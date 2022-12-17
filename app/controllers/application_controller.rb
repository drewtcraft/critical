class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  before_action :configure_permitted_devise_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  protected
  def configure_permitted_devise_parameters
    devise_parameter_sanitizer

  end

  def is_at_least_artist?
    current_user && [:artist, :moderator, :superuser].include?(current_user.role)
  end

  def is_god?
    current_user && current_user.role == :god
  end

  def is_mod?
    current_user && current_user.role == :mod
  end

  def is_artist?
    current_user && current_user.role == :artist
  end

  def is_spectator?
    current_user && current_user.role == :spectator?
  end
end
