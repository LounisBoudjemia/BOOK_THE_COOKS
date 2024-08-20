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

  def edit
    @service = Service.find(params[:id])
  end

  def update
    @service = Service.find(params[:id])
    if @service.update(service_params)
      redirect_to @service, notice: 'You updated your Service successfully.'
    else
      render :edit
    end
  end
  
  def destroy
    @service = Service.find(params[:id])
    @service.destroy
    redirect_to services_path(@service)
  end

  private

  def service_params
    params.require(:service).permit(:name, :category, :description)
  end
end
