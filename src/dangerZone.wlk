class Empleado {
	var rol
	var salud = 100
	var estrellas
	const property habilidades = []
	
	method salud() = salud
	
	method reducirSalud(puntos_a_restar){
		salud = 0.max(salud - puntos_a_restar)
	}
	
	method agregarEstrellas(cantidad) {
		estrellas += cantidad
		
		if(estrellas >= 3)
			rol = espia
	}
	
	method agregarHabilidad(newSkill) = habilidades.add(newSkill)
	
	method estaIncapacitado() = salud < rol.saludCritica(self)
	
	method puedeUsar(habilidad) = !self.estaIncapacitado() && habilidades.contains(habilidad)
	
	method puedeCumplirMision(mision) = mision.puedeRealizarla(self)
	
	method cumplirMision(mision){
		if(self.puedeCumplirMision(mision))
			self.registrarVictoria(mision.peligrosidad(), mision)
		else
			self.error("No se cumplen con los requisitos para cumplir la mision")
	}
	
	method registrarVictoria(peligrosidad, mision){
		self.reducirSalud(peligrosidad)
		
		if(self.salud() > 0)
			rol.registrarVictoria(self, mision)
	}
	
}

class Equipo {
	const property empleados = []
	
	method puedeCumplirMision(mision) = empleados.any({empleado => mision.puedeRealizarla(empleado)})
	
	method cumplirMision(mision){
		if(self.puedeCumplirMision(mision)){
			const peligrosidad = mision.peligrosidad()
			empleados.forEach({empleado => empleado.registrarVictoria(peligrosidad, mision)})	
		}
		else
			self.error("No se cumplen con los requisitos para cumplir la mision")
		
	}
}

class Jefe inherits Empleado {
	const property subordinados = []
	
	override method puedeUsar(habilidad) = 
		!self.estaIncapacitado() && self.subordinados().any{empleado => empleado.puedeUsar(habilidad)}
}

object espia {
	method saludCritica(empleado) = 15
	
	method registrarVictoria(empleado, mision){
		const habilidades_a_aprender = empleado.habilidades().filter({skill => !mision.habilidades().contains(skill)})
		habilidades_a_aprender.forEach({newSkill => empleado.agregarHabilidad(newSkill)})
	}
}

object oficinista {
	method saludCritica(empleado)= 40 - 5 * empleado.estrellas()
	
	method registrarVictoria(empleado, mision){
		
	}
}

class Mision {
	const property peligrosidad
	const property habilidades = []
	
	method puedeRealizarla(empleado) = habilidades.all({hab => empleado.puedeUsar(hab)})
}
