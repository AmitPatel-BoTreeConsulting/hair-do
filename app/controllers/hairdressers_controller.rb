class HairdressersController < ApplicationController
   skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    #@hairdressers = Hairdresser.all
    @hairdressers = Hairdresser.where.not(latitude: nil, longitude: nil)
      # array of instances of flat that we iterate over with map which returns an array
    @markers = @hairdressers.map do |hairdresser|
      {
        lat: hairdresser.latitude,
        lng: hairdresser.longitude
      }
    end
  end

  def show
    @hairdresser = Hairdresser.find(params[:id])
  end

  def new
    @hairdresser = Hairdresser.new
  end

  def create
    @hairdresser = Hairdresser.new(hairdresser_params)
    # @hairdresser.save ? (redirect_to hairdresser_path(@hairdresser)) : (render 'new')
      if @hairdresser.save!
        redirect_to hairdresser_path(@hairdresser)
      else
        render 'new'
      end
  end

  def edit
    @hairdresser = Hairdresser.find(params[:id])
  end

  def update
    @hairdresser =  Hairdresser.find(params[:id])
  end

  def destroy
    @hairdresser =  Hairdresser.find(params[:id])
  end
end
private

def hairdresser_params
  params.require(:hairdresser).permit(:name, :address, :photo, :location, :description, :photo_cache)
end
