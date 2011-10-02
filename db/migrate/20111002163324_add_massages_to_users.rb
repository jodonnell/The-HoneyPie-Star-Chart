class AddMassagesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :massages, :integer, :default => 0
  end
end
