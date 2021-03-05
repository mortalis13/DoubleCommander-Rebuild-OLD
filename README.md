# Double Commander [Rebuild]

A custom build of the file manager [**Double Commander**](http://doublecmd.sourceforge.net) **v0.9.8**. SVN revision: [**9293**](https://sourceforge.net/p/doublecmd/code/9293/tree). <br>

---

## Download

### v0.8.0 - r7623
- [Windows 32 bit](https://github.com/mortalis13/DoubleCommander-Rebuild/releases/download/r7623-v5/doublecmd-0.8.0-7623-rebuild-x32.zip) **(23.2 MB)**
- [Windows 64 bit](https://github.com/mortalis13/DoubleCommander-Rebuild/releases/download/r7623-v5/doublecmd-0.8.0-7623-rebuild-x64.zip) **(24.2 MB)**

### v0.9.8 - r9293
- [Windows 32 bit](https://github.com/mortalis13/DoubleCommander-Rebuild/releases/download/0.9.8-r9293-v3/doublecmd-0.9.8-9293-rebuild-x32.zip) **(9.99 MB)**
- [Windows 64 bit](https://github.com/mortalis13/DoubleCommander-Rebuild/releases/download/0.9.8-r9293-v3/doublecmd-0.9.8-9293-rebuild-x64.zip) **(10.7 MB)**


## Changelog

- cm_OpenDriveByIndex command to open drive by index, from 1 to 9
- cm_MaximizePanel command to extend current panel to the 100% width and hide another panel
- cm_ShellExecuteParent command to open parent folder in explorer
- cm_ChangeDirToPrevParentSibling, cm_ChangeDirToNextParentSibling commands to navigate to the prev/next directory at the same level
- cm_ChangeColumnWidth command to set selected column width to a specified value
- cm_RestoreTabs command to restore all tabs to initial positions
- cm_GoToPastTab command to switch between two recent tabs
- cm_ToggleFreeSorting command to switch to the no-sort mode in the files list (disables auto sorting on rename)
- cm_Reload internal editor command to reload the content of a file if it has been changed externally
- cm_NewInstance command to open a new instance of the app
- cm_Restart command to restart the app and restore current tabs
- cm_EditFileNames command to rename selected files editing their names with a text editor, equivalent to the Edit names button of the MultiRename window

<p></p>
<p></p>

- parameter 'SkipErrors' for the cm_Delete command to delete all files without showing errors dialog
- parameter 'UnixSeparator' for the cm_CopyFullNamesToClip, cm_CopyPathOfFilesToClip, cm_CopyPathNoSepOfFilesToClip commands to copy paths with '/' separator
- parameter 'CopyFolders' for the cm_Copy command to copy only folders structure without files
- parameter 'CopyPlainFolders' for the cm_Copy command to copy only top-level folders without files
- parameter 'OpenEditor' for the cm_EditNew command to create new file without opening it in editor
- parameter 'UseInternal' for the cm_Edit command to open a file in the internal editor

<p></p>
<p></p>

- added drive index near its label
- added aliases feature (borrowed from MultiCommander manager), short commands are saved in the text file aliases.txt and can be executed from the internal command line
- added possibility to use right arrow to enter archives
- added possibility to change color for selected item with selection
- added more info to copy/move/delete progress dialogs - current/total files/folders, current/total space
- added column type which shows files/folders count for the current folder when the Calculate all folders size is called
- added Ctrl+Backspace keys handling for the New folder dialog and Rename textbox which deletes the previous word
- added possibility to create multiple folders from a list (added textarea to the New folder dialog)
- fixed drive size line for helper views (search results, net drive, ...), keep the line to prevent panels jumping
- fixed rename for folders with '.' symbol in their names, the name should be selected completely
- changed copied filename pattern in the same folder (to a constant value 'name-%id%')
- changed the cm_QuickView command to allow to show the content of currently selected folder in another panel
- changed Ctrl+MouseWheel action to scroll filelist faster
- disabled autocomplete on folder creation
- removed '..' item in folders/archives for non empty folders
- increased tabs height
- initialized the filter with the * symbol by default
- redesigned Calculate space dialog with larger font, non-modal type and Copy button
- select files with current extension is extended to select all folders when used on a folder
- when copying folders that already exist always 'Merge All'

## Build

1. Install [Lazarus 1.8.4](https://sourceforge.net/projects/lazarus/files/Lazarus%20Windows%2064%20bits/Lazarus%201.8.4/lazarus-1.8.4-fpc-3.0.4-win64.exe/download). Install [Cross Compilation Addon](https://sourceforge.net/projects/lazarus/files/Lazarus%20Windows%2064%20bits/Lazarus%201.8.4/lazarus-1.8.4-fpc-3.0.4-cross-i386-win32-win64.exe/download).
2. In the **r.bat** modify *OS_TARGET* and *lazpath* variables.
3. Run command `r a`.

- To rebuild the code if build errors occur run `r r` or `rr`
- To build the final ready to use executable run `r p`
