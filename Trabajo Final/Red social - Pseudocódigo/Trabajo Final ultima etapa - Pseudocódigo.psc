Algoritmo RedSocial
	
	Dimension usuarios[9999999,2]
	Dimension publicaciones[99999999]
	
	Definir usuarios, eleccion, buscadorNom, buscadorPass, publicaciones como caracter
	Definir i, a, b, c, d, z, contador, contIntentos, contadorPublicaciones Como Entero
	Definir llave Como Logico
	
	contador=0
	contIntentos=0
	contadorPublicaciones=0
	llave=Falso
	c=0
	
	Para i=0 Hasta 3 Con Paso 1 Hacer
		
		i=0
		
		Escribir "+--------------------------------------------------------------+"
		Escribir "| Bienvenido a nuestra red social local! Aquí podras compartir |"
		Escribir "| textos sobre lo que piensas con el resto de usuarios.        |"
		Escribir "| Si es que no tienes una cuenta, te invitamos a crearla.      |"
		Escribir "+--------------------------------------------------------------+"
		Escribir "| 1) Para entrar a tu cuenta                                   |"
		Escribir "| 2) Para Crear tu cuenta                                      |"
		Escribir "| 3) Cerrar pestaña                                            |"
		Escribir "+--------------------------------------------------------------+"
		
		leer eleccion
		Limpiar Pantalla
		
		si i=0 Entonces
			
			Segun eleccion Hacer
				"1":
					Escribir "Escribe tu nombre de usuario:"
					Leer buscadorNom
					
					si contador<>0 Entonces  // Este "si" es para abarcar la posibilidad de q aún no se haya registrado ningún usuario
						
					Para a=0 Hasta contador Con Paso 1 Hacer
						
						Para d=0 Hasta contador-1 Con Paso 1 Hacer //Este bucle itera dentro del arreglo de usuarios buscando coincidencia entre lo ingresado por el usuario y los usuarios guardados
							si usuarios[d,0]=buscadorNom Entonces 
								llave=Verdadero   	//variable llave cambia su valor a"verdadero" si se establece coincidencia
							FinSi
						Fin Para
							si llave=Verdadero Entonces
								Escribir "cuenta encontrada"
								Escribir "escribe la contraseña"
								llave=Falso // Aquí vuelvo la variante "llave" a su estado original de "falso"
								Leer buscadorPass
								
								Para d=0 Hasta contador-1 Con Paso 1 Hacer // Repito el proceso
									si usuarios[d,1]=buscadorPass Entonces 
										llave=Verdadero   	
									FinSi
								Fin Para
								
								si llave=Verdadero Entonces
									llave=Falso
									Limpiar Pantalla
									
									a=contador
									
									i=2
									
									
									
								SiNo
									Limpiar Pantalla
									Escribir ""
									escribir "       || Contraseña incorrecta. Vuelve a intentarlo ||"
									a=contador
								FinSi
							SiNo
								Limpiar Pantalla
								Escribir ""
								Escribir "   || La cuenta que buscas no existe. Vuelve a intentarlo ||" 
								a=contador
							FinSi
						Fin Para
					SiNo
						Limpiar Pantalla
						Escribir ""
						Escribir "       || Aún no se ha registrado ningún usuario ||"
						Escribir ""
					FinSi
					
					
				"2":
					i=1
				"3":
					i=3
				De Otro Modo:
					Escribir ""
					Escribir "   || El comando ingresado no correspone a ninguna acción ||"
					Escribir ""
				Fin Segun
				
		FinSi
		
		si i=1 Entonces
			
			contIntentos=0
			
			Si eleccion="2" Entonces			//En este apartado se "crean" los usuarios. Se piden datos y se guardan dentro del arreglo "usuarios"
				
					Escribir "Defina su nombre de usuario"
					Leer usuarios[contador,0]
					si usuarios[contador,0]="" Entonces
						Repetir
							escribir "Olvidó colocar su nombre de usuario"
							Leer usuarios[contador,0]
							contIntentos=contIntentos+1
						hasta Que usuarios[contador,0]<> "" o contIntentos=3
						
						si contIntentos<>3 Entonces
							
							Escribir "Defina su contraseña"
							Leer usuarios[ contador,1]
							si usuarios[contador,1]= "" Entonces
								Repetir
									escribir "Olvidó colocar su contraseña"
									Leer usuarios[ contador,1]
									contIntentos=contIntentos+1
								hasta Que usuarios[contador,1]<> "" o contIntentos=3
								Limpiar Pantalla
								Escribir ""
								Escribir "             || Usuario creado con exito ||"
								Escribir ""
							FinSi
							contador=contador+1
						FinSi
					SiNo
						contIntentos=0
						Escribir "Defina su contraseña"
						Leer usuarios[ contador,1]
						si usuarios[contador,1]= "" Entonces
							Repetir
								escribir "Olvidó colocar su contraseña"
								Leer usuarios[ contador,1]
								contIntentos=contIntentos+1
							hasta Que usuarios[contador,1]<> "" o contIntentos=3
							Limpiar Pantalla
							Escribir ""
							Escribir "             || Usuario creado con exito ||"
							Escribir ""
						FinSi
						Limpiar Pantalla
						Escribir ""
						Escribir "             || Usuario creado con exito ||"
						Escribir ""
						contador=contador+1
					FinSi
					
			Fin Si
		FinSi
		
		// Aqui defino qué es lo que se encontraran los usuarios al poder acceder a la red
		// Busqué la forma de hacer que lo que publican quede "guardado" en un espacio común (el arreglo "publicaciones") y que todos puedan verlo"
		si i=2 Entonces
			
			Para b=c Hasta contadorPublicaciones Con Paso 1 Hacer
				Repetir
					Escribir "Has accedido a la cuenta. Ahora publica lo que desees"
					Escribir ""
					si contadorPublicaciones<>0 Entonces
						
						Para c=0 Hasta contadorPublicaciones-1 Con Paso 1 Hacer
							Escribir publicaciones[c]
							escribir ""
						Fin Para
						
						Escribir "Si en algún momento deseas salir solo escribe: *cerrar sesion*"
						Leer publicaciones[c]
						Limpiar Pantalla 
						
						si publicaciones[c]<>"cerrar sesion" o publicaciones[c]<>"*cerrar sesion*" Entonces
							contadorPublicaciones=contadorPublicaciones+1
						SiNo
							
						FinSi
					SiNo
						
						Leer publicaciones[b]
						contadorPublicaciones=contadorPublicaciones+1
						
						Limpiar Pantalla
					FinSi
					
				Hasta Que publicaciones[b]="cerrar sesion" o publicaciones[b]="*cerrar sesion*" o publicaciones[c]="cerrar sesion" o publicaciones[c]="*cerrar sesion*"
			Fin Para
			
		FinSi
		
	Fin Para
	
	Escribir "Desea imprimir los usuarios y contraseñas? De ser afirmativo escriba *si*" // Muestra en pantalla todos los usuarios registrados por la aplicación
	Leer eleccion
	
	si eleccion="si" o eleccion="*si*" Entonces
		
		Para z=0 Hasta contador-1 Con Paso 1 Hacer
			Escribir ""
			Escribir Sin Saltar usuarios[z,0]
			Escribir Sin Saltar ": " usuarios[z,1]
			Escribir ""
		Fin Para
		
	FinSi
FinAlgoritmo
