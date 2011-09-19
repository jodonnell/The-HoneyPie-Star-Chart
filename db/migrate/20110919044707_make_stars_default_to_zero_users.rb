class MakeStarsDefaultToZeroUsers < ActiveRecord::Migration
  def change
    change_column :users, :stars, :integer, :default => 0
  end
end
