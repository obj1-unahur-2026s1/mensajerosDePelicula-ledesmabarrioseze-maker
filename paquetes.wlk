import mensajeros.*

object paquete {

    var estaPago = true
    var mensajero = neo

    method precio(){
        return 50
    }

    method estaPago(){
        return estaPago
    }

    method mensajero(nuevoMensajero){
        mensajero = nuevoMensajero
    }

    method puedeSerEntregado(){
        return mensajero.puedeEntregar() && self.estaPago()
    }

    method pagarPaquete(){
        estaPago = true
    }

    method rechazarPago(){
        estaPago = false
    }
}

object paquetito {

    var mensajero = neo

    method mensajero(nuevoMensajero){
        mensajero = nuevoMensajero
    }

    method precio(){
        return 0
    }

    method estaPago(){
        return true
    }

    method puedeSerEntregado(){
        return mensajero.puedeEntregar()
    }
}

object paqueteViajero  {

    const conjuntoDestinos = #{}
    var montoPagado = 0
    var mensajero = neo

    method mensajero(nuevoMensajero){
        mensajero = nuevoMensajero
    }

    method conjuntoDestinos(){
        return conjuntoDestinos
    }

    method agregarDestino(nuevoDestino){
        conjuntoDestinos.add(nuevoDestino)
    }

    method sacarDestino(destinoASacar){
        conjuntoDestinos.remove(destinoASacar)
    }

    method precio(){
       return conjuntoDestinos.size() * 100
    }

    method pagar(monto){
        montoPagado = montoPagado + monto
    }

    method estaPago(){
        return montoPagado >= self.precio()
    }

    method puedeSerEntregado(){
        return self.estaPago() &&
               conjuntoDestinos.all({ destino => destino.dejaPasar(mensajero) })
    }
}

object paquetePremium {

    var estaPago = false
    var mensajero = spiderman

    method precio(){
        return 150
    }

    method estaPago(){
        return estaPago
    }

    method mensajero(nuevoMensajero){
        mensajero = nuevoMensajero
    }

    method puedeSerEntregado(){
        return true
    }

    method pagarPaquete(){
        estaPago = true
    }

    method rechazarPago(){
        estaPago = false
    }
}