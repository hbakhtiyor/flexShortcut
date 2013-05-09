# Flex Shortcut Manager



## Usage

[*Demonstration Application*](https://github.com/hbakhtiyor/flexShortcut/tree/master/example/FlexShortcutDemo)

```mxml
<fx:Declarations>
	<fs:Shortcut>
		<fs:shortcuts>
			<s:ArrayList>		
				<fs:BindKey target="{newButton}" ctrl="true" key="{Keyboard.N}"/>
				<fs:BindKey target="{closeButton}" ctrl="true" key="{Keyboard.Q}"/>
			</s:ArrayList>
		</fs:shortcuts>	
	</fs:Shortcut>
</fx:Declarations>
```

```mxml
<fx:Declarations>
	<fs:Shortcut>
		<s:ArrayList>		
			<fs:BindKey target="{newButton}" ctrl="true" key="{Keyboard.N}"/>
			<fs:BindKey target="{closeButton}" ctrl="true" key="{Keyboard.Q}"/>
		</s:ArrayList>
	</fs:Shortcut>
</fx:Declarations>
```

`keyEquivalent` property

```mxml
<fx:Declarations>
	<fs:Shortcut>
		<s:ArrayList>		
			<fs:BindKey target="{newButton}" ctrl="true" keyEquivalent="n"/>
			<fs:BindKey target="{closeButton}" ctrl="true" keyEquivalent="q"/>
		</s:ArrayList>
	</fs:Shortcut>
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