function toggleCollapse(id, buttonID) { 
	let x = document.getElementById(id);
	 if(x.style.display === 'block') {
		 document.getElementById(id).style.display='none'
		 document.getElementById(buttonID).innerHTML = `%s`;
	 } else {
		 document.getElementById(id).style.display='block'
		 document.getElementById(buttonID).innerHTML = `%s`;
	 }
 }
