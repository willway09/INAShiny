function toggleCollapse(id, buttonID) { 
	let x = document.getElementById(id);
	 if(x.style.display === 'block') {
		 document.getElementById(id).style.display='none'
		 document.getElementById(buttonID).children[0].classList.remove("buttonup");
		 document.getElementById(buttonID).children[0].classList.add("buttondown");
	 } else {
		 document.getElementById(id).style.display='block'
		 document.getElementById(buttonID).children[0].classList.remove("buttondown");
		 document.getElementById(buttonID).children[0].classList.add("buttonup");
	 }
 }
