import paquetes.*
import mensajeros.*

object empresaDeMensajeria{

    const listaDeMensajeros = []

    method listaDeMensajeros(){

        return listaDeMensajeros
    }

    method contratarEmpleado(unMensajero){

        listaDeMensajeros.add(unMensajero)

    }

    method echarUnEmpleado(unMensajero){

        listaDeMensajeros.remove(unMensajero)

    }

    method echarATodosLosEmpleados(){

        listaDeMensajeros.clear()
    }

    method esGrande(){

        return listaDeMensajeros.size() > 2
    }

    method puedeEntregarPrimerMensajeroUnPaquete(unPaquete){

        return listaDeMensajeros.first().puedeEntregar() && unPaquete.estaPago()
    }

    method saberPesoUltimoMensajero(){

        return listaDeMensajeros.last().pesoTotal()
    }


}