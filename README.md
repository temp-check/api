# README

## Description

A simple API service that lazily geocodes input addresses (or zipcodes) using [RubyGeocoder](http://www.rubygeocoder.com).

Stored geocoded addresses are used to lazily refresh the 10-day forecast using [WeatherAPI](https://www.weatherapi.com).

All successful forecast responses are cached up to 30 minutes. During the initial 30 minute cache any subsequent address lookups that resolve to the same same `postal_code` will return the cached response. After 30 minutes the cache is lazily refreshed when the `postal_code` is requested again.

All responses are JSON and follow the following format:

```json
{
  "data": {},
  "errors": []
}
```

## Requirements

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Get Started (Locally)

1. Clone this repo

```bash
git clone git@github.com:temp-check/api.git
```

2. You'll need to setup a [WeatherAPI](https://www.weatherapi.com/my/) account and get an API key. Once you have your API key, copy the example `.example-env` file to `.env`

```bash
cp .example-env .env
```

and update `WEATHER_API_KEY` value with your API key.

3. Bundle the gems

```bash
bundle install
```

4. Start the app
  
  ```bash
rails s
```

5. The app should now be running at http://localhost:3000

6. You can now make requests to the API. For example:

```bash
curl -X GET \
  'http://localhost:3000/api/v1/address?q=87104' \
  -H 'Accept: application/json' \
  -H 'Content-Type: application/json'
```

Or just use a browser and navigate to [http://localhost:3000/api/v1/address?q=87104](http://localhost:3000/api/v1/address?q=87104)
