AS3TextEditorLite: Free version of AS3 Text Editor Component for Flash CS3
Developed by MobileWish (www.mobilewish.com)
(c) November 2007

Author: Samir K. Dash <samir@mobilewish.com>

Additional Contributors:
	Jonathan M. Woffenden <jwoffenden@gmail.com>

I haven't been keeping track of revisions until the 1.02 release, so there's not much to say up to that point.

Revision Log - 
	1.0  - (SVN Revision 1) Initial release by Samir K. Dash
	1.01 - (SVN Revision 3) Bugfixes and feature implementation by Jonathan M. Woffenden
	1.02 - (SVN Revision 4) Further feature implementation and bugfixing by Jonathan M. Woffenden.
			- Fixed out-of-bound exceptions that would be thrown by paragraph formatting controls if there was no text selected
			- Refactored formatting to be more consistent and neat
			- Refactored addChildren to be more flexible. 
			- Added configuration goodies into Config.as - a lot of it is used in addChildren().			
			- Implemented the ability to change current font without having anything selected.
			- Added keyboard shortcuts to copy and paste.
			- Synched up the font size up and size down buttons with the font size combo box so they play nicer together.
			- Reduced code size by almost 700 lines (combining redundant event listeners, replacing repeated code with functions)