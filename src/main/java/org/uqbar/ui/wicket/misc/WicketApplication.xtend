package org.uqbar.ui.wicket.misc

import org.apache.wicket.protocol.http.WebApplication

/**
 * Application object for your web application. If you want to run this application without deploying, run the Start class.
 * 
 * @see edu.unsam.algo3.Start#main(String[])
 */
class WicketApplication extends WebApplication {
	
	override getHomePage() {
		MenuPage
	}
	
	override init() {
		super.init()
		// add your configuration here
	}
	
}