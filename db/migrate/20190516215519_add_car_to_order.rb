class AddCarToOrder < ActiveRecord::Migration[5.2]
  def change
    add_reference :orders, :car, foreign_key: true
  end
end
