module WeatherHelper
  def format_temp(num)
    "#{num.to_i}&deg;F".html_safe
  end
end
