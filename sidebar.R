sidebar = function() {
	sectionsData = fromJSON(file="sections.json")

	sections = list()

	idx = 1
	i = 1
	for(section in sectionsData) {
		sections[[i]] = collapsiblePanel(section$title, matrixInput(idx), section$id)
		i = i + 1

		if(idx != length(sectionsData)) {
			sections[[i]] = hr()
			i = i + 1
		}
		idx = idx + 1
	}

	print(length(sections))

	sidebarPanel(
		sections
	)
}
