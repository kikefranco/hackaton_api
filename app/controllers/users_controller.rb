class UsersController < ApplicationController
  before_action :set_user, only: %i[show update destroy]

  # GET /users
  def index
    @users = if params[:name].present?
               user = User.find_by(name: params[:name].strip)
               return render json: {}, status: :not_found if user.nil?
               user
             else
               User.all
             end

    render json: @users, status: :ok
  end

  # GET /users/1
  def show
    render json: @user
  end

  def show_by_name
    @user = User.where(name: params[:name])

    render json: @user.last, status: :ok
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:name, :lastname, :birthdate, :password, :description, :image)
    end
end
