class Api::V1::Users::SessionsController < Devise::SessionsController
  respond_to :json

  def create
    user = User.find_by(email: params[:user][:email])

    if user.present? && user.valid_password?(params[:user][:password])
      sign_in(:user, user)
      render json: { token: user.generate_jwt }, status: :created
    else
      render json: { error: 'Invalid email or password' }, status: :unauthorized
    end
  end

  private

  def respond_to_on_destroy
    head :no_content
  end
end
