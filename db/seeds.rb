# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(email: "admin@yopmail.com", password: "password")
Hacker.create(email: "hacker@yopmail.com", password: "password")
starship = Starship.create(name: "USS Enterprise")
crew_members = CrewMember.create([
	{ name: "Jean Luc Picard", division: "Command", starship_id: starship.id, bio: FFaker::Lorem.paragraph(2) },
	{ name: "Geordi La Forge", division: "Engineering", starship_id: starship.id, bio: FFaker::Lorem.paragraph(2) },
	{ name: "Beverly Crusher", division: "Science", starship_id: starship.id, bio: FFaker::Lorem.paragraph(2) }

])
HolodeckProgram.create([
  { title: "Robin Hood", crew_member_id: crew_members.first.id, starship_id: starship.id},
	{ title: "Sherlock Holmes", crew_member_id: crew_members.first.id, starship_id: starship.id},
	{ title: "Dixon Hill", crew_member_id: crew_members.first.id, starship_id: starship.id}
])
puts "SEED DATA GENERATED!"	