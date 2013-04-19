json.items @stories do |story|
  json.id story.id
  json.title story.title
  json.state story.state_name
  json.comments do |json|
    json.count story.comments.count
  end
end

json.current_user do |json|
  json.id current_user.id
end

json.pagination do |json|
  json.current @stories.current_page
  json.count @stories.num_pages
end
