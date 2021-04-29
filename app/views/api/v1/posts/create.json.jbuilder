json.data do
  json.title @post.title
  json.slug @post.slug
  json.content @post.content
  json.created_at @post.created_at.strftime("%Y-%m-%d %H:%M:%S")
  json.updated_at @post.updated_at.strftime("%Y-%m-%d %H:%M:%S")
  json.id @post.id
  json.user_id @post.user_id
end