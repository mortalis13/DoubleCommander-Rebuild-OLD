
A custom build of the file manager [**Double Commander**](http://doublecmd.sourceforge.net).

The changed version is **0.8.0** on the [SVN **trunk**](https://svn.code.sf.net/p/doublecmd/code/trunk).

Current SVN revision is **7623**.

---

## Download

### v1.0.0
- [Windows 32 bit](https://github.com/mortalis13/DoubleCommander-Rebuild/releases/download/7623-1.0.0/doublecmd-0.8.0-7623-rebuild-x32.zip)
- [Windows 64 bit](https://github.com/mortalis13/DoubleCommander-Rebuild/releases/download/7623-1.0.0/doublecmd-0.8.0-7623-rebuild-x64.zip)


## Changelog

- cm_OpenDriveByIndex command to open drive by index, from 1 to 9
- cm_MaximizePanel command to extend current panel to the 100% width and hide another panel
- cm_ShellExecuteParent command to open parent folder in explorer
- cm_ChangeDirToPrevParentSibling, cm_ChangeDirToNextParentSibling commands to navigate to the prev/next directory at the same level
- cm_ChangeColumnWidth command to set selected column width to a specified value
- cm_MarkNFiles command to select N items starting from currently selected file
- cm_RestoreTabs command to restore all tabs to initial positions
- cm_GoToPastTab command to switch between two recent tabs
- cm_ToggleFreeSorting command to switch to the no-sort mode in the files list (disables auto sorting on rename)
- cm_Reload internal editor command to reload the content of a file if it has been changed externally
- cm_LoadUninstallerList command to show an uninstaller list, executing an item will call the corresponding uninstaller for the selected app
- cm_NewInstance command to open a new instance of the app
- cm_Restart command to restart the app and restore current tabs

<p>

- parameter 'skiperrors' for the cm_Delete command to delete all files without showing errors dialog
- parameter 'unixSeparator' for the cm_CopyFullNamesToClip, cm_CopyPathOfFilesToClip, cm_CopyPathNoSepOfFilesToClip commands to copy paths with '/' separator
- parameter 'folders_only' for the cm_Copy command to copy only folder without files
- parameter 'OpenEditor' for the cm_EditNew command to create new file without opening it in editor

<p>

- added drive index near its label
- added aliases feature (borrowed from MultiCommander manager), short commands are saved in the text file aliases.txt and can be executed from the internal command line
- added scroll event for tab label to switch tabs on mouse scroll
- added possibility to use right arrow to enter archives
- added possibility to change color for selected item with selection
- added more info to copy/move/delete progress dialogs - current/total files/folders, current/total space
- added highlighting of the current drive in the drives list when it's opened
- added column type which shows files/folders count for the current folder when the Calculate all folders size is called
- added Ctrl+Backspace keys handling for the New folder dialog and Rename textbox which deletes the previous word
- added possibility to create multiple folders from a list (added textarea to the New folder dialog)
- added 'apkinfo' plugin to show names of APK Android applications
- fixed viewer to keep maximized state
- fixed drive size line for helper views (search results, net drive, ...), keep the line to prevent panels jumping
- fixed rename for folders with '.' symbol in their names, the name should be selected completely
- fixed a bug when the view was scrolled after dragging a file outside the app to another window
- changed copied filename pattern in the same folder (to a constant value 'name-%id%')
- changed rename files cycling feature when pressing F2 repeatedly
- changed the cm_QuickView command to allow to show the content of currently selected folder in another panel
- disabled autocomplete on folder creation
- disabled Ctrl+MouseWheel event in the list view which changed font size
- removed '..' item in folders/archives for non empty folders
- increased tabs hight
- initialized the filter with the * symbol by default
- redesigned Calculate space dialog with larger font, non-modal type and Copy button
- click event for tree view to open folder on single click
- select files with current extension is extended to select all folders when used on a folder
