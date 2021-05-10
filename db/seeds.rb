Flight.destroy_all
User.destroy_all
# Booking.destroy_all

airlines = ["United Airlines", "Delta Airlines", "Southwest Airlines", "Alaska Airlines", "Hawaiian Airlines"]

50.times {Flight.create(origin: Faker::Address.state, destination: Faker::Address.state, airline: airlines.sample, departure_time: Faker::Time.forward, flight_number: 6.times.map{rand(6)}.join.to_i )}

5.times {User.create(first_name: Faker::Name.first_name , last_name: Faker::Name.last_name , username: Faker::Internet.username, password: "P@ssword!")}
