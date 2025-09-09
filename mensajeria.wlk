import mensajeros.*

object mensajeria {
    var property mensajeros = []

    method contratarMensajero(mensajero){
        mensajeros.add(mensajero)
    }

    method despedirMensajero(mensajero) {
      mensajeros.remove(mensajero)
    }

    method despedirTodos() {
      mensajeros.clear()
    }

    method esMensajeriaGrande() {
      return mensajeros.size() > 2
    }

    method puedeSerEntregadoPorPrimerEmpleado(){
        const mensajero = mensajeros.first()
        return paquete.puedeSerEntregadoPor(mensajero)
    }

    method pesoUltimoMensajero() {
      const mensajero = mensajeros.last()
      return mensajero.peso()  
    }
}
