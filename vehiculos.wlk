object camion {

    var acoplados = 1

    method acoplados(nuevoNumero){
        acoplados = nuevoNumero
    }

    method peso(){
        return acoplados * 500
    }
}


object bicicleta {

    method peso(){
        return 5
    }
}