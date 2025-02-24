# README

This Assignment build for Teksystems.
Assignment points:

Requirements:
-> Must be done in Ruby on Rails
-> Accept an address as input
-> Retrieve forecast data for the given address. This should include, at minimum, the
current temperature (Bonus points - Retrieve high/low and/or extended forecast)
-> Display the requested forecast details to the user
-> Cache the forecast details for 30 minutes for all subsequent requests by zip codes.
Display indicator if result is pulled from cache.
Assumptions:
-> This project is open to interpretation
-> Functionality is a priority over form
-> If you get stuck, complete as much as you can
Submission:
-> Use a public source code repository (GitHub, etc) to store your code
-> Send us the link to your completed code


Implementation::

Priority to Zip Code:
	If the user provides a zip code, we fetch the weather forecast based on it.

Fallback to City:
	If the zip code is not provided but the city is present, we fetch and display the weather forecast for the given city.

Request for Missing Data:
	If neither zip code nor city is provided, we prompt the user to enter at least one of them.

Redis Caching:
	Weather data is cached in Redis for 30 minutes.
	If cached data is available, it is fetched and displayed instead of making a new request.

Testing Coverage:
	RSpec tests include cache validation to ensure proper data retrieval and storage.