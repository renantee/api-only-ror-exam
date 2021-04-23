if @comment.save
  json.data do
    json.body @comment.body
    json.commentable_type @comment.commentable_type
    json.commentable_id @comment.commentable_id
    json.creator_id @comment.user_id
    json.parent_id @comment.parent_id
    json.created_at @comment.created_at
    json.updated_at @comment.updated_at
    json.id @comment.id
  end
else
  json.message "The given data was invalid."
  json.errors @comment.errors
end