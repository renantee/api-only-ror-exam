json.data @commentable.comments do |comment|
  json.id comment.id
  json.title comment.title
  json.body comment.body
  json.commentable_type comment.commentable_type
  json.commentable_id comment.commentable_id
  json.creator_id comment.user_id
  json.parent_id comment.parent_id
  json.created_at comment.created_at.strftime("%Y-%m-%d %H:%M:%S")
  json.updated_at comment.updated_at.strftime("%Y-%m-%d %H:%M:%S")
end