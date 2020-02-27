class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # ROOT or GET /
  def home
  end

  # GET /dashboard
  def dashboard
    if current_user.overlord?
      # as an overlord, you can only see your own planets
      @planets = policy_scope(Planet).where(user: current_user)
    elsif current_user.traveller?
      # as a traveller, you can see all planets in the gallery
      @planets = policy_scope(Planet)
    end

    if current_user.overlord?
      # as an overlord, you can see only incoming bookings for your planets
      @bookings = policy_scope(current_user.incoming_bookings)
    elsif current_user.traveller?
      # as a traveller, you can see only bookings you've made
      @bookings = policy_scope(Booking).where(user: current_user)
    end
  end
end
