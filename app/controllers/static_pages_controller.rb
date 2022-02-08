class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @user = current_user
      @micropost = @user.microposts.build
    else
      render 'home'
    end

  end

  def help
  end

  def about
    @user = User.create()
  end

  def contact

  end


end
