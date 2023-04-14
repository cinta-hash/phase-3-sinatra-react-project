class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
    t.string :title
    t.string :plot_summary
    t.string :genre
    t.datetime :release_date 
    end
  end
end
