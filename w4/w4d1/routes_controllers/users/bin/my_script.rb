require 'addressable/uri'
require 'rest-client'

def create_users
    url = Addressable::URI.new(
      scheme: 'http',
      host: 'localhost',
      port: 3000,
      path: '/users.html'
    ).to_s

    puts RestClient.post(url, user: {name: 'justin'})
end

begin
  create_users
rescue
end
