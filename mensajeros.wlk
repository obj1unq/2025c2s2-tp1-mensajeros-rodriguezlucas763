/*
- El paquete debe estar pagado para poder ser entregado.
- En el ejemplo lo está, pero no siempre podria ser asi.
(estado inicial de "pagado?" True, establecer setter para pagar)

- Cada destino tiene restricciones segun quien llega a él: 	
	. "PuenteDeBrooklyn": deja pasar todo lo que pese hasta una tonelada (1000 kilos)
	. "LaMatrix": deja pasar a quien pueda hacer una llamada.
	.. getters de peso y puedellamar en cada persona

- jeanGray siempre llama y tiene peso fijo
- neo no pesa nada y llama siempre si tieneCredito. setter para tieneCredito ? 
- saraConnor no llama. setter para peso propio, peso extra segun vehiculo, el
  camion si tiene acoplados pesa 500 mas por acoplado. cada vehiculo un objeto
  con getter de peso, acoplados del camion en el 
*/

object puenteDeBrooklyn {
  const pesoLimite = 1000

  method puedePasar(persona) {
	  return persona.peso() <= pesoLimite
  }
}

object laMatrix {
	
  method puedePasar(persona) {
	  return persona.puedeLlamar()
  }
}

object jeanGray {
  const puedeLlamar = true 
  const peso        = 65

  method peso() {
	  return peso
  }

  method puedeLlamar() {
    return puedeLlamar
  }
}

object neo {
  const puedeLlamar  = self.tieneCredito()
  const tieneCredito = true
  const peso         = 0

  method peso() {
	  return peso
  }
  method puedeLlamar() {
	  return puedeLlamar
  }
  method tieneCredito() {
	  return tieneCredito
  }
}

object saraConnor {
  const puedeLlamar  = false
  var   peso         = 0

  method peso(){
	  return peso
  }
  method puedeLlamar() {
	  return puedeLlamar
  }
  method peso(pesoPropio, vehiculo) {
	  peso = pesoPropio + vehiculo.peso()
	      
  }

}

object paquete {
  var estaPagado = true

  method pagar() {
	  estaPagado = true
  }
  method noPagar() {
    estaPagado = false
  }
  method estaPagado() {
	  return estaPagado
  }
  method puedeSerEntregadoEn_Por_(destino, persona) {
	  if (estaPagado) {
		  return destino.puedePasar(persona)
	  }
	  else {
		  return false
	  }
  }
}

object camion {
  const peso = 500
  var cantAcoplados = 0

  method peso() {
	  return peso + cantAcoplados * 500
  }
  method cantAcoplados(cantidad) {
    cantAcoplados = cantidad
  }
}

object moto {
  const peso = 100

  method peso() {
	  return peso
  }
}