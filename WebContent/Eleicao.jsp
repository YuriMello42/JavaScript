<!DOCTYPE html>
<html>
<head>
	<meta charset="ISO-8859-1">
	<title>Vote no seu Candidato!</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-eOJMYsd53ii+scO/bJGFsiCZc+5NDVN2yr8+0RDqr0Ql0h+rP48ckxlpbzKgwra6" crossorigin="anonymous">
	
	<style>
		#area_clique {			
			background-color: red;
		}
		
		#imagem_principal {
			width: 25px
		
		}
	
	</style>
</head>
<body>
	<div>		
		<div id="app"></div>
		
	</div>
	<script>	   	 
		'use strict'
				
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
		card.setAttribute("style", "width: 18rem;")
		
		const img = document.createElement("img")
		img.src = user.picture.large
		img.alt = "..."
		img.className = "card-img-top"
		
		const cardBody = document.createElement("div")
		cardBody.className = "card-body"
		
		const cardTitle = document.createElement("h5")
		cardTitle.className = "card-title"
		cardTitle.innerText = user.name.title + " " + user.name.first + " " + user.name.last
		
		const app = document.getElementById("app")
		
		cardBody.appendChild(cardTitle)
		
		card.appendChild(img)
		card.appendChild(cardBody)
		
		app.appendChild(card)
		
	</script>
</body>
</html>