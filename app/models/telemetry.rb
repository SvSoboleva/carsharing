class Telemetry < ApplicationRecord
  belongs_to :car
  belongs_to :order, optional: true
end
