(_,_)
class Regalos{
	var destinatarios  
	var lugar = 1
	var voluminosidad
	var importancia
	method destinatarios() {
		return destinatarios
	}
	method importancia(){
		importancia = destinatarios.size() * 2
	}
	method voluminosidad(){
		voluminosidad = lugar > 5 
	}
}

class Tarjetas{
	var destinatarios 
	var importancia 
	var lugar = 0
	var voluminosidad
	method voluminosidad(){
		voluminosidad = lugar > 5 
	}
}
		
class Adorno{
	var pesoBase
	var coeficienteDeSuperioridad
	var voluminosidad
	var lugar 
	method lugar(){
		lugar = pesoBase.min(3)		
	}
	method importancia(){
		return pesoBase * coeficienteDeSuperioridad
	}
	method voluminosidad(){
		voluminosidad = lugar > 5 
	}
}

class FiguraElaborada{
	var adornos = [ ]
	var lugar 
	var importancia
	var voluminosidad
	method sumaDeAdornos() {
		return adornos.sum({ adorno => adorno.lugar()})
	}
	
	method lugar(){
		lugar = 1 + self.sumaDeAdornos()
	}

	method importancia() {
		importancia = adornos.max({ adorno => adorno.importancia() })
	}
	method voluminosidad(){
		voluminosidad = lugar > 5 
	}
	
}

class EstrellaDeBelen {
	var importancia = 10
	var lugar = 1
	var destinatarios
	var voluminosidad 
	method destinatarios(){
		return destinatarios
	}
	method lugar(){
	return lugar	
	}
	method voluminosidad(){
		voluminosidad = lugar > 5 
	}
}


object arbol {
	var tronco
	var edad
	var elementos
	var impProm
	var capacidad
	
	method capacidad(){
		capacidad = tronco * edad
	}
	
	method capacidadDisponible (){
		return capacidad - elementos.sum({ elemento => elemento.lugar()})
	}
	
	method agregarElemento (nuevoelem){
		if (self.capacidadDisponible() > 0){
			elementos = elementos.add(nuevoelem)	
		}
	}		
	method importancia(){
		return elementos.sum({elemento => elemento.importancia()})
	}
	method importanciaPromedio(){
		impProm = self.importancia()/ elementos.size()
	}
	method cosasImportantes(){
		return elementos.filter({ elemento => elemento.importancia() > impProm})	
	}
	method quitarVoluminosos(){
		elementos = elementos.filter({ elemento => not  elemento.voluminosidad() })
	}
}
