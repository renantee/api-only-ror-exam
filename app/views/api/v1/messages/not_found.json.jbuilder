controller_action = "#{request.parameters['controller']}/#{request.parameters['action']}"
case controller_action
when 'api/v1/posts/show', 'api/v1/posts/update'
  message = "No query results for model [App\\Post]."
when 'api/v1/comments/index'
  message = "No query results for commentable [Post]."
else
  message = controller_action
end

json.message message