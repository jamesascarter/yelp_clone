class AddUserIdToRestaurants < ActiveRecord::Migration
  def change
    add_reference :restaurants, :restaurant, index: true
  end
end
