class ApplicationController < ActionController::API
    include JwtHandler
  
    private
  
    def authenticate_request
        header = request.headers['Authorization']
        return unauthorized_access unless header.present?
        token = header.split(' ').last
        decoded = decode(token)
        if decoded
          @current_user = User.find_by(id: decoded[:id])
          unauthorized_access unless @current_user
        else
          unauthorized_access
        end
    end
    
    def unauthorized_access
        render json: { error: 'Unauthorized' }, status: :unauthorized
    end
end
