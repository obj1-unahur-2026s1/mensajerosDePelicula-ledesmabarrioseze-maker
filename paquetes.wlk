object paquete {

    var estaPagado = false

    method precio(){
        return 50
    }

    method estaPago(){
        return estaPagado
    }

    method pagarPaquete(){
        estaPagado = true
    }

    method rechazarPago(){
        estaPagado = false
    }

    method puedeSerEntregado(unMensajero, unDestino){
        return self.estaPago() && unDestino.dejaPasar(unMensajero)
    }
}


object paquetito {

    method precio(){
        return 0
    }

    method puedeSerEntregado(unMensajero, unDestino){
        return true
    }
}


object paquetePremium {

    var estaPagado = false

    method precio(){
        return 150
    }

    method estaPago(){
        return estaPagado
    }

    method pagarPaquete(){
        estaPagado = true
    }

    method rechazarPago(){
        estaPagado = false
    }

    method puedeSerEntregado(unMensajero, unDestino){
        return self.estaPago() && unDestino.dejaPasar(unMensajero)
    }
}


object paqueteViajero {

    const conjuntoDestinos = #{}
    var montoPagado = 0

    method conjuntoDestinos(){
        return conjuntoDestinos
    }

    method agregarDestino(destino){
        conjuntoDestinos.add(destino)
    }

    method sacarDestino(destino){
        conjuntoDestinos.remove(destino)
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

    method puedeSerEntregado(unMensajero, unDestino){
        return self.estaPago() &&
               conjuntoDestinos.all({ d => d.dejaPasar(unMensajero) })
    }

    method pagarPaquete(){
        self.pagar(self.precio())
    }

    method rechazarPago(){
        montoPagado = 0
    }
}