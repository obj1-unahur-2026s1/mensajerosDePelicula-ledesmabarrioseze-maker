import mensajeros.*

object brooklyn {

    var mensajero = neo

    method mensajero(nuevoMensajero){

        mensajero = nuevoMensajero

    }

    method dejaPasar() {

        return mensajero.pesoTotal( ) <= 1000

    }

}

object matrix {

    var mensajero = neo

    method mensajero(nuevoMensajero){

        mensajero = nuevoMensajero

    }

    method dejaPasar() {

        return mensajero.puedeLlamar()
    }

}
