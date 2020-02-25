class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  # GET /planets
  def index
  end

  # GET /planets/:id
  def show
  end

  # GET /planets/new
  def new
  end

  # POST /planets
  def create
  end

  # GET /planets/:id/edit
  def edit
  end

  # PATCH or PUT /planets/:id
  def update
  end

  # DELETE /planets/:id
  def destroy
  end
end
