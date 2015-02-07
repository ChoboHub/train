class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_resource, only: [:show, :update, :destroy, :edit]

  def set_resource
    raiser "you must overwrite this method in your controller!"
  end

  protected

end