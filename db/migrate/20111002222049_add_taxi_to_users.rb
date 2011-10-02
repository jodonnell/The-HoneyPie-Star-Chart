class AddTaxiToUsers < ActiveRecord::Migration
  def change
    add_column :users, :taxi, :integer, :default => 0
  end
end
