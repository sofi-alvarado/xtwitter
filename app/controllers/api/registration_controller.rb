class Api::RegistrationController < Api::ApiController 
    skip_before_action :authenticate_user!
    before_action :set_default_format
    before_action :user_params, only: %i[ show create ]
  

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
          if @user.save
            token = Api::JsonWebToken.encode(id: @user.id)
            render json: { token: token }
          else
            render json: @user.errors, status: :unprocessable_entity
          end
        end
      end

      def user_params
        params.require(:user).permit(:name, :username, :email, :password)
      end
end
