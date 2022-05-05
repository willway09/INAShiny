const {app, BrowserWindow} = require("electron");
const {spawn} = require("child_process");

const createWindow = () => {
	const win = new BrowserWindow({
		width: 800,
		height: 600,
		autoHideMenuBar: true
	});
	win.loadURL("http://127.0.0.1:8080");
	//win.loadFile("index.html");
}

app.whenReady().then(() => {
	const Rscript = spawn( 'Rscript', ["app.R"] );

	Rscript.stdout.on( 'data', ( data ) => {
		console.log( `stdout: ${ data }` );
	} );

	Rscript.stderr.on( 'data', ( data ) => {
		console.log( `stderr: ${ data }` );
		if(data.includes("Listening")) {
			createWindow(); //Server will be running when outputs text
		}
	} );

	Rscript.on( 'close', ( code ) => {
		console.log( `child process exited with code ${ code }` );
	} );

});
