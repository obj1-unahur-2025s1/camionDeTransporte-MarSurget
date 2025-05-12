import cosas.*

object camion {
    const tara = 1000
    const cosasCargadas = []
    method pesoTotal() = tara + cosasCargadas.sum({c=>c.peso()})
    method cargar(algo){
        cosasCargadas.add(algo)
    }
    method descargar(algo) {
        cosasCargadas.remove(algo)
    }
    method sonNumPares(cosas) {
        cosasCargadas.all({c=>c.peso() % 2 == 0})
    }
    method pesoDe(algo, peso) {
        cosasCargadas.any({a=>a.peso() == peso })      
    }
    method nivelPeligrosidadPrimerCosa(nivel) {
        cosasCargadas.find({a=>a.nivelPeligrosidad() == nivel})    
    }
    method cosasConPeligrosidad(nivelPeligrosidad) {
        cosasCargadas.filter({a=>a.nivelPeligrosidad() > nivelPeligrosidad})
    }
    method cosasConPeligrosidadMayorA(algo) {
        cosasCargadas.filter({a=>a.nivelPeligrosidad() > algo.nivelPeligrosidad()})
    }
    method estaExcedidoPeso() = self.pesoTotal() >= 2500
    method puedeCircularEnRuta(nivelPeligrosidad) = not self.estaExcedidoPeso() and cosasCargadas.all({c=>c.nivelPeligrosidad()< nivelPeligrosidad})

}