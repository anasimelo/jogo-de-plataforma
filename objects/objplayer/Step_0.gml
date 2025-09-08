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

	//Movimentação Vertical
	moviVertical = teclaCima or setaCima or barraEspaco
	
	x += moviHorizontal * velocidade
	y += gravidade
	gravidade += 0.1
	
	colisaoBaixo = place_meeting(x, y + 10, objChao)
	colisaoHorizontal = place_meeting(x + moviHorizontal * velocidade,y, objChao)
	
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
#endregion