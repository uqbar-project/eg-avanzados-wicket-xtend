package org.uqbar.ui.wicket.misc.paneles;

import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.panel.Panel
import org.uqbar.ui.wicket.misc.paneles.modelo.Cuenta
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XAttributeModifier
import org.uqbar.wicket.xtend.XLink

/**
 * @author jfernandes
 */
class CuentaPanel extends Panel {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods 

	new(String id, Cuenta cuenta) {
		super(id)
		this.defaultModel = cuenta.asCompoundModel
		
		this.addChild(new Label("numero"))
		this.addChild(new Label("tipo"))
		
		val saldoLabel = new Label("saldo")
		saldoLabel.add(new XAttributeModifier("class", [Float saldo | if (saldo < 0) "saldoNegativo" else "saldoPositivo"]))
		
		this.addChild(saldoLabel)
		
		this.addChild(new XLink("darlePlata") => [
			onClick = [| cuenta.saldo = cuenta.saldo + 1000 ]
		])
	}

}
