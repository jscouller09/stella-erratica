class PlanetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  # GET /planets
  def index
    if params[:query] && !params[:query].empty?
      @planets = policy_scope(Planet).global_search(params[:query])
    else
      @planets = policy_scope(Planet)
    end
  end

  # GET /planets/:id
  def show
    @planet = Planet.find(params[:id])
    authorize @planet
  end

  # GET /planets/new
  def new
    @planet = Planet.new
    authorize @planet
  end

  # POST /planets
  def create
    @planet = Planet.new(planet_params)
    @planet.user = current_user
    authorize @planet
    if @planet.save
      redirect_to planet_path(@planet)
    else
      render "new"
    end
  end

  # GET /planets/:id/edit
  def edit
    @planet = Planet.find(params[:id])
    authorize @planet
  end

  # PATCH or PUT /planets/:id
  def update
    @planet = Planet.find(params[:id])
    authorize @planet
    if @planet.update(planet_params)
      redirect_to planet_path(@planet)
    else
      render "edit"
    end
  end

  # DELETE /planets/:id
  def destroy
  # TODO only owners can destroy their own planets
    @planet = Planet.find(params[:id])
    authorize @planet
    @planet.destroy
    redirect_to dashboard_path
  end

private

  def planet_params
    params.require(:planet).permit(:name, :description, :rate, :capacity, environment_ids: [], photos: [])
  end
end
