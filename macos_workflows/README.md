# macOS Workflows

### Printer Folder Action
`printer_folder` is a folder action that launches a print job from the command line by using `lp` from CUPS with default options (see Default Printer in System Preferences).
- Installation: 
	1. Create a folder (default is `${HOME}/Desktop/Cartella\ Stampa`) 
	2. Set owner and permission to avoid deletion (`chmod 700 folder`)
	3. Make sure to enable privascy permission on macOS to handle Folder Actions (Catalina and higher)
