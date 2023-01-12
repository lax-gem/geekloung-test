class UsersController < ApplicationController

  def index
    @user = User.first
  end

  def new
  end

  def show
    @user = User.first
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "新規登録が完了しました！"
      redirect_to @user
    else
      render 'new', status: :unprocessable_entity
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email)
    end
end
