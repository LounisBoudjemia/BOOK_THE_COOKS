class UsersController < ApplicationController
  def profile
    # select the current user
    @user = current_user
    # select all bookings that belong to the current user
    @my_bookings = Booking.all.select { |booking| booking.user_id == @user.id }
    # select all services that belong to the current user
    @my_services = Service.all.select { |service| service.user_id == @user.id }
    # select all service ids that belong to the current user
    @my_service_ids = @my_services.map { |service| service[:id] }
    # select all bookings that belong to these services
    @my_gigs = Booking.where(service_id: @my_service_ids)
  end
end
