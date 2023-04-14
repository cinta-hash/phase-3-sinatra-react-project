require 'faker'
puts "🌱 Seeding spices..."

# Seed your database here
10.times do
    User.create(name: Faker::Name.name,
    email: Faker::Internet.email
    )
  end
  
  
  10.times do
    # create a movie with random data
    movie = Movie.create(
      title: Faker::Movie.title,
      plot_summary: Faker::Lorem.sentence,
      genre: Faker::Lorem.word,
      release_date: Faker::Date.between(from: 20.years.ago, to: Date.today),
      image_url: Faker::LoremFlickr.image
    )
    
    # create between 1 and 5 reviews for each movie
    rand(1..5).times do
      # get a random user for every review
      # https://stackoverflow.com/a/25577054
      user = User.order('RANDOM()').first
  
      # A review belongs to a movie and a user, so we must provide those foreign keys
      Review.create(
        movie_id: movie.id,
        user_id: user.id,
        rating: rand(1..10),
        comment: Faker::Lorem.sentence,
        
      )
    end
  end

puts "✅ Done seeding!"
