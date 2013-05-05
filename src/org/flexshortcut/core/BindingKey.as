////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2013 Abd ar-Rahman (bakhtiyor.h@gmail.com)
//
// Released under the "MIT" license
//
// See LICENSE.txt for full license information.
////////////////////////////////////////////////////////////////////////////////
package org.flexshortcut.core
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	
	import mx.binding.utils.ChangeWatcher;
	import mx.core.IVisualElement;
	import mx.managers.IToolTipManagerClient;
	
	import org.flexshortcut.utils.KeyNamesUtil;

	/**
	 * BindKey class 
	 */
	[Bindable]
	public class BindingKey extends EventDispatcher
	{
		//--------------------------------------------------------------------------
		//
		//  Constants
		//
		//--------------------------------------------------------------------------
		/**
		 *
		 */
		
		
		//--------------------------------------------------------------------------
		//
		//  Variables
		//
		//--------------------------------------------------------------------------
		/**
		 *
		 */
		//--------------------------------------------------------------------------
		//
		//  Constructor
		//
		//--------------------------------------------------------------------------
		/**
		 * Constructor
		 * BindKey 
		 */
		public function BindingKey()
		{
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Properties
		//
		//--------------------------------------------------------------------------
		[Bindable("eventChanged")]
		[Inspectable(category="General")]
		private var _event:Class;
		
		public function get event():Class
		{
			return _event;
		}

		public function set event(value:Class):void
		{
			if(_event === value)
				return;
			
			_event = value;
			dispatchEvent(new Event("eventChanged"));
		}

		[Bindable("eventTypeChanged")]
		[Inspectable(category="Text")]
		private var _eventType:String;

		public function get eventType():String
		{
			return _eventType;
		}

		public function set eventType(value:String):void
		{
			if(_eventType === value)
				return;
			
			_eventType = value;
			dispatchEvent(new Event("eventTypechanged"));
		}
		
		
		[Bindable("handlerChanged")]
		[Inspectable(category="Events")]
		private var _handler:Function;
		
		public function get handler():Function
		{
			return _handler;
		}

		public function set handler(value:Function):void
		{
			if(_handler === value)
				return;
			
			_handler = value;
			dispatchEvent(new Event("handlerChanged"));
		}
		
		
		[Bindable("showKeysTipChanged")]
		[Inspectable(category="General", defaultValue="false")]
		private var _showKeysTip:Boolean=false;
		
		public function get showKeysTip():Boolean
		{
			return _showKeysTip;
		}
		
		public function set showKeysTip(value:Boolean):void
		{
			if(_showKeysTip === value)
				return;
			
			_showKeysTip = value;
			invalidateToolTipProperty();
			dispatchEvent(new Event("showKeysTipChanged"));
		}
		
		
		[Bindable("shiftChanged")]
		[Inspectable(category="General", defaultValue="false")]
		private var _shift:Boolean=false;
		
		public function get shift():Boolean
		{
			return _shift;
		}
		
		public function set shift(value:Boolean):void
		{
			if(_shift === value)
				return;
			
			_shift = value;
			invalidateToolTipProperty();
			dispatchEvent(new Event("shiftChanged"));
		}
		
		[Bindable("altChanged")]
		[Inspectable(category="General", defaultValue="false")]
		private var _alt:Boolean=false;
		
		public function get alt():Boolean
		{
			return _alt;
		}
		
		public function set alt(value:Boolean):void
		{
			if(_alt === value)
				return;
			
			_alt = value;
			invalidateToolTipProperty();
			dispatchEvent(new Event("altChanged"));
		}
		
		[Bindable("ctrlChanged")]
		[Inspectable(category="General", defaultValue="false")]
		private var _ctrl:Boolean=false;
		
		public function get ctrl():Boolean
		{
			return _ctrl;
		}
		
		public function set ctrl(value:Boolean):void
		{
			if(_ctrl === value)
				return;
			
			_ctrl = value;
			invalidateToolTipProperty();
			dispatchEvent(new Event("ctrlChanged"));
		}
		
		[Bindable("targetChanged")]
		[Inspectable(category="General", defaultValue="null")]
		private var _target:IVisualElement;

		public function get target():IVisualElement
		{
			return _target;
		}

		public function set target(value:IVisualElement):void
		{
			if(_target === value)
				return;
			
			_target = value;
			if(_target is IToolTipManagerClient && _showKeysTip)
			{
				watchToolTipProperty();
				invalidateToolTipProperty();
			}
			
			dispatchEvent(new Event("targetChanged"));
		}
		

		[Bindable("keyCodeChanged")]
		[Inspectable(category="General", defaultValue="null", minValue="0")]
		private var _keyCode:uint;

		public function get keyCode():uint
		{
			return _keyCode;
		}

		public function set keyCode(value:uint):void
		{
			if(_keyCode === value)
				return;
			
			_keyCode = value;
			invalidateToolTipProperty();
			dispatchEvent(new Event("keyCodeChanged"));
		}

		
		//--------------------------------------------------------------------------
		//
		//  Overridden methods
		//
		//--------------------------------------------------------------------------
		/**
		 *  @private
		 */
		
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		private function watchToolTipProperty():void
		{
			var w:ChangeWatcher =
				ChangeWatcher.watch(_target, "toolTip", null, true, true);
			if (w != null)
			{
				var assign:Function = function(event:*):void
				{
					invalidateToolTipProperty();
				};
				w.setHandler(assign);
				assign(null);
			}
		}	
		
		private function invalidateToolTipProperty():void
		{
			if(_target is IToolTipManagerClient && _showKeysTip && _keyCode)
			{
				var shortcutString:String = " (" + KeyNamesUtil.createShortcutString(_keyCode, _ctrl, _shift, _alt) + ")";
				
				var toolTip:String = _target["toolTip"] || "";
				if(toolTip.indexOf(shortcutString) == -1)
					_target["toolTip"] = toolTip + shortcutString;
			}
		}	
		
		public function compareShortcut(event:KeyboardEvent):Boolean
		{
			if(!event) return false;
			
			return ctrl == event.ctrlKey && alt == event.altKey &&
					shift == event.shiftKey && keyCode == event.keyCode;
		}
	}
}