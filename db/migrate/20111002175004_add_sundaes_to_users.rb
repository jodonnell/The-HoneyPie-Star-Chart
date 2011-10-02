class AddSundaesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :sundaes, :integer, :default => 0
  end
end
