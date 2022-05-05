doLater = function(later) {
	return(HTML(sprintf("<i>%s</i><br>",later)))
}

subTitlePanel = function(subtitle) {
	return(HTML(sprintf("<h3>%s</h3>",subtitle)))
}

titlePanel = function(title) {
	return(HTML(sprintf("<h1>%s</h1>",title)));
}

loadFileAsset = function(filename) {
	readChar(filename, file.info(filename)$size);
}

downButtonHTML = function() {
	sprintf("%s", img(src="img/arrow.svg"))
}

toggleScript = function() {
	loadFileAsset("js/toggle.js")
}

collapsiblePanelButton = function(targetID) {
	return(HTML(sprintf("<button onclick=\"toggleCollapse('%s', '%s')\" id=\"%s\">%s</button>",
		sprintf("%scollapse",targetID),
		sprintf("%sbutton", targetID),
		sprintf("%sbutton", targetID),
		downButtonHTML()
	)));
}

collapsiblePanel = function(title, inside, id) {
	tags$div(
		tags$div(
			subTitlePanel(title),
			collapsiblePanelButton(id),
			style="display: flex; justify-content: space-between;"
		),
		tags$div(
			inside,
			id=sprintf("%scollapse", id),
			class="collapsible"
		),
		id=id

	);
}

