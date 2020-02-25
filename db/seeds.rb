# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'open-uri'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row,
                converters: :numeric, header_converters: :symbol  }

# make new user with each row in the CSV file
# file location
filepath = 'db/users.csv'
CSV.read(filepath, csv_options).each do |row|
  # grab all columns (except for photo_* columns) and give 2 new planet instance
  args = row.to_h
  user = User.new(args)
  unless user.save
    puts "Couldn't create user #{user.email}. Maybe already in DB?"
  end
end

# make new environment with each row in the CSV file
# file location
filepath = 'db/environments.csv'
CSV.read(filepath, csv_options).each do |row|
  # grab all columns (except for photo_* columns) and give 2 new planet instance
  args = row.to_h
  environment = Environment.new(args)
  unless environment.save
    puts "Couldn't create environment #{environment.name}. Maybe already in DB?"
  end
end

# make new planet with each row in the CSV file
# file location
filepath = 'db/planets.csv'
CSV.read(filepath, csv_options).each do |row|
  # grab all columns (except for photo_* columns) and give 2 new planet instance
  planet_args = row.reject { |k, v| k =~ /\Aphoto_.*\z/ } .to_h
  planet = Planet.new(planet_args)
  # last 3 entries in the row are photo URLs
  photos = row.select { |k, v| k =~ /\Aphoto_.*\z/ } .to_h
  photos.each do |col_name, photo_url|
    photo = URI.open(photo_url)
    planet.photos.attach(io: photo, filename: "stella-erratica/#{planet.name}.png", content_type: 'image/png')
  end
  # assign the planet a random overlord
  planet.user = User.where(overlord: true).sample
  # assign the planet a random environment
  planet.environment = Environment.all.sample
  unless planet.save
    puts "Couldn't create planet #{planet.name}. Maybe already in DB?"
  end
end
