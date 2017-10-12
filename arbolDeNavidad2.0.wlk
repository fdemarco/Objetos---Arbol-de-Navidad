
class Regalos{
	var destinatarios  
	var lugar = 1
	var voluminosidad
	var importancia
	method destinatarios() {
		return destinatarios
	}
	method importancia(){
		return destinatarios.size() * 2
	}
}

class Tarjetas{
	var destinatarios 
	var importancia 
	
	method lugar() { return 0}
}
		
class Adorno{
	var pesoBase
	var coeficienteDeSuperioridad
	
	method lugar(){
		return pesoBase.min(3)		
	}
	method importancia(){
		return pesoBase * coeficienteDeSuperioridad
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
		return 1 + self.sumaDeAdornos()
	}

	method importancia() {
		return adornos.max({ adorno => adorno.importancia() }).importancia()
	}
	
	
}

class EstrellaDeBelen {
	var importancia = 10
	var lugar = 1
	var destinatarios

	method destinatarios(){
		return destinatarios
	}
	method lugar(){
	return lugar	
	}
	
}


object arbol {
	var tronco
	var edad
	var elementos =  []
	var impProm
	var capacidad
	
	method capacidad(){
		capacidad = tronco * edad
	}
	
	method capacidadDisponible (){
		return capacidad - elementos.sum({ elemento => elemento.lugar()})
	}
	
	method agregarElemento (nuevoelem){
		if (self.capacidadDisponible() <= 0)
			throw new Exception()	
		elementos.add(nuevoelem)	
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
		 elementos.removeAllSuchThat({ elemento => elemento.lugar() > 5 })
	}
}

/*FALTARIA LO SIGUIENTE
 *Agregar un elemento a un �rbol si hay capacidad disponible, si no lo hay que tire un error con un mensaje descriptivo
Hacer que todos los elementos que se pueda, tengan por destinatario a una persona dada.
Poder conocer a todos los destinatarios diferentes de un �rbol, ordenados de mayor a menor por al cantidad de cosas destinadas a cada uno
 */

