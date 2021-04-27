<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6"
	crossorigin="anonymous">

<title>Vote no seu Candidato!</title>

<style>
body {
	background-image: url("img/fundo.jpg");
	background-repeat: none;
	background-size: cover;
}

.botaoNumero {
	margin-top: 5px;
	width: 60px;
	height: 30px;
}

#Teclado {
	position: absolute;
	top: 350px;
	left: 40%;
	position: absolute;
}

#n0 {
	position: absolute;
	left: 64px;
}

#acoes {
	position: absolute;
	top: 140px;
	font-size: 11px;
}

#numero1 {
	position: absolute;
	top: -60px;
	left: 75px;
}

#numero2 {
	position: absolute;
	top: -60px;
	left: 94px;
}

.entrada {
	background: none;
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom-color: gray;
	width: 15px;
	height: 50px;
	width: 15px;
	border-bottom-color: gray;
	width: 15px;
}

#bConfirma {
	background: green;
}

#bCorrige {
	background: orange;
}

#c1 {
	position: absolute;
	top: 70px;
	left: 15%;
}

#resultado {
	position: absolute;
	top: 90%;
	left: 1%;
}
</style>
</head>
<body>

	<input type="button" id="bGerar" onclick="Gerar()"
		value="Gerar Candidatos" style="width:100px;height:80px;position: absolute; top:10px; left:10px;white-space: normal;">
	<div>
		<div id="c1"></div>



	</div>


	<div id="Teclado">
		<div id="visor">
			<input type="text" class="entrada" id="numero1" name="numero1"
				maxlength="1"> <input type="text" class="entrada"
				id="numero2" name="numero2" maxlength="1">
		</div>

		<div id="n123">
			<input type="button" class="botaoNumero" name="numero" value="1"
				onclick="inserir(1)" /> <input type="button" class="botaoNumero"
				name="numero" value="2" onclick="inserir(2)" /> <input
				type="button" class="botaoNumero" name="numero" value="3"
				onclick="inserir(3)" />
		</div>

		<div id="n345">
			<input type="button" class="botaoNumero" name="numero" value="4"
				onclick="inserir(4)" /> <input type="button" class="botaoNumero"
				name="numero" value="5" onclick="inserir(5)" /> <input
				type="button" class="botaoNumero" name="numero" value="6"
				onclick="inserir(6)" />
		</div>

		<div id="n789">
			<input type="button" class="botaoNumero" name="numero" value="7"
				onclick="inserir(7)" /> <input type="button" class="botaoNumero"
				name="numero" value="8" onclick="inserir(8)" /> <input
				type="button" class="botaoNumero" name="numero" value="9"
				onclick="inserir(9)" />
		</div>

		<div id="n0">
			<input type="button" class="botaoNumero" name="numero" value="0"
				onclick="inserir(0)" />
		</div>
		<div id="acoes">
			<input type="button" class="botaoNumero" name="Branco" value="Branco"
				votoBranco() onclick="votoBranco()" /> <input type="button"
				class="botaoNumero" name="Corrige" id="bCorrige" value="Corrige"
				onclick="reset()" /> <input type="button" class="botaoNumero"
				name="Confirma" id="bConfirma" value="Confirma" onclick="votar()" />
		</div>
	</div>


	<div id="resultado">
	<a href=""><img alt="Resultado Votação" id="imgEstatistica" src="img/ee.png" style="position:absolute;top:20px; left:900px;width: 40px;height:40px;" onclick="resultado()" ></a>
	
	</div>


	<script>
		'use strict'

		function Gerar(){
			let i;
		for (i=0; i < 5; i++){
			
		let usuario;

		const xhr = new XMLHttpRequest();

		xhr.onreadystatechange = function() {
			if (xhr.readyState == XMLHttpRequest.DONE) {
				usuario = JSON.parse(xhr.responseText)
			}
		}
		xhr.open('GET', 'https://randomuser.me/api/', false);
		xhr.send(null);

		const user = usuario.results[0]

		const card = document.createElement("div")
		card.setAttribute("class", "card")
		card.setAttribute("style", "width: 8rem;float:left; margin-top:10px;margin-left:20px;")

		const img = document.createElement("img")
		img.src = user.picture.large
		img.alt = "..."
		img.className = "card-img-top"

		const cardBody = document.createElement("div")
		cardBody.className = "card-body"

		const cardTitle = document.createElement("h5")
		cardTitle.className = "card-title"
		cardTitle.style = "font-size: 10px;"
		cardTitle.innerText = user.name.title + " " + user.name.first + " "
				+ user.dob.age

		const app = document.getElementById("c1")

		cardBody.appendChild(cardTitle)

		card.appendChild(img)
		card.appendChild(cardBody)

		app.appendChild(card)

		
		document.getElementById("bGerar").disabled = true
		
		}
		}

		
		function inserir(valor) {

			let nCandidato1 = document.getElementById("numero1").value;
			let nCandidato2 = document.getElementById("numero2").value;

			if (nCandidato2 != "") {
				document.getNamedItem("numero").disabled = true;
			}

			if (nCandidato1 == "") {
				document.getElementById("numero1").value = valor;
			} else {
				document.getElementById("numero2").value = valor;
			}

		}

		function reset() {
			document.getElementById("numero1").value = "";
			document.getElementById("numero2").value = "";
		}

		function votar() {

			let n1 = document.getElementById("numero1").value;
			let n2 = document.getElementById("numero2").value;

			let candidato = n1 + n2;

			
			
			
			console.log(candidato);
			
			alert("Voto computado com sucesso! ")
			document.getElementById("numero1").value = "";
			document.getElementById("numero2").value = "";

		}
		
		let voto = 0;

		function votoBranco() {

			voto++;

			alert("Voto computado com sucesso!")

			document.getElementById("numero1").value = "";
			document.getElementById("numero2").value = "";

			console.log(voto);
		}

		
		 
	</script>




</body>
</html>