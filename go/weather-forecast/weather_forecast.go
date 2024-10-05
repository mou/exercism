// Package weather provides utilities to perform forecasts.
package weather


// CurrentCondition represents current condition.
var CurrentCondition string
// CurrentLocation represents current location.
var CurrentLocation string

// Forecast return string describing forecast for specified location
// and condition.
func Forecast(city, condition string) string {
	CurrentLocation, CurrentCondition = city, condition
	return CurrentLocation + " - current weather condition: " + CurrentCondition
}
