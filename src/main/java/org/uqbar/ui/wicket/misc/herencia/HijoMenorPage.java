package org.uqbar.ui.wicket.misc.herencia;

import org.apache.wicket.markup.html.basic.Label;

/**
 * @author jfernandes
 */
public class HijoMenorPage extends PadrePage {

	public HijoMenorPage() {
		super();
		this.add(new Label("saludo", "Hola soy el hijo menor"));
	}
	
}
