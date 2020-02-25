class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  # ROOT or GET /
  def home
  end

  # GET /dashboard
  def dashboard
    # TO DO: Add dashboards for overlords and ITs
  end
end
