require "test_helper"

class WeatherForecastControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get weather_forecast_new_url
    assert_response :success
  end

  test "should get search" do
    get weather_forecast_search_url
    assert_response :success
  end
end
