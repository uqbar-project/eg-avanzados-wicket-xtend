package org.uqbar.ui.wicket.misc.herencia

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.uqbar.ui.wicket.misc.MenuPage
import org.uqbar.ui.wicket.misc.herencia.model.Cliente
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XLink

/**
 * 
 * @author jfernandes
 */
class ClientePage extends WebPage {
	protected extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	
	new(Cliente cliente) {
		this.defaultModel = cliente.asCompoundModel
		
		this.addChild(new Label("nombre"))
		this.addChild(new Label("apellido"))
		this.addChild(new Label("domicilio"))
		
		
		this.addChild(new XLink("volver") => [
			onClick = [|
				responsePage = MenuPage
			]
		]);
	}

}
