# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Clearing database"
Listing.destroy_all

puts "Creating listings"
6.times do
  listing = Listing.new(
    title: Faker::TvShows::Friends.location,
    num_of_beds: (1..10).to_a.sample,
    num_of_guests: (1..10).to_a.sample,
    description: Faker::Hipster.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 3),
    start_date: Faker::Date.between(from: Date.today, to: 1.days.from_now),
    end_date: Faker::Date.forward(days: 60),
    price: (80..500).to_a.sample,
    image_url: "http://picsum.photos/id/#{rand(0..500)}/#{rand(1000..1200)}/#{rand(750..850)}"
    # image_url: Faker::LoremFlickr.image(size: "320x240", search_terms: ['house', 'apartment', 'flat', 'room'])
  )
  listing.save!
  puts "Finished listings!"

  puts "Creating bookings"
  (0..2).to_a.sample.times do
    booking = Booking.new(
      start_date:Faker::Date.between(from: Date.today, to: 1.days.from_now),
      end_date: Faker::Date.forward(days: 60),
      num_of_guests: (1..10).to_a.sample,
      listing: listing
    )
    booking.save!
    puts "Finished bookings!"

    puts "Creating reviews"
    (0..3).to_a.sample.times do
      review = Review.new(
        content: Faker::Hipster.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 3),
        rating: (1..5).to_a.sample,
        listing: listing,
        booking: booking
      )
      review.save!

    end
  end
end

# puts "Creating bookings"
# (2..5).to_a.sample.times do
#   booking = Booking.new(
#     start_date:Faker::Date.between(from: Date.today, to: 1.days.from_now),
#     end_date: Faker::Date.forward(days: 60),
#     num_of_guests: (0..10).to_a.sample,
#     listing: listing
#   )
#   booking.save!
# end
# puts "Finished bookings!"

# puts "Creating reviews"
# (2..5).to_a.sample.times do
#   review = Review.new(
#     content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 2),
#     rating: (0..5).to_a.sample
#   )
#   review.save!
# end
# puts "Finished reviews!"
