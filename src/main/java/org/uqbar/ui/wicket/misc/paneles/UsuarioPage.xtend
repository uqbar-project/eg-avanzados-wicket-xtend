package org.uqbar.ui.wicket.misc.paneles;

import org.apache.wicket.markup.html.WebPage
import org.apache.wicket.markup.html.basic.Label
import org.apache.wicket.request.mapper.parameter.PageParameters
import org.uqbar.ui.wicket.misc.paneles.modelo.RepositorioUsuarios
import org.uqbar.ui.wicket.misc.paneles.modelo.Usuario
import org.uqbar.wicket.xtend.WicketExtensionFactoryMethods

/**
 * 
 * @author jfernandes
 */
public class UsuarioPage extends WebPage {
	extension WicketExtensionFactoryMethods = new WicketExtensionFactoryMethods

	new() {
		this(RepositorioUsuarios.instance.crearUsuario("Juan Perez", "29.324.122", 132342356, 1200));
	}
	
	new(Usuario usuario) {
		this.defaultModel = usuario.asCompoundModel
		
		this.addChild(new Label("nombre"));
		this.addChild(new Label("dni"));
		
		val panelCuenta = new CuentaPanel("cuenta", usuario.cuenta);
		this.addChild(panelCuenta);
	}


	// bookmarkable
	
	new(PageParameters parameters) {
		this(RepositorioUsuarios.getInstance().buscarPorDni(parameters.get("dni").toString()));
	}
	
}
