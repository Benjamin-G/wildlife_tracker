require 'rails_helper'

RSpec.describe "AnimalSightingApis", type: :request do
    let!(:animals){Animal.create(common_name: "Lion", latin_name: "Panthera leo", kingdom: "	Animalia")}
    let(:animal_id){animals.id}
    let!(:animal_sight){AnimalSighting.create(date: DateTime.parse('3rd Feb 2001 04:05:06+03:30'), lat: 12.2321312, long: 123.233124)}
    let(:animal_sighting_id){animal_sight.id}

  describe "GET /animal_sighting_apis" do
    it "works! (now write some real specs)" do
      get animal_sighting_apis_path
      expect(response).to have_http_status(200)
    end
  end
end
