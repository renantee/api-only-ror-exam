if !@errors.empty?
  json.message "The given data was invalid."
  json.errors @errors
else
  json.data do
    json.name @user.name
    json.email @user.email    
    json.updated_at @user.updated_at
    json.created_at @user.created_at
    json.id @user.id
  end
end