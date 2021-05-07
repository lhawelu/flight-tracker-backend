Flight.destroy_all
# User.destroy_all
# Booking.destroy_all

airlines = ["United Airlines", "Delta Airlines", "Southwest Airlines", "Alaska Airlines", "Hawaiian Airlines"]

50.times {Flight.create(origin: Faker::Address.state, destination: Faker::Address.state, airline: airlines.sample, depature_time: Faker::Time.forward, flight_number: 6.times.map{rand(6)}.join.to_i )}
