class BusinessTravelsController < ApplicationController
  def index
    matching_business_travels = BusinessTravel.all

    @list_of_business_travels = matching_business_travels.order({ :created_at => :desc })

    render({ :template => "business_travels/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_business_travels = BusinessTravel.where({ :id => the_id })

    @the_business_travel = matching_business_travels.at(0)

    render({ :template => "business_travels/show.html.erb" })
  end

  def create
    the_business_travel = BusinessTravel.new
    the_business_travel.start_date = params.fetch("query_start_date")
    the_business_travel.end_date = params.fetch("query_end_date")
    the_business_travel.user_id = params.fetch("query_user_id")
    the_business_travel.description = params.fetch("query_description")
    the_business_travel.travel_purpose = params.fetch("query_travel_purpose")

    if the_business_travel.valid?
      the_business_travel.save
      redirect_to("/business_travels", { :notice => "Business travel created successfully." })
    else
      redirect_to("/business_travels", { :notice => "Business travel failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_business_travel = BusinessTravel.where({ :id => the_id }).at(0)

    the_business_travel.start_date = params.fetch("query_start_date")
    the_business_travel.end_date = params.fetch("query_end_date")
    the_business_travel.user_id = params.fetch("query_user_id")
    the_business_travel.description = params.fetch("query_description")
    the_business_travel.travel_purpose = params.fetch("query_travel_purpose")

    if the_business_travel.valid?
      the_business_travel.save
      redirect_to("/business_travels/#{the_business_travel.id}", { :notice => "Business travel updated successfully."} )
    else
      redirect_to("/business_travels/#{the_business_travel.id}", { :alert => "Business travel failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_business_travel = BusinessTravel.where({ :id => the_id }).at(0)

    the_business_travel.destroy

    redirect_to("/business_travels", { :notice => "Business travel deleted successfully."} )
  end
end
