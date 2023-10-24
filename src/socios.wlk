import viajes.*

class Socio {
	const property actividadesRealizadas = []
	const property idiomasQueHabla = []
	const edad
	var maximoDeActividades
	
	method esAdoradorDelSol() = actividadesRealizadas.all({act => act.sirveParaBroncearse()})
	method actividadesEsforzadas() = actividadesRealizadas.filter({act => act.implicaEsfuerzo()})
	
	method cantidadDeActividades() = actividadesRealizadas.size()
	method registrarActividad(unaActividad){
		if (self.cantidadDeActividades() >= maximoDeActividades){
			self.error("El cliente alcanzó el límite de actividades que puede realizar")
		}
		actividadesRealizadas.add(unaActividad)
	}
	
	// 5. Actividades que le atraen a los socios
	method leAtrae(unaActividad)
}

class SocioTranquilo inherits Socio {
	override method leAtrae(unaActividad) = unaActividad.diasDeActividad() >= 4
}

class SocioCoherente inherits Socio {
	override method leAtrae(unaActividad) {
		if (self.esAdoradorDelSol()){unaActividad.sirveParaBroncearse()} else {unaActividad.implicaEsfuerzo()}
	}
}

class SocioRelajado inherits Socio {
	
	method coincideConAlgunIdioma(unIdioma){
		idiomasQueHabla.any({i=> i == unIdioma})
	}
	
	override method leAtrae(unaActividad) = 
		unaActividad.idiomas().any({i => self.coincideConAlgunIdioma(i)})	
}

