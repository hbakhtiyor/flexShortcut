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
	
	import mx.binding.utils.ChangeWatcher;
	import mx.collections.IList;
	import mx.core.IUIComponent;
	import mx.core.UIComponent;
	import mx.events.FlexEvent;
	import mx.managers.ISystemManager;
	
	import spark.components.ToggleButton;
	
	//--------------------------------------
	//  Other metadata
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
		//  Properties
		//
		//--------------------------------------------------------------------------
		private var _showKeysTip:Boolean=false;
		
		[Inspectable(category="General", defaultValue="false")]
		public function get showKeysTip():Boolean
		{
			return _showKeysTip;
		}
		
		public function set showKeysTip(value:Boolean):void
		{
			_showKeysTip = value;
		}
		
		
		[Inspectable(category="General", defaultValue="false")]
		private var _shift:Boolean=false;
		
		public function get shift():Boolean
		{
			return _shift;
		}
		
		public function set shift(value:Boolean):void
		{
			_shift = value;
		}
		
		
		[Inspectable(category="General", defaultValue="false")]
		private var _alt:Boolean=false;
		
		public function get alt():Boolean
		{
			return _alt;
		}
		
		public function set alt(value:Boolean):void
		{
			_alt = value;
		}
		
		
		[Inspectable(category="General", defaultValue="false")]
		private var _ctrl:Boolean=false;
		
		public function get ctrl():Boolean
		{
			return _ctrl;
		}
		
		public function set ctrl(value:Boolean):void
		{
			_ctrl = value;
		}
		
		
		[Bindable("shortcutsChanged")]
		[Inspectable(category="General")]
		[ArrayElelemtType("org.flexshortcut.BindKey")]
		private var _shortcuts:IList

		public function get shortcuts():IList
		{
			return _shortcuts;
		}

		public function set shortcuts(value:IList):void
		{
			if(_shortcuts === value)
				return;
			
			_shortcuts = value;
			
			if(_shortcuts && _shortcuts.length > 0)
				watchTargetProperty(_shortcuts.getItemAt(0) as BindingKey);
			
			dispatchEvent(new Event("shortcutsChanged"));
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
		private function watchTargetProperty(bindingKey:BindingKey):void
		{
			if(!bindingKey) return;
			
			var w:ChangeWatcher =
				ChangeWatcher.watch(bindingKey, "target", null);
			if (w != null)
			{
				var assign:Function = function(event:*):void
				{
					var document:UIComponent = bindingKey.target  as UIComponent;
					if(document)
					{
						document.initialized ? captureKeyboardEvent(document) :
							document.addEventListener(FlexEvent.CREATION_COMPLETE, onDocumentCreateCompleted);
					}				
				};
				w.setHandler(assign);
				assign(null);
			}
		}
		
		private function onDocumentCreateCompleted(event:FlexEvent):void
		{
			event.target.removeEventListener(FlexEvent.CREATION_COMPLETE, onDocumentCreateCompleted);
			captureKeyboardEvent(event.target as UIComponent);
		}
		
		private function captureKeyboardEvent(document:UIComponent):void
		{
			if(!document) return;
			
			while(document && !document.systemManager)
				document = document.parentDocument as UIComponent;
			
			if(document && document.systemManager)
			{
				var systemManager:ISystemManager = document.systemManager.topLevelSystemManager;
				
				if(systemManager && systemManager.stage)
					systemManager.stage.addEventListener(KeyboardEvent.KEY_DOWN, systemManager_mouseDownHandler, false, int.MAX_VALUE, true);
			}
		}
		
		private function systemManager_mouseDownHandler(event:KeyboardEvent):void
		{
			for (var i:int = 0; i < _shortcuts.length; i++)
			{
				var bindKey:BindingKey = _shortcuts.getItemAt(i) as BindingKey;
				if(bindKey.compareShortcut(event))
				{
					if(bindKey.target is IUIComponent && (bindKey.target as IUIComponent).enabled)
					{
						if(bindKey.target is ToggleButton)
						{
							var toggle:ToggleButton = bindKey.target as ToggleButton;							
							toggle.selected = !toggle.selected;
						}
						
						bindKey.target.dispatchEvent(new MouseEvent(MouseEvent.CLICK));
					}
					break;
				}
			}
		}
		
	}
}