json.array!(@stickies) do |sticky|
  json.extract! sticky, :id, :type, :comment, :author, :boards_id
  json.url sticky_url(sticky, format: :json)
end
