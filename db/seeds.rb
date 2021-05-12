require './db/flight_generator.rb'

Flight.destroy_all
User.destroy_all
Booking.destroy_all

airlines = ["United Airlines", "Delta Airlines", "Southwest Airlines", "Alaska Airlines", "Hawaiian Airlines"]

FlightGenerator.flights.each {|flight| Flight.create(flight)}

5.times { User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , username: Faker::Internet.username, password: "P@ssword!", password_confirmation: "P@ssword!") }
