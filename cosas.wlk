import camion.*

object knightRider{
    method peso() = 500
    method nivelPeligrosidad() = 10
}

object bumblebee{
     var estaTransformado = false
     method peso() = 800
     method transformarse() {
        estaTransformado = !estaTransformado
    }
    method estaTransformado() = estaTransformado      
    method nivelPeligrosidad() = if (self.estaTransformado()) 30 else 15
}

object paqueteDeLadrillos{
    var cantidadDeLadrillos = 0
    method sumarLadrillos(n) {
      cantidadDeLadrillos = n
    }
    method cantidadDeLadrillos() = cantidadDeLadrillos
    method peso() = cantidadDeLadrillos * 2  
    method nivelPeligrosidad() = 1
}

object arenaAGranel{
    var peso = null
    method peso() = peso 
    method modificarPeso(nuevoPeso) {
         peso = nuevoPeso
    }
}

object bateriaAntiaerea{
    var hayMisiles = false
    method hayMisiles() = hayMisiles      
    method cargarMisiles() {
        hayMisiles = !hayMisiles      
    }
    method peso() = if (self.hayMisiles()) 300 else 200
    method nivelPeligrosidad() =  if (self.hayMisiles()) 100 else 0
}

object contenedorPortuario{
    const tara = 100
    const cosasDentro = []
    method peso() = tara + cosasDentro.sum(c=>c.pesaje())
  
}