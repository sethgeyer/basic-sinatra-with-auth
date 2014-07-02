require "sinatra"
require "rack-flash"

require "./lib/user_database"

class App < Sinatra::Application
  enable :sessions
  use Rack::Flash

  def initialize
    super
    @user_database = UserDatabase.new
  end

  #ROOT
  get "/" do
    erb :home
  end

  #NEW
  get "/users/new" do
    erb :new
  end

  #CREATE
  post "/users" do
    hash = {username: params[:name], password: params[:password]}
    @user_database.insert(hash)
    flash[:notice] = "Thank you for registering."
    redirect "/"
  end

  #LOG IN
  post "/log_in" do
    #grab username and password & create hash
    hash = {username: params[:name], password: params[:password]}
    #iterate through the users array to see if the hash created == iterated item
    user_info = @user_database.all.detect { |user_hash| user_hash[:username] == hash[:username] && user_hash[:password] == hash[:password]}
    session[:user_id] = user_info[:id]
    flash[:notice] = "Welcome, #{user_info[:username]}"
    redirect "/"
  end

  get "/log_out" do
    session.delete(:user_id)
    redirect "/"
  end


end
