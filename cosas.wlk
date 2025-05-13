import camion.*

object knightRider{
    method peso() = 500
    method nivelPeligrosidad() = 10
    method bultos() = 1
    method alCargarse() {} /// aal cargarse no le pasa nada lo dejo asi??
}

object bumblebee{
     var estaTransformado = false
     method peso() = 800
     method transformarse() {
        estaTransformado = true
        // estaTransformado = !estaTransformado
    }
    method estaTransformado() = estaTransformado      
    method nivelPeligrosidad() = if (self.estaTransformado()) 30 else 15
    method bultos() = 2    
    method alCargarse() {
        estaTransformado = false
    } 
}

object paqueteDeLadrillos{
    var cantidadDeLadrillos = 0
    method sumarLadrillos(n) {
      cantidadDeLadrillos += n
    }
    method cantidadDeLadrillos() = cantidadDeLadrillos
    method peso() = cantidadDeLadrillos * 2  
    method nivelPeligrosidad() = 1
    method bultos() {
        if(cantidadDeLadrillos <= 100){
            return 1
        }else if(cantidadDeLadrillos.between(101, 300)){
            return 2
        }else{
            return 3
        }
    }  
    method alCargarse() {
        self.sumarLadrillos(12) 
    }
}

object arenaAGranel{
    var peso = 0
    method peso() = peso 
    method actualizarPeso(nuevoPeso) {
         peso = nuevoPeso
    }
    method nivelPeligrosidad() = 1
    method bultos() = 1
    method alCargarse() {
        peso = peso - 10
    }
}

object bateriaAntiaerea{
    var hayMisiles = false
    method hayMisiles() = hayMisiles      
    method cargarMisiles() {
        hayMisiles = true      
    }
    method peso() = if (self.hayMisiles()) 300 else 200
    method nivelPeligrosidad() =  if (self.hayMisiles()) 100 else 0
    method bultos() = if (self.hayMisiles()) 2 else 1
    method alCargarse() {
        self.cargarMisiles()
    }
}

object contenedorPortuario{
    const tara = 100
    const cosasDentro = []
    method peso() = tara + cosasDentro.sum({c=>c.peso()})
    method nivelPeligrosidad() = 
        if (cosasDentro.isEmpty()) 0 else cosasDentro.max({c=>c.nivelPeligrosidad()})     
    method agregarCosa(algo) {
        cosasDentro.add(algo)      
    }
    method bultos() = 1 + cosasDentro.sum({c=>c.bultos()})

    method alCargarse() { //// verrrrr
        cosasDentro.forEach({c=>c.alCargarse()})
    }
}

object residuosRadioactivos {
    var peso = 0
    method nivelPeligrosidad() = 200
    method peso() = peso
    method actualizarPeso(nuevoPeso) {
        peso = nuevoPeso
    }
    method bultos() = 1
    method alCargarse() { 
        peso = peso + 15
    }
}

object embalajeDeSeguridad {
    var cosaAEnvolver = residuosRadioactivos // inicializo con el que quiero 
    method envolver(cosa) {
        cosaAEnvolver = cosa      
    }
    method peso() = cosaAEnvolver.peso()
    method nivelPeligrosidad() = cosaAEnvolver.nivelPeligrosidad() / 2
    method bultos() = cosaAEnvolver.bulto()
    method alCargarse() {  }
}

