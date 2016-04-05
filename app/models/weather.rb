class Weather
  def initialize(lat, long)
    @data = DarkSkyService.new(lat, long).get
  end

  def feels_like
    current[:apparentTemperature]
  end

  def current_temp
    current[:temperature]
  end

  def current_summary
    current[:summary]
  end

  def hour_summary
    hour[:summary]
  end

  def day_summary
    day[:summary]
  end

  def week_summary
    week[:summary]
  end

  private

  def current
    @data[:currently]
  end

  def hour
    @data[:minutely]
  end

  def day
    @data[:hourly]
  end

  def week
    @data[:daily]
  end
end
