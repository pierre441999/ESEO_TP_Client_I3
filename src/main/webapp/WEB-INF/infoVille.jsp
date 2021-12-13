<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<%@ include file="navbar.jsp"%>

	<form method="post"
		action="infosVille?codeCommune=${ville.codeCommune}">

		<div class="col-md-3">
			<label for="nomCommune" class="form-label">Nom commune :</label> <input
				type="text" name="nomCommune" id="nomCommune" class="form-control"
				value="${ville.nomCommune}"> <label for="codePostale"
				class="form-label">Code Postale :</label> <input type="text"
				name="codePostale" id="codePostale" class="form-control"
				value="${ville.codePostale}"> <label for="libelle"
				class="form-label">Libelle acheminement :</label> <input type="text"
				name="libelle" id="libelle" class="form-control"
				value="${ville.libelle}"> <label for="ligne"
				class="form-label">Ligne :</label> <input type="text" name="ligne_5"
				id="ligne" class="form-control" value="${ville.ligne_5}"> <label
				for="latitude" class="form-label">Latitude :</label> <input
				type="text" name="latitude" id="latitude" class="form-control"
				value="${ville.coord.latitude}"> <label for="longitude"
				class="form-label">Longitude :</label> <input type="text"
				name="longitude" id="longitude" class="form-control"
				value="${ville.coord.longitude}">
		</div>

		<input type="submit" class="btn btn-danger" name="send"
			value="Supprimer" /> <input type="submit" class="btn btn-warning"
			name="send" value="Modifier" />

	</form>






</body>
</html>