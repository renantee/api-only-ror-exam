require "factory_bot"

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

def authenticated_header(user)
  token = Knock::AuthToken.new(payload: { sub: user.id }).token

  {
    Authorization: "Bearer #{token}"
  }
end
