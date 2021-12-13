<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Page inexistante</title>
<style type="text/css">
#msg {
	text-align: center;
	font-size: 1.6em
}
body {
	font-family: Helvetica, sans-serif;
	font-size: large;
}
#error {
	color: red;
	font-weight: bold;
	text-align: center;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar navbar-light" style="background-color: #e3f2fd;">
  <div class="container-fluid">
    <a class="navbar-brand" href="/ESEO_TP_Client_I3/distance">Villes</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
 
        <li class="nav-item">
          <a class="nav-link" href="/ESEO_TP_Client_I3/listeVilles?page=1" >Liste des villes</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

	<p id="msg">La page que vous recherchez n'existe pas !</p>
	<p id="error">Veuillez renseigner un paramètre valide dans l'url !</p>
	

</body>
</html>