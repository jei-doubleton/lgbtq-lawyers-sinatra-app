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
    elsif User.find_by(username: params[:user][:username])
      flash[:message] = "The username '#{params[:user][:username]}' is already taken."
      redirect "/signup"
    elsif User.find_by(email: params[:user][:email])
      flash[:message] = "The email address '#{params[:user][:email]}' was already used to create an account. If you already have an account, login using the link above."
      redirect "/signup"
    else
      @user = User.create(params[:user])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    end
  end

  get '/login' do
    erb :"users/login"
  end

  post '/login' do
    @user = User.find_by(username: params[:user][:username])
    if @user && @user.authenticate(params[:user][:password])
      session[:user_id] = @user.id
      redirect "/users/#{@user.slug}"
    else
      flash[:message] = "Incorrect login. Please try again."
      redirect '/login'
    end
  end

  get '/logout' do
    if logged_in?
      session.destroy
      redirect '/'
    else
      flash[:message] = "You weren't logged in..."
      redirect '/login'
    end
  end

  get "/users/:slug" do
    if logged_in?
      @user = User.find {|user| user.slug == params[:slug]}
      erb :"users/show"
    else
      flash[:message] = "You must log in to view that page."
      redirect '/login'
    end
  end
end
