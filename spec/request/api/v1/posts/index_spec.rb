require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "GET /index" do
    it "returns http success" do
      # this will perform a GET request to the /posts route
      get "/api/posts"

      # 'response' is a special object which contain HTTP response received after a request is sent
      # response.body is the body of the HTTP response, which here contain a JSON string
      expect(response.body).to eq('{"result":[{"name":"post 1"}]}')

      # we can also check the http status of the response
      expect(response.status).to eq(200)
    end
  end
end
