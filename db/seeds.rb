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
    title: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 4),
    num_of_rooms: (0..5).to_a.sample,
    num_of_beds: (0..10).to_a.sample,
    num_of_guests: (0..10).to_a.sample,
    description: Faker::Lorem.paragraphs(number: 1),
    start_date:Faker::Date.between(from: Date.today, to: 1.days.from_now),
    end_date: Faker::Date.forward(days: 60),
    price: (80..500).to_a.sample
    # photos: Faker::LoremFlickr.image(size: "320x240", search_terms: ['holiday', 'apartments'], match_all: true)
  )
  listing.save!
  puts "Finished listings!"

  puts "Creating bookings"
  (1..3).to_a.sample.times do
    booking = Booking.new(
      start_date:Faker::Date.between(from: Date.today, to: 1.days.from_now),
      end_date: Faker::Date.forward(days: 60),
      num_of_guests: (0..10).to_a.sample,
      listing: listing
    )
    booking.save!
    puts "Finished bookings!"

    puts "Creating reviews"
    (1..3).to_a.sample.times do
      review = Review.new(
        content: Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 2),
        rating: (0..5).to_a.sample,
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
