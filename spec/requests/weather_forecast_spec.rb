require 'rails_helper'

RSpec.describe WeatherForecastController, type: :controller do
  describe "GET #search" do
    context "when searching by city" do
      it "returns weather data if city is found" do
        get :search, params: { city: "Goa" }
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json_response["city"]).to eq("Goa")
        expect(json_response).to include("currrent_temperature", "condition")
      end

      it "returns an error if city is not found" do
        get :search, params: { city: "UnknownCity" }
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:not_found)
        expect(json_response["error"]).to eq("Weather data not found for given City/Zip Code")
      end
    end

    context "when searching by zip code" do
      it "returns weather data if zip code is found" do
        get :search, params: { zip_code: "233454" }
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json_response["zip_code"]).to eq("233454")
        expect(json_response).to include("currrent_temperature", "condition")
      end

      it "returns an error if zip code is not found" do
        get :search, params: { zip_code: "99999" }
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:not_found)
        expect(json_response["error"]).to eq("Weather data not found for given City/Zip Code")
      end
    end

    context "when both city and zip code are present, zip code consider" do
      it "returns an error" do
        get :search, params: {ity: "Goa", zip_code: "233454"}
        json_response = JSON.parse(response.body)

        expect(response).to have_http_status(:ok)
        expect(json_response["zip_code"]).to eq("233454")
        expect(json_response).to include("currrent_temperature", "condition")
      end
    end
  end
end