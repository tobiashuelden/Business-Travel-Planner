class WebpageController < ApplicationController
  def homepage

    matching_business_travels = BusinessTravel.all
  
    user_matching_business_travels = matching_business_travels.where({ :user_id => session[:user_id] })
  
    todays_date = Date.today
  
    user_matching_business_travels = user_matching_business_travels.where('start_date >= ?', todays_date)
  
    upcoming_travel = user_matching_business_travels.order({ :start_date => :asc }).first
  
    @company = User.where({:id=>session[:user_id]}).first.company_name

    if upcoming_travel.present?
      session[:business_travel_id] = upcoming_travel.id
      session[:business_travel_name] = upcoming_travel.description
  
      @description = upcoming_travel.description
    else
      @description = nil
    end
    render({ :template => "webpages/homepage.html.erb" })

  end

end

