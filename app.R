library(shiny)

doLater = function(later) {
	return(HTML(sprintf("<i>%s</i><br>",later)))
}

subTitlePanel = function(subtitle) {
	return(HTML(sprintf("<h3>%s</h3>",subtitle)))
}

titlePanel = function(title) {
	return(HTML(sprintf("<h1>%s</h1>",title)));
}

downButtonHTML = function() {
	readChar("down.svg", file.info("down.svg")$size);
}

upButtonHTML = function() {
	readChar("up.svg", file.info("up.svg")$size);
}

toggleScript = function() {
	readChar("toggle.js", file.info("toggle.js")$size);
}

collapsiblePanelButton = function(targetID) {
	return(HTML(sprintf("<button onclick=\"toggleCollapse('%s', '%s')\" id=\"%s\">%s</button>", sprintf("%scollapse",targetID), sprintf("%sbutton", targetID), sprintf("%sbutton", targetID), downButtonHTML())));
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

css = function() {
	tags$head(
		tags$style("
			.collapsible {
				display: none;
			}
			h3 {
				display: inline;
			}
			button {
				display: inline;
			}
		")
	);
}

ui = fluidPage(
	css(),
	titlePanel("INA Shiny App"),
	sidebarPanel(
		collapsiblePanel("Meta Information", 
			fluidRow(
				numericInput(inputId="nreals",label="Number of Realizations:", value=NA),
				numericInput(inputId="ntimesteps",label="Number of Timesteps:", value=NA),
				numericInput(inputId="numnodes",label="Number of nodes", value=NA)
			),
			id="metainfo"
		),
		hr(),
		collapsiblePanel("Geographic Biological Nodes",
			fluidRow(

				numericInput(inputId="numnodes",label="Number of Nodes", value=NA),
				doLater("geocoords: mat_double(n,2)"),
				doLater("distribution: RandomeographicDistribution")
				
			),
			id="geobionodes"
		),
		hr(),
		collapsiblePanel("Locations with Management Information",
			fluidRow(
				checkboxInput(inputId="readinitinfo",label="Read Initial Information Vector", value=F),
				doLater("initifon: vec_bool"),
				textInput(inputId="initinfo.norp", "Numeric or Propotional"),
				numericInput(inputId="initinfo.n", label="Number of Initial Locations", value=NA),
				numericInput(inputId="initinfo.p", label="Infection Probablility", value=NA),
				textInput(inputId="initinfo.dist", label="Distribution", value=NA)
			),
			id="infoloc"
		),

		hr(),
		collapsiblePanel("Locations with Biological Pathogen",
			fluidRow(
				checkboxInput(inputId="readinitbio",label="Read Initial Biological Vector", value=F),
				doLater("initbio: vec_bool"),
				textInput(inputId="initbio.norp", "Numeric or Propotional"),
				numericInput(inputId="initbio.n", label="Number of Initial Locations", value=NA),
				numericInput(inputId="initbio.p", label="Infection Probablility", value=NA),
				textInput(inputId="initbio.dist", label="Distribution", value=NA)
			),
			id="bioloc"
		),

		hr(),
		collapsiblePanel("Socioeconomic Adjacency Matrix",
			fluidRow(
				doLater("seam: vec_bool"),
				doLater("distribution: Distribution"),
				numericInput(inputId="numnodes", label="Number of Nodes", value=NA)
			),
			id="seam"
		),

		hr(),
		collapsiblePanel("Biophysical Adjacency Matrix",
			fluidRow(
				doLater("bpam: vec_bool"),
				doLater("distribution: Distribution"),
				numericInput(inputId="numnodes", label="Number of Nodes", value=NA)
			),
			id="bpam"
		),

		hr(),
		collapsiblePanel("Management Adoption",
			fluidRow(
				doLater("probadoptvec: vec_double"),
				doLater("distribution: Distribution"),
				numericInput(inputId="numnodes", label="Number of Nodes", value=NA)
			),
			id="manadopt"
		),

		hr(),
		collapsiblePanel("Biological Establishment Management Effect",
			fluidRow(
				doLater("probadoptvec: vec_doulbe"),
				doLater("estab.distrucution: Distribution"),
				doLater("man.distriution: Distribution"),
				selectInput(inputId="maneffdir", label="Management Effect Direction", choices=c("Increase Establishment", "Decrease Establishment"))
			),
			id="bioestabmaneff"
		),

		hr(),
		collapsiblePanel("Sciecne of Science", 
			fluidRow(
				checkboxInput(inputId="maneffthres",label="Management Effect Threshold", value=F),
				numericInput(inputId="sampeffort", label="Sampling Effort", value=NA)
			),
			id="scienceofscience"
		)
	),
	mainPanel(
		plotOutput("test")
	),

	HTML(sprintf("<script>%s</script>", sprintf(toggleScript(), downButtonHTML(), upButtonHTML())))
);

server = function(input, output) {
	output$test = renderPlot({
		hist(rnorm(25))
	});
}

shinyApp(ui = ui, server = server, options=list(port=8080));
