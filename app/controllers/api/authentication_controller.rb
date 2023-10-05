class Api::AuthenticationController < Api::ApiController 
    skip_before_action :authenticate_token!, :only => "reply", :raise => false

    def create
        user = User.find_by(email: params[:user][:email])
        #debugger
        if user.valid_password? params[:user][:password]
            render json: { token: Api::JsonWebToken.encode(sub: user.id)}
           
        else 
            render json: { errors: ["Invalid email or password"] }
        end

        #debugger
    end

end
