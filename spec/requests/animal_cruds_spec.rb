require 'rails_helper'

RSpec.describe "AnimalCruds", type: :request do
    let!(:animal){Animal.create(common_name: "Lion", latin_name: "Panthera leo", kingdom: "	Animalia")}

  describe "GET /animal" do
    it "should return a 200 http response" do
      get animals_path
      expect(response).to have_http_status(200)
    end
    it "should return Lion" do
      get animals_path
      animals = JSON.parse(response.body)
      expect(animals.first['common_name']).to eq("Lion")
    end
  end

  describe "POST /animal" do
      it "should creates an animal " do
          headers = {
            "ACCEPT" => "application/json"
        }
        body = {animal: {common_name: "Cat", latin_name: "Felis catus", kingdom: "	Animalia"}}
        post animals_path, params: body, headers: headers
        expect(response).to have_http_status(201)
      end
  end
end
