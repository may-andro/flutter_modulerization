part of common;

abstract class UnidirectionalObjectMapper<In, Out>{
	Out to(In object);
}