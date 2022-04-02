function MovimentoPlayer(){
	var cima, baixo, direita, esquerda;
	direita = keyboard_check(vk_right);
	esquerda = keyboard_check(vk_left);
	cima = keyboard_check(vk_up);
	baixo = keyboard_check(vk_down);
	
	velocidadeHorizontal = (direita - esquerda) * velocidade;
	velocidadeVertical  = (baixo - cima) * velocidade;
	
	x += sign(velocidadeHorizontal); 
	y += sign(velocidadeVertical);	
}

function UpdatePlayer(){
	MovimentoPlayer();
}