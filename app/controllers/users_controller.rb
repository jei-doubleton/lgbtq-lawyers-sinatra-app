require 'rack-flash'

class UsersController < ApplicationController
  use Rack::Flash

  get '/signup' do
    if logged_in?
      redirect to "/lawyers"
    else
      erb :"users/create_user"
    end
  end

  post '/signup' do
    if params[:user][:email] == "" || params[:user][:username] == "" || params[:user][:password] == ""
      flash[:message] = "You must fill in all fields!"
      redirect "/signup"
    else
      @user = User.create(params[:user])
      session[:user_id] = @user.id
      erb :"users/show"
    end
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      User.find(session[:user_id])
    end
  end
end
