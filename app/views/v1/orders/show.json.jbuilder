json.data do
  json.order do
    json.partial! 'v1/orders/order', order: order
    json.user do
      json.partial! 'v1/users/user', user: user
    end  
  end  
end 