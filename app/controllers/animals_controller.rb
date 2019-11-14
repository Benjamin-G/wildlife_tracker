class AnimalsController < ApplicationController
    before_action :set_animal, only: [:show, :update, :destroy]

    def index
        animals = Animal.all
        render json: animals
    end
    def create
        new_animal = Animal.new(animal_params)
        if new_animal.save
            render json: new_animal, status: 201
        else
            render json: new_animal.errors, status: 422
        end
    end
    def destroy
        if @animal.destroy
            render json: @animal, status: 204
        else
            render json: @animal, status: 404
        end
    end

    def update
        if @animal.update(animal_params)
            render json: @animal, status: 200
        else
            render json: @animal, status: 404
        end
    end

    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end
    def set_animal
        @animal = Animal.find(params[:id])
    end
end
