class SightingsController < ApplicationController
  def show
    sighting = Sighting.find_by(id: params[:id])
    if sighting
      render json: sighting, include: {
        bird: {only: [:name, :species]},
        location: {only: [:latitude, :longitude]}
      }, except: [:updated_at]
    else
      render json: "Oops!"
    end
  end
end
