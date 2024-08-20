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
    @user = current_user
    @service.user = @user
    if @service.save
      redirect_to @service, notice: "Let's get cooking!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def service_params
    params.require(:service).permit(:name, :category, :description)
  end
end
