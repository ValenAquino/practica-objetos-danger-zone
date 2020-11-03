// const empleado = new Empleado(
// 		puesto = new Oficinista(cantEstrellas = 1))
// empleado.puesto(espia)
// empleado.estaIncapacitado()

class Empleado {
	var property puesto
	var salud = 100
	
	method estaIncapacitado() = salud < puesto.saludCritica()
}

object espia {
	method saludCritica() = 15
}

class Oficinista {
	var cantEstrellas = 0
	method saludCritica() = 40 - 5 * cantEstrellas
}