puts "🌱 Seeding spices..."

# Seed your database here
10.times do 
    Movie.create!(
        title :Faker::Movie.title,
        plot_summary :Faker::Lorem.paragraph(sentence_count: 2),
        genre: Faker::Book.genre,
        release_date :Faker::Date.between(from: 20.years.ago, to: Date.today)
    )
    file = URI.open(Faker::LoremPixel.image(size: "300x400", is_gray: false, category: 'abstract'))
     movie.image.attach(io: file, filename: "#{Faker::Lorem.word}.jpg")
    movie.save!
end

10.times do
    User.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email
    )
end

User.all.each do |user|

    Movie.all.each do |movie|

        Review.create!(
            user_id: user.id,
            movie_id:movie.id,
            rating: rand(1..10),
            comment: Lorem.paragraph(sentence_count: 2)
        )
    end
end

puts "✅ Done seeding!"
