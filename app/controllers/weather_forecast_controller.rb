class WeatherForecastController < ApplicationController

  before_action :set_instance_variables

  def new
  end


  def search
    # We will search the Weather forecast
    if @zip_code.present?
      @weather = WeatherReport.find_by_zipcode(@zip_code)
    elsif @city.present?
      @weather = WeatherReport.find_by_city(@city)
    else
      @weather = nil
    end

    puts "#{@weather}"

    if @weather
      render json: @weather
    else
      render json: { error: "Weather data not found for given City/Zip Code" }, status: :not_found
    end
  end

  private

  def set_instance_variables
    @zip_code = params[:zip_code]
    @city = params[:city]
  end
end
