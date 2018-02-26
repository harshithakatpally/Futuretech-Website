<html>
	<head><title>Order Successful</title>
	<style>
		#wrapper a{margin-left:50px;
	margin-top:25px;
	font-size:25px;
	}

#wrapper h2{ font-size:30px;
	text-align:center;
	color:#008b8b;
}

#wrapper{
    margin-top:100px;
    margin-left:300px;
    border:2px solid grey;
    margin-right:300px;
    background-color:#ebebe0;
}

#wrapper input{
    width:500px;
    margin-left:120px;
    height:40px;
    font-size:20px;
}

#wrapper input[type=submit]{
    background-color:#008b8b;
    color:white;
    margin-bottom:50px;
}

	</style>
	</head>

	<body>
		<div id="wrapper">
		<a href="productsl.html">Back to products</a>
		<h2>Give your details:</h2>
		<form action="ordercon.jsp" method="post">
			<input type="text" id="nameu" placeholder="Name..."><br><br>
			<input type="text" id="mn" placeholder="Mobile number..."><br><br>
			<input type="textarea" id="add" placeholder="Address..."><br><br>
			<input type="text" id="mail" placeholder="Email..."><br><br>
			<input type="submit" value="Confirm Order">
		</form>
		</div>
	</body>
</html>
