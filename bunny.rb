require "bunny"
require 'rubygems'
require 'json'
require 'active_record'

# Change the following to reflect your database settings
ActiveRecord::Base.establish_connection(
  adapter:  'mysql2', # or 'postgresql' or 'sqlite3'
  host:     'localhost',
  database: 'event_processor',
  username: 'root',
  password: ''
)

class Event < ActiveRecord::Base
  #blah, blah, blah
end


# Start a communication session with RabbitMQ
conn = Bunny.new
conn.start

# open a channel
ch = conn.create_channel

# declare a queue
q  = ch.queue("zenoss" ,:durable => true)

# publish a message to the default exchange which then gets routed to this queue

# fetch a message from the queue
puts " [*] Waiting for messages in #{q.name}. To exit press CTRL+C"
q.subscribe(:block => true) do |delivery_info, properties, body|
  #puts " [x] Received #{body}"
  parsed = JSON.parse(body)

  if (parsed['eventtype'] == 'CREATE')
	if (parsed['component'].to_s == '')
		parsed['component'] = ' '
	end

  	servicename = parsed['eventclass'] + parsed['component'].to_s 
  	Event.create(:hostname => parsed["device"], :message => parsed["message"],:severity => parsed["severity"],:event_source => parsed["eventsource"],:ticket_status => 1,:first_time => parsed["firsttime"],:last_occurance => parsed["lasttime"],:event_status => 1 ,:servicename => servicename.to_s ,:eventid => parsed["eventid"])
	
 else

	p parsed
        Event.where(:eventid => parsed['eventid']).update_all( event_status: '2')


 end

end
# close the connection
conn.stop
