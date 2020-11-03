// empleado.estaIncapacitado()

class Empleado {
	var salud = 100
	var esEspia = true
	var cantEstrellas = 0
	
	method estaIncapacitado() = salud < self.saludCritica()
	
	method saludCritica() = if (esEspia) 15 else 40 - 5 * cantEstrellas

}