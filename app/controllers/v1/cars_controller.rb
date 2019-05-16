class V1::CarsController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_car, only: [:show, :update, :destroy]


  def index
    @cars = Car.order('created_at DESC')
    render json: @cars, status: :ok
  end  

  def show
    render json: {status: 'SUCCESS', message: 'Loaded car', data: @car}, status: :ok
  end  

  def create
    #@order = current_user.orders.build(order_params)
    @car = Car.new(car_params)

    if @car.save
      render json:  @car, status: :created
    else
      render json: {status: 'ERROR', message: 'Car not saved', 
                    data: @car.errors}, status: :unprocessable_entity
    end  
  end  

  def destroy
    if @car.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end  
  end

  def update

   if @car.update_attributes(car_params)
      render json: {status: 'SUCCESS', message: 'Updated car', data: car}, status: :ok 
    else
      render json: {status: 'ERROR', message: 'Car not updated', 
                    data: car.errors}, status: :unprocessable_entity
    end  
  end

  private

  def car_params
    params.require(:car).permit(:state_number, :car_brand, :user_id)
  end  

  def set_car
    @car = Car.find(params[:id])
  end
end