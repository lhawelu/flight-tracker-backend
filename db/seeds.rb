require './db/flight_generator.rb'

Flight.destroy_all
User.destroy_all
Booking.destroy_all

airlines = ["United Airlines", "Delta Airlines", "Southwest Airlines", "Alaska Airlines", "Hawaiian Airlines"]

FlightGenerator.flights.each {|flight| Flight.create(flight)}

test_user = User.create(first_name: "test", last_name: "user", username: "testuser", password: "P@ssword!", password_confirmation: "P@ssword!")

5.times { User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , username: Faker::Internet.username, password: "P@ssword!", password_confirmation: "P@ssword!") }

seats = ["1A", "2B", "4C", "15C", "1D"]

seats.each {|seat| Booking.create(user_id: User.all.sample.id, flight_id: Flight.first.id, seat: seat )}

50.times { Booking.create(user_id: User.all.sample.id, flight_id: Flight.all.sample.id, seat: seats.sample )}

