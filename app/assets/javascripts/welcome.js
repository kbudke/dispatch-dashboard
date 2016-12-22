//Refreshes Dashboard Tables and Widgets
function loadTables() {

	//Used multiple delayed time out functions because database updates are slow and dashboard sometimes does not update.
	setTimeout(function() {
		$('#dashtable').load("dashboard #dashtable")
		$('#widget').load("dashboard #widget")
	},  200);  

	setTimeout(function() {
		$('#dashtable').load("dashboard #dashtable")
	},  5000);  

		setTimeout(function() {
		$('#widget').load("dashboard #widget")
	},  5000); 

	setTimeout(function() {
		$('#widget2').load("dashboard #widget2")
	},  5000);   
	setTimeout(function() {
		$('#widget3').load("dashboard #widget3")
	},  5000);  
	setTimeout(function() {
		$('#widget4').load("dashboard #widget4")
	},  5000);  

};
