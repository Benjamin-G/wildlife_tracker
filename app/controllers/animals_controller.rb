class AnimalsController < ApplicationController
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
    
    private
    def animal_params
        params.require(:animal).permit(:common_name, :latin_name, :kingdom)
    end
end
