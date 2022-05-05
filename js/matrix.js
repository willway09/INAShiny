function matrix() {
	let table = document.createElement("table");

	for(let y = 0; y < 5; y++) {
		let row = document.createElement("tr")
		for(let x = 0; x < 5; x++) {
			let data = document.createElement("td");
			let input = document.createElement("input")
			input.type = "text";
			data.appendChild(input);
			row.appendChild(data);
		}
		table.appendChild(row);
	}

}

function showMatrix(id) {
	document.getElementById(id).style.visibility="visible";

	let table = document.getElementById((new String(id)).replace("blankout", ""))

	table.innerHTML = "";

	let numnodes = 10;
	let blank = document.createElement("td");
	blank.classList.add("tabletext");

	let r = document.createElement("tr");
	r.appendChild(document.createElement("td"));
	r.appendChild(document.createElement("td"));
	let toDat = blank.cloneNode();
	toDat.colSpan=numnodes;
	toDat.innerHTML = "To";
	r.appendChild(toDat);
	table.appendChild(r);

	let numsRow = document.createElement("tr");
	numsRow.appendChild(document.createElement("td"));
	numsRow.appendChild(document.createElement("td"));
	for(let i = 0; i < numnodes; i++) {
		let data = blank.cloneNode();
		data.innerHTML = i;
		numsRow.appendChild(data);
	}
	table.appendChild(numsRow);

	for(let y = 0; y < numnodes; y++) {
		let row = document.createElement("tr")
		if(y == 0) {
			let fromDat = blank.cloneNode();
			fromDat.rowSpan=numnodes;
			fromDat.innerHTML = `<div style="transform: rotate(-90deg);">From</div>`;
			row.appendChild(fromDat);
		}
		let numDat = blank.cloneNode();
		numDat.innerHTML = `&nbsp&nbsp&nbsp${y}&nbsp&nbsp&nbsp`;
		row.appendChild(numDat);
		for(let x = 0; x < numnodes; x++) {
			let data = document.createElement("td");
			data.classList.add("tableinput");
			let input = document.createElement("input")
			input.classList.add("matrixinput");
			input.type = "text";
			data.appendChild(input);
			row.appendChild(data);
		}
		table.appendChild(row);
	}
}

function hideMatrix(id) {
	document.getElementById(id).style.visibility="hidden";
}
