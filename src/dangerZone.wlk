class Empleado {
	var salud = 100
	
	method estaIncapacitado() = salud < self.saludCritica()
	
	method saludCritica()
	
}

class Espia inherits Empleado {	
	method saludCritica() = 15 
}

class Oficinista inherits Empleado {
	//var saludCritica = 40 // si es dependiente, no va a un atributo
	var cantEstrellas = 0
	
	method saludCritica() = 40 - 5 * cantEstrellas
}