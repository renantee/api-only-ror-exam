controller_action = "#{request.parameters['controller']}/#{request.parameters['action']}"
case controller_action
when "api/v1/auth/logout"
  status = "user logged-out successfully"
when "api/v1/posts/destroy", "api/v1/comments/destroy"
  status = "record deleted successfully"
when "api/v1/passwords/update"
  status = "password updated successfully"
else
  status = nil
end

json.status status