class CreateTelemetries < ActiveRecord::Migration[5.2]
  def change
    create_table :telemetries do |t|
      t.float :speed
      t.float :oil_level
      t.float :mileage
      t.references :car, foreign_key: true
      t.references :order, foreign_key: true

      t.timestamps
    end
  end
end
