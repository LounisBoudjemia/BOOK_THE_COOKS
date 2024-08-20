class UsersController < ApplicationController
  def show
    @user = current_user
    @my_bookings = Booking.all.select { |m| m.user_id == @user.id }
  end
end
