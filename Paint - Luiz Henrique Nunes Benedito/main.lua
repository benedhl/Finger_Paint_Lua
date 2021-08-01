display.setStatusBar(display.HiddenStatusBar);


local _h = display.contentHeight
local _w = display.contentWidth
local posX = _w/6
local posY = _h-_h-10

local inicioX, inicioY;
local selecionado = ""

local R,G,B = 0,0,0;
local sWidth = 2



local desenhos = display.newGroup();
local canva = display.newRect(desenhos, _w/2, _h/2, _w *2, 440);



local menuSuperior = display.newGroup();
local fundoMenuSup = display.newRect(menuSuperior, 0, -15, _w *2, 60);

local linha;
local posicaoX, movimentoX;
local posicaoY, movimentoY;



local btnMaoLivre = display.newImageRect(menuSuperior,"lapis.png",40,40)
btnMaoLivre.y = posY
btnMaoLivre.x = posX
btnMaoLivre.strokeWidth = 2
btnMaoLivre:setStrokeColor(0,0,0)



local btnLinha = display.newImageRect(menuSuperior,"linha.png",40,40)
btnLinha.y = posY
btnLinha.x = posX+50
btnLinha.strokeWidth = 2
btnLinha:setStrokeColor(0,0,0)

local btnRetangulo = display.newImageRect(menuSuperior,"retangulo.png",40,40)
btnRetangulo.y = posY
btnRetangulo.x = posX+100
btnRetangulo.strokeWidth = 2
btnRetangulo:setStrokeColor(0,0,0)

local btnCirculo = display.newImageRect(menuSuperior,"circulo.png",40,40)
btnCirculo.y = posY
btnCirculo.x = posX+150
btnCirculo.strokeWidth = 2
btnCirculo:setStrokeColor(0,0,0)

local btnBorracha = display.newImageRect(menuSuperior,"borracha.png",40,40)
btnBorracha.y = posY
btnBorracha.x = posX+200
btnBorracha.strokeWidth = 2
btnBorracha:setStrokeColor(0,0,0)


local menuInferior = display.newGroup();
local fundoMenuInf = display.newRect(menuInferior, 0, 500, _w *2, 70);

local pequeno = display.newImageRect(menuInferior,"ponto1.png",40,40)
pequeno.y = _h +20
pequeno.x = _w/15
pequeno.strokeWidth = 2
pequeno:setStrokeColor(0,0,0)

local medio = display.newImageRect(menuInferior,"ponto2.png",40,40)
medio.y = _h + 20
medio.x = _w/4.5
medio.strokeWidth = 2
medio:setStrokeColor(0,0,0)

local grande = display.newImageRect(menuInferior,"ponto3.png",40,40)
grande.y = _h + 20
grande.x = _w/2.6
grande.strokeWidth = 2
grande:setStrokeColor(0,0,0)

local corVermelho = display.newRect(menuInferior,_w/1.6,_h+20,40,40)
corVermelho:setFillColor(1,0,0)
local corVerde = display.newRect(menuInferior,_w/1.3,_h+20,40,40)
corVerde:setFillColor(0,1,0)
local corAzul = display.newRect(menuInferior,_w/1.1,_h+20,40,40)
corAzul:setFillColor(0,0,1)


local function desenhoMaoLivre(event)
	print("Livre")
	btnMaoLivre:setStrokeColor(1,0,0)
	btnLinha:setStrokeColor(0,0,0)	
	btnCirculo:setStrokeColor(0,0,0)
	btnBorracha:setStrokeColor(0,0,0)
	btnRetangulo:setStrokeColor(0,0,0)

	movimentoX = event.x;
    movimentoY = event.y;

    if event.phase == "began" then        
        posicaoX = movimentoX;
        posicaoY = movimentoY;

    elseif event.phase == "moved" then
        linha = display.newLine(desenhos, posicaoX, posicaoY, movimentoX, movimentoY);
        linha:setStrokeColor(R,G,B)
        linha.strokeWidth = sWidth

        posicaoX = movimentoX;
        posicaoY = movimentoY;

    end

    return true
end

local function desenhoLinha(event)
	print("Linha")
	btnMaoLivre:setStrokeColor(0,0,0)
	btnLinha:setStrokeColor(1,0,0)	
	btnCirculo:setStrokeColor(0,0,0)
	btnBorracha:setStrokeColor(0,0,0)
	btnRetangulo:setStrokeColor(0,0,0)

    movimentoX = event.x;
    movimentoY = event.y;

    if event.phase == "began" then        
        posicaoX = movimentoX;
        posicaoY = movimentoY;
        
    elseif event.phase == "moved" then
        if(linha) then
            linha:removeSelf();
            linha = nil;

        end
        
        linha = display.newLine(desenhos, posicaoX, posicaoY, movimentoX, movimentoY);
        linha:setStrokeColor(R,G,B);
        linha.strokeWidth = sWidth;


    elseif event.phase == "ended" then
        linha = display.newLine(desenhos, posicaoX, posicaoY, movimentoX, movimentoY);
        linha:setStrokeColor(R,G,B);
        linha.strokeWidth = sWidth;

    end

    return true

end

local function desenhoRetangulo(event)

	print("Retangulo")
	btnMaoLivre:setStrokeColor(0,0,0)
	btnLinha:setStrokeColor(0,0,0)	
	btnCirculo:setStrokeColor(0,0,0)
	btnBorracha:setStrokeColor(0,0,0)
	btnRetangulo:setStrokeColor(1,0,0)
	movimentoX = event.x;
    movimentoY = event.y;
    
    if event.phase == "began" then           
        posicaoX = movimentoX;
        posicaoY = movimentoY;
      
    elseif event.phase == "moved" then

        if(retangulo) then
            retangulo:removeSelf()
            retangulo = nil

        end

        retangulo = display.newRect(desenhos, posicaoX, posicaoY, movimentoX - posicaoX, movimentoY - posicaoY);
        retangulo:setStrokeColor(R,G,B);
        retangulo.strokeWidth = sWidth;

    elseif event.phase == 'ended' then

        retangulo = display.newRect(desenhos, posicaoX, posicaoY, movimentoX - posicaoX, movimentoY - posicaoY);
        retangulo:setStrokeColor(R,G,B);
        retangulo.strokeWidth = sWidth;

    end

    return true

	end

local function desenhoCirculo(event)
	print("Circulo")


	btnMaoLivre:setStrokeColor(0,0,0)
	btnLinha:setStrokeColor(0,0,0)	
	btnCirculo:setStrokeColor(1,0,0)
	btnBorracha:setStrokeColor(0,0,0)
	btnRetangulo:setStrokeColor(0,0,0)


	movimentoX = event.x;
    movimentoY = event.y;
    
    if event.phase == "began" then           
        posicaoX = movimentoX;
        posicaoY = movimentoY;
      
    elseif event.phase == "moved" then

        if(circulo) then
            circulo:removeSelf();
            circulo = nil;

        end

        circulo = display.newCircle(desenhos, posicaoX, posicaoY, posicaoX - movimentoX);
        circulo:setStrokeColor( R, G, B );
        circulo.strokeWidth = sWidth;

    elseif event.phase == 'ended' then

        circulo = display.newCircle(desenhos, posicaoX, posicaoY, posicaoX - movimentoX);
        circulo:setStrokeColor(R,G,B);
        circulo.strokeWidth = sWidth;


    end

    return true
end

local function apagar ()
	print("Apagar")
	btnMaoLivre:setStrokeColor(0,0,0)
	btnLinha:setStrokeColor(0,0,0)	
	btnCirculo:setStrokeColor(0,0,0)
	btnBorracha:setStrokeColor(1,0,0)
	btnRetangulo:setStrokeColor(0,0,0)


local canva = display.newRect(desenhos, _w/2, _h/2, _w *2, 440);

end

function linhaPequeno()
	print("pequeno")

	pequeno:setStrokeColor(1,0,0)
	medio:setStrokeColor(0,0,0)
	grande:setStrokeColor(0,0,0)
	sWidth = 1
end

function linhaMedio()
	print("medio")

	pequeno:setStrokeColor(0,0,0)
	medio:setStrokeColor(1,0,0)
	grande:setStrokeColor(0,0,0)
	sWidth = 5
end

function linhaGrande()
	print("grande")

	
	pequeno:setStrokeColor(0,0,0)
	medio:setStrokeColor(0,0,0)
	grande:setStrokeColor(1,0,0)
	sWidth = 10

end

function vermelho()
	print ("vermelho")
	R = 1
	G = 0
	B = 0
	corVermelho.strokeWidth = 1
	corAzul.strokeWidth = 5	
	corVerde.strokeWidth = 5


end

function azul()
	print ("azul")

	R = 0
	G = 0
	B = 1
	corVermelho.strokeWidth = 5
	corAzul.strokeWidth = 1	
	corVerde.strokeWidth = 5
end

function verde()
	print ("verde")

	R = 0
	G = 1
	B = 0

	corVermelho.strokeWidth = 5
	corAzul.strokeWidth = 5	
	corVerde.strokeWidth = 1


end

local function selecionarAcao( event )
    local selecionado = event.target;
    local acao;

    Runtime:removeEventListener("touch", desenhoLinha);
    Runtime:removeEventListener("touch", desenhoCirculo);
    Runtime:removeEventListener("touch", desenhoRetangulo);
    Runtime:removeEventListener("touch", desenhoMaoLivre);

    for i=1,menuSuperior.numChildren do
        local elemento = menuSuperior[i]
    end
   

    if(selecionado == btnMaoLivre)then
        acao = desenhoMaoLivre;

    elseif(selecionado == btnLinha)then
        acao = desenhoLinha;

    elseif(selecionado == btnRetangulo)then
        acao = desenhoRetangulo;

    elseif(selecionado == btnCirculo)then
        acao = desenhoCirculo;
    end
    Runtime:addEventListener("touch", acao);

end

btnMaoLivre:addEventListener("tap", selecionarAcao);
btnLinha:addEventListener("tap", selecionarAcao);
btnRetangulo:addEventListener("tap", selecionarAcao);
btnCirculo:addEventListener("tap", selecionarAcao);
btnBorracha:addEventListener("tap", apagar);


pequeno:addEventListener( "tap", linhaPequeno )
medio:addEventListener( "tap", linhaMedio )
grande:addEventListener( "tap", linhaGrande )
corVermelho:addEventListener( "tap", vermelho )
corVerde:addEventListener( "tap", verde )
corAzul:addEventListener( "tap", azul )










