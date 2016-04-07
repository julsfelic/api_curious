var $weatherSearchForm = $('.weather-search');
var $url = $weatherSearchForm.attr('action');
var $location = $(".location");
var $currentTemp = $(".current-temp");
var $currentSummary = $(".current-summary");
var $hourSummary = $('.hour-summary');
var $daySummary = $('.day-summary');
var $weekSummary = $('.week-summary');
var $weatherIcon = $('img');

function formatTemp(num) {
  return parseInt(num) + "&deg;F";
}

function parseWeather(data) {
  return {
    currentTemp: formatTemp(data.currently.temperature),
    currentSummary: data.currently.summary + " * Feels like " + formatTemp(data.currently.apparentTemperature),
    hourSummary: data.minutely.summary,
    daySummary: data.hourly.summary,
    weekSummary: data.daily.summary,
    weatherIcon: data.currently.icon
  }
}

function addWeather(weatherData) {
  $currentTemp.html(weatherData.currentTemp);
  $currentSummary.html(weatherData.currentSummary);
  $hourSummary.html(weatherData.hourSummary);
  $daySummary.html(weatherData.daySummary);
  $weekSummary.html(weatherData.weekSummary);
  $weatherIcon.attr({
    src: "/assets/" + weatherData.weatherIcon + ".svg",
    alt: weatherData.weatherIcon,
    class: weatherData.weatherIcon
  });
}

$weatherSearchForm.on('submit', function(e) {
  e.preventDefault();
  var $weather_location = $('#weather_location');

  var createWeather = $.post($url, { location: $weather_location.val() })

  createWeather.done(function(data) {
    $location.html($weather_location.val());
    var weatherData = parseWeather(data);
    addWeather(weatherData);
    $('.hide-weather').removeClass('hide-weather');
  });
});
