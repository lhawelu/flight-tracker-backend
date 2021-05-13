class Flight < ApplicationRecord
  has_many :bookings, :dependent => :destroy
  has_many :users, through: :bookings
 

  @@aircraft_data = [
    {
      name: "Airbus A220-100",
      max_capacity: 108,
      seat_arrangement: "2-3"
    },
    {
      name: "Airbus A220-100",
      max_capacity: 108,
      seat_arrangement: "2-3"
    },
    {   
      name: "Airbus A220-100",
      max_capacity: 108,
      seat_arrangement: "2-3"
    },
    {
      name: "Airbus A220-100",
      max_capacity: 108,
      seat_arrangement: "2-3"
    },
    {
      name: "Airbus A220-300",
      max_capacity: 160,
      seat_arrangement: "2-3"
    },
   {
      name: "Airbus A220-300",
      max_capacity: 160,
      seat_arrangement: "2-3"
    },
    {
      name: "Airbus A319",
      max_capacity: 132,
      seat_arrangement: "3-3"
    },
    {
      name: "Airbus A320",
      max_capacity: 162,
      seat_arrangement: "3-3"
    },
    {
      name: "Airbus A321",
      max_capacity: 192,
      seat_arrangement: "3-3"
    },
    {
      name: "Airbus A330-200",
      max_capacity: 232,
      seat_arrangement: "2-4-2"
    },
    {   
      name: "Airbus A330-300",
      max_capacity: 296,
      seat_arrangement: "2-4-2"
    },
    {
      name: "Airbus A350-900",
      max_capacity: 315,
      seat_arrangement: "3-3-3"
    },
    {
      name: "Airbus A350-1000",
      max_capacity: 369,
      seat_arrangement: "3-3-3"
    },
    {   
      name: "Boeing 717-200",
      max_capacity: 110,
      seat_arrangement: "2-3"
    },
    {
      name: "Boeing 737-700",
      max_capacity: 144,
      seat_arrangement: "3-3"
    },
    {
      name: "Boeing 737 MAX 8",
      max_capacity: 174,
      seat_arrangement: "3-3"
    },
    {
      name: "Boeing 737 MAX 9",
      max_capacity: 192,
      seat_arrangement: "3-3"
    },
    {
      name: "Boeing 737-800",
      max_capacity: 162,
      seat_arrangement: "3-3"
    },
    {
      name: "Boeing 737-900",
      max_capacity: 180,
      seat_arrangement: "3-3"
    },
    {
      name: "Boeing 757-200",
      max_capacity: 198,
      seat_arrangement: "3-3"
    },
    {
      name: "Boeing 757-300",
      max_capacity: 234,
      seat_arrangement: "3-3"
    },
    {
      name: "Boeing 767-300",
      max_capacity: 266,
      seat_arrangement: "2-3-2"
    },
    {
      name: "Boeing 767-400",
      max_capacity: 308,
      seat_arrangement: "2-3-2"
    },
    {
      name: "Boeing 777-200",
      max_capacity: 315,
      seat_arrangement: "3-3-3"
    },
    {
      name: "Boeing 777-300",
      max_capacity: 396,
      seat_arrangement: "3-3-3"
    },
    {
      name: "Boeing 787-8",
      max_capacity: 333,
      seat_arrangement: "3-3-3"
    },
    {
      name: "Boeing 787-9",
      max_capacity: 360,
      seat_arrangement: "3-3-3"
    },
    {
      name: "Boeing 787-10",
      max_capacity: 405,
      seat_arrangement: "3-3-3"
    },
    {
      name: "Bombardier CRJ200",
      max_capacity: 48,
      seat_arrangement: "2-2"
    },
    {
      name: "Bombardier CRJ700",
      max_capacity: 72,
      seat_arrangement: "2-2"
    },
    {
      name: "Bombardier CRJ900",
      max_capacity: 80,
      seat_arrangement: "2-2"
    },
    {
      name: "Bombardier CRJ1000",
      max_capacity: 104,
      seat_arrangement: "2-2"
    },
    {
      name: "Embraer ERJ145",
      max_capacity: 54,
      seat_arrangement: "1-2"
    },
    {
      name: "Embraer E170",
      max_capacity: 72,
      seat_arrangement: "2-2"
    },
    {
      name: "Embraer E175",
      max_capacity: 80,
      seat_arrangement: "2-2"
    },
    {
      name: "Embraer E190",
      max_capacity: 100,
      seat_arrangement: "2-2"
    },
    {
      name: "Embraer E195",
      max_capacity: 116,
      seat_arrangement: "2-2"
    }
  ]

  @@seat_letters = [
    {
      seat_count: 1,
      letters: ["A"]
    },
    {
      seat_count: 2,
      letters: ["A", "B"]
    },
    {
      seat_count: 3,
      letters: ["A", "B", "C"]
    },
    {
      seat_count: 4,
      letters: ["A", "B", "C", "D"]
    },
    {
      seat_count: 5,
      letters: ["A", "B", "C", "D", "E"]
    },
    {
      seat_count: 6,
      letters: ["A", "B", "C", "D", "E", "F"]
    },
    {
      seat_count: 7,
      letters: ["A", "B", "C", "D", "E", "F", "G"]
    },
    {
      seat_count: 8,
      letters: ["A", "B", "C", "D", "E", "F", "G", "H"]
    },
    {
      seat_count: 9,
      letters: ["A", "B", "C", "D", "E", "F", "G", "H", "I"]
    },
    {
      seat_count: 10,
      letters: ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J"]
    },
  ]

  # available seats on flight
  
  def flight_seats
    # identify total number of seats per row
    seats_per_row = @@aircraft_data.find {|a| a[:name] == self.aircraft}[:seat_arrangement].split("-").map(&:to_i).inject(0){|sum,x| sum + x }
    # total rows in plane capacity / seats_per_row
    total_rows = @@aircraft_data.find {|a| a[:name] == self.aircraft}[:max_capacity] / seats_per_row
    # identify the seats that have already been booked
    booked_seats = self.bookings.pluck(:seat)
    all_seats = []
    # loop to create all of the seat numbers based on the aircraft
    i = 1
    while i <= total_rows  do
      @@seat_letters.find {|s| s[:seat_count] == seats_per_row}[:letters].each{|letter| all_seats << "#{i}#{letter}"}
      i +=1
    end
    # build the array for all the seats that have not been booked
    available_seats = all_seats.filter{|seat| seat if booked_seats.exclude?(seat)}
  end

  # flight data with seats
  
  def self.flight_with_available_seats
    @flights = Flight.all.map { |flight| 
      available_seats = flight.flight_seats
      flight_data = {
        id: flight.id,
        origin: flight.origin,
        destination: flight.destination,
        airline: flight.airline,
        departure_time: flight.departure_time,
        flight_number: flight.flight_number,
        arrival_time: flight.arrival_time,
        aircraft: flight.aircraft,
        available_seats: available_seats
      }
    }
  end

end