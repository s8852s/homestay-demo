class RegistrationsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(params_user)
    if @user.save
      redirect_to root_path, notice: "註冊成功"
    else
      render :new
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    if current_user.update(params_user)
      redirect_to root_path, notice: "編輯會員資料成功!"
    else
      render :edit
    end
  end

  private
  def params_user
    params.require(:user).permit(:email, :account, :password, :password_confirmation, :nickname)
  end
end
