matrixInput = function(id) {
	tags$div(
		HTML(sprintf("<button id=\"matrixbutton%s\" onclick=\"showMatrix('matrixblankout%s')\">Edit Matrix</button>", id, id)),
		tags$div(
			tags$img(
				src="img/close.svg",
				class="blankoutclose",
				onclick=sprintf("hideMatrix('matrixblankout%s')", id)
			),
			tags$table(id=sprintf("matrix%s", id)),
			class="blankout",
			id=sprintf("matrixblankout%s", id)
		)
	)
}
