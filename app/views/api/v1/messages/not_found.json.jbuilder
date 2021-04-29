controller_action = "#{request.parameters['controller']}/#{request.parameters['action']}"
case controller_action
when "api/v1/posts/show", "api/v1/posts/update", "api/v1/posts/destroy"
  message = "No query results for model [App\\Post]."
when "api/v1/comments/index"
  message = "No query results for commentable [Post]."
when "api/v1/comments/create", "api/v1/comments/update"
  message = "No query results for model [Commentable\\Models\\Comment]"
  exception = "Symfony\\Component\\HttpKernel\\Exception\\NotFoundHttpException"
else
  message = controller_action
end

json.message message
if exception
  json.exception exception
end