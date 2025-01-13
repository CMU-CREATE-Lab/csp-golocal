# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
  puts "Processing #{file.split('/').last}"
  require file
end

Cuisine.create(name: "Asian")
Cuisine.create(name: "Mexican")

# Social Media Sites
facebook = SocialMediaSite.create(name: 'Facebook')
twitter = SocialMediaSite.create(name: 'Twitter')
instagram = SocialMediaSite.create(name: 'Instagram')
website = SocialMediaSite.create(name: 'Website')
# Attach logos
# (taken from: https://icons8.com/icons/set/social-media)
facebook.logo.attach(io: File.open(Rails.root.join('public', 'assets', 'social-media-sites', 'facebook-logo.png')), filename: 'facebook-logo.png')
twitter.logo.attach(io: File.open(Rails.root.join('public', 'assets', 'social-media-sites', 'twitter-logo.png')), filename: 'twitter-logo.png')
instagram.logo.attach(io: File.open(Rails.root.join('public', 'assets', 'social-media-sites', 'instagram-logo.png')), filename: 'instagram-logo.png')
website.logo.attach(io: File.open(Rails.root.join('public', 'assets', 'social-media-sites', 'website-logo.png')), filename: 'website-logo.png')
# website_filepath = Rails.root.join('public', 'assets', 'social-media-sites', 'website-logo.png')
# website.logo.attach(io: File.open(website_filepath), filename: 'website-logo.png')
