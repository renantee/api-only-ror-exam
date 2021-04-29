if @token
  json.token @token
  json.token_type "bearer"
  json.expires_at Time.at(@exp).strftime("%Y-%m-%d %H:%M:%S")
end