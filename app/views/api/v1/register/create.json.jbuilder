if @user.save
  json.data do
    json.name @user.name
    json.email @user.email    
    json.updated_at @user.updated_at.strftime("%Y-%m-%d %H:%M:%S")
    json.created_at @user.created_at.strftime("%Y-%m-%d %H:%M:%S")
    json.id @user.id
  end
else
  json.message "The given data was invalid."
  json.errors @user.errors
end