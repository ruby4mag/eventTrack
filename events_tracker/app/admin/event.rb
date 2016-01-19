ActiveAdmin.register Event do

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if resource.something?
#   permitted
# end

 index do
      # do nothing; table will be filled with a partial via Javascript
   end

   collection_action :events_list do 
      @events = Event.all.order("id asc").limit(2)
  puts "filtered collection magin = " + apply_filtering(collection).to_yaml
#	@eventsi = apply_filtering(collection)
  render :partial => "events_list"
   end


permit_params :hostname, :servicename, :severity, :message, :ticket_status, :ticket_number, :event_source, :first_time, :last_occurance, :count, :commit
end
