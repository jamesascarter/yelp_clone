class DeleteRestaurantId < ActiveRecord::Migration
  def change
    change_table :restaurants do |t|
    t.remove :restaurant_id
    end
  end
end

