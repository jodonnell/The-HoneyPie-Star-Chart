class AddDinnerToUsers < ActiveRecord::Migration
  def change
    add_column :users, :dinner, :integer, :default => 0
  end
end
