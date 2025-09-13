object trinity {
  const property peso = 900
  const property puedeLlamar = true
}

object neo {
  const property peso = 0
  var property credito = true
  
  method puedeLlamar() = credito
}

object morfeo {
  const property pesoBase = 90
  var property transporte = camion
  const property puedeLlamar = false
  
  method peso() {
    if (transporte.tipo() == "monopatin") {
      return pesoBase + 1
    } else {
      return pesoBase + transporte.peso()
    }
  }
}

object camion {
  var property acoplados = 1
  const property tipo = "camion"
  
  method peso() = 500 * acoplados
}

object monopatin {
  const property peso = 1
  var property tipo = "monopatin"
}

object puente {
  method dejarPasar(persona) = persona.peso() <= 1000
}

object matrix {
  method dejarPasar(persona) = persona.puedeLlamar()
}

object paquete {
  var property pago = false
  var property destino = puente
  const property precio = 50
  
  method estaPago() = pago
  
  method pagar() {
    pago = true
  }
  
  method puedeSerEntregadoPor(persona) {
    if (pago) {
      return destino.dejarPasar(persona)
    } else {
      return false
    }
  }
}

object paquetito {
  const property pago = true
  const property precio = 0
  
  method puedeSerEntregadoPor(persona) = true
}

object paquetonViajero {
  var property destinos = []
  const property precio = 100
  var property pagado = 0
  
  method añadirDestino(destino) {
    destinos.add(destino)
  }
  
  method pagar(monto) {
    pagado += monto
  }
  
  method estaPago() = pagado >= precio
  
  method puedeSerEntregadoPor(persona) {
    if (not self.estaPago()) {
      return false
    }
    if (destinos.isEmpty()) {
      return true
    }
    
    const aprobados = destinos.filter(
      { destino => destino.dejarPasar(persona) }
    )
    return aprobados.size() == destinos.size()
  }
}