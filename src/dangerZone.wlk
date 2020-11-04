class Empleado {
	var salud = 100
	const habilidades = []
	
	method estaIncapacitado() = salud < self.saludCritica()
	method saludCritica()
	
	method puedeUsar(habilidad) = not self.estaIncapacitado() and self.poseeHabilidad(habilidad)
	
	method poseeHabilidad(habilidad) = habilidades.contains(habilidad) 
	    
}

class Espia inherits Empleado {	
	method saludCritica() = 15 
}

class EspiaJefe inherits Espia {
	const subordinados = []
	override method poseeHabilidad(habilidad) = super(habilidad)
		or self.algunSubordinadoLaTiene(habilidad)
	method algunSubordinadoLaTiene(habilidad) = 
		subordinados.any { subordinado => subordinado.puedeUsar(habilidad) }
}

class Oficinista inherits Empleado {
	var cantEstrellas = 0
	method saludCritica() = 40 - 5 * cantEstrellas
}

class OficinistaJefe inherits Oficinista {
		const subordinados = []
	override method poseeHabilidad(habilidad) = super(habilidad)
		or self.algunSubordinadoLaTiene(habilidad)
	method algunSubordinadoLaTiene(habilidad) = 
		subordinados.any { subordinado => subordinado.puedeUsar(habilidad) }
}

// empleado.puedeUsar(habilidad)
// habilidad.puedeSerUsada(empleado) // descartar