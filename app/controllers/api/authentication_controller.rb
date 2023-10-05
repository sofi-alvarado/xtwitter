class Api::AuthenticationController < Api::ApiController 
    skip_before_action :authenticate_user!

    def create
        Rails.logger.debug "wtf?"
        user = User.find_by(email: params[:user][:email])
        debugger
        if user.valid_password? params[:user][:password]
            render json: { token: Api::JsonWebToken.encode(sub: user.id)}

        else 
            render json: { errors: ["Invalid email or password"] }
        end
    end
end
