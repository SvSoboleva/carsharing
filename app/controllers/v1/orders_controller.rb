class V1::OrdersController < ApplicationController
  #before_action :authenticate_user!
  before_action :set_order, only: [:show, :update, :destroy]


  def index
    @orders = Order.order('created_at DESC')
    render json: @orders, status: :ok
  end  

  def show
    render json: {status: 'SUCCESS', message: 'Loaded order', data: @order}, status: :ok
  end  

  def create
    #@order = current_user.orders.build(order_params)
    @order = Order.new(order_params)

    if @order.save
      render json:  @order, status: :created
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
                    data: order.errors}, status: :unprocessable_entity
    end  
  end

  private

  def order_params
    params.require(:order).permit(:number, :date, :user_id)
  end  

  def set_order
    @order = Order.find(params[:id])
  end
end
