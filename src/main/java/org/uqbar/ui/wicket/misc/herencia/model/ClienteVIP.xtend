package org.uqbar.ui.wicket.misc.herencia.model

import java.util.List

/**
 * 
 * @author jfernandes
 */
class ClienteVIP extends Cliente {
	@Property List<Descuento> descuentos = newArrayList();	
}


class Descuento {
	@Property int porcentaje;
	@Property Producto producto; 
}

class Producto {
	@Property String nombre;
	new(String nombre) {
		this.nombre = nombre;
	}
}