module JwtHandler
    extend ActiveSupport::Concern
  
    def encode(payload, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i
      JWT.encode(payload, Rails.application.config.jwt_secret)
    end
  
    def decode(token)
      body = JWT.decode(token, Rails.application.config.jwt_secret)[0]
      HashWithIndifferentAccess.new body
    rescue
      nil
    end
end