class Api::UsersController < ApplicationController
  before_action :set_default_format
  before_action :set_user, only: %i[ show update ]
  before_action :authenticate_user!

  def show 
    #@followers_count = @user.followers_count.count
    #@followings_count = @user.followings_count.count
  end

  # PATCH/PUT /api/users/1
  # PATCH/PUT /api/users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :username, :bio, :location, :link, :email, :password, :encrypted_password, :lastname)
    end

    def set_default_format
      request.format = :json
  end
end
