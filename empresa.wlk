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

    method puedeEntregarPrimerMensajeroUnPaquete(unPaquete){

        return listaDeMensajeros.first().puedeEnviar(unPaquete)

    }

    method saberPesoUltimoMensajero(){

        return listaDeMensajeros.last().pesoTotal()

    }

    method puedeEntregar(unPaquete) {

        return listaDeMensajeros.any({ m => m.puedeEnviar(unPaquete) })

    }

    method mensajerosPuedenLlevar(unPaquete) {

        return listaDeMensajeros.filter({ m => m.puedeEnviar(unPaquete) })

    }

    method pesoTotalDeTodosLosMensajeros(){

        return listaDeMensajeros.sum({ m => m.pesoTotal() })

    }

    method mensajeriaTieneSobrepeso() {

        return not listaDeMensajeros.isEmpty() && (self.pesoTotalDeTodosLosMensajeros() / listaDeMensajeros.size() > 500)

    }

    method agregarPaquetePendiente(unPaquete){

        paquetesPendientes.add(unPaquete)

    }

    method agregarPaqueteEnviado(unPaquete){

        paquetesEnviados.add(unPaquete)
        
    }

    method enviarUnPaquete(unPaquete){

        if (self.puedeEntregar(unPaquete)){

            self.agregarPaqueteEnviado(unPaquete)

        } else {

            self.agregarPaquetePendiente(unPaquete)
        }
    }

    method facturar(){

        return paquetesEnviados.sum({ p => p.precio() })

    }

    method enviarConjuntoDePaquetes(nuevoConjuntoDePaquetes){

        nuevoConjuntoDePaquetes.forEach({ p => self.enviarUnPaquete(p) })

    }
    
    method paquetePendienteDeMaximoValor(){
        
        return paquetesPendientes.max({p => p.precio()})
        
    }
    
    method enviarPaquetePendienteMasCaro(){
        
        if (not paquetesPendientes.isEmpty() && self.puedeEntregar(self.paquetePendienteDeMaximoValor())){
            
            paquetesEnviados.add(self.paquetePendienteDeMaximoValor())
            paquetesPendientes.remove(self.paquetePendienteDeMaximoValor())

    }

}

}