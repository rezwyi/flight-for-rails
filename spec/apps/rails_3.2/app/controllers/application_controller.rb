class ApplicationController < ActionController::Base
  protect_from_forgery

  respond_to :html

  def index
    respond_with({})
  end
end