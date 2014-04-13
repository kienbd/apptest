class HomeController < ApplicationController

  before_filter :signed_in_user?

	def index

	end

  def signed_in_user?
    unless user_signed_in?
      redirect_to new_user_registration_path
    end
  end





end
