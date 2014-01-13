json.array!(@tickets) do |ticket|
  json.extract! ticket, :id, :title, :description, :deadline, :status
  json.url ticket_url(ticket, format: :json)
end
