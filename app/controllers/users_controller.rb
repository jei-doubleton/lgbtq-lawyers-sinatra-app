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
      flash[:message] = "You must complete all fields."
      redirect "/signup"
    elsif User.all.find_by(username: params[:user][:username])
      flash[:message] = "The username '#{params[:user][:username]}' is already taken."
      redirect "/signup"
    elsif User.all.find_by(email: params[:user][:email])
      flash[:message] = "The email address '#{params[:user][:email]}' was already used to create an account. If you already have an account, login using the link above."
      redirect "/signup"
    else
      @user = User.create(params[:user])
      session[:user_id] = @user.id
      binding.pry
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
