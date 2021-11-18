class UsersController < ApplicationController
  skip_before_action :login_required, only: [:new, :create]
  before_action :set_user, only: [:show, :edit, :update]
  before_action :user_limit, only: [:show, :edit, :update]
  def new
    @user = User.new
  end

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user.id), notice: "編集しました！"
    else
      render :edit
    end
  end


  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :user_image,
    :password_confirmation)
  end

  def user_limit
    if current_user.id != @user.id
      redirect_to pictures_path, notice: "他人プロフィールは閲覧・編集・削除できません"
    end
  end

  def set_user
    @user = User.find(params[:id])
  end
end
