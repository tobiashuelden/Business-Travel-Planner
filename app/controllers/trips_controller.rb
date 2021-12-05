class TripsController < ApplicationController

  def add
    render({ :template => "trips/add.html.erb" })
  end

  def index
    matching_trips = Trip.all
    matching_trips = matching_trips.where({:business_travel_id => session[:business_travel_id]})
    @list_of_trips = matching_trips.order({ :created_at => :desc })

    session[:indicator] = TRUE
    render({ :template => "trips/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_trips = Trip.where({ :id => the_id })

    @the_trip = matching_trips.at(0)

    render({ :template => "trips/show.html.erb" })
  end

  def create
    the_trip = Trip.new
    the_trip.start_a = params.fetch("query_start_a")
    the_trip.end_b = params.fetch("query_end_b")
    the_trip.start_date = params.fetch("query_start_date")
    the_trip.end_date = params.fetch("query_end_date")
    the_trip.trip_type = params.fetch("query_trip_type")
    the_trip.description = params.fetch("query_description")
    the_trip.business_travel_id = session[:business_travel_id]

    if the_trip.valid?
      the_trip.save
      redirect_to("/add_trip", { :notice => "Trip created successfully." })
    else
      redirect_to("/add_trip", { :notice => "Trip failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    the_trip.start_a = params.fetch("query_start_a")
    the_trip.end_b = params.fetch("query_end_b")
    the_trip.start_date = params.fetch("query_start_date")
    the_trip.end_date = params.fetch("query_end_date")
    the_trip.trip_type = params.fetch("query_trip_type")
    the_trip.description = params.fetch("query_description")
    the_trip.business_travel_id = params.fetch("query_business_travel_id")

    if the_trip.valid?
      the_trip.save
      redirect_to("/trips/#{the_trip.id}", { :notice => "Trip updated successfully."} )
    else
      redirect_to("/trips/#{the_trip.id}", { :alert => "Trip failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_trip = Trip.where({ :id => the_id }).at(0)

    the_trip.destroy

    redirect_to("/trips", { :notice => "Trip deleted successfully."} )
  end
end
