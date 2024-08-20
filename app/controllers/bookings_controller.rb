class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @user = current_user
    @service = Service.first # needs to be changed
  end

  def create
  end
end
