# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

## TODO create mechanism to check for seeding businesses? (defaults to create models and old TempBusiness, omit for now)
#Dir[Rails.root.join('db/seeds/*.rb')].sort.each do |file|
#  puts "Processing #{file.split('/').last}"
#  require file
#end

Cuisine.find_or_create_by(name: "Asian")
Cuisine.find_or_create_by(name: "Mexican")

# Social Media Sites
facebook = SocialMediaSite.find_or_create_by(name: 'Facebook')
twitter = SocialMediaSite.find_or_create_by(name: 'Twitter')
instagram = SocialMediaSite.find_or_create_by(name: 'Instagram')
website = SocialMediaSite.find_or_create_by(name: 'Website')
grubhub = SocialMediaSite.find_or_create_by(name: 'Grubhub')
# Attach logos
# (taken from: https://icons8.com/icons/set/social-media)
facebook.logo.attach(io: File.open(Rails.root.join('public', 'assets', 'social-media-sites', 'facebook-logo.png')), filename: 'facebook-logo.png')
twitter.logo.attach(io: File.open(Rails.root.join('public', 'assets', 'social-media-sites', 'twitter-logo.png')), filename: 'twitter-logo.png')
instagram.logo.attach(io: File.open(Rails.root.join('public', 'assets', 'social-media-sites', 'instagram-logo.png')), filename: 'instagram-logo.png')
website.logo.attach(io: File.open(Rails.root.join('public', 'assets', 'social-media-sites', 'website-logo.png')), filename: 'website-logo.png')
grubhub.logo.attach(io: File.open(Rails.root.join('public', 'assets', 'social-media-sites', 'grubhub-logo.png')), filename: 'grubhub-logo.png')
# website_filepath = Rails.root.join('public', 'assets', 'social-media-sites', 'website-logo.png')
# website.logo.attach(io: File.open(website_filepath), filename: 'website-logo.png')
