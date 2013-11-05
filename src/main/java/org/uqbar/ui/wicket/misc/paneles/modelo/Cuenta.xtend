package org.uqbar.ui.wicket.misc.paneles.modelo

class Usuario {
	@Property String nombre;
	@Property String dni;
	@Property Cuenta cuenta;
}

class Cuenta {
	@Property int numero
	@Property TipoCuenta tipo = TipoCuenta.CAJA_AHORRO
	@Property float saldo
}

public enum TipoCuenta {
	CUENTA_CORRIENTE,
	CAJA_AHORRO,
	SUELDO
}
