class AddPopcornToUsers < ActiveRecord::Migration
  def change
    add_column :users, :popcorn, :integer, :default => 0
  end
end
