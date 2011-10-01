class AddMovieTicketsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :movie_tickets, :integer, :default => 0
  end
end
