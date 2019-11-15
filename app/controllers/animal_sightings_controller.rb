class AnimalSightingsController < ApplicationController
    before_action :set_sighting, only: [ :update, :destroy]
    def show
        animal_sightings_for_animal = AnimalSighting.where(animal_id: params[:id])
        render json: animal_sightings_for_animal
    end
    def create
        new_sighting = AnimalSighting.new(sighting_params)
        if new_sighting.save
            render json: new_sighting, status: 201
        else
            render json: new_sighting.errors, status: 422
        end
    end
    def update
        if @sighting.update(sighting_params)
            render json: @sighting, status: 200
        else
            render json: @sighting, status: 404
        end
    end
    def destroy
        if @sighting.destroy
            render json: @sighting, status: 204
        else
            render json: @sighting, status: 404
        end
    end
    private
    def sighting_params
        params.require(:animal_sighting).permit(:animal_id, :date, :lat, :long)
    end
    def set_sighting
        @sighting = AnimalSighting.find(params[:id])
    end
end
