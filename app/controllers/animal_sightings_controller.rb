class AnimalSightingsController < ApplicationController
    def create
        new_sighting = AnimalSighting.new(sighting_params)
        if new_sighting.save
            render json: new_sighting, status: 201
        else
            render json: new_sighting.errors, status: 422
        end
    end

    private
    def sighting_params
        params.require(:animal_sighting).permit(:animal_id, :date, :lat, :long)
    end
    def set_animal
        @animal = Animal.find(params[:id])
    end
end
