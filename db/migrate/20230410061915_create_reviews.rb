class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :movie_id   
      t.integer :rating
      t.string :comment
      t.timestamp
    end
  end
end
