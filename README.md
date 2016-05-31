# Synoptix

## Synopsis

Synoptix is a personalized weather outlook for your area. It provides up to date
weather forecast along with weather outlook throughout a 24 hour span. Synoptix
also allows you to type in plain text addresses to see the weather outlook for a
specific area.

## Code Example

Synoptix utilizes the Twitter API to pull in the users location, the Geolocation
API to convert the plain text location into latitude and longitude coordinates and
the DarkSky API to gather up the necessary weather information for the specific
area.

The heart of the application is the DarkSky service class that hits the DarkSky
API and gathers the appropiate information based on the latitude and longitude
give. Here is the code:

```ruby
class DarkSkyService
  attr_reader :weather

  def initialize
    @_apikey = ENV["DARK_SKY_API_KEY"]
    @_connection = Faraday.new("https://api.forecast.io")
  end

  def weather(params)
    path = "/forecast/#{apikey}/#{params[:lat]},#{params[:long]}"
    parse(connection.get(path))
  end

  private

  def apikey
    @_apikey
  end

  def connection
    @_connection
  end

  def parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
```

The only hard fast requirement is that you obtain a DarkSky API key and set an environment
variable to that key to avoid committing your key to github. The `weather` method
makes the call to the DarkSky API using Faraday with the appropriate information and
returns a JSON response that we parse to use in our views.

## Motivation

The motivation for Synoptix was inspired from my girlfriend who is a meteorologist.
She wanted me to create a simple weather dashboard that quickly gives you the
24 hour forecast.

## Tests

To run the tests, first clone down the project:

```
$ git clone https://github.com/julsfelic/api_curious
```

Once cloned down, `cd` into the project and `bundle`

```
$ bundle
```

Once bundled, go ahead and setup the db:

```
$ rake db:{create,setup}
```

Then, go ahead and run `rspec` to run the test suite:

```
$ rspec
```

## Contributors

* **Julian Feliciano** - *initial work* - [github](https://github.com/julsfelic)
