controller_action = "#{request.parameters['controller']}/#{request.parameters['action']}"
case controller_action
when 'api/v1/auth/logout'
  status = "user logged-out successfully"
when 'api/v1/posts/destroy'
  status = "record deleted successfully"
else
  status = controller_action
end

json.status status