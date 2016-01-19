json.array!(@devices) do |device|
  json.extract! device, :id, :name, :ts_steps, :project_id
  json.url device_url(device, format: :json)
end
