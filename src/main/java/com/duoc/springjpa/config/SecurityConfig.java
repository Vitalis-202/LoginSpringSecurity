package com.duoc.springjpa.config;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	//Sobreescribir el método configure
	//Programar el enrutamiento.
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		// TODO Auto-generated method stub
		//super.configure(http);
		//Orden logico de configuracion es
		//Permiso general
		//Permiso especifico
		//Cerrar sesión
		http
		.authorizeRequests()//Autorizar las request
		.antMatchers("/css/*","/js/*","/img/*","/assets/*","/fonts/*","/vendor/*")
		.permitAll()
        .anyRequest()
        .authenticated()
		.and() //y
		.formLogin() //
		.loginPage("/login") //login sea mi pagina
		.permitAll()//cualquier persona puede entrar al login
		.and()
		.logout() //cuando haga logout
		.logoutRequestMatcher(new AntPathRequestMatcher("/logout")) //cerrar la sesion, es lo que pasa cuando se cierra sesion
		.logoutSuccessUrl("/login") //si es correcto, devuelve al login
		;
		
		
	}



}
