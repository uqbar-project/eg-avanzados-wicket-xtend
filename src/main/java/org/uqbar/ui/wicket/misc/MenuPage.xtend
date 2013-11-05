package org.uqbar.ui.wicket.misc

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.link.BookmarkablePageLink
import org.apache.wicket.request.mapper.parameter.PageParameters
import org.uqbar.ui.wicket.misc.herencia.HijoMenorPage
import org.uqbar.ui.wicket.misc.paneles.UsuarioPage
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods
import org.uqbar.wicket.xtend.XLink

class MenuPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	new() {
		
		this.addChild(new XLink("ejemploHerencia") => [
			onClick = [| setResponsePage(new HijoMenorPage)]
		])
		
		this.addChild(new XLink("ejemploPaneles") => [
			onClick = [| setResponsePage(new UsuarioPage)]
		])
		
		val params = new PageParameters;
		params.add("dni", "13.241.415");
		
		this.addChild(new BookmarkablePageLink("usuario13", UsuarioPage, params));
		
	}
	
}