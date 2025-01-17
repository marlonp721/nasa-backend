class Api::V1::Users::RegistrationsController < Devise::RegistrationsController
    respond_to :json
  
    private
  
    def respond_with(resource, _opts = {})
      if resource.persisted?
        render json: { message: 'Signed up successfully.', user: resource }, status: :ok
      else
        render json: { message: 'Sign up failed.', errors: resource.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    def sign_up_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end
  
    def account_update_params
      params.require(:user).permit(:email, :password, :password_confirmation, :current_password)
    end
end