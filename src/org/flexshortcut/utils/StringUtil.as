////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2013 Abd ar-Rahman (bakhtiyor.h@gmail.com)
//
// Released under the "MIT" license
//
// See LICENSE.txt for full license information.
////////////////////////////////////////////////////////////////////////////////
package org.flexshortcut.utils
{
	/**
	 * StringUtil class 
	 */
	public class StringUtil
	{
		
	
		//--------------------------------------------------------------------------
		//
		//  Methods
		//
		//--------------------------------------------------------------------------
		public static function humanize(string:String):String
		{
			if(!string) return "";
			
			string = string.toLowerCase();
			string = string.replace(/_|\-/ig, " ");
			
			return string.charAt().toUpperCase() + string.substr(1);
		}
		
	}
}