# Events

Unity calls your `OnGUI` kind of functions multiple times a frame to handle your GUI. For complex views, understanding Unity GUI Events can help you write more performant views.

You can get the current event for the current `OnGUI` call with `Event.current`.

```csharp
private void OnGUI()
{
	var editorEvent = Event.current;
	if (editorEventType == EventType.ScrollWheel)
	{
		var scrollDelta = editorEvent.delta;
		// ...
	}
}
```

The most important events are `Layout` and `Repaint`.

- Layout is called before any other event. `GUILayout` calls use this to initialize themselves. Layout events may occur multiple times in one frame.
- Repaint is called only once at the end of a frame.

## User interaction
There is also `GUI.changed` which you can use to detect user interaction.

```csharp
private void OnGUI()
{
	var table = DrawTable(titles);
	
	if (GUI.changed)
	{
		// Users pressed something in the table.
		// Get the index and do stuff
		// once in a frame.
		var index = table.SelectedIndex;
		// ...
	}
}
```