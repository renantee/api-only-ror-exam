if @errors.present?
  json.message "The given data was invalid."
  json.errors @errors
end