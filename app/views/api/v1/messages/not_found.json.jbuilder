controller_action = "#{request.parameters['controller']}/#{request.parameters['action']}"
case controller_action
when 'api/v1/posts/show'
  message = "No query results for model [App\\Post]."
else
  message = controller_action
end

json.message message