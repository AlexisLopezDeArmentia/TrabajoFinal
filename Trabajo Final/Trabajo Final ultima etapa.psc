Algoritmo RedSocial
	Dimension usuarios[9999999,2]
	Dimension publicaciones[99999999]
	Definir usuarios,eleccion,buscadorNom,buscadorPass,publicaciones Como Caracter
	Definir i,a,b,c,d,z,contador,contIntentos,contadorPublicaciones Como Entero
	Definir llave Como Logico
	contador <- 0
	contIntentos <- 0
	contadorPublicaciones <- 0
	llave <- Falso
	c <- 0
	Para i<-0 Hasta 3 Hacer
		i <- 0
		Escribir '+--------------------------------------------------------------+'
		Escribir '| Bienvenido a nuestra red social local! Aquí podras compartir |'
		Escribir '| textos sobre lo que piensas con el resto de usuarios.        |'
		Escribir '| Si es que no tienes una cuenta, te invitamos a crearla.      |'
		Escribir '+--------------------------------------------------------------+'
		Escribir '| 1) Para entrar a tu cuenta                                   |'
		Escribir '| 2) Para Crear tu cuenta                                      |'
		Escribir '| 3) Cerrar pestaña                                            |'
		Escribir '+--------------------------------------------------------------+'
		Leer eleccion
		Borrar Pantalla
		Si i=0 Entonces
			Segun eleccion  Hacer
				'1':
					Escribir 'Escribe tu nombre de usuario:'
					Leer buscadorNom
					Si contador<>0 Entonces // Este "si" es para abarcar la posibilidad de q aún no se haya registrado ningún usuario
						Para a<-0 Hasta contador Hacer
							Para d<-0 Hasta contador-1 Hacer // Este bucle itera dentro del arreglo de usuarios buscando coincidencia entre lo ingresado por el usuario y los usuarios guardados
								Si usuarios[d,0]=buscadorNom Entonces
									llave <- Verdadero // variable llave cambia su valor a"verdadero" si se establece coincidencia
								FinSi
							FinPara
							Si llave=Verdadero Entonces
								Escribir 'cuenta encontrada'
								Escribir 'escribe la contraseña'
								llave <- Falso // Aquí vuelvo la variante "llave" a su estado original de "falso"
								Leer buscadorPass
								Para d<-0 Hasta contador-1 Hacer // Repito el proceso
									Si usuarios[d,1]=buscadorPass Entonces
										llave <- Verdadero
									FinSi
								FinPara
								Si llave=Verdadero Entonces
									llave <- Falso
									Borrar Pantalla
									a <- contador
									i <- 2
								SiNo
									Borrar Pantalla
									Escribir ''
									Escribir '       || Contraseña incorrecta. Vuelve a intentarlo ||'
									a <- contador
								FinSi
							SiNo
								Borrar Pantalla
								Escribir ''
								Escribir '   || La cuenta que buscas no existe. Vuelve a intentarlo ||'
								a <- contador
							FinSi
						FinPara
					SiNo
						Borrar Pantalla
						Escribir ''
						Escribir '       || Aún no se ha registrado ningún usuario ||'
						Escribir ''
					FinSi
				'2':
					i <- 1
				'3':
					i <- 3
				De Otro Modo:
					Escribir ''
					Escribir '   || El comando ingresado no correspone a ninguna acción ||'
					Escribir ''
			FinSegun
		FinSi
		Si i=1 Entonces
			contIntentos <- 0
			Si eleccion='2' Entonces // En este apartado se "crean" los usuarios. Se piden datos y se guardan dentro del arreglo "usuarios"
				Escribir 'Defina su nombre de usuario'
				Leer usuarios[contador,0]
				Si usuarios[contador,0]='' Entonces
					Repetir
						Escribir 'Olvidó colocar su nombre de usuario'
						Leer usuarios[contador,0]
						contIntentos <- contIntentos+1
					Hasta Que usuarios[contador,0]<>'' O contIntentos=3
					Si contIntentos<>3 Entonces
						Escribir 'Defina su contraseña'
						Leer usuarios[contador,1]
						Si usuarios[contador,1]='' Entonces
							Repetir
								Escribir 'Olvidó colocar su contraseña'
								Leer usuarios[contador,1]
								contIntentos <- contIntentos+1
							Hasta Que usuarios[contador,1]<>'' O contIntentos=3
							Borrar Pantalla
							Escribir ''
							Escribir '             || Usuario creado con exito ||'
							Escribir ''
						FinSi
						contador <- contador+1
					FinSi
				SiNo
					contIntentos <- 0
					Escribir 'Defina su contraseña'
					Leer usuarios[contador,1]
					Si usuarios[contador,1]='' Entonces
						Repetir
							Escribir 'Olvidó colocar su contraseña'
							Leer usuarios[contador,1]
							contIntentos <- contIntentos+1
						Hasta Que usuarios[contador,1]<>'' O contIntentos=3
						Borrar Pantalla
						Escribir ''
						Escribir '             || Usuario creado con exito ||'
						Escribir ''
					FinSi
					Borrar Pantalla
					Escribir ''
					Escribir '             || Usuario creado con exito ||'
					Escribir ''
					contador <- contador+1
				FinSi
			FinSi
		FinSi
		// Aqui defino qué es lo que se encontraran los usuarios al poder acceder a la red
		// Busqué la forma de hacer que lo que publican quede "guardado" en un espacio común (el arreglo "publicaciones") y que todos puedan verlo"
		Si i=2 Entonces
			Para b<-c Hasta contadorPublicaciones Hacer
				Repetir
					Escribir 'Has accedido a la cuenta. Ahora publica lo que desees'
					Escribir ''
					Si contadorPublicaciones<>0 Entonces
						Para c<-0 Hasta contadorPublicaciones-1 Hacer
							Escribir publicaciones[c]
							Escribir ''
						FinPara
						Escribir 'Si en algún momento deseas salir solo escribe: *cerrar sesion*'
						Leer publicaciones[c]
						Borrar Pantalla
						Si publicaciones[c]<>'cerrar sesion' O publicaciones[c]<>'*cerrar sesion*' Entonces
							contadorPublicaciones <- contadorPublicaciones+1
						FinSi
					SiNo
						Leer publicaciones[b]
						contadorPublicaciones <- contadorPublicaciones+1
						Borrar Pantalla
					FinSi
				Hasta Que publicaciones[b]='cerrar sesion' O publicaciones[b]='*cerrar sesion*' O publicaciones[c]='cerrar sesion' O publicaciones[c]='*cerrar sesion*'
			FinPara
		FinSi
	FinPara
	Escribir 'Desea imprimir los usuarios y contraseñas? De ser afirmativo escriba *si*' // Muestra en pantalla todos los usuarios registrados por la aplicación
	Leer eleccion
	Si eleccion='si' O eleccion='*si*' Entonces
		Para z<-0 Hasta contador-1 Hacer
			Escribir ''
			Escribir usuarios[z,0] Sin Saltar
			Escribir ': ',usuarios[z,1] Sin Saltar
			Escribir ''
		FinPara
	FinSi
FinAlgoritmo
