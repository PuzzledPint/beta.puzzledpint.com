require 'rails_helper'

RSpec.describe CountriesController, type: :controller do
  describe "GET #index" do
    it "returns a list of countries" do
      expected_response = ISO3166::Country.countries.map do |c|
        { c.alpha2 => c.name }
      end

      get :index

      expect(response).to be_successful
      expect(response.body).to eq(expected_response.to_json)
    end
  end

  describe "GET #subdivisions" do
    it "returns a list of subdivisions" do
      country = ISO3166::Country.new("US")
      expected_response = country.subdivisions.map { |k, v| { code: k, name: v["name"] } }

      get :subdivisions, country: "US"

      expect(response).to be_successful
      expect(response.body).to eq(expected_response.to_json)
    end

    it "returns an empty list" do
      get :subdivisions, country: "XX"
      expect(response).to be_successful
      expect(response.body).to eq("[]")
    end
  end
end
