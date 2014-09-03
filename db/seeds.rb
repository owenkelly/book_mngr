# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


titles = ["A Midsummer Night's Dream", "Moby Dick", "A Game of Thrones", "The Eye of the World",
			"Misery", "POODR", "History of the World Part 1", "Redwall", "The Lake",
			"ALIENS!", "Star Wars", "Braveheart", "The Archer", "Fun Times", "Anatomy", 
			"Utopia", "The Prince", "The Illiad", "Beowulf", "The Bible", "1984", "Brave New World",
			"Animal Farm", "Redshirts", "When Lions Roared", "Beers of Washington State",
			"Everybody Poops", "Mockingjay", "Harry Potter visits Bombay", "Indiana Jane",
			"30 Ways to Cook a Chicken", "HABENEBROS!"]

authors = ["Homer", "Shakespeare", "Jane Austin", "Geroge RR Martin", "Tony Stark", 
			"Catwoman", "Sandy Metz", "John Conner", "George Orwell", "Thomas Moore",
			"Machievelli", "Karen Ross", "Anne McCaffery", "Mel Gibson", "Kramer"]

u = User.create(:email => 'derp@lerp.com', :password => 'facebook', :password_confirmation => 'facebook')
u.add_role :admin
titles.each do |title|
	Book.create( title: title, author: authors.sample, 
		cover: File.open(File.join(Rails.root, 'app/assets/images/test_cover.jpg')), user_id: u.id)
end