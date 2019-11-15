require 'rails_helper'

RSpec.describe AnimalSightingsController, type: :controller do
    let!(:animals){Animal.create(common_name: "Lion", latin_name: "Panthera leo", kingdom: "	Animalia")}
    let(:animal_id){animals.id}
    let!(:animal_sighting){}
    let(:animal_sighting_id){animal_sighting.id}
end
