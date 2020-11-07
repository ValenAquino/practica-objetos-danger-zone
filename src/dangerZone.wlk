class Empleado {
	var salud = 100
	const habilidades = []
	var puesto 
	
	method estaIncapacitado() = salud < self.saludCritica()
	method saludCritica() = puesto.saludCritica()
	
	method puedeUsar(habilidad) = not self.estaIncapacitado() and self.poseeHabilidad(habilidad)
	
	method poseeHabilidad(habilidad) = habilidades.contains(habilidad) 
	    
}

class Jefe inherits Empleado {
	const subordinados = []
	override method poseeHabilidad(habilidad) = super(habilidad)
		or self.algunSubordinadoLaTiene(habilidad)
	method algunSubordinadoLaTiene(habilidad) = 
		subordinados.any { subordinado => subordinado.puedeUsar(habilidad) }
}

object puestoEspia {	
	method saludCritica() = 15 
}

class PuestoOficinista {
	var cantEstrellas = 0
	method saludCritica() = 40 - 5 * cantEstrellas
}

// Antes:
// ofJefe = new OficinistaJefe()

// Ahora:
// ofJefe = new Jefe(puesto = new PuestoOficinista())







// empleado.puedeUsar(habilidad)
// habilidad.puedeSerUsada(empleado) // descartar