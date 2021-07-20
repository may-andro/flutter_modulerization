part of common;

class AirIndexColorModelEntityMapper implements UnidirectionalObjectMapper<int, Color>{
  @override
  Color to(int object) {
	  Color airQuality = Colors.grey;
	  switch (object) {
		  case 1:
			  airQuality = Colors.green;
			  break;
		  case 2:
			  airQuality = Colors.lightGreen;
			  break;
		  case 3:
			  airQuality = Colors.yellow;
			  break;
		  case 4:
			  airQuality = Colors.orange;
			  break;
		  case 5:
			  airQuality = Colors.red;
			  break;
		  case 6:
			  airQuality = Colors.grey;
			  break;
	  }
	  return airQuality;
  }
}