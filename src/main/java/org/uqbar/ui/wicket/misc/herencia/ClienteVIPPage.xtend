package org.uqbar.ui.wicket.misc.herencia;

import org.apache.wicket.markup.html.basic.Label;
import org.uqbar.ui.wicket.misc.herencia.model.ClienteVIP
import org.uqbar.wicket.xtend.XListView

/**
 * 
 * @author jfernandes
 */
class ClienteVIPPage extends ClientePage {

	new(ClienteVIP vip) {
		super(vip)
		
		// agregamos los descuentos
		this.addChild(new XListView("descuentos") => [
			populateItem = [item |
				item.model = item.modelObject.asCompoundModel
				
				item.addChild(new Label("porcentaje"))
				item.addChild(new Label("producto.nombre"))
			]
		]);
	}
	
}
