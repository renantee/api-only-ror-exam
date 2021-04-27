if @post
  json.data do
    json.id @post.id
    json.user_id @post.user_id
    json.title @post.title
    json.slug @post.slug
    json.image @post.image
    json.content @post.content
    json.created_at @post.created_at.strftime("%Y-%m-%d %H:%M:%S")
    json.updated_at @post.updated_at.strftime("%Y-%m-%d %H:%M:%S")
  end
else
  json.message "No query results for model [App\\Post]."
end