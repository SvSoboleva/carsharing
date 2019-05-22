class V1::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:show, :update, :destroy]

  def index
    @orders = Order.order('created_at DESC')
    render :index, status: :ok
  end  

  def show
    render :show, locals: { order: @order, user: set_user(@order) }, status: :ok
  end  

  def create
    @order = current_user.orders.build(order_params)
    #@order = Order.new(order_params)

    if @order.save
      render :created, status: :created
    else
      render json: {status: 'ERROR', message: 'Order not saved', 
                    data: @order.errors}, status: :unprocessable_entity
    end  
  end  

  def destroy
    if @order.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end  
  end

  def update

   if @order.update_attributes(order_params)
      render json: {status: 'SUCCESS', message: 'Updated order', data: order}, status: :ok 
    else
      render json: {status: 'ERROR', message: 'Order not updated', 
                    data: @order.errors}, status: :unprocessable_entity
    end  
  end

  private

  def order_params
    params.require(:order).permit(:number, :date, :car_id)
  end  

  def set_order
    @order = Order.find(params[:id])
  end

  def set_user(order)
    User.find_by(id: order.user_id)
  end
end
