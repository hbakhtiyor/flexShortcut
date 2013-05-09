# Flex Shortcut Manager

Binding shortcut keys in your application.

## Usage

[*Demonstration Application*](https://github.com/hbakhtiyor/flexShortcut/tree/master/example/FlexShortcutDemo)

Declarations

```mxml
<fx:Declarations>
	<fs:ShortcutKey>
		<fs:shortcuts>
			<s:ArrayList>		
				<fs:BindingKey target="{newButton}" ctrl="true" keyCode="{Keyboard.N}"/>
				<fs:BindingKey target="{closeButton}" ctrl="true" keyCode="{Keyboard.Q}"/>
			</s:ArrayList>
		</fs:shortcuts>	
	</fs:ShortcutKey>
</fx:Declarations>
```

or without `shortcuts` property.

```mxml
<fx:Declarations>
	<fs:ShortcutKey>
		<s:ArrayList>		
			<fs:BindingKey target="{newButton}" ctrl="true" keyCode="{Keyboard.N}"/>
			<fs:BindingKey target="{closeButton}" ctrl="true" keyCode="{Keyboard.Q}"/>
		</s:ArrayList>
	</fs:ShortcutKey>
</fx:Declarations>
```

Binding key using letter instead of key code with `keyEquivalent` property.

```mxml
<fx:Declarations>
	<fs:ShortcutKey>
		<s:ArrayList>		
			<fs:BindingKey target="{newButton}" ctrl="true" keyEquivalent="n"/>
			<fs:BindingKey target="{closeButton}" ctrl="true" keyEquivalent="q"/>
		</s:ArrayList>
	</fs:ShortcutKey>
</fx:Declarations>
```

Upper-case letter automatically to enable shift-key modifier. e.g. `Ctrl+Shift+T`

```mxml
<fx:Declarations>
	<fs:ShortcutKey>
		<s:ArrayList>		
			<fs:BindingKey target="{pinButton}" ctrl="true" keyEquivalent="T"/>
		</s:ArrayList>
	</fs:ShortcutKey>
</fx:Declarations>
```

Handle shortcut key with `handler` property.

```mxml
<fx:Declarations>
	<fs:ShortcutKey>
		<s:ArrayList>		
			<fs:BindingKey target="{newButton}" ctrl="true" keyEquivalent="n" handler="onNewButtonClicked"/>
		</s:ArrayList>
	</fs:ShortcutKey>
</fx:Declarations>
```

Show keys tool tip using `showKeysTip` property. e.g. `Ctrl+N`

```mxml
<fx:Declarations>
	<fs:ShortcutKey>
		<s:ArrayList>		
			<fs:BindingKey target="{newButton}" ctrl="true" keyEquivalent="n" showKeysTip="true"/>
		</s:ArrayList>
	</fs:ShortcutKey>
</fx:Declarations>
```

## Dependencies

* [*Flex Unit*](https://github.com/flexunit/flexunit)

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request