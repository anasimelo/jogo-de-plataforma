#region Controle do tamanho da tela
	//Tecla esc
	teclaEsc = keyboard_check_pressed(vk_escape)

	//Teclas F11 e a letra F
	teclasF = keyboard_check_pressed(vk_f11) or keyboard_check_pressed(ord("F"))

if teclaEsc{
	window_set_fullscreen(false)
}

if teclasF{
	if window_get_fullscreen(){
		window_set_fullscreen(false)
	}
	else{
		window_set_fullscreen(true)
	}
}	

#endregion

#region Controle da vida
	if objplayer.y >= room_height{
			room_restart()
			global.vidas --
	}
		
	if global.vidas == 0{
		global.vidas = 5
		global.pontos = 0
	}
	
	if global.pontos >= 10{
		global.vidas++
		global.pontos = 0
	}
#endregion