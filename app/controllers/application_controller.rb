class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  protected
  def is_at_least_artist?
    current_user && [:artist, :moderator, :superuser].include?(current_user.role)
  end

  def is_super_user?
    current_user && current_user.role == :superuser
  end

  def is_moderator?
    current_user && current_user.role == :moderator
  end

  def is_artist?
    current_user && current_user.role == :artist
  end

  def is_appreciator?
    current_user && current_user.role == :appreciator?
  end
end
