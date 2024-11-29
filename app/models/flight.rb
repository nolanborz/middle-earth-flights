class Flight < ApplicationRecord
  belongs_to :departure_airport, class_name: "Airport"
  belongs_to :arrival_airport, class_name: "Airport"

  def self.flight_dates
    distinct.order(:start_datetime).pluck(:start_datetime).map(&:to_date).uniq
  end
end
