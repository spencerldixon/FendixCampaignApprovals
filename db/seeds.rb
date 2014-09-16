# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if User.where(email: "spencer.dixon@fendixmedia.co.uk").blank?
	User.create!(
		first_name: "Spencer",
		last_name: "Dixon",
		email: "spencer.dixon@fendixmedia.co.uk",
		password: Rails.application.secrets.spencer_password,
		password_confirmation: Rails.application.secrets.spencer_password,
		admin: true)
	puts "spencer.dixon@fendixmedia.co.uk created with admin privileges!"
else
	puts "spencer.dixon@fendixmedia.co.uk already exists!"
end

if User.where(email: "claire.allen@fendixmedia.co.uk").blank?
	User.create!(
		first_name: "Claire",
		last_name: "Allen",
		email: "claire.allen@fendixmedia.co.uk",
		password: Rails.application.secrets.claire_password,
		password_confirmation: Rails.application.secrets.claire_password,
		admin: true)
	puts "claire.allen@fendixmedia.co.uk created with admin privileges!"
else
	puts "claire.allen@fendixmedia.co.uk already exists!"
end