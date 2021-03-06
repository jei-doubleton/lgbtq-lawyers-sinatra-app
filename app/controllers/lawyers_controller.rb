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
    lawyer = Lawyer.new(params[:lawyer])

    if Lawyer.find {|name| name.slug == lawyer.slug}
      flash[:message] = "The lawyer '#{params[:lawyer][:name]}' has already been added."
      redirect "/lawyers/new"
    else
      lawyer.save
      current_user.lawyers << lawyer

      if params[:practice_areas]
        params[:practice_areas].each do |id|
          lawyer.practice_areas << PracticeArea.find(id)
          lawyer.save
        end
      end

      if params[:practice_area][:name] != ""
        if PracticeArea.find {|area| area.name.downcase == params[:practice_area][:name].downcase}
          flash[:message] = "Note: The new practice area you tried to add (#{params[:practice_area][:name]}) already existed. If you'd like to add that practice area to this lawyer, click Edit this lawyer below."
          redirect "/lawyers/#{lawyer.slug}"
        else
          practice_area = PracticeArea.create(name: params[:practice_area][:name])
          lawyer.practice_areas << practice_area
          lawyer.save
        end
      end
      redirect "/lawyers/#{lawyer.slug}"
    end
  end

  get '/lawyers' do
    if logged_in?
      erb :"/lawyers/lawyers"
    else
      flash[:message] = "You must be logged in to see the View Lawyers page"
      redirect "/login"
    end
  end

  get '/lawyers/:slug' do
    if logged_in?
      @lawyer = Lawyer.find {|lawyer| lawyer.slug == params[:slug]}
      erb :"lawyers/show_lawyer"
    else
      flash[:message] = "You must be logged in to view that page"
      redirect "/login"
    end
  end

  get '/lawyers/:slug/edit' do
    @lawyer = Lawyer.find {|lawyer| lawyer.slug == params[:slug]}

    if !current_user.lawyers.include?(@lawyer)
      flash[:message] = "Sorry, you do not have authorization to edit this lawyer entry."
    else
      erb :"lawyers/edit_lawyer"
    end
  end

  patch '/lawyers/:slug' do
    @lawyer = Lawyer.find {|lawyer| lawyer.slug == params[:slug]}
    @lawyer.update(params[:lawyer])

    @lawyer.practice_areas.clear

    if params[:practice_areas]
      params[:practice_areas].each do |id|
        @lawyer.practice_areas << PracticeArea.find(id)
        @lawyer.save
      end
    end

    if params[:practice_area][:name] != ""
      if PracticeArea.find {|area| area.name.downcase == params[:practice_area][:name].downcase}
        flash[:message] = "The practice area '#{params[:practice_area][:name]}' has already been added."
        redirect "/lawyers/#{@lawyer.slug}/edit"
      else
        practice_area = PracticeArea.create(name: params[:practice_area][:name])
        @lawyer.practice_areas << practice_area
        @lawyer.save
      end
    end

    redirect "/lawyers/#{@lawyer.slug}"
  end

  delete '/lawyers/:slug' do
    @lawyer = Lawyer.find {|lawyer| lawyer.slug == params[:slug]}

    if !current_user.lawyers.include?(@lawyer)
      flash[:message] = "Sorry, you do not have authorization to delete this lawyer entry."
      redirect "/lawyers"
    else
      @lawyer.destroy
      redirect "/lawyers"
    end
  end
end
