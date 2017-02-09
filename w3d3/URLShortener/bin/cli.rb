# require_relative '../app/models/user.rb'
# require_relative '../app/models/shortened_url.rb'
# require_relative '../app/models/visit.rb'

require 'launchy'

puts "What's your email?"

email = gets.chomp

current_user = User.find_by_email(email)

puts "hello, #{current_user.name}"
puts "would you like to visit a random shortened url you've already visited? (y/n)"

input = gets.chomp
if input == 'y'
  past_links = current_user.shortened_urls
  Launchy.open (past_links.shuffle.first.long_url)
end




past_links.each { |url| puts "#{url.short_url} => #{url.long_url}"}
