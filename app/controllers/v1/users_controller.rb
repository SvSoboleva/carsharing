class V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: { data: @users }, status: :ok
  end  

  def show
    @user = User.find(params[:id])
    render json: { data: @user }, status: :ok
  end  

  def create
     @user = User.new(user_params)

    if @user.save
      render json: { message: 'Saved user', data: @user }, status: :ok 
    else
      render json: { message: 'User not saved', data: @user.errors}, status: :unprocessable_entity
    end  
  end  

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    render json: { message: 'Deleted user', data: @user }, status: :ok 
  end

  def update
   @user = User.find(params[:id])

   if @user.update_attributes(user_params)
      render json: { message: 'Updated user', data: @user }, status: :ok 
    else
      render json: { message: 'User not updated', 
                    data: user.errors}, status: :unprocessable_entity
    end  
  end

  private

  def user_params
    params.permit(:nickname, :role)
  end  
end
