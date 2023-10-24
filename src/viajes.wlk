import socios.*

class Viaje {
	const property idiomas = []
	
	method agregarIdioma(unIdioma){
		idiomas.add(unIdioma)
	}	
	method implicaEsfuerzo()
	method sirveParaBroncearse()
	method diasDeActividad()
		
	// 2. Viajes interesantes
	method cantidadDeIdiomas() = idiomas.size()
	method esInteresante() = self.cantidadDeIdiomas() > 1
	
	// 6. Actividades recomendadas para socios
	
	// method esRecomendadaPara(unSocio) = self.esInteresante and unSocio.leAtrae(self) and
}

class ViajeDePlaya inherits Viaje {
	const largoDeLaPlaya
	
	override method diasDeActividad() =	largoDeLaPlaya / 500
	override method implicaEsfuerzo() = largoDeLaPlaya > 1200
	override method sirveParaBroncearse() = true
}

class ExcursionACiudad inherits Viaje {
	var cantidadDeAtracciones
	
	override method diasDeActividad() =	cantidadDeAtracciones / 2
	override method implicaEsfuerzo() = cantidadDeAtracciones.between(5,8)
	override method sirveParaBroncearse() = false
	
	// 2. Viajes Interesantes
	override method esInteresante() = super() or cantidadDeAtracciones == 5
}

class ExcursionACiudadTropical inherits ExcursionACiudad {
	
	override method diasDeActividad() =	super() + 1
	override method sirveParaBroncearse() = true
}

class SalidaDeTrekking inherits Viaje {
	var kilometrosDeSenderos
	var cantidadDeDiasDeSol
		
	override method diasDeActividad() =	kilometrosDeSenderos / 50
	override method implicaEsfuerzo() = kilometrosDeSenderos > 80
	override method sirveParaBroncearse() = 
		cantidadDeDiasDeSol > 200 or cantidadDeDiasDeSol.between(100, 200) and kilometrosDeSenderos > 120
	
	// 2. Viajes Interesantes
	override method esInteresante() = super() and cantidadDeDiasDeSol > 140
	
}

// 3. Clases de gimnasia

class ClasesDeGimnasia inherits Viaje {
	const idioma = "español"
	
	override method diasDeActividad() =	1
	override method implicaEsfuerzo() = true
	override method sirveParaBroncearse() = false
}

