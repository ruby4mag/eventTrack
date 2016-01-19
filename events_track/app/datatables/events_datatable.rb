class EventsDatatable
delegate :params, :h, :link_to, :price, to: :@view

def initialize(view)
  @view = view
end

def as_json(options = {})
  {
    sEcho: params[:sEcho].to_i,
    iTotalRecords: Event.count,
    iTotalDisplayRecords: events.total_entries,
    aaData: data
  }
end

  def events
    @events ||= fetch_events
  end

private
def data
  events.map do |event|
    [
      link_to(event.hostname,'http://localhost:3002/admin/devices/1?iframe=true&width=1200&height=600',{rel: "prettyPhoto"} ), 
      (event.servicename),
      (event.severity),
      (event.message),
      (event.ticket_status),
      (event.ticket_number),
      (event.event_source),
      (event.first_time),
      (event.event_status),
      link_to("Details",'http://localhost:3000/events/'+ event.id.to_s + '?iframe=true&width=1200&height=600',{rel: "prettyPhoto"} ) 
    ]
  end
end

def fetch_events
  events = Event.order("#{sort_column} #{sort_direction}")
  events = events.page(page).per_page(per_page)
  if params[:sSearch].present?
    events = events.where("hostname like :search or severity like :search", search: "%#{params[:sSearch]}%")
  end
  events
  
end

 def page
    params[:iDisplayStart].to_i/per_page + 1
  end

  def per_page
    params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
  end

  def sort_column
    columns = %w[hostname servicename severity message ticket_status ticket_number event_source first_time event_status count]
    columns[params[:iSortCol_0].to_i]
  end

  def sort_direction
    params[:sSortDir_0] == "desc" ? "desc" : "asc"
  end

end

