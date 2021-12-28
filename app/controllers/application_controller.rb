class ApplicationController < ActionController::Base
  def hello
    render html: 'yo'
  end
end
