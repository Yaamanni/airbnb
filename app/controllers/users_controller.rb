class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]


# GET /listings
  def index
    @users = User.all
  end

# GET /listings/new
  def new
   @user = User.new
  end

# POST /articles
  def create
    @user = User.new(user_params)
  if @user.save
    redirect_to @user, notice: "User was successfully created."
  else
    render :new, status: :unprocessable_entity
  end
end


  def show
  end


  def edit
  end


  def update
  if @user.update(user_params)
    redirect_to @user, notice: "User was successfully created."
  else
    render :edit, status: :unprocessable_entity
  end
  end

  def destroy
  @user.destroy
  redirect_to users_path, notice: "User was deleted."
  end

private

  def set_user
  @user = User.find(params[:id])
  end

  def User_params
  params.require(:user).permit(:first_name, :last_name, :email, :user_type)
  end
end
end
