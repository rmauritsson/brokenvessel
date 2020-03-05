class Admin::UsersController < Admin::ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(admin_user_params)
    if @user.save
      redirect_to admin_users_path, notice: 'User has been created'
    else
      flash.now[:alert] = 'User could not be saved'
      render :new
    end
  end

  def show; end

  def edit; end

  def update; end

  private

  def admin_user_params
    params.require(:user).permit(:email, :password, :username, :contact, :fullname, :admin, :listener)
  end
end
