class AddActivitiesToUser < ActiveRecord::Migration
  def change
    add_column :users, :yoga, :integer, :default => 0
    add_column :users, :gym, :integer, :default => 0
    add_column :users, :meditation, :integer, :default => 0
  end
end
