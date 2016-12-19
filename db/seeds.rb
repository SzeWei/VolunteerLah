# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# require 'ffaker'

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

# Streets
streets = ["Jalan Ampang", "Jalan Bangsar", "Jalan Bukit Bintang", "Jalan Semarang", "Jalan Chow Kit", "Jalan Cochrane", "Jalan Cheng Lock", "Jalan Damansara"]

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
		day_time: ", 9am - 12pm",
		longitude: 101.68685 + rand(-0.300000000...0.300000000),
		latitude: 3.139003 + rand(-0.300000000...0.300000000)
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
			city: "Kuala Lumpur",
			state: "Kuala Lumpur"
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

# Change User Name
User.last(17).each {|user|
	user.update(name: "#{FFaker::Name::first_name} #{FFaker::Name::last_name}")
}

# Change Organisation Name
local_names = ['Chempaka', 'Bunga Raya', 'Harmoni', 'Baik Hati', 'Bantu']

descriptions = ["Our organisation helps the poor, homeless and needy.", 
	"Our organisation seeks to make a positive change in communities.", 
	"We provide services that help disadvantaged communities.", 
	"We help communities achieve their dreams.", 
	"We seek positive growth for society.",
	"We help build up less fortunate communities.",
	"We provide aid to women, children, the elderly and the homeless.",
	"Those we help include the poverty-stricken and refugees.", 
	"Our funds go to various compassionate causes.",
	"Humanitarian aid is the main part of our mission.",
	"All are welcome to receive help, regardless of race or religion.",
	"Strength comes from unity and compassion."]

event_ttl = ["Helping Hands", "Building Communities", "Help The Disadvantaged", "Community"]

event_txt = ["Our event seeks to improve the lives of the disadvantaged.",
	"Thousands have benefited from our event.",
	"Volunteers find the activities life-changing.",
	"This is an excellent opportunity to give back to society.",
	"We offer a safe haven for individuals to find shelter and meet their everyday needs.",
	"Our organisation provides fulfillment to those who are in need.",
	"Guests to our event are welcomed with warmth and generosity.",
	"Our event is founded on compassion and charity.",
	"We are helping to feed the hungry and shelter the homeless.",
	"This is a chance for citizens to aid those who seek help.",
	"The aim of the programme is to create positive growth for the community.",
	"The event helps construct bridges with less fortunate communities.",
	"Targetted groups for the programme include the poverty-stricken and refugees."]


def build_description(descriptions, num) 
	arr = Array.new
	num.times do
		arr << descriptions.sample
	end
	return arr.uniq.shuffle.join(" ")
end

# Rename users 2 and 3
orgs = User.where(name: ["user2","user3"])
orgs.each { |org|
	org.organisation_profile.update(
		name: "#{local_names.sample} Association",
		org_description: build_description(descriptions, 5),
		contact_person: "#{FFaker::Name::first_name} #{FFaker::Name::last_name}"
	)
}

Event.last(100).each {|event|
	event.update(
		title: "#{event.event_detail.city} 2016 #{event_ttl.sample} Event",
		description: build_description(event_txt, 5)
		
	)
	event.event_detail.update(
		street_address: "#{rand(1..99)}, #{streets.sample}",
		city: "Kuala Lumpur",
		state: "Kuala Lumpur"
	)
}