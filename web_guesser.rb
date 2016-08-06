require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)

get '/' do
  "the secret number is: #{SECRET_NUMBER}"
end