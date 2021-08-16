class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_back fallback_location: '/'
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
    
  end
  
  private

  def user_params
    params.require(:user).permit(:company_name, :name, :email, :password, :password_confirmation, :admin_flg)
  end
  
end
