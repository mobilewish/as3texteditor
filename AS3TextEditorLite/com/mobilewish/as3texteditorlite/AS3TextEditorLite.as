/*

AS3TextEditorLite: Free version of AS3 Text Editor Component for Flash CS3
Developed by MobileWish (www.mobilewish.com)
(c) November 2007
Author: Samir K. Dash <samir@mobilewish.com>

Additional Contributors:
	Jonathan M. Woffenden <jwoffenden@gmail.com>

Notes and todos:
	
*/
package com.mobilewish.as3texteditorlite
{
	import fl.core.UIComponent;
	import flash.display.DisplayObject;
	import flash.display.Stage;
	import flash.display.Sprite;
	import flash.text.*;
	import flash.system.System;
	import fl.events.ScrollEvent;

	import fl.controls.UIScrollBar;
	import flash.ui.Keyboard;

	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import fl.controls.*;
	import fl.data.DataProvider;
	import fl.controls.ColorPicker;

	import fl.events.ColorPickerEvent;


	public class AS3TextEditorLite extends UIComponent 
	{

		private var  selectedFontColor:uint;
		private var  selectedLinkColor:uint;

		private var  HTMLtext:TextField = new TextField();
		private var  isActive:Boolean = true;
		private var  mIsRichText:Boolean = true; // JMW: Used to keep track of whether or not we're in wysiwyg mode.
		private var  beginIndex:int = 0;
		private var  endIndex:int = 0;
		private var  lastIndexTillSearched:uint;

		private var  isLinkShow:Boolean = true;


		private var  findTxt:TextInput = new TextInput();
		private var  searchString:String = new String();
		private var  initialPoint:Number = new Number();
		private var  finalpoint:Number = new Number();
		private var  clipBoard:String = new String();
		private var  clipboardFmt:TextFormat = new TextFormat();

		private var  rightIndentBut:Button = new Button();
		private var  leftIndentBut:Button = new Button();

		private var  l_button:Button = new Button();
		
		private var  charBackBut:Button = new Button();
		private var  findNextBut:Button = new Button();
		private var  replaceBut:Button = new Button();
		private var  hyperlink_button:Button = new Button();
		private var  Char1:Button = new Button();
		private var  Char2:Button = new Button();
		private var  Char3:Button = new Button();
		private var  Char4:Button = new Button();
		private var  Char5:Button = new Button();
		private var  Char6:Button = new Button();
		private var  Char7:Button = new Button();
		private var  Char8:Button = new Button();
		private var  Char9:Button = new Button();
		private var  Char10:Button = new Button();
		private var  Char11:Button = new Button();
		private var  Char12:Button = new Button();
		private var  Char13:Button = new Button();
		private var  Char14:Button = new Button();
		private var  Char15:Button = new Button();
		private var  Char16:Button = new Button();
		private var  Char17:Button = new Button();
		private var  Char18:Button = new Button();
		private var  Char19:Button = new Button();
		private var  Char20:Button = new Button();
		private var  bold_button:Button = new Button();
		private var  italic_button:Button = new Button();
		private var  underline_button:Button = new Button();
		private var  sizeUpButton:Button = new Button();
		private var  sizeDownButton:Button = new Button();


		private var  leftAlign_button:Button = new Button();
		private var  centerAlign_button:Button = new Button();
		private var  rightAlign_button:Button = new Button();
		private var  justifiedAlign_button:Button = new Button();
		private var  letterspacing_button:Button = new Button();
		private var  imgAdd_button:Button = new Button();
		private var  formatParagraphBut:Button = new Button();
		private var  paraBackBut:Button = new Button();
		private var  copy_button:Button = new Button();
		private var  cut_button:Button = new Button();
		private var  paste_button:Button = new Button();
		private var  selectall_button:Button = new Button();
		private var  removeformatting_button:Button = new Button();


		private var  linkColorPicker:ColorPicker = new ColorPicker();
		private var  addunderlineTick:CheckBox = new CheckBox();
		private var  changecolorTick:CheckBox = new CheckBox();
		private var  replaceString:String =  new String();
		private var  replaceTxt:TextInput =  new TextInput();
		private var  indStepper:NumericStepper = new NumericStepper();
		private var  lineStepper:NumericStepper = new NumericStepper();
		private var  lMarginStepper:NumericStepper = new NumericStepper();
		private var  rMarginStepper:NumericStepper = new NumericStepper();
		private var  FindBackground:Button = new Button();
		private var  font_cb:ComboBox = new ComboBox();
		private var  size_cb:ComboBox = new ComboBox();

		private var  window_cb:ComboBox = new ComboBox();
		private var  viewHTML:Button = new Button();
		private var  findLabel:TextField = new TextField();
		private var  replaceLabel:TextField = new TextField();
		private var  linkTxt:TextInput = new TextInput();
		private var  hyperlinkActive:Button = new Button();
		private var  findActive:Button = new Button();

		private var  fontColorPicker:ColorPicker = new ColorPicker();

		private var  linkLabel:TextField = new TextField();
		private var  indentLabel:TextField = new TextField();
		private var  lineLabel:TextField = new TextField();
		private var  leftindLabel:TextField = new TextField();
		private var  rightindLabel:TextField = new TextField();
		private var  specialCharBut:Button = new Button();
		private var  scrollTarget:ScrollEvent;
		private var  my_fmt:TextFormat = new TextFormat();


		private  static  var charSpaceBackBut:Button = new Button();
		private  static  var charSpacemaxStepper:NumericStepper = new NumericStepper();
		private  static  var charSpacemaxLabel:TextField = new TextField();
		private  static  var charSpaceminStepper:NumericStepper = new NumericStepper();
		private  static  var charSpaceminLabel:TextField = new TextField();

		private var icon1:MovieClip = new MovieClip();

		private var icon2:MovieClip = new MovieClip();
		private var icon3:MovieClip = new MovieClip();
		private var icon4:MovieClip = new MovieClip();
		private var icon5:MovieClip = new MovieClip();
		private var icon6:MovieClip = new MovieClip();
		private var icon7:MovieClip = new MovieClip();
		private var icon8:MovieClip = new MovieClip();
		private var icon9:MovieClip = new MovieClip();
		private var icon10:MovieClip = new MovieClip();
		private var icon11:MovieClip = new MovieClip();
		private var icon12:MovieClip = new MovieClip();
		private var icon13:MovieClip = new MovieClip();
		private var icon14:MovieClip = new MovieClip();
		private var icon15:MovieClip = new MovieClip();
		private var icon16:MovieClip = new MovieClip();
		private var icon17:MovieClip = new MovieClip();
		private var icon18:MovieClip = new MovieClip();
		private var icon19:MovieClip = new MovieClip();
		private var icon20:MovieClip = new MovieClip();
		private var icon21:MovieClip = new MovieClip();
		private var icon22:MovieClip = new MovieClip();
		private var labeltextformat:TextFormat = new TextFormat();
		
		
			
		private var imgPathTxt:TextInput =  new TextInput();
		private var imgAlignCb:ComboBox = new ComboBox();
		private var imgWidthTxt:TextInput =  new TextInput();
		private var imgHeightTxt:TextInput =  new TextInput();
		private var imgHSNs:NumericStepper = new NumericStepper();
		private var imgVSNs:NumericStepper = new NumericStepper();
		private var imgURLTxt:TextInput =  new TextInput();
		private var imgTargetCb:ComboBox = new ComboBox();
		private var imgBackBt:Button = new Button();
		private var imgBackBG:Button = new Button();
		private var imgLabel:TextField = new TextField();
		private var imgAlignLabel:TextField = new TextField();
		private var imgWidthLabel:TextField = new TextField();
		private var imgHeightLabel:TextField = new TextField();
		private var imgHSpLabel:TextField = new TextField();
		private var imgVSpLabel:TextField = new TextField();
		private var imgURLLabel:TextField = new TextField();
		private var imgTargetLabel:TextField = new TextField();

		private var imgIDTxt:TextInput = new TextInput();
		private var imgIDLabel:TextField = new TextField();
		private var incId:Number = 0;

		public var input_txt:TextField = new TextField();
		public var scroller:UIScrollBar = new UIScrollBar();
		
		private var mCurrentX:Number = 0;
		private var mCurrentY:Number = 0;


		public function AS3TextEditorLite() 
		{
			super();
		    //AddDemo();
	
			addChildren();
			SetElements();
			ShowAllRow();
			//input_txt.addEventListener(MouseEvent.MOUSE_UP, input_txtListener);
			input_txt.addEventListener(MouseEvent.MOUSE_UP, handleClick);
		}

		public function set fontSize(newSize:int):void
		{			
			var provider:DataProvider = size_cb.dataProvider;
			
			
			for(var i:int = 0; i < provider.length; i++)
			{
				var dataObj:Object = provider.getItemAt(i);
				if (dataObj.data == newSize)
				{
					size_cb.selectedIndex = i;
					var format:TextFormat = input_txt.defaultTextFormat;
					format.size = newSize;
					input_txt.defaultTextFormat = format;
					return; // No need to keep looking, we found our font size.
				}
			}
		}

		protected override function configUI():void 
		{
			super.configUI();
		}
		
		protected override function draw():void 
		{
			//Lastline
			super.draw();
		}
		public override function setSize(w:Number,h:Number):void {

		}
		//All the other methods and properties are component specific

		public function handleClick(e:Event):void {

			var initialPoint:uint = input_txt.selectionBeginIndex;

			////trace(input_txt.selectionEndIndex)
			////trace(input_txt.selectionBeginIndex)
			////trace("initialPoint: "+initialPoint)
			if ((input_txt.selectionEndIndex - input_txt.selectionBeginIndex) > 0 ) {
				////trace("selected");
				rightIndentBut.enabled = true;
				l_button.enabled = true;
				leftIndentBut.enabled = true;


			} else {
				rightIndentBut.enabled = false;
				l_button.enabled = false;
				leftIndentBut.enabled = false;

			}
		}


		private function addChildren():void 
		{
			addChild(icon1);
			addChild(icon2);
			addChild(icon3);
			addChild(icon4);
			addChild(icon5);
			addChild(icon6);
			addChild(icon7);
			addChild(icon8);
			addChild(icon9);
			addChild(icon10);
			addChild(icon11);
			addChild(icon12);
			addChild(icon13);
			addChild(icon14);
			addChild(icon15);
			addChild(icon16);
			addChild(icon17);
			addChild(icon18);
			addChild(icon19);
			addChild(icon20);
			addChild(icon21);
			addChild(icon22);

			labeltextformat.font = Config.DEFAULT_FONT;
			labeltextformat.color = Config.DEFAULT_FONT_COLOR;
			labeltextformat.size = Config.DEFAULT_FONT_SIZE;

			mCurrentY = Config.TOP_PADDING;
			
			addButton(font_cb, 272);
			addButton(size_cb, 60);
			addButton(bold_button);
			addButton(italic_button);
			addButton(underline_button);		
			
			bold_button.label = "";
			bold_button.setStyle("icon", Icon14);
			
			italic_button.label = "";
			italic_button.setStyle("icon", Icon13);
			
			underline_button.label = "";
			underline_button.setStyle("icon", Icon12);

			addButton(fontColorPicker, 24, 24);
			
			addButton(sizeUpButton);
			sizeUpButton.label="";
			sizeUpButton.setStyle("icon", Icon17);

			addButton(sizeDownButton);
			sizeDownButton.label="";
			sizeDownButton.setStyle("icon", Icon18);
			
			addButton(viewHTML, 267);
			viewHTML.label = Config.VIEW_HTML_PROMPT;

			addButton(hyperlinkActive, 125);
			hyperlinkActive.label = Config.OPEN_HYPER_LINK_PROMPT;
			hyperlinkActive.labelPlacement = ButtonLabelPlacement.RIGHT;
			hyperlinkActive.setStyle("icon", Icon22);

			addButton(findActive, 125);
			findActive.label = Config.FIND_BUTTON_PROMPT;
			findActive.labelPlacement = ButtonLabelPlacement.RIGHT;
			findActive.setStyle("icon", Icon15);
			

			addButton(leftIndentBut);
			leftIndentBut.label = "";
			leftIndentBut.enabled = false;
			leftIndentBut.setStyle("icon", Icon9);
			
			
			addButton(rightIndentBut);
			rightIndentBut.label = "";
			rightIndentBut.enabled = false;
			rightIndentBut.setStyle("icon", Icon8);

			addButton(l_button);
			l_button.label = "";
			l_button.enabled = false;
			l_button.setStyle("icon", Icon6);

			addButton(leftAlign_button);
			leftAlign_button.label = "";
			leftAlign_button.setStyle("icon", Icon1);

			addButton(centerAlign_button);
			centerAlign_button.label = "";
			centerAlign_button.setStyle("icon", Icon2);

			addButton(rightAlign_button);
			rightAlign_button.label = "";
			rightAlign_button.setStyle("icon", Icon3);

			addButton(justifiedAlign_button);
			justifiedAlign_button.label = "";
			justifiedAlign_button.setStyle("icon", Icon4);

			mCurrentX += 12.9; // I have no idea where this number came from - ask Samir :-) --JMW
			
			addButton(cut_button);
			cut_button.label = "";
			cut_button.setStyle("icon", Icon7);

			addButton(copy_button);
			copy_button.label = "";
			copy_button.setStyle("icon", Icon10);

			addButton(paste_button);
			paste_button.label = "";
			paste_button.setStyle("icon", Icon16);

			addButton(selectall_button);
			selectall_button.label = "";
			selectall_button.setStyle("icon", Icon11);

			addButton(removeformatting_button);
			removeformatting_button.label = "";
			removeformatting_button.setStyle("icon", Icon21);

			addButton(letterspacing_button);
			letterspacing_button.label = "";
			letterspacing_button.setStyle("icon", Icon19);

			addButton(imgAdd_button);
			imgAdd_button.label = "";
			imgAdd_button.setStyle("icon", Icon20);

			addButton(specialCharBut);
			specialCharBut.label = "";
			
			addButton(formatParagraphBut);
			formatParagraphBut.label = "";
			//////////////////////////////////////////////////////
			//                end of layer 1                    //
			//////////////////////////////////////////////////////

			addChild(FindBackground);
			FindBackground.x = 0;
			FindBackground.y = 52 ;
			FindBackground.width = 522;
			FindBackground.height = 30;
			FindBackground.visible = true;
			FindBackground.label = "";
			FindBackground.enabled = false;
			//////////////////////////////////////////////////////
			//                end of layer 2                    //
			//////////////////////////////////////////////////////

			mCurrentX = 6;
			mCurrentY = 56;
			addButton(findLabel, 30);
			findLabel.text = Config.FIND_BUTTON_PROMPT;
			findLabel.setTextFormat(labeltextformat);

			addButton(findTxt, 140);

			addButton(replaceLabel, 44);
			replaceLabel.text = Config.REPLACE_PROMPT;
			replaceLabel.setTextFormat(labeltextformat);

			addButton(replaceTxt, 140);

			addButton(findNextBut, 59);
			findNextBut.label = Config.FIND_NEXT_PROMPT;

			addButton(replaceBut, 59);
			replaceBut.label = Config.REPLACE_PROMPT;
			//////////////////////////////////////////////////////
			//                end of layer 3                    //
			//////////////////////////////////////////////////////

			mCurrentX = 6;
			mCurrentY = 56;

			addButton(linkLabel, 26);
			linkLabel.text = "Link";
			linkLabel.setTextFormat(labeltextformat);

			addButton(linkTxt, 131);

			addButton(window_cb, 77);

			addButton(changecolorTick, 100);
			changecolorTick.label="Change Color";
			changecolorTick.enabled = true;

			addButton(linkColorPicker, 24);

			addButton(addunderlineTick, 100);
			addunderlineTick.label="Add Underline";
			addunderlineTick.enabled = true;


			addButton(hyperlink_button, 30);
			hyperlink_button.label = "<>";
			//////////////////////////////////////////////////////
			//                end of layer 4                    //
			//////////////////////////////////////////////////////
			
			mCurrentX = 3;
			mCurrentY = 56;
			
			addButton(Char1, 22);
			Char1.label = "";
			
			addButton(Char2, 22);
			Char2.label = "";
			
			addButton(Char3, 22);
			Char3.label = "";
			
			addButton(Char4, 22);
			Char4.label = "";
			
			addButton(Char5, 22);
			Char5.label = "";
			  
			addButton(Char6, 22);
			Char6.label = "";
			
			addButton(Char7, 22);
			Char7.label = "";
			
			addButton(Char8, 22);
			Char8.label = "";
			
			addButton(Char9, 22);
			Char9.label = "";
			
			addButton(Char10, 22);
			Char10.label = "";
			
			addButton(Char11, 22);
			Char11.label = "";
			
			addButton(Char12, 22);
			Char12.label = "";
			
			addButton(Char13, 22);
			Char13.label = "";
			
			addButton(Char14, 22);
			Char14.label = "";
			
			addButton(Char15, 22);
			Char15.label = "";
			
			addButton(Char16, 22);
			Char16.label = "";
			
			addButton(Char17, 22);
			Char17.label = "";
			
			addButton(Char18, 22);
			Char18.label = "";
			  
			addButton(Char19, 22);
			Char19.label = "";
			
			addButton(Char20, 22);
			Char20.label = "";
			
			addButton(charBackBut, 39);
			charBackBut.label = "Back";
			//////////////////////////////////////////////////////
			//                end of layer 5                    //
			//////////////////////////////////////////////////////

			mCurrentX = 5;
			mCurrentY = 56;

			addButton(indentLabel, 41);
			indentLabel.text = "Indent";
			indentLabel.setTextFormat(labeltextformat);

			addButton(indStepper, 50); //X 41
			indStepper.stepSize = 1;
			indStepper.minimum = 0;
			indStepper.maximum = 1200;
			indStepper.value = 0;

			addButton(lineLabel, 70); // X 101
			lineLabel.text = "Line Spacing";
			lineLabel.setTextFormat(labeltextformat);

			addButton(lineStepper, 50); // X 166
			lineStepper.stepSize = 1;
			lineStepper.minimum = 0;
			lineStepper.maximum = 1200;
			lineStepper.value = 2;

			addButton(leftindLabel, 65); // X 225
			leftindLabel.text = "Left Margin";
			leftindLabel.setTextFormat(labeltextformat);

			addButton(lMarginStepper, 50); // X 287
			lMarginStepper.stepSize = 1;
			lMarginStepper.minimum = 0;
			lMarginStepper.maximum = 1200;
			lMarginStepper.value = 0;

			addButton(rightindLabel, 72); // X 343
			rightindLabel.text = "Right Margin";
			rightindLabel.setTextFormat(labeltextformat);

			addButton(rMarginStepper, 50); // X 414
			rMarginStepper.stepSize = 1;
			rMarginStepper.minimum = 0;
			rMarginStepper.maximum = 1200;
			rMarginStepper.value = 0;

			addButton(paraBackBut, 39); // X 475
			paraBackBut.label = "Back";
			//////////////////////////////////////////////////////
			//                end of layer 6                    //
			//////////////////////////////////////////////////////


			addChild(charSpaceminLabel);
			charSpaceminLabel.x = 5;
			charSpaceminLabel.y = 56 ;
			charSpaceminLabel.width = 150;
			
			charSpaceminLabel.height = 22;
			charSpaceminLabel.text = "Change Character Spacing";
			//charSpaceminLabel.embedFonts = true;
			//charSpaceminLabel.defaultTextFormat = labeltextformat;
			charSpaceminLabel.setTextFormat(labeltextformat);


			addChild(charSpaceminStepper);
			charSpaceminStepper.x = 150;
			charSpaceminStepper.y = 56 ;
			charSpaceminStepper.width = 50;
			charSpaceminStepper.height = 22;
			charSpaceminStepper.stepSize = 1;
			charSpaceminStepper.minimum = 0;
			charSpaceminStepper.maximum = 100;
			charSpaceminStepper.value = 0;


			addChild(charSpaceBackBut);
			charSpaceBackBut.x = 475 ;
			charSpaceBackBut.y = 56 ;
			charSpaceBackBut.width = 39;
			charSpaceBackBut.height = 22;
			charSpaceBackBut.label = "Back";

			//end of layer 7

			addChild(imgBackBG);
			imgBackBG.x = 0;
			imgBackBG.y = 0 ;
			imgBackBG.width = 522;
			imgBackBG.height = 80;
			imgBackBG.visible = true;
			imgBackBG.label = "";
			imgBackBG.enabled = false;
			
			//end of layer 8
			
			
			addChild(imgLabel);
			imgLabel.x = 5;
			imgLabel.y = 2 ;
			imgLabel.width = 104;
			imgLabel.height = 22;
			imgLabel.text = "Image";
			//imgLabel.embedFonts = true;
			//imgLabel.defaultTextFormat = labeltextformat;
			imgLabel.setTextFormat(labeltextformat);
			
			addChild(imgIDLabel);
			imgIDLabel.x = 240;
			imgIDLabel.y = 2 ;
			imgIDLabel.width = 80;
			imgIDLabel.height = 22;
			imgIDLabel.text = "ID";
			//imgIDLabel.embedFonts = true;
			//imgIDLabel.defaultTextFormat = labeltextformat;
			imgIDLabel.setTextFormat(labeltextformat);
			
			
			addChild(imgAlignLabel);
			imgAlignLabel.x = 344;
			imgAlignLabel.y = 2 ;
			imgAlignLabel.width = 104;
			imgAlignLabel.height = 22;
			imgAlignLabel.text = "Align";
			//imgAlignLabel.embedFonts = true;
			//imgAlignLabel.defaultTextFormat = labeltextformat;
			imgAlignLabel.setTextFormat(labeltextformat);
			
			
			addChild(imgWidthLabel);
			imgWidthLabel.x = 5;
			imgWidthLabel.y = 28 ;
			imgWidthLabel.width = 104;
			imgWidthLabel.height = 22;
			imgWidthLabel.text = "Width";
			//imgWidthLabel.embedFonts = true;
			//imgWidthLabel.defaultTextFormat = labeltextformat;
			imgWidthLabel.setTextFormat(labeltextformat);
			
			
			addChild(imgHeightLabel);
			imgHeightLabel.x = 138;
			imgHeightLabel.y = 28 ;
			imgHeightLabel.width = 104;
			imgHeightLabel.height = 22;
			imgHeightLabel.text = "Height";
			//imgHeightLabel.embedFonts = true;
			//imgHeightLabel.defaultTextFormat = labeltextformat;
			imgHeightLabel.setTextFormat(labeltextformat);
			
			
			addChild(imgHSpLabel);
			imgHSpLabel.x = 260;
			imgHSpLabel.y = 28 ;
			imgHSpLabel.width = 104;
			imgHSpLabel.height = 22;
			imgHSpLabel.text = "H-Space";
			//imgHSpLabel.embedFonts = true;
			//imgHSpLabel.defaultTextFormat = labeltextformat;
			imgHSpLabel.setTextFormat(labeltextformat);
			
			
			addChild(imgVSpLabel);
			imgVSpLabel.x = 378;
			imgVSpLabel.y = 28 ;
			imgVSpLabel.width = 104;
			imgVSpLabel.height = 22;
			imgVSpLabel.text = "V-Space";
			//imgVSpLabel.embedFonts = true;
			//imgVSpLabel.defaultTextFormat = labeltextformat;
			imgVSpLabel.setTextFormat(labeltextformat);
			
			
			addChild(imgURLLabel);
			imgURLLabel.x = 5;
			imgURLLabel.y = 54 ;
			imgURLLabel.width = 104;
			imgURLLabel.height = 22;
			imgURLLabel.text = "URL";
			//imgURLLabel.embedFonts = true;
			//imgURLLabel.defaultTextFormat = labeltextformat;
			imgURLLabel.setTextFormat(labeltextformat);
			
			
			addChild(imgTargetLabel);
			imgTargetLabel.x = 260;
			imgTargetLabel.y = 54 ;
			imgTargetLabel.width = 104;
			imgTargetLabel.height = 22;
			imgTargetLabel.text = "Target";
			//imgTargetLabel.embedFonts = true;
			//imgTargetLabel.defaultTextFormat = labeltextformat;
			imgTargetLabel.setTextFormat(labeltextformat);
			
			addChild(imgPathTxt);
			imgPathTxt.x = 60;
			imgPathTxt.y = 2 ;
			imgPathTxt.width = 170;
			imgPathTxt.height = 22;
				
			addChild(imgIDTxt);
			imgIDTxt.x = 260;
			imgIDTxt.y = 2 ;
			imgIDTxt.width = 80;
			imgIDTxt.height = 22;
			
			
			addChild(imgAlignCb);
			imgAlignCb.x = 379;
			imgAlignCb.y = 2 ;
			imgAlignCb.width = 113;
			imgAlignCb.height = 22;
			
			addChild(imgWidthTxt);
			imgWidthTxt.x = 58;
			imgWidthTxt.y = 28 ;
			imgWidthTxt.width = 67;
			imgWidthTxt.height = 22;
			
			addChild(imgHeightTxt);
			imgHeightTxt.x = 183;
			imgHeightTxt.y = 28 ;
			imgHeightTxt.width = 67;
			imgHeightTxt.height = 22;
			
						
			addChild(imgHSNs);
			imgHSNs.x = 308;
			imgHSNs.y = 28 ;
			imgHSNs.width = 67;
			imgHSNs.height = 22;
			imgHSNs.stepSize = 1;
			imgHSNs.minimum = 0;
			imgHSNs.maximum = 1200;
			imgHSNs.value = 0;
						
			
			addChild(imgVSNs);
			imgVSNs.x = 428;
			imgVSNs.y = 28 ;
			imgVSNs.width = 67;
			imgVSNs.height = 22;
			imgVSNs.stepSize = 1;
			imgVSNs.minimum = 0;
			imgVSNs.maximum = 1200;
			imgVSNs.value = 0;
						
			addChild(imgURLTxt);
			imgURLTxt.x = 60;
			imgURLTxt.y = 53 ;
			imgURLTxt.width = 190;
			imgURLTxt.height = 22;
			
			addChild(imgTargetCb);
			imgTargetCb.x = 301;
			imgTargetCb.y = 53 ;
			imgTargetCb.width = 110;
			imgTargetCb.height = 22;

			addChild(imgBackBt);
			imgBackBt.x = 420 ;
			imgBackBt.y = 53 ;
			imgBackBt.width = 75;
			imgBackBt.height = 22;
			imgBackBt.label = "Insert Image";
			//end of layer 9
		}
		
		private function addButton(theButton:DisplayObject, bWidth:Number = Config.BUTTON_WIDTH, bHeight:Number = Config.BUTTON_HEIGHT):void
		{
			addChild(theButton);
			theButton.height = bHeight;
			theButton.width = bWidth;
			
			theButton.x = mCurrentX;
			theButton.y = mCurrentY;
			
			mCurrentX += (bWidth + Config.HORIZONTAL_PADDING);
			if (mCurrentX >= Config.ROW_MAX_WIDTH)
			{
				mCurrentY += bHeight + Config.ROW_PADDING;
				mCurrentX = 0;
			}
		}
		
		private function HideAllRow():void 
		{
			Hide1stRow();
			Hide2ndRow();
			Hide3rdRow();
			imgBackBG.visible = true;
		}
		
		
		private function ShowAllRow():void 
		{
			Show1stRow();
			Show2ndRow();
			Show3rdRow();
			imgBackBG.visible = false;
			HideimgTab();
			
		}
		
		private function Hide1stRow():void 
		{
			
			font_cb.visible = false;
			size_cb.visible = false;
			bold_button.visible = false;
			italic_button.visible = false;
			underline_button.visible = false;
			fontColorPicker.visible = false;
			sizeUpButton.visible = false;
			sizeDownButton.visible = false;
		}
	
		private function Show1stRow():void 
		{
			font_cb.visible = true;
			size_cb.visible = true;
			bold_button.visible = true;
			italic_button.visible = true;
			underline_button.visible = true;
			fontColorPicker.visible = true;
			sizeUpButton.visible = true;
			sizeDownButton.visible = true;		
		}
		
		private function Hide2ndRow():void 
		{
			//style_cb.visible = false;
			viewHTML.visible = false;
			hyperlinkActive.visible = false;
			findActive.visible = false;
			
		}
		private function Show2ndRow():void 
		{
			//style_cb.visible = true;
			viewHTML.visible = true;
			hyperlinkActive.visible = true;
			findActive.visible = true;
		}
		
		private function ShowimgTab():void 
		{
			imgPathTxt.visible = true;
			imgIDTxt.visible = true;
			imgAlignCb.visible = true;
			imgWidthTxt.visible = true;
			imgHeightTxt.visible = true;
			imgHSNs.visible = true;
			imgVSNs.visible = true;
			imgURLTxt.visible = true;
			imgTargetCb.visible = true;
			imgBackBt.visible = true;
			imgLabel.visible = true;
			imgIDLabel.visible = true;
			imgAlignLabel.visible = true;
			imgWidthLabel.visible = true;
			imgHeightLabel.visible = true;
			imgHSpLabel.visible = true;
			imgVSpLabel.visible = true;
			imgURLLabel.visible = true;
			imgTargetLabel.visible = true;
			imgBackBG.visible = true;
		
		}
		
		
		private function HideimgTab():void {
			imgPathTxt.visible = false;
			imgIDTxt.visible = false;
			imgAlignCb.visible = false;
			imgWidthTxt.visible = false;
			imgHeightTxt.visible = false;
			imgHSNs.visible = false;
			imgVSNs.visible = false;
			imgURLTxt.visible = false;
			imgTargetCb.visible = false;
			imgBackBt.visible = false;
			imgLabel.visible = false;
			imgIDLabel.visible = false;
			imgAlignLabel.visible = false;
			imgWidthLabel.visible = false;
			imgHeightLabel.visible = false;
			imgHSpLabel.visible = false;
			imgVSpLabel.visible = false;
			imgURLLabel.visible = false;
			imgTargetLabel.visible = false;
			imgBackBG.visible = false;
		}

		private function Hide3rdRow():void {
			leftIndentBut.visible = false;
			rightIndentBut.visible= false;
			l_button.visible= false;
			leftAlign_button.visible= false;
			centerAlign_button.visible= false;
			rightAlign_button.visible= false;
			justifiedAlign_button.visible= false;
			cut_button.visible= false;
			copy_button.visible= false;
			paste_button.visible= false;
			removeformatting_button.visible= false;
			selectall_button.visible= false;
			letterspacing_button.visible= false;
			imgAdd_button.visible= false;
			specialCharBut.visible= false;
			formatParagraphBut.visible= false;
		}

		private function Show3rdRow():void {

			leftIndentBut.visible = true;
			rightIndentBut.visible= true;
			l_button.visible= true;
			leftAlign_button.visible= true;
			centerAlign_button.visible= true;
			rightAlign_button.visible= true;
			justifiedAlign_button.visible= true;
			cut_button.visible= true;
			copy_button.visible= true;
			paste_button.visible= true;
			removeformatting_button.visible= true;
			selectall_button.visible= true;
			letterspacing_button.visible= true;
			imgAdd_button.visible= true;
			specialCharBut.visible= true;
			formatParagraphBut.visible= true;


		}

		private function SetElements():void {

			searchString = findTxt.text;
			replaceString = replaceTxt.text;

			hideChartab();
			hideCharSpacetab();
			SetTextField();
			PopulateDropdown();
			openFindTab();
			hideLinkElements();
			hideParagraphtab();
			EnableListeners();
		}
		
		private function showCharSpacetab():void 
		{
			charSpaceBackBut.visible = true;
			charSpacemaxStepper.visible =  true;
			charSpacemaxLabel.visible =  true;
			charSpaceminStepper.visible =  true;
			charSpaceminLabel.visible =  true;
			Hide3rdRow();
			FindBackground.visible = true;
		}
		
		private function hideCharSpacetab():void
		{
			charSpaceBackBut.visible = false;
			charSpacemaxStepper.visible = false;
			charSpacemaxLabel.visible = false;
			charSpaceminStepper.visible = false;
			charSpaceminLabel.visible = false;
			Show3rdRow();
			FindBackground.visible = false;
		}


		private function hideChartab():void 
		{
			Char1.visible = false;
			Char2.visible = false;
			Char3.visible = false;
			Char4.visible = false;
			Char5.visible = false;
			Char6.visible = false;
			Char7.visible = false;
			Char8.visible = false;
			Char9.visible = false;
			Char10.visible = false;
			Char11.visible = false;
			Char12.visible = false;
			Char13.visible = false;
			Char14.visible = false;
			Char15.visible = false;
			Char16.visible = false;
			Char17.visible = false;
			Char18.visible = false;
			Char19.visible = false;
			Char20.visible = false;
			charBackBut.visible = false;
			FindBackground.visible = false;
		}
		
		private function showChartab():void 
		{
			Hide3rdRow();
			Char1.visible = true;
			Char2.visible = true;
			Char3.visible = true;
			Char4.visible = true;
			Char5.visible = true;
			Char6.visible = true;
			Char7.visible = true;
			Char8.visible = true;
			Char9.visible = true;
			Char10.visible = true;
			Char11.visible = true;
			Char12.visible = true;
			Char13.visible = true;
			Char14.visible = true;
			Char15.visible = true;
			Char16.visible = true;
			Char17.visible = true;
			Char18.visible = true;
			Char19.visible = true;
			Char20.visible = true;
			charBackBut.visible = true;
			FindBackground.visible = true;
		}
		
		private function SetTextField():void 
		{

			/* set the text field parameters so that the text field has a border, 
			   word wrap and multiline enabled, and set it to an input text field so users can modify the text. */
			/*input_txt.border = true;
			input_txt.wordWrap = true;
			input_txt.useRichTextClipboard = true;
			input_txt.multiline = true;
			input_txt.type = TextFieldType.INPUT;
			input_txt.background = true;
			input_txt.alwaysShowSelection = true;
			input_txt.backgroundColor = 0xFFFFFF;
			input_txt.doubleClickEnabled = true;*/
			// enter some fake text into the input_txt text field on the Stage. 
			//input_txt.htmlText='Enter your text here.';
		}
		
		private function PopulateDropdown():void 
		{
			// populate the instances on the Stage.
			font_cb.labelField = "fontName";
			font_cb.dropdown.iconField = null;
			font_cb.dataProvider = new DataProvider(Font.enumerateFonts(true).sortOn("fontName"));

			// add a few standard font sizes to the size_cb ComboBox instance.
			size_cb.dataProvider = new DataProvider([8, 10, 12, 14, 16, 20, 24, 32, 36, 48, 64, 96]);


			window_cb.dropdown.iconField = null;
			window_cb.dataProvider = new DataProvider(["_blank", "_self","_parent"]);
			
			
			
			imgAlignCb.dropdown.iconField = null;
			imgAlignCb.dataProvider = new DataProvider(["left", "right"]);
			
			
			imgTargetCb.dropdown.iconField = null;
			imgTargetCb.dataProvider = new DataProvider(["_blank", "_self","_parent"]);
		}
		
		private function changeFindButtonToggle():void 
		{
			if (isActive == true) {

				isActive = false;
				findActive.label = "Close Find Tab";
				findActive.labelPlacement = ButtonLabelPlacement.RIGHT;
				findActive.setStyle("icon", Icon15);
				hyperlinkActive.enabled = false;
				viewHTML.enabled = false;
			}
			else
			{
				isActive = true;
				findActive.label = "Open Find Tab";
				hyperlinkActive.enabled = true;
				viewHTML.enabled = true;
				findActive.labelPlacement = ButtonLabelPlacement.RIGHT;
				findActive.setStyle("icon", Icon15);
			}
		}

		private function displayFindtab():void {

			if (isActive == true) {

				openFindTab();
				Show3rdRow();

			} else {

				closeFindTab();

				Hide3rdRow();
			}
		}

		private function openFindTab():void {

			findNextBut.visible = false;
			replaceBut.visible = false;
			findTxt.visible = false;
			replaceTxt.visible = false;
			FindBackground.visible = false;
			findLabel.visible = false;
			replaceLabel.visible = false;


		}

		private function closeFindTab():void {

			lastIndexTillSearched = 0;
			replaceBut.enabled = false;

			findNextBut.visible = true;
			replaceBut.visible = true;
			findTxt.visible = true;
			replaceTxt.visible = true;
			FindBackground.visible = true;
			//trace(FindBackground.x)
			findLabel.visible = true;
			replaceLabel.visible = true;


		}

		private function displayLinkElements():void {
			Hide3rdRow();
			FindBackground.visible = true;
			linkTxt.visible = true;
			linkLabel.visible = true;
			window_cb.visible = true;
			hyperlink_button.visible = true;
			changecolorTick.visible = true;
			addunderlineTick.visible = true;
			linkColorPicker.visible = true;


		}


		private function hideLinkElements():void {
			Show3rdRow();
			FindBackground.visible = false;
			linkTxt.visible = false;
			linkLabel.visible = false;
			window_cb.visible = false;
			hyperlink_button.visible = false;
			changecolorTick.visible = false;
			addunderlineTick.visible = false;
			linkColorPicker.visible = false;
		}

		private function toggleLinkButton():void 
		{
			if (hyperlinkActive.label == Config.CLOSE_HYPER_LINK_PROMPT)
				hyperlinkActive.label = Config.OPEN_HYPER_LINK_PROMPT;
			else
				hyperlinkActive.label = Config.CLOSE_HYPER_LINK_PROMPT;
		}

		private function colorHTML():void {
			var searchString1:String;
			var searchString2:String;
			var lastIndexTillSearched:int = 0;
			initialPoint = 0;
			finalpoint = 0;
			var textLength:uint = input_txt.text.length;

			var i:int = 0;
			searchString1 = "<";
			searchString2 = ">";
			//trace(input_txt.text);

			var colorformat:TextFormat = new TextFormat();
			colorformat.font = "Verdana";
			colorformat.color = 0xff0000;
			colorformat.size = 10;
			colorformat.underline = false;


			do 
			{
				initialPoint = input_txt.text.indexOf(searchString1, lastIndexTillSearched);
				finalpoint = input_txt.text.indexOf(searchString2, lastIndexTillSearched)+1;

				lastIndexTillSearched = finalpoint;
				//trace(initialPoint +"  "+finalpoint+" /"+textLength);

				i = initialPoint;
				//trace("i= "+i);
				if (initialPoint > -1) {
					input_txt.setTextFormat(colorformat, initialPoint, finalpoint);
				}
			} while (i >= 0 && i < textLength );
			
			
			initialPoint = input_txt.text.indexOf(searchString1, lastIndexTillSearched);
			finalpoint = input_txt.text.indexOf(searchString2, lastIndexTillSearched);
			lastIndexTillSearched = finalpoint;
			//trace(finalpoint);
		}

		private function hideParagraphtab():void {
			indStepper.visible = false;
			lineStepper.visible = false;
			lMarginStepper.visible = false;
			rMarginStepper.visible = false;
			paraBackBut.visible = false;
			indentLabel.visible = false;
			lineLabel.visible = false;
			leftindLabel.visible = false;
			rightindLabel.visible = false;
			if (FindBackground.visible == true) {
				FindBackground.visible = false;
				Show3rdRow();
			}
		}
		
		private function showParagraphtab():void {

			indStepper.value = 0;
			lineStepper.value = 2;
			lMarginStepper.value = 0;
			rMarginStepper.value = 0;


			indStepper.visible = true;
			lineStepper.visible = true;
			lMarginStepper.visible = true;
			rMarginStepper.visible = true;
			paraBackBut.visible = true;
			indentLabel.visible = true;
			lineLabel.visible = true;
			leftindLabel.visible = true;
			rightindLabel.visible = true;
			FindBackground.visible = true;
			Hide3rdRow();
		}

		public function EnableListeners():void 
		{
			findActive.addEventListener(MouseEvent.CLICK, findWindowActivatorListener);
			hyperlinkActive.addEventListener(MouseEvent.CLICK, hyperlinkListener);

			addunderlineTick.addEventListener(MouseEvent.CLICK, addunderlineTickHandler);
			changecolorTick.addEventListener(MouseEvent.CLICK, changecolorTickHandler);
			linkColorPicker.addEventListener(ColorPickerEvent.CHANGE, linkColorPickerChangeHandler);

			font_cb.addEventListener(Event.CHANGE, controlChangeListener);
			size_cb.addEventListener(Event.CHANGE, controlChangeListener);

			bold_button.addEventListener(MouseEvent.CLICK, buttonClickListener);
			underline_button.addEventListener(MouseEvent.CLICK, buttonClickListener);
			hyperlink_button.addEventListener(MouseEvent.CLICK, hyperbuttonClickListener);

			italic_button.addEventListener(MouseEvent.CLICK, buttonClickListener);
			sizeUpButton.addEventListener(MouseEvent.CLICK, buttonClickListener);
			sizeDownButton.addEventListener(MouseEvent.CLICK, buttonClickListener);
			l_button.addEventListener(MouseEvent.CLICK,  buttonClickListener);
			leftIndentBut.addEventListener(MouseEvent.CLICK,  buttonClickListener);
			rightIndentBut.addEventListener(MouseEvent.CLICK,  buttonClickListener);
			leftAlign_button.addEventListener(MouseEvent.CLICK,  buttonClickListener);
			centerAlign_button.addEventListener(MouseEvent.CLICK,  buttonClickListener);
			rightAlign_button.addEventListener(MouseEvent.CLICK,  buttonClickListener);
			justifiedAlign_button.addEventListener(MouseEvent.CLICK,  buttonClickListener);

			imgAdd_button.addEventListener(MouseEvent.CLICK,  imgAdd_buttonListener);
			fontColorPicker.addEventListener(ColorPickerEvent.CHANGE, colorPickerChangeHandler);
			replaceTxt.addEventListener(Event.CHANGE, updateReplaceTxt);
			replaceBut.addEventListener(MouseEvent.CLICK, replaceListener);
			specialCharBut.addEventListener(MouseEvent.CLICK,  specialCharButListener);
			charBackBut.addEventListener(MouseEvent.CLICK,  charBackButListener);
			viewHTML.addEventListener(MouseEvent.CLICK, viewHTMLListener);
			findTxt.addEventListener(Event.CHANGE, updateFindTxt);
			findNextBut.addEventListener(MouseEvent.CLICK, findNextListener);

			Char1.addEventListener(MouseEvent.CLICK, insertChar);
			Char2.addEventListener(MouseEvent.CLICK, insertChar);
			Char3.addEventListener(MouseEvent.CLICK, insertChar);
			Char4.addEventListener(MouseEvent.CLICK, insertChar);
			Char5.addEventListener(MouseEvent.CLICK, insertChar);
			Char6.addEventListener(MouseEvent.CLICK, insertChar);
			Char7.addEventListener(MouseEvent.CLICK, insertChar);
			Char8.addEventListener(MouseEvent.CLICK, insertChar);
			Char9.addEventListener(MouseEvent.CLICK, insertChar);
			Char10.addEventListener(MouseEvent.CLICK, insertChar);
			Char11.addEventListener(MouseEvent.CLICK, insertChar);
			Char12.addEventListener(MouseEvent.CLICK, insertChar);
			Char13.addEventListener(MouseEvent.CLICK, insertChar);
			Char14.addEventListener(MouseEvent.CLICK, insertChar);
			Char15.addEventListener(MouseEvent.CLICK, insertChar);
			Char16.addEventListener(MouseEvent.CLICK, insertChar);
			Char17.addEventListener(MouseEvent.CLICK, insertChar);
			Char18.addEventListener(MouseEvent.CLICK, insertChar);
			Char19.addEventListener(MouseEvent.CLICK, insertChar);
			Char20.addEventListener(MouseEvent.CLICK, insertChar);

			indStepper.addEventListener(Event.CHANGE, controlChangeListener);
			lineStepper.addEventListener(Event.CHANGE, controlChangeListener);
			lMarginStepper.addEventListener(Event.CHANGE, controlChangeListener);
			rMarginStepper.addEventListener(Event.CHANGE, controlChangeListener);

			formatParagraphBut.addEventListener(MouseEvent.CLICK, formatParagraphListener);
			paraBackBut.addEventListener(MouseEvent.CLICK, paraBackButListener );

			copy_button.addEventListener(MouseEvent.CLICK, copytoClipboard);
			cut_button.addEventListener(MouseEvent.CLICK, cuttoClipboard);
			paste_button.addEventListener(MouseEvent.CLICK, pastefromClipboard);
			selectall_button.addEventListener(MouseEvent.CLICK, selectAllListener);
			removeformatting_button.addEventListener(MouseEvent.CLICK, removeFormatListener);

			charSpaceminStepper.addEventListener(MouseEvent.CLICK, charSpaceminStepperListener);
			//charSpacemaxStepper.addEventListener(MouseEvent.CLICK, charSpacemaxStepperListener);
			charSpaceBackBut.addEventListener(MouseEvent.CLICK, charSpaceBackButListener);
			letterspacing_button.addEventListener(MouseEvent.CLICK,  letterspacing_buttonListener);
			imgBackBt.addEventListener(MouseEvent.CLICK,  imgBackBtListener);
			
			addEventListener(KeyboardEvent.KEY_UP, keyUp);
			addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
		}

		private function keyUp(k:KeyboardEvent):void
		{
			//?????
		}

		private function keyDown(k:KeyboardEvent):void
		{
			if (k.ctrlKey)
			{
				switch(k.keyCode)
				{
					case Keyboard.C:
						copytoClipboard(k);
					break;
					case Keyboard.X:
						cuttoClipboard(k);
					break;
					case Keyboard.V:
						pastefromClipboard(k);
					break;
					case Keyboard.B:
						applyStyle(bold_button);
					break;
				}
			}
		}

		//Listener Functions

		private function imgBackBtListener(e:Event):void {
			ShowAllRow();
			
			//var imageCode:String = "<img src = 'abc.jpg' id='abcd' >";
			if(imgIDTxt.text == "")
			{
				incId = incId+1;
				imgIDTxt.text = "default_id"+incId;
				
			}
			
			if(imgPathTxt.text != "")
			{
				
				input_txt.replaceText (input_txt.selectionBeginIndex, input_txt.selectionEndIndex, '!##'); 
				
				HTMLtext.text = input_txt.htmlText;
				initialPoint = HTMLtext.text.indexOf("!##", 0);
				finalpoint = initialPoint+3;
				if(imgURLTxt == null)
				{
					HTMLtext.replaceText (initialPoint, finalpoint,  "<img src = '"+imgPathTxt.text+"' id='"+imgIDTxt.text+"' align='"+imgAlignCb.value+"' hspace = '"+imgHSNs.value+"' vspace='"+imgVSNs.value+"' width='"+imgWidthTxt.text+"' height='"+imgHeightTxt.text+"'  >");
				}
				else
				{
					HTMLtext.replaceText (initialPoint, finalpoint,  "<a href='"+imgURLTxt.text+"' target='"+imgTargetCb.value+"' ><img src = '"+imgPathTxt.text+"' id='"+imgIDTxt.text+"' align='"+imgAlignCb.value+"' hspace = '"+imgHSNs.value+"' vspace='"+imgVSNs.value+"' width='"+imgWidthTxt.text+"' height='"+imgHeightTxt.text+"'  ></a>");
				}

				input_txt.htmlText =  HTMLtext.text;
			}
		}
		
		private function imgAdd_buttonListener(e:Event):void 
		{
			imgIDTxt.text = "";
			HideAllRow();
			ShowimgTab();
			
		}
		

		private function letterspacing_buttonListener(e:Event):void 
		{
			showCharSpacetab();
		}
		private function charSpaceBackButListener(e:Event):void 
		{
			hideCharSpacetab();
		}
		
		/*private function charSpacemaxStepperListener(e:Event):void {

   				trace(charSpaceminStepper.value+"_____________________________")
			
				var my_fmt:TextFormat = input_txt.getTextFormat(input_txt.selectionBeginIndex, input_txt.selectionEndIndex);

				my_fmt.letterSpacing =  e.target.value;
				input_txt.setTextFormat(my_fmt, input_txt.selectionBeginIndex, input_txt.selectionEndIndex);
				scroller.scrollTarget = input_txt;

			
		}*/
		private function charSpaceminStepperListener(e:Event):void 
		{
				var my_fmt:TextFormat = input_txt.getTextFormat(input_txt.selectionBeginIndex, input_txt.selectionEndIndex);

				my_fmt.letterSpacing =  charSpaceminStepper.value;
				
				input_txt.setTextFormat(my_fmt, input_txt.selectionBeginIndex, input_txt.selectionEndIndex);
				scroller.scrollTarget = input_txt;
		}
		
		private function removeFormatListener(e:Event):void {
			//trace("clear");
			var clear_fmt:TextFormat = new TextFormat ();
			clear_fmt.font = "Tahoma";
			clear_fmt.color = 0x000000;
			clear_fmt.size = 11;
			clear_fmt.underline = false;
			clear_fmt.align = "left";
			clear_fmt.blockIndent=0;
			clear_fmt.bold = false;
			clear_fmt.italic = false;
			clear_fmt.bullet = false;
			clear_fmt.indent = 0;
			clear_fmt.kerning = 0;
			clear_fmt.leading = 2;
			clear_fmt.leftMargin=0;
			clear_fmt.rightMargin=0;

			//var selectedText:String = input_txt.text.substring(input_txt.selectionBeginIndex, input_txt.selectionEndIndex);
			//input_txt.replaceText (input_txt.selectionBeginIndex,input_txt.selectionEndIndex,selectedText);
			input_txt.setTextFormat(clear_fmt, input_txt.selectionBeginIndex, input_txt.selectionEndIndex);

		}

		private function selectAllListener(e:Event):void {

			initialPoint = 0;
			finalpoint = input_txt.text.length;
			input_txt.setSelection(initialPoint,finalpoint);
		}

		private function pastefromClipboard(e:Event):void 
		{
			input_txt.replaceSelectedText(clipBoard);
			
			finalpoint = initialPoint + clipBoard.length;
			scroller.scrollTarget = input_txt;
		}
		
		private function cuttoClipboard(e:Event):void {
			input_txt.useRichTextClipboard = true;
			clipboardFmt = input_txt.getTextFormat(input_txt.selectionBeginIndex, input_txt.selectionEndIndex);
			clipBoard = input_txt.text.substring(input_txt.selectionBeginIndex, input_txt.selectionEndIndex);
			System.setClipboard(clipBoard);
			//trace(":::::   "+clipBoard);
			input_txt.replaceText(input_txt.selectionBeginIndex,input_txt.selectionEndIndex,"");
		}

		private function copytoClipboard(e:Event):void {
			input_txt.useRichTextClipboard = true;
			clipboardFmt = input_txt.getTextFormat(input_txt.selectionBeginIndex, input_txt.selectionEndIndex);
			clipBoard = input_txt.text.substring(input_txt.selectionBeginIndex, input_txt.selectionEndIndex);
			System.setClipboard(clipBoard);
			//trace(":::::   "+clipBoard);
		}
		
		///////////////
		private function formatParagraphListener(e:Event):void {

			showParagraphtab();

			viewHTML.enabled = false;
			findActive.enabled = false;
			hyperlinkActive.enabled = false;

		}
		private function paraBackButListener(e:Event):void {

			hideParagraphtab();
			viewHTML.enabled = true;
			findActive.enabled = true;
			hyperlinkActive.enabled = true;
		}

		private function insertChar(e:Event):void {

			var charTxt:String = e.target.label;
			input_txt.replaceText(input_txt.selectionBeginIndex,input_txt.selectionEndIndex,charTxt);


		}

		private function input_txtListener(e:Event):void {
			//trace("mouse up");

			//var p:DisplayObject = input_txt.getImageReference ("abc");
			//var q:DisplayObject;

			//q = p;
			////trace(p.width);
			////trace(p.x+" / mouse X "+ input_txt.mouseX );
			////trace(p.y);
			////trace(p.name);
			////trace(p.loaderInfo);
			////trace( hitTestObject(p));




			//imgLoader.source = q;

			////trace("caretIndex ="+input_txt.caretIndex);
			/* 
			
			to update colored areas of input text field in HTML code view on any changes made 
			 if (viewHTML.label == "Rich Text"){
			  
			  colorHTML();
			  
			  }*/
			var initialPoint:uint = input_txt.selectionBeginIndex;

			////trace(input_txt.selectionEndIndex)
			////trace(input_txt.selectionBeginIndex)
			//trace("initialPoint: "+initialPoint)
			if ((input_txt.selectionEndIndex - input_txt.selectionBeginIndex) > 0 ) {
				////trace("selected");
				rightIndentBut.enabled = true;
				l_button.enabled = true;
				leftIndentBut.enabled = true;
		
			} else {
				rightIndentBut.enabled = false;
				l_button.enabled = false;
				leftIndentBut.enabled = false;
			}
		}

		private function findNextListener(e:Event):void {
			//trace(searchString);
			var selectLength:Number = searchString.length;
			initialPoint = input_txt.text.indexOf(searchString, lastIndexTillSearched);
			//trace(initialPoint);
			finalpoint= initialPoint+ selectLength;

			if (initialPoint > -1) {
				replaceBut.enabled  = true;
				input_txt.setSelection(initialPoint,finalpoint);
				lastIndexTillSearched = finalpoint;
			}
		}

		private function updateFindTxt(e:Event):void 
		{
			searchString = findTxt.text;
		}


		private function updateReplaceTxt(e:Event):void 
		{
			replaceString = replaceTxt.text;
		}
		
		private function replaceListener(e:Event):void {

			if (initialPoint > -1) {
				input_txt.replaceText(initialPoint,finalpoint, replaceString);
				var selectLength:Number = replaceString.length;
				finalpoint = initialPoint+selectLength;
				input_txt.setSelection(initialPoint,finalpoint);
				lastIndexTillSearched = finalpoint;

			}
			replaceBut.enabled = false;
		}

		private function findWindowActivatorListener(e:Event):void {

			changeFindButtonToggle();

			displayFindtab();
		}
		
		private function changecolorTickHandler(event:MouseEvent):void 
		{
			if ( changecolorTick.selected == true ) {
				linkColorPicker.enabled = true;
			} else {
				linkColorPicker.enabled = false;
			}
		}

		//TODO!
		private function addunderlineTickHandler(event:MouseEvent):void {
			//
		}

		private function linkColorPickerChangeHandler(event:ColorPickerEvent):void 
		{
			selectedLinkColor = event.color;//event.target.hexValue;
		}
		
		private function hyperlinkListener(e:Event):void 
		{
			if (isLinkShow == true) {

				displayLinkElements();
				isLinkShow = false;

				findActive.enabled = false;
				viewHTML.enabled = false;

			} else if (isLinkShow == false) {

				isLinkShow = true;
				findActive.enabled = true;
				viewHTML.enabled = true;
				hideLinkElements();

			}
			toggleLinkButton();
		}

		private function controlChangeListener(event:Event):void 
		{
			// if (viewHTML.enabled == true)  --JMW: I changed this from the commented line to the line below.
			// I wasn't quite sure what the original intent was, but I assume it was testing whether we're in HTML editing mode or rich editing mode.
			if (this.mIsRichText == true)
			{
				if (input_txt.selectionBeginIndex == input_txt.selectionEndIndex)
				{
					stage.focus = input_txt;
					var defaultFormat:TextFormat = input_txt.defaultTextFormat;
					switch(event.currentTarget)
					{
						case font_cb :
							// if it's the font combo box and nothing is selected, change the default
							defaultFormat.font = ComboBox(event.currentTarget).selectedItem.fontName;
						break;
						case size_cb :
							defaultFormat.size = ComboBox(event.currentTarget).selectedLabel;
						break;
						case rMarginStepper:
							defaultFormat.rightMargin = rMarginStepper.value;
						break;
						case rMarginStepper:
							defaultFormat.leftMargin = lMarginStepper.value;
						break;
						
						case indStepper:
							defaultFormat.indent = indStepper.value;
						break;
						case lineStepper:
							defaultFormat.leading = lineStepper.value;
						break;
					}
					input_txt.defaultTextFormat = defaultFormat;
				}
				else
					applyStyle(event.currentTarget);
			}
		}

		private function buttonClickListener(event:MouseEvent):void {

			if (viewHTML.enabled == true) {
				if (input_txt.selectionBeginIndex == input_txt.selectionEndIndex)
				{
					stage.focus = input_txt;
					var defaultFormat:TextFormat = input_txt.defaultTextFormat;
					switch(event.currentTarget)
					{
						case bold_button :
							// if the bold_btn Button instance is clicked, toggle the bold property.
							defaultFormat.bold = !defaultFormat.bold;
							break;
						case underline_button :
							// if the underline_button Button instance is clicked, toggle the underline property.
							defaultFormat.underline = !defaultFormat.underline;
							break;
						case italic_button :
							defaultFormat.italic = !defaultFormat.italic;
							break;
						case sizeUpButton:
							var fontSizes:DataProvider = size_cb.dataProvider;
							var currentInd:Number = 0;
							
							for (var i:int = 0; i < fontSizes.length - 1; i++) // The -1 in this case is because we can't get any bigger than our last element. --JMW
							{
								if (fontSizes.getItemAt(i).data == defaultFormat.size)
									{
									var newSize:Object = fontSizes.getItemAt(i+1);
									defaultFormat.size = newSize.data;
									size_cb.selectedIndex = i + 1;
									break;
								}
							}
						break;
						case sizeDownButton:
							var fontSizes:DataProvider = size_cb.dataProvider;
							var currentInd:Number = 0;
							
							for (var i:int = 1; i < fontSizes.length; i++) // The 1 in this case is because we can't get any smaller than our first element --JMW
							{
								if (fontSizes.getItemAt(i).data == defaultFormat.size)
								{
									var newSize:Object = fontSizes.getItemAt(i - 1);
									defaultFormat.size = newSize.data;
									size_cb.selectedIndex = i - 1;
									break;
								}
							}							
						break;
					}
					input_txt.defaultTextFormat = defaultFormat;
				}
				else
					applyStyle(event.currentTarget);
			}
		}
		
		private function hyperbuttonClickListener(event:MouseEvent):void 
		{
			applyStyle(event.currentTarget);
		}
		
		private function colorPickerChangeHandler(event:ColorPickerEvent):void {

			selectedFontColor = event.color;//event.target.hexValue;
			//trace("color changed:", event.color, "(#" + event.target.hexValue + ")");

			// //trace(selectedFontColor);
			if (viewHTML.enabled == true) {
				if (input_txt.selectionBeginIndex == input_txt.selectionEndIndex)
				{
					var defaultFormat:TextFormat = input_txt.defaultTextFormat;
					defaultFormat.color = event.color;
					input_txt.defaultTextFormat = defaultFormat;
				}
				applyStyle(event.currentTarget);
			}
		}

		private function specialCharButListener(e:Event):void 
		{
			showChartab();
			hyperlinkActive.enabled = false ;
			findActive.enabled = false ;
			viewHTML.enabled = false ;

		}

		private function charBackButListener(e:Event):void 
		{
			hideChartab();
			Show3rdRow();

			hyperlinkActive.enabled = true ;
			findActive.enabled = true ;
			viewHTML.enabled = true ;

		}

		public function applyStyle(theObject:*):void 
		{
			if ((input_txt.selectionBeginIndex == 0) && (input_txt.selectionEndIndex == 0)) 
				return;
			
			if (input_txt.selectionBeginIndex == input_txt.selectionEndIndex)
				return;
			
			var my_fmt:TextFormat = input_txt.getTextFormat(input_txt.selectionBeginIndex, input_txt.selectionEndIndex);
			// because the majority of the code in this function is the same, 
			// rather than rewrite the code for each instance, we'll perform a "switch" 
			// on the name of the target component and simply change the one paramter in the format.
			switch (theObject) 
			{
				case font_cb :
					// if the font_cb ComboBox instance is changed, set the font to the currently selected item in the ComboBox.
					my_fmt.font = ComboBox(theObject).selectedItem.fontName;
				break;
				case size_cb :
					my_fmt.size = ComboBox(theObject).selectedLabel;
				break;
				case bold_button :
					// if the bold_btn Button instance is clicked, toggle the bold property.
					my_fmt.bold = !my_fmt.bold;
				break;
				case underline_button :
					// if the underline_button Button instance is clicked, toggle the underline property.
					my_fmt.underline = !my_fmt.underline;
				break;
				case italic_button :
					my_fmt.italic = !my_fmt.italic;
				break;
				case sizeUpButton :
					var fontSizes:DataProvider = size_cb.dataProvider;
					var currentInd:Number = 0;
					
					for (var i:int = 0; i < fontSizes.length - 1; i++) // The -1 in this case is because we can't get any smaller than our first element --JMW
					{
						if (fontSizes.getItemAt(i).data == my_fmt.size)
						{
							var newSize:Object = fontSizes.getItemAt(i + 1);
							my_fmt.size = newSize.data;
							size_cb.selectedIndex = i + 1;
							break;
						}
					}
				break;
				case sizeDownButton :
					var fontSizes:DataProvider = size_cb.dataProvider;
					var currentInd:Number = 0;
					
					for (var i:int = 1; i < fontSizes.length; i++) // The 1 in this case is because we can't get any smaller than our first element --JMW
					{
						if (fontSizes.getItemAt(i).data == my_fmt.size)
						{
							var newSize:Object = fontSizes.getItemAt(i - 1);
							my_fmt.size = newSize.data;
							size_cb.selectedIndex = i - 1;
							break;
						}
					}
				break;
					
				case hyperlink_button:
					my_fmt.url = linkTxt.text;
					my_fmt.target = window_cb.selectedLabel;
					////trace(window_cb.selectedLabel);

					if (changecolorTick.selected == true) {
						my_fmt.color = selectedLinkColor;


					}
					if (addunderlineTick.selected == true) {
						my_fmt.underline =  true;
					}
				break;
				
				case l_button :
					my_fmt.bullet = !my_fmt.bullet;
				break;

				case leftIndentBut :
					my_fmt.blockIndent += 5;
				break;

				case rightIndentBut :
					//trace( my_fmt.blockIndent);
					my_fmt.blockIndent = Number(my_fmt.blockIndent)-5;
					//trace( my_fmt.blockIndent);
				break;

				case leftAlign_button :
					my_fmt.align = "left";
					break;

				case centerAlign_button :
					my_fmt.align = "center";
					break;

				case rightAlign_button :
					my_fmt.align = "right";
				break;

				case justifiedAlign_button :
					my_fmt.align = "justify";
				break;
				
				case rMarginStepper:
					my_fmt.rightMargin = rMarginStepper.value;
				break;
				
				case lMarginStepper:
					my_fmt.leftMargin = lMarginStepper.value;
				break;
				
				case indStepper:
					my_fmt.indent = indStepper.value;
				break;
				
				case lineStepper:
					my_fmt.leading = lineStepper.value;
				break;
	
				case fontColorPicker :
					////trace(selectedFontColor+"kkkkk")
					my_fmt.color = selectedFontColor;
				break;

			}
			// reapply the text format.
			input_txt.setTextFormat(my_fmt, input_txt.selectionBeginIndex, input_txt.selectionEndIndex);
			scroller.scrollTarget = input_txt;
		}
		
		private function get richTextMode():Boolean
		{
			return this.mIsRichText;
		}

		private function viewHTMLListener(e:Event):void 
		{
			if (viewHTML.label == "< HTML Code >") {

				openFindTab();
				isActive = false;
				findActive.enabled = false;
				hyperlinkActive.enabled = false;
				findActive.enabled = false;

				var format:TextFormat = new TextFormat();
				format.font = "Verdana";
				format.color = 0x000000;
				format.size = 10;
				format.underline = false;

				//input_txt.setTextFormat(my_fmt, input_txt.selectionBeginIndex, input_txt.selectionEndIndex);
				input_txt.defaultTextFormat = format;
				input_txt.alwaysShowSelection = false;
				input_txt.text = input_txt.htmlText;
				viewHTML.label = "Rich Text";
				this.mIsRichText = false;
				//viewRichText.enabled = true;

				colorHTML();

			} else {
				this.mIsRichText = true;
				findActive.enabled = true;
				hyperlinkActive.enabled = true;
				input_txt.alwaysShowSelection = false;
				//applyStyle(input_txt.text);
				input_txt.htmlText = input_txt.text;
				viewHTML.label = "< HTML Code >";
				//viewRichText.enabled = false;

			}
		}
	}
}