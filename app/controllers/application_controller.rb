class ApplicationController < ActionController::API

  #acts_as_token_authentication_handler_for User, unless: ->(controller) { permitted_controller? controller }
  acts_as_token_authentication_handler_for User, fallback: :none

  def respond_json_error(message)
    render json: { error: message }, status: :unprocessable_entity
  end

  protected

  # def authenticate_user!
  #   if user_signed_in?
  #     super
  #   else
  #     render json: { error: 'Unauthorized user' }, status: :unauthorized
  #   end
  # end

  private

  def permitted_controller?(controller)
    (controller.instance_of? V1::SessionsController) || \
      (controller.instance_of?(V1::UsersController) && \
      controller.action_name == 'create')
  end
  
end
