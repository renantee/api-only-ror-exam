if @post
  json.data do
    json.id @post.id
    json.user_id @post.user_id
    json.title @post.title
    json.slug @post.slug
    json.image @post.image
    json.content @post.content
    json.created_at @post.created_at
    json.updated_at @post.updated_at
  end
else
  json.message "No query results for model [App\\Post]."
end