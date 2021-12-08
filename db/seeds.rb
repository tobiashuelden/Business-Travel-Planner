# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

csv_text = File.read(Rails.root.join("lib", "csvs", "companies.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  c = Company.new
  c.name = row["name"]
  c.business_area = row["business_area"]
  c.save
end

csv_text = File.read(Rails.root.join("lib", "csvs", "chatrooms.csv"))
csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
csv.each do |row|
  c = Chatroom.new
  c.company_id = row["company_id"]
  c.save
end

