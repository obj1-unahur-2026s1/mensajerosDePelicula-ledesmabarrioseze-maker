import mensajeros.*

object paquete {

    var estaPago = true

    var mensajero = neo

    method mensajero(nuevoMensajero){

        mensajero = nuevoMensajero
    }

    method puedeSerEntregado(){

        return mensajero.puedeEntregar() && estaPago

    }

    method pagarPaquete(){

        estaPago = true

    }

    method rechazarPago(){

        estaPago = false
    }
}