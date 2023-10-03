class Api::UsersController < ApplicationController
  before_action :set_api_user, only: %i[ show update destroy ]

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
    @users = User.new
  end
  # POST /api/users
  # POST /api/users.json
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

  # PATCH/PUT /api/users/1
  # PATCH/PUT /api/users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/users/1
  # DELETE /api/users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
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
end
