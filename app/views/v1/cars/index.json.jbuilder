json.data do
  json.array! @cars do |car|
    json.partial! 'v1/cars/car', car: car
  end  
end