controller_action = "#{request.parameters['controller']}/#{request.parameters['action']}"
case controller_action
when "api/v1/comments/destroy", "api/v1/comments/update"
  status = "You can only update or delete your own comment"
when "api/v1/posts/destroy", "api/v1/posts/update" 
  status = "You can only update or delete your own post"
else
  status = nil
end

json.status status