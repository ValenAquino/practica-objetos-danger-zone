class NaveDeCarga {

	var property velocidad = 0
	var property carga = 0

	method sobrecargada() = carga > 100

	method excedidaDeVelocidad(){
		const maximo = if(!self.sobrecargada()) 100000 else 80000
		return velocidad > maximo
	}  

	method recibirAmenaza() {
		carga = 0
	}

}

class NaveDePasajeros {

	var property alarma = false
	const cantidadDePasajeros = 0

	method tripulacion() = cantidadDePasajeros + 4

	method velocidadMaxima() = 300000 / self.tripulacion() - if (cantidadDePasajeros > 100) 200 else 0

	method recibirAmenaza() {
		alarma = true
	}

}
