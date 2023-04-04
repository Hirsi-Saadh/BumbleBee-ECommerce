<%--
  Created by IntelliJ IDEA.
  User: itzme
  Date: 4/4/2023
  Time: 1:40 PM
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<html>
<head>
    <title>Payment Successful</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        .container {
            margin-top: 50px;
            text-align: center;
        }
        h1 {
            font-size: 50px;
            font-weight: bold;
            color: green;
        }
        p {
            font-size: 30px;
            font-weight: bold;
            margin-top: 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Payment Successful!</h1>
    <p>You will be redirected to the homepage in <span id="countdown">6</span> seconds.</p>
</div>

<script>
    var timeLeft = 6;
    var countdown = setInterval(function() {
        timeLeft--;
        document.getElementById("countdown").innerHTML = timeLeft;
        if (timeLeft <= 0) {
            clearInterval(countdown);
            window.location.href = "homepage";
        }
    }, 1000);
</script>
</body>
</html>

