class Admin::UsersController < Admin::ApplicationController
  before_action :set_user, only: %i[show edit update archive]

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

  def update
    params[:user].delete(:password) if params[:user][:password].blank?

    if @user.update(admin_user_params)
      redirect_to admin_users_path, notice: 'User has been updated'
    else
      flash.now[:alert] = 'User could not be updated'
      render :edit
    end
  end

  def archive
    if @user == current_user
      flash[:alert] = 'You cannot archive yourself'
    else
      @user.archive
      flash[:notice] =  'User has been archived'
    end

    redirect_to admin_users_path
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def admin_user_params
    params.require(:user).permit(:email, :password, :username, :contact, :fullname, :admin, :listener)
  end
end
