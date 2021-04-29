case request.path
when '/api/logout'
  status = "user logged-out successfully"
else
  status = request.path
end

json.status status