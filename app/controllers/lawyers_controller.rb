require 'rack-flash'
class LawyersController < ApplicationController
  use Rack::Flash

  get '/lawyers/new' do
    if logged_in?
      erb :"/lawyers/new"
    else
      flash[:message] = "You must be logged in to view that page."
      redirect '/login'
    end
  end

  post '/lawyers' do
    lawyer = Lawyer.create(params[:lawyer])
    current_user.lawyers << lawyer
    params[:practice_areas].each do |id|
      lawyer.practice_areas << PracticeArea.find(id)
    end
  end
end
