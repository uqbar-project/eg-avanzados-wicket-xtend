package org.uqbar.ui.wicket.misc.paneles.dinamicos

import org.apache.wicket.ajax.AjaxRequestTarget
import org.apache.wicket.ajax.form.OnChangeAjaxBehavior
import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.markup.html.form.DropDownChoice
import org.apache.wicket.markup.html.form.Form
import org.apache.wicket.markup.html.form.TextField
import org.apache.wicket.markup.html.panel.Panel
import org.uqbar.ui.wicket.misc.herencia.model.Producto
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.apache.wicket.model.PropertyModel
import org.apache.wicket.model.IModel
import org.apache.wicket.model.Model
import java.io.Serializable

/**
 * 
 * @author jfernandes
 */
class PagarCompra extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	Form<ComprarProducto> form
	
	new() {
		form = new Form<ComprarProducto>("comprarForm", crearModeloDummy.asCompoundModel)
		this.addChild(form)
		
		form.addChild(new Label("producto.nombre"))
		
		form.addChild(new DropDownChoice("medioDePago") => [
			choices = loadableModel([| MedioDePago.getMediosDePago ])
			add(new OnChangeAjaxBehavior() {
				override protected onUpdate(AjaxRequestTarget target) {
					target.add(actualizarPanel)
				}
			});
		])
		
		form.addChild(new SinMedioDePagoPanel("medioDePagoPanel") => [
			outputMarkupId = true
		])
	}
	
	def actualizarPanel() {
		val medio = form.modelObject.medioDePago
		val panel = crearPanelPara(medio)
		panel.defaultModelObject = medio.asCompoundModel
		form.addOrReplace(panel)
	}
	
	
	
	
	
	
	
	
	
	def Panel crearPanelPara(MedioDePago medio) {
		if (medio instanceof TarjetaDeCredito)
			new CreditoPanel("medioDePagoPanel", medio.asCompoundModel)
		else if (medio instanceof Transferencia)
			new TransferenciaPanel("medioDePagoPanel", medio.asCompoundModel)
		else if (medio instanceof Paypal)
			new PayPalPanel("medioDePagoPanel", medio.asCompoundModel)
		else
			throw new RuntimeException("no hay panel para ese medio de pago!")
	}
	
	
	
	
	
	def crearModeloDummy() {
		new ComprarProducto => [
			producto = new Producto("Lavasecarropas")
		]
	}
}

abstract class AbstractMedioDePagoPanel extends Panel {
	protected extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods
	
	new(String id, IModel model) {
		super(id, model)
	}
}

class SinMedioDePagoPanel extends AbstractMedioDePagoPanel {
	new(String id) {
		super(id, null)
	}
}

class CreditoPanel extends AbstractMedioDePagoPanel {
	new(String id, IModel model) {
		super(id, model)
		#["numeroTarjeta", "codigoSeguridad", "fechaExpiracion"].forEach[p|
			this.addChild(new TextField(p))
		]
	}
}

class TransferenciaPanel extends AbstractMedioDePagoPanel {
	new(String id, IModel model) {
		super(id, model)
		this.addChild(new TextField("cbuOrigen"))
		this.addChild(new TextField("dni"))
	}
}

class PayPalPanel extends AbstractMedioDePagoPanel {
	new(String id, IModel model) {
		super(id, model)
		
		this.addChild(new TextField("usuario"))
		this.addChild(new TextField("password"))
	}
	
	
}