/*
This is a sample file of AS3 Text Editor Lite v1.0.0
This is a free AS3 based component for Flash CS3. For more info visit www.mobilewish.com
*/

package {
	import flash.display.MovieClip;
	import flash.text.*;
	import flash.events.*
	import fl.controls.UIScrollBar;
	import fl.controls.*;
	import com.mobilewish.as3texteditorlite.AS3TextEditorLite;



	public class TestSample extends MovieClip {


		public function TestSample() {
			

			var abc:TextField = new TextField();
			abc.width = 510;
			abc.height = 250;
			abc.x = 15;
			abc.y = 100;
			abc.htmlText='<P ALIGN="LEFT"><FONT FACE="Arial">Welcome to <B>AS3 Rich Text Editor Lite !</B></FONT></FONT></P>';
			abc.border = true;
			abc.wordWrap = true;
			abc.useRichTextClipboard = true;
			abc.multiline = true;
			abc.type = TextFieldType.INPUT;
			abc.background = true;
			abc.alwaysShowSelection = true;
			abc.backgroundColor = 0xFFFFFF;
			abc.doubleClickEnabled = true;
			abc.alwaysShowSelection = true;
			addChild(abc);


			var scroller:UIScrollBar = new UIScrollBar();
			addChild(scroller);
			scroller.x = abc.width+scroller.width;
			scroller.y = abc.y ;
			scroller.scrollTarget = abc;
			scroller.height = abc.height;


			var tt:AS3TextEditorLite = new AS3TextEditorLite();
			tt.x = 15;
			tt.y =15
			addChild(tt);
			tt.input_txt = abc;
			tt.scroller = scroller;
			abc.addEventListener(MouseEvent.MOUSE_UP, tt.handleClick);
		}

	}
}