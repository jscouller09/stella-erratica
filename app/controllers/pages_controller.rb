class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # ROOT or GET /
  def home
  end

  # GET /dashboard
  def dashboard
    @planets = policy_scope(Planet)
    @bookings = policy_scope(Booking)
    authorize @planets
    authorize @bookings
  end
end
