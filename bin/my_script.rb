require 'addressable/uri'
require 'rest-client'
# bin/my_script.rb
# url = Addressable::URI.new(
#   scheme: 'http',
#   host: 'localhost',
#   port: 3000,
#   path: '/users.html'
# ).to_s
url = Addressable::URI.new(
  scheme: 'http',
  host: 'localhost',
  port: 3000,
  path: '/users/new',
  query_values: {
    'some_category[a_key]' => 'another value',
    'some_category[a_second_key]' => 'yet another value',
    'some_category[inner_inner_hash][key]' => 'value',
    'something_else' => 'aaahhhhh'
  }
).to_s
puts RestClient.get(url)
