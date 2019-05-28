class AddIgnitionToTelemetries < ActiveRecord::Migration[5.2]
  def change
     add_column :telemetries, :ignition, :binary, default: false
     add_column :telemetries, :engine_started, :binary, default: false
     add_column :telemetries, :lights, :binary, default: false
     add_column :telemetries, :latitude, :float
     add_column :telemetries, :longtitude, :float
     add_column :telemetries, :altitude, :float
     add_column :telemetries, :device_id, :bigint
  end
end
