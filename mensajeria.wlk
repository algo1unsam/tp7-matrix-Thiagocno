import mensajeros.*

object mensajeria {
  var property mensajeros = []
  var property facturacion = 0
  var property pendientes = []
  
  method contratarMensajero(mensajero) {
    mensajeros.add(mensajero)
  }
  
  method despedirMensajero(mensajero) {
    mensajeros.remove(mensajero)
  }
  
  method despedirTodos() {
    mensajeros.clear()
  }
  
  method esMensajeriaGrande() = mensajeros.size() > 2
  
  method puedeSerEntregadoPorPrimerEmpleado() {
    const mensajero = mensajeros.first()
    return paquete.puedeSerEntregadoPor(mensajero)
  }
  
  method pesoUltimoMensajero() {
    const mensajero = mensajeros.last()
    return mensajero.peso()
  }
  
  // parte 3
  method puedeSerEntregadoPorLaEmpresa(p) = mensajeros.any(
    { mensajero => p.puedeSerEntregadoPor(mensajero) }
  )
  
  method mensajerosQuePuedenLlevar(p) = mensajeros.filter(
    { mensajero => p.puedeSerEntregadoPor(mensajero) }
  )
  
  method tieneSobrepeso() {
    if (mensajeros.isEmpty()) {
      return false
    }
    return mensajeros.map({ mensajero => mensajero.peso() }).average() > 500
  }
  
  method enviar(p) {
    const posibles = self.mensajerosQuePuedenLlevar(p)
    if (posibles.isEmpty()) {
      pendientes.add(p)
    } else {
      facturacion += p.precio()
    }
  }
  
  method enviarTodos(paquetes) {
    paquetes.forEach({ paquete => self.enviar(paquete) })
  }
  
  method enviarPendienteMasCaro() {
    const paqueteMasCaro = pendientes.max({ paquete => paquete.precio() })
    self.enviar(paqueteMasCaro)
    pendientes.remove(paqueteMasCaro)
  }
}