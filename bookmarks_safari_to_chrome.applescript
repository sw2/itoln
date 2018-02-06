tell application "System Events" to tell process "Google Chrome"
	tell application "Google Chrome"
		set folderNames to {}
		repeat with i from 1 to count of bookmark folders of bookmark folder "Bookmarks Bar"
			set folderItem to item i of bookmark folders of bookmark folder "Bookmarks Bar"
			set folderName to title of folderItem
			copy folderName to end of folderNames
		end repeat
		
		repeat with i from 1 to count of folderNames
			set folderName to item i of folderNames
			set folderItem to bookmark folder folderName of bookmark folder "Bookmarks Bar"
			delete folderItem
		end repeat
		
		set bookmarkNames to {}
		repeat with i from 1 to count of bookmark items of bookmark folder "Bookmarks Bar"
			set bookmarkItem to item i of bookmark items of bookmark folder "Bookmarks Bar"
			set bookmarkName to title of bookmarkItem
			copy bookmarkName to end of bookmarkNames
		end repeat
		
		repeat with i from 1 to count of bookmarkNames
			set bookmark to item i of bookmarkNames
			set bookmarkItem to bookmark item bookmark of bookmark folder "Bookmarks Bar"
			delete bookmarkItem
		end repeat
	end tell
	
	set frontmost to true
	tell menu bar item "Chrome" of menu bar 1
		click
		set menuItem to menu item "Import Bookmarks and Settings…" of menu 1
		click menuItem
	end tell
end tell