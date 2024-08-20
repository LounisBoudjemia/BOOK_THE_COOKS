class ServicesController < ApplicationController
  def index
    @services = Service.all
  end

  def show
    @service = Service.find(params[:id])
    @user = User.new(last_name: "Schuch", first_name: "Frida")
  end

  def new
    @service = Service.new
  end

  def create
    @service = Service.new(service_params)
    @service = Service.save
  end

  private

  def service_params
    params.require(:service).permit(:name, :category)
  end
end
