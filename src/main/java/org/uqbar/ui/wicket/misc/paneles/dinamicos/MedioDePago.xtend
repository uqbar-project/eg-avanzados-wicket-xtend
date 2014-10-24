package org.uqbar.ui.wicket.misc.paneles.dinamicos

class MedioDePago {
	public static val MEDIOS = #[new TarjetaDeCredito, new Transferencia, new Paypal] 
	
	def static getMediosDePago() {
		MEDIOS
	}
	
}

class TarjetaDeCredito extends MedioDePago {
	@Property String numeroTarjeta
	@Property String codigoSeguridad
	@Property String fechaExpiracion
	
	override toString() {
		'Tarjeta de Credito'
	}
	
}

class Transferencia extends MedioDePago {
	@Property String cbuOrigen;
	@Property String dni;
	
	override toString() {
		'Transferencia'
	}
}

class Paypal extends MedioDePago {
	@Property String usuario
	@Property String password
	
	override toString() {
		'Paypal'
	}
}

