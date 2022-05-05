library(shiny)
library(rjson)

source("include.R")

head = function() {
	tags$head(
		tags$link(rel="stylesheet", type="text/css", href="css/stylesheet.css"),
		HTML('<script src="js/toggle.js"></script>'),
		HTML('<script src="js/matrix.js"></script>')
	);
}

ui = fluidPage(
	head(),
	titlePanel("INA Shiny App"),
	sidebar(),
	mainPanel(
		plotOutput("test")
	)
);

#Add resource paths for static assets
addResourcePath("img", "img")
addResourcePath("js", "js")
addResourcePath("css", "css")

server = function(input, output) {
	output$test = renderPlot({
		hist(rnorm(25))
	});
}

shinyApp(ui = ui, server = server, options=list(port=8080));
