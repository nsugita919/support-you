class SupportRequestsController < ApplicationController
  before_action :require_user_logged_in
  
  def index
    @pagy, @support_requests = pagy(SupportRequest.all.order(id: :desc),items:5)
  end

  def new
    @support_request = SupportRequest.new
  end

  def create
    @support_request = current_user.support_requests.build(support_request_params)
    if @support_request.save
      flash[:success] = 'サポートのリクエストを受け付けました。'
      redirect_to requests_user_path(@support_request.user)
    else
      flash.now[:danger] = 'サポートのリクエスト登録に失敗しました。'
      render :new
    end
  end

  def show
    @support_request = SupportRequest.find(params[:id])
  end
  
  def edit
    if current_user.admin_flg
      @support_request = SupportRequest.find(params[:id])
    else
      redirect_to requests_user_path
    end
  end
  
  def update
    @support_request = SupportRequest.find(params[:id])
    
    if @support_request.update(support_status_params)
      flash[:success] = 'ステータスは正常に更新されました'
      redirect_to @support_request
    else
      flash.now[:danger] = 'ステータスの更新に失敗しました'
      render :edit
    end        
  end
  
  private

  def support_request_params
    params.require(:support_request).permit(:contents, :product_name, :status)
  end

  def support_status_params
    params.require(:support_request).permit(:contents, :status)
  end


end
