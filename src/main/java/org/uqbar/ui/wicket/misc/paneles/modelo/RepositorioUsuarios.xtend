package org.uqbar.ui.wicket.misc.paneles.modelo

import java.util.List

/**
 * @author jfernandes
 */
public class RepositorioUsuarios {
	static final RepositorioUsuarios INSTANCE = new RepositorioUsuarios
	List<Usuario> usuarios = newArrayList
	
	new() {
		usuarios.add(crearUsuario("Pepe", "13.241.415", 9999, -23));
		usuarios.add(crearUsuario("Antonio", "8.123.123", 8888, 9000));
		usuarios.add(crearUsuario("Maria", "7.123.124", 8888, 1000));
		usuarios.add(crearUsuario("Alvaro", "27.123.123", 8888, 1500));
	}
	
	def crearUsuario(String nombre, String dni, int numeroCuenta, float saldo) {
		val u = new Usuario
		u.nombre = nombre
		u.dni = dni
		
		val c = new Cuenta
		c.numero = numeroCuenta
		c.saldo = saldo
		u.cuenta = c
		u
	}

	def static RepositorioUsuarios getInstance() {
		return INSTANCE;
	}
	
	def buscarPorDni(String dni) {
		for (Usuario u : this.usuarios) {
			if (u.getDni().equals(dni)) {
				return u
			}
		}
		throw new RuntimeException("No existe el usuario con DNI " +  dni);
	}
	

}