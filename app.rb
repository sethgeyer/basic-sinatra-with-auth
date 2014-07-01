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
    flash[:notice] = "Thank you for registering."
    redirect "/"
  end


end
