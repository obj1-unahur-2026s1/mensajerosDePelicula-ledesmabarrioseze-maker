import vehiculos.*
import destinos.*

object roberto {

    var property  pesoPropio = 90

    var destino = brooklyn

    var vehiculo = camion

    method destino(nuevoDestino) {

        destino = nuevoDestino
    }

    method vehiculo(nuevoVehiculo) {

        vehiculo = nuevoVehiculo
    }

    method puedeEntregar(){

        return destino.dejaPasar()

    }



    method pesoTotal(){

        return vehiculo.peso() + self.pesoPropio()

    }

    method puedeLlamar(){

        return false

    }


}

object chuckNorris {

    var destino = brooklyn

    method destino(nuevoDestino){
        
        destino = nuevoDestino
    }

    method puedeEntregar(){

        return destino.dejaPasar()

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

    var destino = matrix

    method destino(nuevoDestino){
        
        destino = nuevoDestino
    }

    method puedeEntregar(){

        return destino.dejaPasar()

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