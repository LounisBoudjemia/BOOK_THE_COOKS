class UsersController < ApplicationController
  def profile
    @user = current_user
    @my_bookings = Booking.all.select { |m| m.user_id == @user.id }
    @my_gigs = Service.all.select { |m| m.user_id == @user.id }
  end
end
