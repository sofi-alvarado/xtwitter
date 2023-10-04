class Api::UsersController < ApplicationController
  before_action :set_api_user, only: %i[ show edit update destroy ]
  before_action :set_default_format
  before_action :authenticate_user!
  # GET /api/users
  # GET /api/users.json
  def index
    @users = User.all
    render json: @users
  end

  # GET /api/users/1
  # GET /api/users/1.json
  def show
    @user = User.find(params[:id])
    render json: @user
  end

  # GET /tweets/new
  def new

  end
  # POST /api/users
  # POST /api/users.json
  def create
    @user = User.new(api_user_params)

    if @user.save
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /api/users/1
  # PATCH/PUT /api/users/1.json
  def update
    if @user.update(api_user_params)
      render :show, status: :ok, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/users/1
  # DELETE /api/users/1.json
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_api_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def api_user_params
      params.require(:user).permit(:name, :username, :bio, :location, :link, :email, :password, :lastname)
    end

    def set_default_format 
      request.format = :json unless params[:format]
    end
end
