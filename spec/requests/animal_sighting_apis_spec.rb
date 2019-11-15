require 'rails_helper'

RSpec.describe "AnimalSightingApis", type: :request do
    let!(:animal){Animal.create(common_name: "Lion", latin_name: "Panthera leo", kingdom: "	Animalia")}
    let(:animal_id){animal.id}
    let(:lat){12.232}
    # let!(:animal_sight){animal.animal_sightings.create(date: DateTime.parse('3rd Feb 2001 04:05:06+03:30'), lat: :lat, long: 123.233)}
    let!(:animal_sight2){AnimalSighting.create(date: DateTime.parse('3rd Feb 2001 04:05:06+03:30'), lat: 12.232, long: 123.233)}
    let(:animal_sighting_id){animal_sight.id}

    describe "POST /animal_sighting" do
        it "should creates an animal sighting" do
          headers = {
              "ACCEPT" => "application/json"
          }
          body = {animal_sighting: {date: DateTime.parse('3rd Feb 2001 04:05:06+03:30'), lat: :lat, long: 123.233, animal_id: animal.id}}
          post animal_sightings_path, params: body, headers: headers
          expect(response).to have_http_status(201)
        end
    end
end
