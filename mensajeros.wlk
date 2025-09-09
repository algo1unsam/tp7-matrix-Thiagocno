object trinity {
  const property peso = 900
  const property puedeLlamar = true  
}

object neo {
  const property peso = 0
  var property puedeLlamar = true  
  var property credito = true

  method puedeLlamar(){
    return credito
  }
}

object morfeo {
    var property peso = 90
    var property transporte = camion
    const property puedeLlamar = false

    method peso(){
        if (transporte.tipo() == "monopatin"){
            peso += 1
            return peso
        } else {
            peso += transporte.peso()
            return peso
        }
    }  
}

object camion {
    var property acoplados = 1
    var property tipo = "camion"
    var property peso = 500

    method peso(){
        peso *= acoplados
        return peso
    }
}

object monopatin {
    const property peso = 1
    var property tipo = "monopatin"
}

object puente {

    method dejarPasar(persona){
        return persona.peso() <=1000
    }
}

object matrix {
  method dejarPasar(persona) {
    return persona.puedeLlamar()
  }
}

object paquete {
    var property pago = false
    var property destino = puente

    method estaPago() {
      return pago
    }

    method pagar() {
      pago = true
    }

    method puedeSerEntregadoPor(persona) {
        if (pago){
      return destino.dejarPasar(persona) 
        } else {
        return false
        }
    }
}
