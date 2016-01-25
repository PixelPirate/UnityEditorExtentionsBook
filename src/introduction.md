# Introduction

## Layout
Most UI widgets are available in an auto layout version, and a version where the user manually sets a rect in whicht to draw the widget.

Auto layout widgets are in `GUILayout.*` and `EditorGUILayout.*`.

Manual layout widgets are in `GUI.*` and `EditorGUI.*`.

## Styles
Editor styles are in `UnityEditor.EditorStyles.*`, regular runtime styles are in `GUI.skins.*`.

Be carefull not to change the default styles, as that would change all uses of that style, even the Unity editor itself. Always make a copy of a style that you cant to change, change the copy and use that copy.

```csharp
var helpBoxStyle = new GUIStyle(EditorStyles.helpBox);
helpBoxStyle.normal.textColor = Color.blue;
```