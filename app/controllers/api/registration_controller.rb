class Api::RegistrationController < Api::ApiController 
    skip_before_action :authenticate_user!
    before_action :set_default_format

    def new
        @user = User.new
      end

    def create
        @user = User.new(user_params)
    
        respond_to do |format|
          if @user.save
            format.html { redirect_to user_url(@user), notice: "User was successfully created." }
            format.json { render :show, status: :created, location: @user }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: @user.errors, status: :unprocessable_entity }
          end
        end
      end

      def user_params
        params.require(:user).permit(:name, :username, :email, :password, :encrypted_password, :lastname)
      end
end
