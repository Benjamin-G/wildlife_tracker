require 'rails_helper'

RSpec.describe "AnimalSightingApis", type: :request do
    let!(:animal){Animal.create(common_name: "Lion", latin_name: "Panthera leo", kingdom: "	Animalia")}
    let(:animal_id){animal.id}
    let(:lat){12.000}
    # let!(:animal_sight){animal.animal_sightings.create(date: DateTime.parse('3rd Feb 2001 04:05:06+03:30'), lat: :lat, long: 123.233)}
    let!(:animal_sight1){AnimalSighting.create(date: DateTime.parse('4rd Feb 2001 04:05:06+03:30'), lat: 13.232, long: 124.233, animal_id: animal.id)}
    let!(:animal_sight2){AnimalSighting.create(date: DateTime.parse('3rd Feb 2001 04:05:06+03:30'), lat: 12.232, long: 123.233, animal_id: animal.id)}
    let(:animal_sighting_id){animal_sight1.id}

    describe "GET /animal_sighting/:animal_id" do
        before { get "/animal_sightings/#{animal_id}"}
        it "should return a 200 http response" do
          expect(response).to have_http_status(200)
        end
    end
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

    describe "PUT /animal_sighting/:id" do
        it "should return status code 204" do
          headers = {
              "ACCEPT" => "application/json"
          }
          body = {animal_sighting: {date: DateTime.parse('3rd Feb 2001 04:05:06+03:30'), lat: :lat, long: 123.000, animal_id: animal.id}}
          put "/animal_sightings/#{animal_sighting_id}", params: body, headers: headers
          expect(response).to have_http_status(200)
        end
    end
    describe "DELETE /animal_sighting/:id" do
        before { delete "/animal_sightings/#{animal_sighting_id}"}
        it "should return status code 204" do
            expect(response).to have_http_status(204)
        end
    end
end
