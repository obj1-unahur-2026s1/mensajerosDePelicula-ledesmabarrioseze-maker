import paquetes.*
import mensajeros.*

object empresaDeMensajeria {

    const listaDeMensajeros = []
    const paquetesEnviados = #{}
    const paquetesPendientes = #{}

    method listaDeMensajeros(){
        return listaDeMensajeros
    }

    method paquetesEnviados(){
        return paquetesEnviados
    }

    method paquetesPendientes(){
        return paquetesPendientes
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

    method puedeEntregarPrimerMensajeroUnPaquete(unPaquete, unDestino){
        return listaDeMensajeros.first().puedeEnviar(unPaquete, unDestino)
    }

    method saberPesoUltimoMensajero(){
        return listaDeMensajeros.last().pesoTotal()
    }

    method puedeEntregar(unPaquete, unDestino) {
        return listaDeMensajeros.any({ m => m.puedeEnviar(unPaquete, unDestino) })
    }

    method mensajerosPuedenLlevar(unPaquete, unDestino) {
        return listaDeMensajeros.filter({ m => m.puedeEnviar(unPaquete, unDestino) })
    }

    method pesoTotalDeTodosLosMensajeros(){
        return listaDeMensajeros.sum({ m => m.pesoTotal() })
    }

    method mensajeriaTieneSobrepeso() {
        return not listaDeMensajeros.isEmpty() &&
               (self.pesoTotalDeTodosLosMensajeros() / listaDeMensajeros.size() > 500)
    }

    method agregarPaquetePendiente(unPaquete){
        paquetesPendientes.add(unPaquete)
    }

    method agregarPaqueteEnviado(unPaquete){
        paquetesEnviados.add(unPaquete)
    }

    method enviarUnPaquete(unPaquete, unDestino){
        if (self.puedeEntregar(unPaquete, unDestino)){
            self.agregarPaqueteEnviado(unPaquete)
        } else {
            self.agregarPaquetePendiente(unPaquete)
        }
    }

    method facturar(){
        return paquetesEnviados.sum({ p => p.precio() })
    }

    method enviarConjuntoDePaquetes(conjunto){
        conjunto.forEach({ p, d => self.enviarUnPaquete(p, d) })
    }

    method paquetePendienteDeMaximoValor(){
        return paquetesPendientes.max({ p => p.precio() })
    }

    method enviarPaquetePendienteMasCaro(unDestino){
        if (not paquetesPendientes.isEmpty() &&
            self.puedeEntregar(self.paquetePendienteDeMaximoValor(), unDestino)) {

            paquetesEnviados.add(self.paquetePendienteDeMaximoValor())
            paquetesPendientes.remove(self.paquetePendienteDeMaximoValor())
        }
    }
}