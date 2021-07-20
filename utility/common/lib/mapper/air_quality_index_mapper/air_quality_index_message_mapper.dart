part of common;

class AirIndexModelEntityMapper implements UnidirectionalObjectMapper<int, String>{
  @override
  String to(int object) {
	  String airQuality = "Unknown";
	  switch (object) {
		  case 1:
			  airQuality = "Good";
			  break;
		  case 2:
			  airQuality = "Fair";
			  break;
		  case 3:
			  airQuality = "Moderate";
			  break;
		  case 4:
			  airQuality = "Poor";
			  break;
		  case 5:
			  airQuality = "Very Poor";
			  break;
		  case 6:
			  airQuality = "Unknown";
			  break;
	  }
	  return airQuality;
  }
}