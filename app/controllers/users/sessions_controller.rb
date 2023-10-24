# app/controllers/users/sessions_controller.rb

class Users::SessionsController < Devise::SessionsController
  respond_to :json

  # POST /users/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    render json: resource
  end

  private

  def sign_in_params
    params.require(:user).permit(:login, :password)
  end
end
