class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/movies" do
    movies = Movie.all
    movies.to_json
  end
  #to get each movie
  get '/movies/:id' do
    movies = Movie.find(params[:id])

    # include associated reviews in the JSON response
    movies.to_json(only: [:id, :title, :genre, :image_url], include: {
      reviews: { only: [:comment, :rating], include: {
        user: { only: [:name] }
      } }
    })
  end

get "/reviews" do
    reviews = Review.all
    reviews.to_json
  end


  post '/reviews' do
    reviews = Review.create(
      user_id: params[:user_id],
      movie_id: params[movie_id],
      rating: params[rating],
      comment: params[comment]
    )
    reviews.to_json
  end

  patch '/reviews/:id' do
    review = Review.find(params[:id])
    review.update(
      rating: params[:rating],
      comment: params[:comment]
    )
    review.to_json
  end

  delete '/reviews/:id' do
    review = Review.find(params[:id])
    review.destroy
    review.to_json
  end
end
