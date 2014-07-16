CitiRide
========

*Find the best route to pick up your CitiBike and get to your destination.*

This app combines constantly-updated CitiBike station map information with Google Directions to map an entire ride with the best walking route and the best biking route for you.

###How it works

The user enters a starting point address and a destination address in the home page and receives a map with four points. 

  A. The starting point. 
  
  B. The nearest dock with at least two available bikes. 
  
  C. The dock nearest to your destination with at least two open docks. 
  
  D. The destination.
  
The path from a -> b is the fastest walking path according to Google Directions.
The path from b -> c is the fastest biking path.
The path from c -> d is also the fastest walking path.

### What's happening under the hood

The main API used in this app is Google Directions. We wrap the API with the [google-directions-ruby](https://github.com/joshcrews/google-directions-ruby) gem.

CitiBike has real time biking and docking information in JSON format.  

Before sending a request to Google Directions, we find the closest city bike station to our starting point with at least two available bikes. We also find the closest city bike station to our destination with at least two available docks. This is calculated with the [geodistance](https://github.com/kristianmandrup/geo-distance) gem, using longitude and latitude points acquired from the CitiBike JSON object.

### Other project details

Heroku link: http://citiride.herokuapp.com/

Trello: https://trello.com/b/uSddpuoV/citiride

Contributors:
1. Raghav
2. Ken
3. Dinesh
4. Mario
