class UsersController < ApplicationController
  
  def index
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    
    if @user.save
      flash[:success] = 'ユーザを登録しました。ログインしサービスをご利用ください。'
      redirect_to root_url
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
    
  end
  
  def requests
    @user = User.find(current_user.id)
    @pagy, @support_requests = pagy(@user.support_requests.order(id: :desc),items:10)
  end
  
  private

  def user_params
    params.require(:user).permit(:company_name, :name, :email, :password, :password_confirmation, :admin_flg)
  end
  
end
