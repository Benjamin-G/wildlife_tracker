require 'rails_helper'

RSpec.describe "Animal API", type: :request do
    let!(:animals){Animal.create(common_name: "Lion", latin_name: "Panthera leo", kingdom: "	Animalia")}
    let(:animal_id){animals.id}

  describe "GET /animals" do
    before { get animals_path}
    it "should return a 200 http response" do
      expect(response).to have_http_status(200)
    end
    it "should return Lion" do
      animals = JSON.parse(response.body)
      expect(animals.first['common_name']).to eq("Lion")
    end
  end

  describe "POST /animals" do
      it "should creates an animal " do
        headers = {
            "ACCEPT" => "application/json"
        }
        body = {animal: {common_name: "Cat", latin_name: "Felis catus", kingdom: "	Animalia"}}
        post animals_path, params: body, headers: headers
        expect(response).to have_http_status(201)
      end
  end

  describe "DELETE /animals/:id" do
      before { delete "/animals/#{animal_id}"}
      it "should return status code 204" do
          expect(response).to have_http_status(204)
      end
      # it "should return status code 404 " do
      #     delete "/animals/0"
      #     expect(response).to have_http_status(204)
      # end
  end

  describe "PUT /animals/:id" do
      it "should return status code 204" do
        headers = {
            "ACCEPT" => "application/json"
        }
        body = {animal: {common_name: "Cat", latin_name: "Felis catus", kingdom: "	Animalia"}}
        put "/animals/#{animal_id}", params: body, headers: headers
        expect(response).to have_http_status(200)
      end
  end
end
