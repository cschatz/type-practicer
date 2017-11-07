<head>
<title>Type Checker</title>
<script
  src="https://code.jquery.com/jquery-3.2.1.min.js"
  integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4="
  crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" media="screen" href="style.css">
</head>

<div class="container">

<h1>Type Determination Practice</h1>

<form id="typeform" action="check.php" method="post">
<p>Declare structs and variables here:</p>
<textarea cols="40" rows="10" name="decls">
</textarea>
<p>Put a single expression and its type here:<br />
<input name="expr" type="text"> <b>is a</b>
<input name="type" type="text"><br />

<!--

TO DO:
Dump this, left over from when this wasn implemented
using ProtoypeJS [why? how did I not know about jQuery then?].
replace it with a separate script.js file using jQuery to trigger
an AJAX call to check.php

ALSO:
The current CSS yields somewhat ugly results. Need to fix it!

<button onclick="
$('reply').innerHTML = '[Checking...]';
$('typeform').request({
onComplete: function(transport){ $('reply').innerHTML = transport.responseText; }
});
return false;
">
Check Answer
</button>

-->


<button>Check Answer</button>

</form>

<div id="reply">
</div>

</p>

</div>