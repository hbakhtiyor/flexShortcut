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
	import flash.ui.Keyboard;
	
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.IList;
	import mx.core.IUIComponent;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.managers.ISystemManager;
	
	import spark.components.supportClasses.ToggleButtonBase;
	
	//--------------------------------------
	//  Default metadata
	//--------------------------------------
	
	[DefaultProperty("shortcuts")]
	
	/**
	 * Shortcut class 
	 */
	public class ShortcutKey extends EventDispatcher
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
		 * Shortcut 
		 */
		public function ShortcutKey()
		{
		}
		
		
		//--------------------------------------------------------------------------
		//
		//  Properties : public
		//
		//--------------------------------------------------------------------------
		
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
			
			dispatchEvent(new Event("ctrlChanged"));
		}
		
		//----------------------------------
		//  shortcuts
		//----------------------------------
		
		/**
		 *  @private
		 *  Storage for the shortcuts property.
		 */
		private var _shortcuts:IList = null;
		
		[Bindable("shortcutsChanged")]
		[Inspectable(category="General", defaultValue="null")]
		[ArrayElelemtType("org.flexshortcut.core.BindingKey")]

		/**
		 *  @private
		 * 
		 *  @default null
		 */
		public function get shortcuts():IList
		{
			return _shortcuts;
		}

		/**
		 *  @private
		 */
		public function set shortcuts(value:IList):void
		{
			if(_shortcuts === value)
				return;
			
			_shortcuts = value;
			
			watchTargetProperty(firstBindingKey);
			
			dispatchEvent(new Event("shortcutsChanged"));
		}
		
		//--------------------------------------------------------------------------
		//
		//  Properties : private
		//
		//--------------------------------------------------------------------------
		
		//----------------------------------
		//  firstBindingKey
		//----------------------------------
		
		/**
		 *  @private
		 */
		private function get firstBindingKey():BindingKey
		{
			if(_shortcuts && _shortcuts.length > 0)
				return _shortcuts.getItemAt(0) as BindingKey;
			return null;
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
		//  Methods : private
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 */
		private function watchTargetProperty(bindingKey:BindingKey):void
		{
			if(!bindingKey) return;
			
			var changeWatcher:ChangeWatcher = ChangeWatcher.watch(bindingKey, "target", null);
			if (changeWatcher != null)
			{
				changeWatcher.setHandler(onTargetPropertyChanged);
				onTargetPropertyChanged();
			}
		}
		
		/**
		 *  @private
		 */		
		private function captureKeyboardEvent(document:UIComponent):void
		{
			if(!document) return;
			
			while(document && !document.systemManager)
				document = document.parentDocument as UIComponent;
			
			if(document && document.systemManager)
			{
				var systemManager:ISystemManager = document.systemManager.topLevelSystemManager;
				
				if(systemManager && systemManager.stage)
				{
					systemManager.stage.addEventListener(KeyboardEvent.KEY_DOWN	, onSystemManagerMouseDown, false, int.MAX_VALUE, true);
					systemManager.stage.addEventListener(KeyboardEvent.KEY_UP	, onSystemManagerMouseUp, false, int.MAX_VALUE, true);
				}
			}
		}
		
		/**
		 *  @private
		 */		
		private function findShortcut(event:KeyboardEvent):void
		{
			if(!_shortcuts) return;
			
			for (var i:int = 0; i < _shortcuts.length; i++)
			{
				var bindKey:BindingKey = _shortcuts.getItemAt(i) as BindingKey;
				if(bindKey.compareShortcut(event))
				{
					var component:IUIComponent = bindKey.target as IUIComponent;
					if(component  && component.enabled)
					{
						if(component is ToggleButtonBase)
						{
							var toggle:ToggleButtonBase = component as ToggleButtonBase;							
							toggle.selected = !toggle.selected;
						}
						
						try
						{
							if(bindKey.handler == null)
								component.dispatchEvent(new bindKey.event(bindKey.eventType));
							else
								bindKey.handler(event);
						}
						catch(error:Error)
						{
							
						}
					}
					break;
				}
			}			
		}
		
		//--------------------------------------------------------------------------
		//
		//  Event handlers
		//
		//--------------------------------------------------------------------------
		
		/**
		 *  @private
		 */
		private function onTargetPropertyChanged(event:Event=null):void
		{
			var document:UIComponent = firstBindingKey.target  as UIComponent;
			if(!document) return;
			
			if(document.initialized)
				captureKeyboardEvent(document)
			else	
				document.addEventListener(FlexEvent.CREATION_COMPLETE, onDocumentCreateCompleted);
		}
		
		/**
		 *  @private
		 */		
		private function onDocumentCreateCompleted(event:FlexEvent):void
		{
			event.target.removeEventListener(FlexEvent.CREATION_COMPLETE, onDocumentCreateCompleted);
			captureKeyboardEvent(event.target as UIComponent);
		}
		
		/**
		 *  @private
		 */		
		private function onSystemManagerMouseUp(event:KeyboardEvent):void
		{
			if(event.keyCode == Keyboard.ALTERNATE)
			{
				// TODO Alt+<underlined letter> shortcut	
			}
		}
		
		/**
		 *  @private
		 */		
		private function onSystemManagerMouseDown(event:KeyboardEvent):void
		{
			if(event.altKey && event.keyCode == Keyboard.ALTERNATE)
			{
				// TODO Alt+<underlined letter> shortcut
			}
			else
			{
				findShortcut(event);
			}
		}
	}
}