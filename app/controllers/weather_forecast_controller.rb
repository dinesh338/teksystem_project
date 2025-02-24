class WeatherForecastController < ApplicationController

  before_action :set_instance_variables, :params_validation, :check_the_cache, only: [:search]
  after_action :update_the_cache, only: [:search]

  def new
  end


  def search
    # We will search the Weather forecast, the priority is given to zip code, if zip code present then first look city for the given zip code values

    @weather = WeatherReport.find_by_zipcode(@zip_code) || WeatherReport.find_by_city(@city) if @weather.nil?

    if @weather
      render json: @weather
    else
      render json: { error: "Weather data not found for given City/Zip Code" }, status: :not_found
    end
  end

  private

  def set_instance_variables
    @zip_code = params[:zip_code]
    @city = params[:city]&.downcase
  end

  def params_validation
    # Ensure at least one parameter is provided
    if @city.blank? && @zip_code.blank?
      return render json: { error: "Please provide a city or zip code." }, status: :bad_request
    end
  end

  def check_the_cache
    # Check cache first, as per condition given setting a key cached_info: true to indentify the value fetched by cache or not.
    cached_info = Rails.cache.read(cache_key) if @zip_code.present?
    cached_info[:cached_info] = true if cached_info.present?
    @weather = cached_info
  end

  def update_the_cache
    Rails.cache.write(cache_key, @weather, expires_in: 30.minutes)
  end

  def cache_key
    "weather_#{@zip_code}"
  end
end
