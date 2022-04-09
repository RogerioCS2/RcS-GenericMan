function SelecionaDirecao(){
	var direcao = choose(1, 2);
	
	if(direcao == 1){
		velocidadeHorizontalInimigo = -2;
		velocidadeVerticalInimigo = 0;
	}
	
	if(direcao == 2){
		velocidadeHorizontalInimigo = 0;
		velocidadeVerticalInimigo = -2;
	}	
}

function MovimentoInimigo(){
	repeat(abs(velocidadeHorizontalInimigo)){
		var colisaEixoX = (!place_meeting(x + sign(velocidadeHorizontalInimigo), y, objBlocoExterno))
						&& (!place_meeting(x + sign(velocidadeHorizontalInimigo), y, objBlocoInterno))
						&& (!place_meeting(x + sign(velocidadeHorizontalInimigo), y, objBlocoExplosivo));
		if(colisaEixoX){
			x += velocidadeHorizontalInimigo;
		}else{
			velocidadeHorizontalInimigo *= -1;
			contadorSelecao++;
			break;
		}				
	}
	
	repeat(abs(velocidadeVerticalInimigo)){
		var colisaEixoY = (!place_meeting(x, y + sign(velocidadeVerticalInimigo), objBlocoExterno))
						&& (!place_meeting(x, y + sign(velocidadeVerticalInimigo), objBlocoInterno))
						&& (!place_meeting(x, y  + sign(velocidadeVerticalInimigo), objBlocoExplosivo));
		if(colisaEixoY){
			y += velocidadeVerticalInimigo;
		}else{
			velocidadeVerticalInimigo *= -1;
			contadorSelecao++;
			break;
		}				
	}
	
	var possuiBlocoImpedindo = (!place_meeting(x - sprite_width, y, objBlocoInterno)) && (!place_meeting(x, y - sprite_height, objBlocoInterno));
	numeroColisao = choose(2, 3, 4);
	if(contadorSelecao >= numeroColisao && possuiBlocoImpedindo){
		contadorSelecao = 0;
		velocidadeHorizontalInimigo = 0;
		velocidadeVerticalInimigo = 0;
		SelecionaDirecao();		
	}
}

function UpdateInimigos(){
	MovimentoInimigo();
}