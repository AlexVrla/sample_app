class ApplicationController < ActionController::Base
  def hi
    render html: 'yo'    
  end
end
