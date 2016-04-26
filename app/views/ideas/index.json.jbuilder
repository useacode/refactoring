json.array!(@ideas) do |idea|
  json.extract! idea, :id, :topic_id, :title, :body
  json.url idea_url(idea, format: :json)
end
