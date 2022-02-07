class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:destroy, :create]

  def create
    @user = current_user
    @micropost = @user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to user_path(@user)
    else
      render 'static_pages/home'
    end
  end

  def destroy
    @user = current_user
    @micropost.destroy
    flash[:danger] = "Please log in."
    redirect_to user_path(@user)
  end


  private

    def micropost_params
      params.require(:micropost).permit(:content)
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_path
      end
    end
end
