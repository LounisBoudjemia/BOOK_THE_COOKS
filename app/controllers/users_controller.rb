class UsersController < ApplicationController
  def profile
    # select the current user
    @user = current_user
    # select all bookings that belong to the current user
    @my_bookings = Booking.all.select { |booking| booking.user_id == @user.id }
    # select all services that belong to the current user
    @services = Service.all.select { |service| service.user_id == @user.id }
    # select all service ids that belong to the current user
    @service_ids = @services.map { |service| service[:id] }
    # select all bookings that belong to these services
    @my_gigs = Booking.where(service_id: @service_ids)
  end

  def account
    # select the current user
    @user = current_user
    @username = current_user.username
  end
end
