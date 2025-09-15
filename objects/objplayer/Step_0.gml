#region Movimentação
	//Movimentação por letras
	//Futuramente você pode deixar o usuário escolher as teclas
	//cima = "W"
	teclaCima = keyboard_check_pressed(ord("W"))
	teclaBaixo = keyboard_check(ord("S"))
	teclaEsq = keyboard_check(ord("A"))
	teclaDir= keyboard_check(ord("D"))

	//Movimento por setas
	setaCima =  keyboard_check_pressed(vk_up)
	setaBaixo =  keyboard_check(vk_down)
	setaEsq =  keyboard_check(vk_left)
	setaDir =  keyboard_check(vk_right)
	
	//Barra de espaço
	barraEspaco =  keyboard_check_pressed(vk_space)
	
	//Movimentação horizontal
	moviHorizontal = -(teclaEsq or setaEsq) + (teclaDir or setaDir)
	velocidadeHorizontal = moviHorizontal * velocidade
	
	//Movimentação vertical
	velocidadeVertical += gravidade
	moviVertical = teclaCima or setaCima or barraEspaco
	
	//colisão abaixo
	if place_meeting(x,y + velocidadeVertical ,objChao) and velocidadeVertical >0  {
		while ! place_meeting(x,y + sign(velocidadeVertical) ,objChao) and velocidadeVertical >0{
			y +=sign(velocidadeVertical)
		}
		velocidadeVertical = 0
	}
	
	
	//Colisão para direita e esquerda
	if place_meeting(x + velocidadeHorizontal,y,objChao){
		while ! place_meeting(x + sign(velocidadeHorizontal),y,objChao){
		 x+= sign(velocidadeHorizontal)
		}
		velocidadeHorizontal = 0
	}
	
	x += velocidadeHorizontal
	y += velocidadeVertical
	
	if place_meeting(x,y + 1 ,objChao) and moviVertical{
		velocidadeVertical-= 16
	}
	
	if moviHorizontal < 0 and image_xscale >0{
		image_xscale *= -1
	}
	
	if moviHorizontal > 0 and image_xscale < 0{
		image_xscale *= -1
	}
#endregion
		
		#region Controle da vida
	
			
/*	//Movimentação Vertical
	moviVertical = teclaCima or setaCima or barraEspaco
	

	colisaoBaixo = place_meeting(x, y + 10, objChao)
	colisaoHorizontal = place_meeting(x + moviHorizontal * velocidade,y, objChao)
	velocidadePulo += gravidade
	
	if colisaoBaixo{
		gravidade = 0
	}
	else if gravidade <= 0.5{
		gravidade =0.5
	}
	
	if colisaoHorizontal{
		x -= moviHorizontal* velocidade
	}		
	
	if moviHorizontal < 0 and image_xscale >0 {
		image_xscale *= -1
	}
	
	if moviHorizontal > 0 and image_xscale < 0{
		image_xscale *= -1
	}
	
	if moviVertical and colisaoBaixo{
		y -= moviVertical * velocidadePulo
	}
	 
#endregion/*