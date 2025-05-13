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
    method algoConPesoDe(peso) {
        return cosasCargadas.any({a=>a.peso() == peso })      
    }
    method nivelPeligrosidadPrimerCosa(nivel) {
        if (cosasCargadas.any({c=>c.nivelPeligrosidad() == nivel})){
            cosasCargadas.find({a=>a.nivelPeligrosidad() == nivel})
        } else{
            return null 
        }
    }
    method cosasConPeligrosidad(nivelPeligrosidad) {
        cosasCargadas.filter({a=>a.nivelPeligrosidad() > nivelPeligrosidad})
    }
    method cosasConPeligrosidadMayorA(algo) {
        cosasCargadas.filter({a=>a.nivelPeligrosidad() > algo.nivelPeligrosidad()})
    }
    method estaExcedidoPeso() = self.pesoTotal() >= 2500
    method puedeCircularEnRuta(nivelPeligrosidad) = not self.estaExcedidoPeso() and cosasCargadas.all({c=>c.nivelPeligrosidad()< nivelPeligrosidad})

    method hayAlgoDePesoEntre(valorMin, valorMax) {
        cosasCargadas.any({c=>c.peso() >= valorMin and c.peso() <= valorMax})
    }
    method cosaMasPesada() {
      cosasCargadas.max({c=>c.peso()})
  ////// que pasa si no encuentra nada? tengo que hacer un if que salve la funcion=? 
    }
}