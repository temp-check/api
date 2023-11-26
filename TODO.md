# TODO

- [ ] Consistent request payload: `{"address": string}`
- [ ] Consistent response payload: `{"data": {}, "errors": []}`
- [ ] Consistent error payload: `{"message": "", "code": ""}`
- [ ] Store geocoded address lat/lng, postalcode, indefinitely
- [ ] Store geocode address failures indefinitely *unless* the geocode error was server/rate limit related using [PositionStack](https://positionstack.com/documentation)
- [ ] Checks store for forecast data matching postalcode using [WeatherAPI](https://www.weatherapi.com/my/)
- [ ] Lazily remove stored forecast data if the postalcode is requested again and the data is older than 30 minutes
- [ ] Fetches forecast data from weather api if not found in store
