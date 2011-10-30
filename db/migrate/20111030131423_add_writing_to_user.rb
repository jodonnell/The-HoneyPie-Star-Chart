class AddWritingToUser < ActiveRecord::Migration
  def change
    add_column :users, :writing, :integer, :default => 0
  end
end
