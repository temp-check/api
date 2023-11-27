# README

## Description

A simple API service that lazily geocodes input addresses using [RubyGeocoder](http://www.rubygeocoder.com).

Stored geocoded addresses are used to lazily refresh the 10-day forecast using [WeatherAPI](https://www.weatherapi.com).

All successful forecast responses are cached up to 30 minutes. During the initial 30 minute cache any subsequent requests for the same `postal_code` will return the cached response. After 30 minutes the cache is lazily refreshed when the `postal_code` is requested again.

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

## Usage

...
