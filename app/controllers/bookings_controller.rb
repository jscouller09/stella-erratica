class BookingsController < ApplicationController
  # GET /planets/:planet_id/bookings/new
  def new
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new
    authorize @booking
  end

  # POST /planets/:planet_id/bookings
  def create
    @planet = Planet.find(params[:planet_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.planet = @planet
    authorize @booking
    @booking.duration = @booking.end - @booking.start
    @booking.cost = @planet.rate * @booking.duration
    if @booking.save
      flash[:notice] = "Your Request Has Been Sent to the Overlord. Awaiting approval."
      redirect_to planet_path(@planet)
    else
      render "new"
    end
  end

  # # GET /bookings/:id/edit
  # def edit
  #   @booking = Booking.find(params[:id])
  #   authorize @booking
  # end

  # PATCH or PUT /bookings/:id
  # def update
  #   @booking = Booking.find(params[:id])
  #   authorize @booking
  #   @booking.update(booking_params)
  #   redirect_to dashboard_path
  # end

  def approve_booking
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.approved = true
    @booking.save
    redirect_to dashboard_path
  end

  def complete_booking
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.complete = true
    @booking.save
    redirect_to dashboard_path
  end

  def reject_booking
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.approved = false
    @booking.completed = true
    @booking.save
    redirect_to dashboard_path
  end



  # DELETE /bookings/:id
  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.destroy
    redirect_to dashboard_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start, :end)
  end
end
