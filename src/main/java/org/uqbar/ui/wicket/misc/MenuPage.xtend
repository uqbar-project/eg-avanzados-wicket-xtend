package org.uqbar.ui.wicket.misc

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.link.BookmarkablePageLink
import org.apache.wicket.request.mapper.parameter.PageParameters
import org.uqbar.ui.wicket.misc.paneles.UsuarioPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XLink
import org.uqbar.ui.wicket.misc.herencia.ClienteVIPPage
import org.uqbar.ui.wicket.misc.herencia.model.ClienteVIP
import org.uqbar.ui.wicket.misc.herencia.model.Descuento
import org.uqbar.ui.wicket.misc.herencia.model.Producto
import org.uqbar.ui.wicket.misc.herencia.ClientePage

class MenuPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	new() {
		
		this.addChild(new XLink("cliente") => [
			onClick = [| setResponsePage(new ClientePage(crearCliente))]
		])
		
		this.addChild(new XLink("clienteVIP") => [
			onClick = [| setResponsePage(new ClienteVIPPage(crearClienteVIP))]
		])
		
		this.addChild(new XLink("ejemploPaneles") => [
			onClick = [| setResponsePage(new UsuarioPage)]
		])
		
		val params = new PageParameters;
		params.add("dni", "13.241.415");
		
		this.addChild(new BookmarkablePageLink("usuario13", UsuarioPage, params));
		
	}
	
	def crearCliente() {
		new ClienteVIP => [
			nombre = "Jose"
			apellido = "Don Nadie"
			domicilio = "Rivadavia 7620, 10mo C"
		]		
	}
	
	def crearClienteVIP() {
		new ClienteVIP => [
			nombre = "Juan"
			apellido = "Importante"
			domicilio = "Juana Manso 234"

			descuentos = #[
				new Descuento => [ porcentaje = 20 ; producto = new Producto("TV LED 55'") ],
				new Descuento => [ porcentaje = 10 ; producto = new Producto("Traje'") ],
				new Descuento => [ porcentaje = 5 ; producto = new Producto("Carga de Combustible'") ]
			]
		]
	}
	
}