if !@errors.empty?
  json.message "The given data was invalid."
  json.errors @errors
else
  json.token @token
  json.token_type "bearer"
  json.expires_at 24.hours.from_now
end