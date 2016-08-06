require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)
# message = "Guess a number between 1 and 100."
guess_int = nil

get '/' do


  message = check_guess(guess_int)

  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}

  # erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :guess => guess_int}

end

def check_guess(guess_int)
  guess_int = params['guess'].to_i
  if guess_int > SECRET_NUMBER
    return "Your guess is too high!"
  elsif guess_int < SECRET_NUMBER
    return  "Your guess is too low!"
  elsif guess_int == SECRET_NUMBER
    return  "That's right!"
  elsif guess_int.nil?
    return  "Guess a number between 1 and 100."
  end
end
