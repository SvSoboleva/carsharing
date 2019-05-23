FactoryBot.define do
  factory :telemetry do
    speed { 1.5 }
    oil_level { 1.5 }
    mileage { 1.5 }
    car { nil }
    order { nil }
  end
end
