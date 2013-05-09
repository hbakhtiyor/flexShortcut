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
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	
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
		//  Properties : public
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  optionProperty
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the optionProperty property.
		 */
		private var _optionProperty:String = "label";
		
		[Bindable("optionPropertyChanged")]
		[Inspectable(category="Text", defaultValue="label")]
		
		/**
		 *  @private
		 * 
		 *  @default label
		 */
		public function get optionProperty():String
		{
			return _optionProperty;
		}

		/**
		 *  @private
		 */
		public function set optionProperty(value:String):void
		{
			if(_optionProperty === value)
				return;
			
			_optionProperty = value ? value : "label";
			dispatchEvent(new Event("optionPropertyChanged"));
		}
		
		//----------------------------------
		//  optionKey
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the optionKey property.
		 */
		private var _optionKey:Boolean = false;
		
		[Bindable("optionKeyChanged")]
		[Inspectable(category="General", defaultValue="false")]
		
		/**
		 *  @private
		 * 
		 *  @default false
		 */
		public function get optionKey():Boolean
		{
			return _optionKey;
		}

		/**
		 *  @private
		 */
		public function set optionKey(value:Boolean):void
		{
			if(_optionKey === value)
				return;
			
			_optionKey = value;
			dispatchEvent(new Event("optionKeyChanged"));
		}
		
		//----------------------------------
		//  event
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the event property.
		 */
		private var _event:Class = MouseEvent;
		
		[Bindable("eventChanged")]
		[Inspectable(category="General", defaultValue="MouseEvent")]
		
		/**
		 *  @private
		 * 
		 *  @default MouseEvent
		 */
		public function get event():Class
		{
			return _event;
		}

		/**
		 *  @private
		 */
		public function set event(value:Class):void
		{
			if(_event === value)
				return;
			
			_event = value ? value : MouseEvent;
			dispatchEvent(new Event("eventChanged"));
		}
		
		//----------------------------------
		//  eventType
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the eventType property.
		 */
		private var _eventType:String = "click";
		
		[Bindable("eventTypeChanged")]
		[Inspectable(category="Text", defaultValue="click")]

		/**
		 *  @private
		 * 
		 *  @default click
		 */
		public function get eventType():String
		{
			return _eventType;
		}

		/**
		 *  @private
		 */
		public function set eventType(value:String):void
		{
			if(_eventType === value)
				return;
			
			_eventType = value ? value : "click";
			dispatchEvent(new Event("eventTypechanged"));
		}

		//----------------------------------
		//  handler
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the handler property.
		 */
		private var _handler:Function = null;
		
		[Bindable("handlerChanged")]
		[Inspectable(category="Events", defaultValue="null")]
		
		/**
		 *  @private
		 * 
		 *  @default null
		 */		
		public function get handler():Function
		{
			return _handler;
		}

		/**
		 *  @private
		 */
		public function set handler(value:Function):void
		{
			if(_handler === value)
				return;
			
			_handler = value;
			dispatchEvent(new Event("handlerChanged"));
		}
		
		//----------------------------------
		//  showKeysTip
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the showKeysTip property.
		 */		
		private var _showKeysTip:Boolean=false;
		
		[Bindable("showKeysTipChanged")]
		[Inspectable(category="General", defaultValue="false")]
		
		/**
		 *  @private
		 * 
		 *  @default false
		 */		
		public function get showKeysTip():Boolean
		{
			return _showKeysTip;
		}
		
		/**
		 *  @private
		 */
		public function set showKeysTip(value:Boolean):void
		{
			if(_showKeysTip === value)
				return;
			
			_showKeysTip = value;
			
			watchToolTipProperty();
			invalidateToolTipProperty();
			
			dispatchEvent(new Event("showKeysTipChanged"));
		}
		
		//----------------------------------
		//  shift
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the shift property.
		 */		
		private var _shift:Boolean=false;
		
		[Bindable("shiftChanged")]
		[Inspectable(category="General", defaultValue="false")]
		
		/**
		 *  @private
		 * 
		 *  @default false
		 */		
		public function get shift():Boolean
		{
			return _shift;
		}
		
		/**
		 *  @private
		 */
		public function set shift(value:Boolean):void
		{
			if(_shift === value)
				return;
			
			_shift = value;
			invalidateToolTipProperty();
			dispatchEvent(new Event("shiftChanged"));
		}
		
		//----------------------------------
		//  alt
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the alt property.
		 */		
		private var _alt:Boolean=false;
		
		[Bindable("altChanged")]
		[Inspectable(category="General", defaultValue="false")]
		
		/**
		 *  @private
		 * 
		 *  @default false
		 */		
		public function get alt():Boolean
		{
			return _alt;
		}
		
		/**
		 *  @private
		 */
		public function set alt(value:Boolean):void
		{
			if(_alt === value)
				return;
			
			_alt = value;
			invalidateToolTipProperty();
			dispatchEvent(new Event("altChanged"));
		}
		
		//----------------------------------
		//  ctrl
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the ctrl property.
		 */		
		private var _ctrl:Boolean=false;
		
		[Bindable("ctrlChanged")]
		[Inspectable(category="General", defaultValue="false")]
		
		/**
		 *  @private
		 * 
		 *  @default false
		 */		
		public function get ctrl():Boolean
		{
			return _ctrl;
		}
		
		/**
		 *  @private
		 */		
		public function set ctrl(value:Boolean):void
		{
			if(_ctrl === value)
				return;
			
			_ctrl = value;
			invalidateToolTipProperty();
			
			dispatchEvent(new Event("ctrlChanged"));
		}
		
		//----------------------------------
		//  target
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the target property.
		 */		
		private var _target:IVisualElement;
		
		[Bindable("targetChanged")]
		[Inspectable(category="General", defaultValue="null")]

		/**
		 *  @private
		 * 
		 *  @default null
		 */		
		public function get target():IVisualElement
		{
			return _target;
		}

		/**
		 *  @private
		 */		
		public function set target(value:IVisualElement):void
		{
			if(_target === value)
				return;
			
			_target = value;

			watchToolTipProperty();
			invalidateToolTipProperty();
			
			dispatchEvent(new Event("targetChanged"));
		}
		
		//----------------------------------
		//  keyEquivalent
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the keyEquivalent property.
		 */
		private var _keyEquivalent:String = null;
		
		[Bindable("keyEquivalentChanged")]
		[Inspectable(category="General", defaultValue="null")]

		/**
		 * 	The key equivalent for a binding target.
		 *  
		 * 	Set the keyEquivalent with a lowercase letter to assign a shortcut without a Shift-key modifier. 
		 * 	Set with an uppercase letter to assign a shortcut with the Shift-key modifier.
		 * 
		 *  @default null
		 */
		public function get keyEquivalent():String
		{
			return _keyEquivalent;
		}
		
		/**
		 *  @private
		 */
		public function set keyEquivalent(value:String):void
		{
			if(_keyEquivalent === value)
				return;
			if(value && value.search(/^[a-z]{1}$/ig) == -1)
				return;
			
			_keyEquivalent = value;
			if(_keyEquivalent)
			{
				shift 	= _keyEquivalent == _keyEquivalent.toUpperCase();
				keyCode = Keyboard[_keyEquivalent.toUpperCase()];
				invalidateToolTipProperty();
			}
			
			dispatchEvent(new Event("keyEquivalentChanged"));
		}
		
		//----------------------------------
		//  keyCode
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the keyCode property.
		 */
		private var _keyCode:uint = NaN;
		
		[Bindable("keyCodeChanged")]
		[Inspectable(category="General", defaultValue="NaN", minValue="0")]

		/**
		 *  @private
		 * 
		 *  @default NaN
		 */		
		public function get keyCode():uint
		{
			return _keyCode;
		}

		/**
		 *  @private
		 */
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
		//  Properties : private
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  optionProperty
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the optionCaption property.
		 */
		private var _optionCaption:String;
		
		[Bindable("optionCaptionChanged")]
		
		/**
		 *  @private
		 */
		private function get optionCaption():String
		{
			return _optionCaption;
		}
		
		/**
		 *  @private
		 */
		private function set optionCaption(value:String):void
		{
			if(_optionCaption === value)
				return;
			
			_optionCaption = value;
			dispatchEvent(new Event("optionCaptionChanged"));
		}
		
		/**
		 *  @private
		 */		
		private function get toolTipManager():IToolTipManagerClient
		{
			return _target as IToolTipManagerClient;
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
		//  Methods : public
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 */		
		public function compareShortcut(event:KeyboardEvent):Boolean
		{
			if(!event) return false;
			
			return ctrl == event.ctrlKey && alt == event.altKey &&
				shift == event.shiftKey && keyCode == event.keyCode;
		}
		
		//--------------------------------------------------------------------------
		//
		//  Methods : private
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 */
		private function watchToolTipProperty():void
		{
			if(toolTipManager && _showKeysTip)
			{
				var changeWatcher:ChangeWatcher = ChangeWatcher.watch(_target, "toolTip", null);
				if (changeWatcher != null)
				{
					var onToolTipPropertyChanged:Function = function(event:Event=null):void
					{
						invalidateToolTipProperty();
					};
					
					changeWatcher.setHandler(onToolTipPropertyChanged);
					onToolTipPropertyChanged();
				}
			}
		}	
		
		/**
		 *  @private
		 */
		private function invalidateToolTipProperty():void
		{
			if(toolTipManager && _keyCode)
			{
				var shortcutString:String = " (" + KeyNamesUtil.createShortcutString(_keyCode, _ctrl, _shift, _alt) + ")";
				
				var toolTip:String = toolTipManager.toolTip || "";
				if(toolTip.indexOf(shortcutString) == -1 && _showKeysTip)
					toolTip = toolTip + shortcutString;
				else if(!_showKeysTip)
					toolTip = toolTip.replace(shortcutString, "");
				
				if(toolTipManager.toolTip != toolTip)
					toolTipManager.toolTip = toolTip;
			}
		}	
	}
}