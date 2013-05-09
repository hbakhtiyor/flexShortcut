////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2013 Abd ar-Rahman (bakhtiyor.h@gmail.com)
//
// Released under the "MIT" license
//
// See LICENSE.txt for full license information.
////////////////////////////////////////////////////////////////////////////////
package org.flexshortcut.utils
{
	import flash.ui.Keyboard;

	/**
	 * KeyNamesUtil class 
	 */
	[ExcludeClass]
	public class KeyNamesUtil
	{
		
		//--------------------------------------------------------------------------
		//
		//  Constants
		//
		//--------------------------------------------------------------------------

		/**
		 * 	 
		 * 	Delimiting control keys (ctrl, alt, shift) and keyboard key
		 *  e.g. Ctrl+Alt+Down 
		 */
		public static const DELIMITER:String 		= "+";
		
		/**
		 * 	Control keys
		 */		
		public static const CTRL:String 			= "CTRL";
		public static const ALT:String 				= "ALT";
		public static const SHIFT:String 			= "SHIFT";
		
		/**
		 * 	F keys
		 */
		public static const F1:String 				= "F1";
		public static const F2:String 				= "F2";
		public static const F3:String 				= "F3";
		public static const F4:String 				= "F4";
		public static const F5:String 				= "F5";
		public static const F6:String 				= "F6";
		public static const F7:String 				= "F7";
		public static const F8:String 				= "F8";
		public static const F9:String 				= "F9";
		public static const F10:String 				= "F10";
		public static const F11:String 				= "F11";
		public static const F12:String 				= "F12";
		public static const F13:String 				= "F13";
		public static const F14:String 				= "F14";
		public static const F15:String 				= "F15";
		
		/**
		 * 	Alphabet keys
		 */		
		public static const A:String 				= "A";
		public static const B:String 				= "B";
		public static const C:String 				= "C";
		public static const D:String 				= "D";
		public static const E:String 				= "E";
		public static const F:String 				= "F";
		public static const G:String				= "G";
		public static const H:String 				= "H";
		public static const I:String 				= "I";
		public static const J:String 				= "J";
		public static const K:String 				= "K";
		public static const L:String 				= "L";
		public static const M:String 				= "M";
		public static const N:String 				= "N";
		public static const O:String 				= "O";
		public static const P:String 				= "P";
		public static const Q:String 				= "Q";
		public static const R:String 				= "R";
		public static const S:String 				= "S";
		public static const T:String 				= "T";
		public static const U:String 				= "U";
		public static const V:String 				= "V";
		public static const W:String 				= "W";
		public static const X:String 				= "X";
		public static const Y:String 				= "Y";
		public static const Z:String 				= "Z";
		

		/**
		 * 	Number keys
		 */		
		public static const NUMBER_0:String 		= "NUMBER_0";
		public static const NUMBER_1:String 		= "NUMBER_1";
		public static const NUMBER_2:String 		= "NUMBER_2";
		public static const NUMBER_3:String 		= "NUMBER_3";
		public static const NUMBER_4:String 		= "NUMBER_4";
		public static const NUMBER_5:String 		= "NUMBER_5";
		public static const NUMBER_6:String 		= "NUMBER_6";
		public static const NUMBER_7:String 		= "NUMBER_7";
		public static const NUMBER_8:String 		= "NUMBER_8";
		public static const NUMBER_9:String			= "NUMBER_9";
		
		/**
		 * 	Numpad keys
		 */		
		public static const NUMPAD:String 			= "NUMPAD";
		public static const NUMPAD_0:String 		= "NUMPAD_0";
		public static const NUMPAD_1:String 		= "NUMPAD_1";
		public static const NUMPAD_2:String 		= "NUMPAD_2";
		public static const NUMPAD_3:String 		= "NUMPAD_3";
		public static const NUMPAD_4:String 		= "NUMPAD_4";
		public static const NUMPAD_5:String 		= "NUMPAD_5";
		public static const NUMPAD_6:String 		= "NUMPAD_6";
		public static const NUMPAD_7:String			= "NUMPAD_7";
		public static const NUMPAD_8:String 		= "NUMPAD_8";
		public static const NUMPAD_9:String 		= "NUMPAD_9";
		public static const NUMPAD_ADD:String 		= "NUMPAD_ADD";
		public static const NUMPAD_DECIMAL:String 	= "NUMPAD_DECIMAL";
		public static const NUMPAD_DIVIDE:String 	= "NUMPAD_DIVIDE";
		public static const NUMPAD_ENTER:String 	= "NUMPAD_ENTER";
		public static const NUMPAD_MULTIPLY:String 	= "NUMPAD_MULTIPLY";
		public static const NUMPAD_SUBTRACT:String 	= "NUMPAD_SUBTRACT";
		
		/**
		 * 	Other keys
		 */
		public static const DELETE:String			= "DELETE";
		public static const BACKSPACE:String		= "BACKSPACE";
		public static const CAPS_LOCK:String		= "CAPS_LOCK";
		public static const UP:String				= "UP";
		public static const DOWN:String				= "DOWN";
		public static const LEFT:String				= "LEFT";
		public static const RIGHT:String			= "RIGHT";
		public static const HOME:String				= "HOME";
		public static const END:String				= "END";
		public static const PAGE_UP:String			= "PAGE_UP";
		public static const PAGE_DOWN:String		= "PAGE_DOWN";
		public static const INSERT:String			= "INSERT";
		public static const ENTER:String			= "ENTER";
		public static const ESCAPE:String			= "ESCAPE";
		public static const TAB:String				= "TAB";
		public static const SPACE:String			= "SPACE";		
		public static const ALTERNATE:String 		= "ALTERNATE";
		public static const AUDIO:String 			= "AUDIO";
		public static const BACK:String 			= "BACK";
		public static const BACKQUOTE:String 		= "BACKQUOTE";
		public static const BACKSLASH:String 		= "BACKSLASH";
		public static const BLUE:String 			= "BLUE";
		public static const CHANNEL_DOWN:String 	= "CHANNEL_DOWN";
		public static const CHANNEL_UP:String 		= "CHANNEL_UP";
		public static const COMMA:String 			= "COMMA";
		public static const COMMAND:String 			= "COMMAND";
		public static const CONTROL:String 			= "CONTROL";
		public static const DVR:String 				= "DVR";
		public static const EQUAL:String 			= "EQUAL";
		public static const EXIT:String 			= "EXIT";		
		public static const FAST_FORWARD:String 	= "FAST_FORWARD";
		public static const GREEN:String 			= "GREEN";
		public static const GUIDE:String 			= "GUIDE";
		public static const HELP:String 			= "HELP";
		public static const INFO:String 			= "INFO";
		public static const INPUT:String 			= "INPUT";
		public static const LAST:String 			= "LAST";
		public static const LEFTBRACKET:String 		= "LEFTBRACKET";
		public static const LIVE:String 			= "LIVE";
		public static const MASTER_SHELL:String 	= "MASTER_SHELL";
		public static const MENU:String 			= "MENU";
		public static const MINUS:String 			= "MINUS";
		public static const NEXT:String 			= "NEXT";		
		public static const PAUSE:String 			= "PAUSE";
		public static const PERIOD:String 			= "PERIOD";
		public static const PLAY:String 			= "PLAY";
		public static const PREVIOUS:String 		= "PREVIOUS";
		public static const QUOTE:String 			= "QUOTE";
		public static const RECORD:String 			= "RECORD";
		public static const RED:String 				= "RED";
		public static const REWIND:String 			= "REWIND";
		public static const RIGHTBRACKET:String 	= "RIGHTBRACKET";
		public static const SEARCH:String 			= "SEARCH";
		public static const SEMICOLON:String 		= "SEMICOLON";
		public static const SETUP:String 			= "SETUP";
		public static const SKIP_BACKWARD:String 	= "SKIP_BACKWARD";
		public static const SKIP_FORWARD:String 	= "SKIP_FORWARD";
		public static const SLASH:String 			= "SLASH";
		public static const STOP:String 			= "STOP";
		public static const SUBTITLE:String 		= "SUBTITLE";
		public static const VOD:String 				= "VOD";
		public static const YELLOW:String 			= "YELLOW";
		
		
		KeyNamesUtil[Keyboard.A] 					= A;
		KeyNamesUtil[Keyboard.ALTERNATE] 			= ALTERNATE;
		KeyNamesUtil[Keyboard.AUDIO] 				= AUDIO;
		KeyNamesUtil[Keyboard.B] 					= B;
		KeyNamesUtil[Keyboard.BACK] 				= BACK;
		KeyNamesUtil[Keyboard.BACKQUOTE] 			= BACKQUOTE;
		KeyNamesUtil[Keyboard.BACKSLASH] 			= BACKSLASH;
		KeyNamesUtil[Keyboard.BACKSPACE] 			= BACKSPACE;
		KeyNamesUtil[Keyboard.BLUE] 				= BLUE;
		KeyNamesUtil[Keyboard.C] 					= C;
		KeyNamesUtil[Keyboard.CAPS_LOCK] 			= CAPS_LOCK;
		KeyNamesUtil[Keyboard.CHANNEL_DOWN] 		= CHANNEL_DOWN;
		KeyNamesUtil[Keyboard.CHANNEL_UP] 			= CHANNEL_UP;
		KeyNamesUtil[Keyboard.COMMA] 				= COMMA;
		KeyNamesUtil[Keyboard.COMMAND] 				= COMMAND;
		KeyNamesUtil[Keyboard.CONTROL] 				= CONTROL;
		KeyNamesUtil[Keyboard.D] 					= D;
		KeyNamesUtil[Keyboard.DELETE] 				= DELETE;
		KeyNamesUtil[Keyboard.DOWN] 				= DOWN;
		KeyNamesUtil[Keyboard.DVR] 					= DVR;
		KeyNamesUtil[Keyboard.E] 					= E;
		KeyNamesUtil[Keyboard.END] 					= END;
		KeyNamesUtil[Keyboard.ENTER] 				= ENTER;
		KeyNamesUtil[Keyboard.EQUAL] 				= EQUAL;
		KeyNamesUtil[Keyboard.ESCAPE] 				= ESCAPE;
		KeyNamesUtil[Keyboard.EXIT] 				= EXIT;
		KeyNamesUtil[Keyboard.F] 					= F;
		KeyNamesUtil[Keyboard.F1] 					= F1;
		KeyNamesUtil[Keyboard.F2] 					= F2;
		KeyNamesUtil[Keyboard.F3] 					= F3;
		KeyNamesUtil[Keyboard.F4] 					= F4;
		KeyNamesUtil[Keyboard.F5] 					= F5;
		KeyNamesUtil[Keyboard.F6] 					= F6;
		KeyNamesUtil[Keyboard.F7] 					= F7;
		KeyNamesUtil[Keyboard.F8] 					= F8;
		KeyNamesUtil[Keyboard.F9] 					= F9;
		KeyNamesUtil[Keyboard.F9] 					= F10;
		KeyNamesUtil[Keyboard.F10] 					= F10;
		KeyNamesUtil[Keyboard.F11] 					= F11;
		KeyNamesUtil[Keyboard.F12] 					= F12;
		KeyNamesUtil[Keyboard.F13] 					= F13;
		KeyNamesUtil[Keyboard.F14] 					= F14;
		KeyNamesUtil[Keyboard.F15] 					= F15;
		KeyNamesUtil[Keyboard.FAST_FORWARD] 		= FAST_FORWARD;
		KeyNamesUtil[Keyboard.G] 					= G;
		KeyNamesUtil[Keyboard.GREEN] 				= GREEN;
		KeyNamesUtil[Keyboard.GUIDE] 				= GUIDE;
		KeyNamesUtil[Keyboard.H] 					= H;
		KeyNamesUtil[Keyboard.HELP] 				= HELP;
		KeyNamesUtil[Keyboard.HOME] 				= HOME;
		KeyNamesUtil[Keyboard.I] 					= I;
		KeyNamesUtil[Keyboard.INFO] 				= INFO;
		KeyNamesUtil[Keyboard.INPUT] 				= INPUT;
		KeyNamesUtil[Keyboard.INSERT] 				= INSERT;
		KeyNamesUtil[Keyboard.J] 					= J;
		KeyNamesUtil[Keyboard.K] 					= K;
		KeyNamesUtil[Keyboard.L] 					= L;
		KeyNamesUtil[Keyboard.LAST] 				= LAST;
		KeyNamesUtil[Keyboard.LEFT] 				= LEFT;
		KeyNamesUtil[Keyboard.LEFTBRACKET] 			= LEFTBRACKET;
		KeyNamesUtil[Keyboard.LIVE] 				= LIVE;
		KeyNamesUtil[Keyboard.M] 					= M;
		KeyNamesUtil[Keyboard.MASTER_SHELL] 		= MASTER_SHELL;
		KeyNamesUtil[Keyboard.MENU] 				= MENU;
		KeyNamesUtil[Keyboard.MINUS] 				= MINUS;
		KeyNamesUtil[Keyboard.N] 					= N;
		KeyNamesUtil[Keyboard.NEXT] 				= NEXT;
		KeyNamesUtil[Keyboard.NUMBER_0] 			= NUMBER_0;
		KeyNamesUtil[Keyboard.NUMBER_1] 			= NUMBER_1;
		KeyNamesUtil[Keyboard.NUMBER_2] 			= NUMBER_2;
		KeyNamesUtil[Keyboard.NUMBER_3] 			= NUMBER_3;
		KeyNamesUtil[Keyboard.NUMBER_4] 			= NUMBER_4;
		KeyNamesUtil[Keyboard.NUMBER_5] 			= NUMBER_5;
		KeyNamesUtil[Keyboard.NUMBER_6] 			= NUMBER_6;
		KeyNamesUtil[Keyboard.NUMBER_7] 			= NUMBER_7;
		KeyNamesUtil[Keyboard.NUMBER_8] 			= NUMBER_8;
		KeyNamesUtil[Keyboard.NUMBER_9] 			= NUMBER_9;
		KeyNamesUtil[Keyboard.NUMPAD] 				= NUMPAD;
		KeyNamesUtil[Keyboard.NUMPAD_0] 			= NUMPAD_0;
		KeyNamesUtil[Keyboard.NUMPAD_1] 			= NUMPAD_1;
		KeyNamesUtil[Keyboard.NUMPAD_2] 			= NUMPAD_2;
		KeyNamesUtil[Keyboard.NUMPAD_3] 			= NUMPAD_3;
		KeyNamesUtil[Keyboard.NUMPAD_4] 			= NUMPAD_4;
		KeyNamesUtil[Keyboard.NUMPAD_5] 			= NUMPAD_5;
		KeyNamesUtil[Keyboard.NUMPAD_6] 			= NUMPAD_6;
		KeyNamesUtil[Keyboard.NUMPAD_7] 			= NUMPAD_7;
		KeyNamesUtil[Keyboard.NUMPAD_8] 			= NUMPAD_8;
		KeyNamesUtil[Keyboard.NUMPAD_9] 			= NUMPAD_9;
		KeyNamesUtil[Keyboard.NUMPAD_ADD] 			= NUMPAD_ADD;
		KeyNamesUtil[Keyboard.NUMPAD_DECIMAL] 		= NUMPAD_DECIMAL;
		KeyNamesUtil[Keyboard.NUMPAD_DIVIDE] 		= NUMPAD_DIVIDE;
		KeyNamesUtil[Keyboard.NUMPAD_ENTER] 		= NUMPAD_ENTER;
		KeyNamesUtil[Keyboard.NUMPAD_MULTIPLY] 		= NUMPAD_MULTIPLY;
		KeyNamesUtil[Keyboard.NUMPAD_SUBTRACT] 		= NUMPAD_SUBTRACT;
		KeyNamesUtil[Keyboard.O] 					= O;
		KeyNamesUtil[Keyboard.P] 					= P;
		KeyNamesUtil[Keyboard.PAGE_DOWN] 			= PAGE_DOWN;
		KeyNamesUtil[Keyboard.PAGE_UP] 				= PAGE_UP;
		KeyNamesUtil[Keyboard.PAUSE] 				= PAUSE;
		KeyNamesUtil[Keyboard.PERIOD] 				= PERIOD;
		KeyNamesUtil[Keyboard.PLAY] 				= PLAY;
		KeyNamesUtil[Keyboard.PREVIOUS] 			= PREVIOUS;
		KeyNamesUtil[Keyboard.Q] 					= Q;
		KeyNamesUtil[Keyboard.QUOTE] 				= QUOTE;
		KeyNamesUtil[Keyboard.R] 					= R;
		KeyNamesUtil[Keyboard.RECORD] 				= RECORD;
		KeyNamesUtil[Keyboard.RED] 					= RED;
		KeyNamesUtil[Keyboard.REWIND] 				= REWIND;
		KeyNamesUtil[Keyboard.RIGHT] 				= RIGHT;
		KeyNamesUtil[Keyboard.RIGHTBRACKET] 		= RIGHTBRACKET;
		KeyNamesUtil[Keyboard.S] 					= S;
		KeyNamesUtil[Keyboard.SEARCH] 				= SEARCH;
		KeyNamesUtil[Keyboard.SEMICOLON] 			= SEMICOLON;
		KeyNamesUtil[Keyboard.SETUP] 				= SETUP;
		KeyNamesUtil[Keyboard.SHIFT] 				= SHIFT;
		KeyNamesUtil[Keyboard.SKIP_BACKWARD] 		= SKIP_BACKWARD;
		KeyNamesUtil[Keyboard.SKIP_FORWARD] 		= SKIP_FORWARD;
		KeyNamesUtil[Keyboard.SLASH] 				= SLASH;
		KeyNamesUtil[Keyboard.SPACE] 				= SPACE;
		KeyNamesUtil[Keyboard.STOP] 				= STOP;
		KeyNamesUtil[Keyboard.SUBTITLE] 			= SUBTITLE;
		KeyNamesUtil[Keyboard.T] 					= T;
		KeyNamesUtil[Keyboard.TAB] 					= TAB;
		KeyNamesUtil[Keyboard.U] 					= U;
		KeyNamesUtil[Keyboard.UP] 					= UP;
		KeyNamesUtil[Keyboard.V] 					= V;
		KeyNamesUtil[Keyboard.VOD] 					= VOD;
		KeyNamesUtil[Keyboard.W] 					= W;
		KeyNamesUtil[Keyboard.X] 					= X;
		KeyNamesUtil[Keyboard.Y] 					= Y;
		KeyNamesUtil[Keyboard.YELLOW] 				= YELLOW;
		KeyNamesUtil[Keyboard.Z] 					= Z;
	
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		
		/**
		 * Creates a text representation for shortcut with keys.
		 *
		 */
		public static function createShortcutString(key:uint, ctrl:Boolean=false, 
										shift:Boolean=false, alt:Boolean=false):String
		{
			var keys:Array = [];
			
			if(ctrl	) 	keys.push(StringUtil.humanize(CTRL));
			if(shift) 	keys.push(StringUtil.humanize(SHIFT));
			if(alt) 	keys.push(StringUtil.humanize(ALT));
			keys.push(StringUtil.humanize(KeyNamesUtil[key]));
			
			return  keys.join(DELIMITER);
		}
	}
}