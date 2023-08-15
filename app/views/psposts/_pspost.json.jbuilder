json.extract! pspost, :id, :title, :description, :created_at, :updated_at
json.url pspost_url(pspost, format: :json)
