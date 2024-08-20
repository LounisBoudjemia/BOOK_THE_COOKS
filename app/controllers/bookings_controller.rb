class BookingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @booking = Booking.new
    @user = current_user
    @service = Service.find(params[:service_id])
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    if @booking.save
      redirect_to @booking, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:name, :service_id, :date)
  end
end
