class BookingsController < ApplicationController
  # GET /planets/:planet_id/bookings/new
  def new
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new
  end

  # POST /planets/:planet_id/bookings
  def create
  # planet_id should be coming from the form linked through the show page
    @booking = Booking.new(booking_params)
    @user = current_user.id
    @booking.user = @user
    if @booking.save
  # TODO make this redirect to the user dashboard
      redirect_to planets_path
    else
      render "new"
    end
  end

  # GET /bookings/:id/edit
  def edit
  end

  # PATCH or PUT /bookings/:id
  def update
  end

  # DELETE /bookings/:id
  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :end)
  end
end
