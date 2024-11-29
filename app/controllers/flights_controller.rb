class FlightsController < ApplicationController
  # app/controllers/flights_controller.rb
  def index
    @flights = Flight.all

    if params[:flight_date].present?
      selected_date = Date.parse(params[:flight_date])
      @flights = @flights.where(start_datetime: selected_date.all_day)
    end

    if params[:departure_airport_id].present?
      @flights = @flights.where(departure_airport_id: params[:departure_airport_id])
    end

    if params[:arrival_airport_id].present?
      @flights = @flights.where(arrival_airport_id: params[:arrival_airport_id])
    end

    @passenger_count = params[:num_passengers]
  end
end
