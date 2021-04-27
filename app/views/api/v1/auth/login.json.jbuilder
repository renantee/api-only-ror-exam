if !@errors.empty?
  json.message "The given data was invalid."
  json.errors @errors
else
  json.token @token
  json.token_type "bearer"
  json.expires_at Time.at(@exp).strftime("%Y-%m-%d %H:%M:%S")
end