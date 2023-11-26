# README

## Description

A simple API service that lazily geocodes input addresses using [PositionStack](https://positionstack.com).

Stored geocoded addresses are used to lazily refresh the 10-day forecast using [WeatherAPI](https://www.weatherapi.com).

All successful forecast responses are cached for 30 minutes.

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