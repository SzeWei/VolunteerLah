# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'ffaker'

# Generate users with name "user1" and email "user1@mail.com" up to "user20". The passwords are "123456". 
num = (1..20).to_a
users = num.map {|n| "user" + n.to_s}
emails = users.map {|e| e + "@mail.com" }

# Create user1 - user20
num.each{ |n| User.create(email: emails[n - 1], password: "123456", name: users[n - 1]) }


# Events
# Sets user1's role to admin.
user1 = User.find_by(name: "user1")
user1.update(role: 0)

# Sets user2 and 3's roles to organisation.
user2 = User.find_by(name: "user2")
user2.update(role: 1)

user3 = User.find_by(name: "user3")
user3.update(role: 1)

# Generate Events posted by users with organisation account.
def generate_event(user)
	new_event = user.events.new(
		title: FFaker::Venue.name,
		description: FFaker::CheesyLingo.sentence,
		start_date: Date.new(2016,(1..11).to_a.sample,(1..28).to_a.sample),
		category: (0..2).to_a.sample,
		target_space: rand(1..5) * 100
		)
	new_event.end_date = new_event.start_date + (0..2).to_a.sample
	new_event.save
	new_event.create_event_detail(
		venue_title: FFaker::Address.city,
		street_address: FFaker::Address.street_address,
		postal_code: rand(1000..9999),
		city: FFaker::Address.city,
		state: FFaker::AddressBR.state,
		contact_num: rand(1111111..9999999).to_s,
		day_time: new_event.start_date.strftime("%A") + ", 9am - 12pm",
		longitude: rand(-90.000000000...90.000000000),
		latitude: rand(-180.000000000...180.000000000)
		)
end

def generate_profile(user)
	if user.organisation?
		user.create_organisation_profile(
			name: user.name + " Sdn. Bhd.",
			field_or_industry: "Non-profit",
			org_description: FFaker::CheesyLingo.sentence,
			language: "English",
			phone: rand(1111111..9999999),
			fax: rand(1111111..9999999),
			email: user.email,
			address: FFaker::Address.street_address,
			postal_code: rand(1000..9999),
			city: FFaker::Address.city,
			state: FFaker::AddressBR.state
		)
	else
		user.create_profile(
			skills: ["Building houses", "Cooking", "Medicine", "Accounting"].sample,
			gender: ["Male", "Female"].sample,
			description: FFaker::CheesyLingo.sentence,
			language: "English",
			phone: rand(1111111..9999999),
			contact_email: user.email,
			street_address: FFaker::Address.street_address,
			postal_code: rand(1000..9999),
			city: FFaker::Address.city,
			state: FFaker::AddressBR.state
		)
	end
end
		

# Generate 50 events for each organisation.
50.times {
	generate_event(user2)
	generate_event(user3)	
}

User.all.each { |user|
	generate_profile(user)
}
