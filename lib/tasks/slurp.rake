namespace :slurp do
  desc "TODO"
  task companies: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "companies.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      c = Company.new
      c.name = row["name"]
      c.business_area = row["business_area"]
      c.save
    end
    
    puts "There are now #{Company.count} rows in the companies table"
  end

  task chatrooms: :environment do
    require "csv"

    csv_text = File.read(Rails.root.join("lib", "csvs", "chatrooms.csv"))
    csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
    csv.each do |row|
      c = Chatroom.new
      c.company_id = row["company_id"]
      c.save
    end
    
    puts "There are now #{Chatroom.count} rows in the chatrooms table"
  end

end
