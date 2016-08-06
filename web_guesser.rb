require 'sinatra'
require 'sinatra/reloader'

SECRET_NUMBER = rand(101)
message = "Guess a number between 1 and 100."
# guess_int = nil

get '/' do
  # erb :index, :locals => {:number => SECRET_NUMBER, :message => message}
  if params['guess'] != nil
    guess_int = params['guess'].to_i

    message = check_guess(guess_int)

  end
  erb :index, :locals => {:number => SECRET_NUMBER, :message => message}

  # erb :index, :locals => {:number => SECRET_NUMBER, :message => message, :guess => guess_int}

end

def check_guess(guess)
  if guess.nil?
    "Guess a number between 1 and 100."
  elsif guess > SECRET_NUMBER + 5
    "WAYYY too high!"
  elsif guess > SECRET_NUMBER
    "Your guess is too high!"
  elsif guess < SECRET_NUMBER - 5
    "WAYYY too low!"
  elsif guess < SECRET_NUMBER
    "Your guess is too low!"
  elsif guess == SECRET_NUMBER
    "That's right! The secret number is #{guess}!"
  end
end
