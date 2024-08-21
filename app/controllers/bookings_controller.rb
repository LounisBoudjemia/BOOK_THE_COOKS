class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.new
    @service = Service.find(params[:service_id])
  end

  def create
    @service = Service.find(params[:service_id])
    @booking = current_user.bookings.build(booking_params)
    @booking.service = @service
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    # No need for app/views/restaurants/destroy.html.erb
    redirect_to profile_path, status: :see_other
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :service_id, :date)
  end
end
