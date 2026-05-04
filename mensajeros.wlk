import vehiculos.*
import destinos.*
import paquetes.*

object roberto {

    var property pesoPropio = 90
    var vehiculo = camion

    method vehiculo(nuevoVehiculo) {
        vehiculo = nuevoVehiculo
    }

    method puedeEnviar(unPaquete, unDestino){
        return unPaquete.puedeSerEntregado(self, unDestino)
    }

    method pesoTotal(){
        return vehiculo.peso() + self.pesoPropio()
    }

    method puedeLlamar(){
        return false
    }
}


object chuckNorris {

    method puedeEnviar(unPaquete, unDestino){
        return unPaquete.puedeSerEntregado(self, unDestino)
    }

    method pesoPropio(){
        return 80
    }

    method pesoTotal(){
        return self.pesoPropio()
    }

    method puedeLlamar(){
        return true
    }
}


object neo {

    var puedeLlamar = true

    method puedeEnviar(unPaquete, unDestino){
        return unPaquete.puedeSerEntregado(self, unDestino)
    }

    method pesoPropio(){
        return 0
    }

    method pesoTotal(){
        return self.pesoPropio()
    }

    method cargarCredito(){
        puedeLlamar = true
    }

    method descargarCredito() {
        puedeLlamar = false
    }

    method puedeLlamar(){
        return puedeLlamar
    }
}


object spiderman {

    method puedeEnviar(unPaquete, unDestino){
        return unPaquete.puedeSerEntregado(self, unDestino)
    }

    method pesoPropio(){
        return 0
    }

    method pesoTotal(){
        return 0
    }

    method puedeLlamar(){
        return true
    }
}