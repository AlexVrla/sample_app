class StaticPagesController < ApplicationController
  def home
  end

  def help
  end

  def about
    @user = User.create()
  end

  def contact

  end


end
