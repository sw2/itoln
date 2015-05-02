tell application "System Events" to tell process "Google Chrome"
	tell application "Google Chrome"
		set bookmarks to {}
		repeat with i from 1 to count of bookmark folders of bookmark folder "Bookmarks Bar"
			set bookmark to item i of bookmark folders of bookmark folder "Bookmarks Bar"
			set bookmarkName to title of bookmark
			copy bookmarkName to end of bookmarks
		end repeat
		
		repeat with i from 1 to count of bookmarks
			set bookmark to item i of bookmarks
			set folderToDelete to bookmark folder bookmark of bookmark folder "Bookmarks Bar"
			delete folderToDelete
		end repeat
	end tell
	
	set frontmost to true
	tell menu bar item "Chrome" of menu bar 1
		click
		set menuItem to menu item "Import Bookmarks and Settings…" of menu 1
		click menuItem
	end tell
end tell