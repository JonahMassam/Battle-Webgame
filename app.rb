require "sinatra"
require "capybara"
require "capybara/rspec"
require "rspec"
require 'sinatra/reloader' if development?


class Battle < Sinatra::Base

  enable :sessions

  configure :development do
    register Sinatra::Reloader
  end

  get "/" do
    erb(:index)
  end

  post "/names" do
    session[:player_1_name] = params[:player_1_name]
    session[:player_2_name] = params[:player_2_name]
    session[:player_2_health] = 100
    redirect '/play'
  end

  get "/play" do
    @player_1_name = session[:player_1_name]
    @player_2_name = session[:player_2_name]
    @player_2_health = session[:player_2_health]
    erb(:play)
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end

