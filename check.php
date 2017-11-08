<?php
if ($_POST['decls'] == "" || $_POST['expr'] == "" || $_POST['type'] == "") {
	echo "You must fill all inputs first.";
} else {
	passthru ("./determine.pl \"" .
		urldecode($_POST['decls']) . "\" \"" . urldecode($_POST['expr'])
		. "\" \"" . urldecode($_POST['type']) . "\"" );
}
?>
