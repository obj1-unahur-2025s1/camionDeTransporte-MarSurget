import cosas.*

object camion {
    const property cosasCargadas = []

    method pesoTotal() = 1000 + cosasCargadas.sum({c=>c.peso()})

    method cargar(algo){
        cosasCargadas.add(algo)
    }

    method descargar(algo) {
        cosasCargadas.remove(algo) /// no se rompe si no hay nada en la colec
    }

    method sonNumPares(cosas) {
        cosasCargadas.all({c=>c.peso().even()}) /// no se rompe
    }

    method algoConPesoDe(peso) {
        return cosasCargadas.any({a=>a.peso() == peso }) /// no se rompe
    }

    method nivelPeligrosidadPrimerCosa(nivel) {
        if (cosasCargadas.any({c=>c.nivelPeligrosidad() == nivel})){
            cosasCargadas.find({c=>c.nivelPeligrosidad() == nivel})
        } 
    }

    method nivelPeligrosidadPrimerCosa2(nivel) =cosasCargadas.findOrDefault({c=>c.nivelPeligrosidad() == nivel}, null)


    method cosasQueSuperanPeligrosidad(nivelPeligrosidad) {
        return cosasCargadas.filter({a=>a.nivelPeligrosidad() > nivelPeligrosidad}) /// no se rompe q dev vacio
    }

    method cosasConPeligrosidadMayorA(algo) {
        return cosasCargadas.filter({a=>a.nivelPeligrosidad() > algo.nivelPeligrosidad()}) /// no se rompe q dev vacio
    }

    method estaExcedidoPeso() = self.pesoTotal() >= 2500 

    method puedeCircularEnRuta(nivelPeligrosidad) {
        return !self.estaExcedidoPeso() and cosasCargadas.all({c=>c.nivelPeligrosidad() < nivelPeligrosidad})
    } 

    method hayAlgoDePesoEntre(valorMin, valorMax) {
        return cosasCargadas.any({c=>c.peso().between(valorMin, valorMax)})
    }

    method cosaMasPesada() {
        if (!cosasCargadas.isEmpty()){
           return cosasCargadas.max({c=>c.peso()})
        } else{
            return 
        }
    }
}