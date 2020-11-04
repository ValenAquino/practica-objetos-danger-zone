// const empleado = new Empleado(
// 		puesto = new Oficinista(cantEstrellas = 1))
// empleado.puesto(espia)
// empleado.estaIncapacitado()

// empleado.puedeUsar(habilidad)

class Empleado {
	var property puesto
	var salud = 100
	const habilidades = []
	
	method estaIncapacitado() = salud < puesto.saludCritica()
	method puedeUsar(habilidad) 
		= not self.estaIncapacitado() && self.poseeHabilidad(habilidad)
		
	method poseeHabilidad(habilidad) = habilidades.contains(habilidad)
}

class Jefe inherits Empleado {
	var subordinados
	override method poseeHabilidad(habilidad) 
		= super(habilidad) || self.algunoDeSusSubordinadosLaPuedeUsar(habilidad)
	method algunoDeSusSubordinadosLaPuedeUsar(habilidad)
		= subordinados.any {subordinado => subordinado.puedeUsar(habilidad)	}
	
}

object espia {
	method saludCritica() = 15
}

class Oficinista {
	var cantEstrellas = 0
	method saludCritica() = 40 - 5 * cantEstrellas
}