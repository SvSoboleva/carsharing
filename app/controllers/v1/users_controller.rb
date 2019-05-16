class V1::UsersController < ApplicationController

  def create
    @user = User.new(user_params)

    if @user.save
      render json:  @user, status: :created
    else
      render json: {status: 'ERROR', message: 'User not saved', 
                    data: @user.errors}, status: :unprocessable_entity
    end  
  end  

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end  
end