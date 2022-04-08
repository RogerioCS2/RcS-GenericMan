function ColisaoPlayer(){
	repeat(abs(velocidadeHorizontal)){
		var colisaoX = (!place_meeting(x + sign(velocidadeHorizontal), y, objBlocoExterno))
						&& (!place_meeting(x + sign(velocidadeHorizontal), y, objBlocoInterno))
						&& (!place_meeting(x + sign(velocidadeHorizontal), y, objBlocoExplosivo));
		if(colisaoX){
			x += sign(velocidadeHorizontal); 			
		}else{
			velocidadeHorizontal = 0;
			break;
		}
	}
	
	repeat(abs(velocidadeVertical)){
		var colisaoX = (!place_meeting(x, y  + sign(velocidadeVertical), objBlocoExterno))
						&& (!place_meeting(x, y + sign(velocidadeVertical), objBlocoInterno))
						&& (!place_meeting(x, y+ sign(velocidadeVertical), objBlocoExplosivo));
		if(colisaoX){
			y += sign(velocidadeVertical); 			
		}else{
			velocidadeVertical = 0;
			break;
		}
	}
}

function AnimacaoPlayer(){
	if(velocidadeHorizontal != 0){
		image_xscale = sign(velocidadeHorizontal);
		sprite_index = sprPlayerAndandoDireita;
	}
	if(velocidadeVertical < 0){sprite_index = sprPlayerAndandoCima;}
	if(velocidadeVertical > 0){sprite_index = sprPlayerAndandoBaixo;}
	if(velocidadeHorizontal == 0 && velocidadeVertical ==0){sprite_index = sprPlayerParado;}
}

function MovimentoPlayer(){
	var cima, baixo, direita, esquerda;
	direita = keyboard_check(vk_right);
	esquerda = keyboard_check(vk_left);
	cima = keyboard_check(vk_up);
	baixo = keyboard_check(vk_down);
	
	velocidadeHorizontal = (direita - esquerda) * velocidade;
	velocidadeVertical  = (baixo - cima) * velocidade;
	
	ColisaoPlayer();
	AnimacaoPlayer();
	
	//x += sign(velocidadeHorizontal); 
	//y += sign(velocidadeVertical);	
}

function UpdatePlayer(){
	MovimentoPlayer();
}