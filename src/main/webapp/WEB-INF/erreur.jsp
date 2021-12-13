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

	<%@ include file="navbar.jsp"%>

	<p id="msg">La page que vous recherchez n'existe pas !</p>
	<p id="error">Veuillez renseigner un paramètre valide dans l'url !</p>
	

</body>
</html>