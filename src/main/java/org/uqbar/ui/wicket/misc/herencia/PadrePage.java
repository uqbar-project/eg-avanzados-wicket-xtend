package org.uqbar.ui.wicket.misc.herencia;

import org.apache.wicket.markup.html.WebPage;
import org.apache.wicket.markup.html.basic.Label;

/**
 * 
 * @author jfernandes
 */
public class PadrePage extends WebPage {
	
	public PadrePage() {
		this.add(new Label("titulo", "Bienvenido desde la superclase"));
	}

}
