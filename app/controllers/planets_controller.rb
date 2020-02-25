class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  # GET /planets
  def index
    @planets = Planet.all
  end

  # GET /planets/:id
  def show
    @planet = Planet.find(params[:id])
  end

  # GET /planets/new
  def new
    @planet = Planet.new(planet_params)
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

private

  def planet_params
    params.require(:planet).permit(:name, :description, :rate, :capacity)
  end
end
