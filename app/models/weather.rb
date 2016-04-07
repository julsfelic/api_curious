class Weather
  attr_reader :current_summary,
              :current_temp,
              :feels_like,
              :hour_summary,
              :day_summary,
              :week_summary,
              :icon

  def initialize(params)
    @current_summary = params[:currently][:summary]
    @current_temp    = params[:currently][:temperature]
    @feels_like      = params[:currently][:apparentTemperature]
    @hour_summary    = params[:minutely][:summary]
    @day_summary     = params[:hourly][:summary]
    @week_summary    = params[:daily][:summary]
    @icon            = params[:currently][:icon]
  end

  def self.find_by(params)
    service = DarkSkyService.new
    new(service.weather(params))
  end
end
