package gooi;

import lua.Table;
import love.graphics.Image;

@:native('component')
extern class Component
{
	public static var style : lua.Table.AnyTable;

	public static function setTooltip(text:String) : Component;
	public static function onPress(f:Dynamic) : Component;
	public static function onRelease(f:Dynamic) : Component;
	public static function onMoved(f:Dynamic) : Component;
	public static function bg(color:Dynamic) : Component;
	public static function fg(color:Dynamic) : Component;
	public static function setRadius(r:Float, ri:Float) : Component;
	public static function border(w:Float, color:Dynamic, style:Table<Dynamic, Dynamic>) : Component;
	public static function make3d() : Component;

	public static var setVisible : Bool->Component;
	public static var setEnabled : Bool->Component;
	public static var setGroup : String->Component;
	public static var wasReleased : Void->Bool;
	public static var overItAux : Float->Float->Table<Dynamic, Dynamic>;
	public static var overIt : Float->Float->Dynamic;

	public static function setBounds(x:Float, y:Float, ?w:Float, ?h:Float) : Component;
	public static function setOpaque(b:Bool) : Component;

	// public static new(t:String, x:Float, y:Float, w:Float, h:Float) : Component;
}

@:native('layout')
extern class Layout
{
	public static function drawCells() : Void;
	public static function nextCell(c:Dynamic) : Dynamic;
}

@:native('gooi')
extern class Gooi
{
	public static var desktopMode : Void->Void;

	public static function newLabel(text:String, x:Float, y:Float, ?w:Float, ?h:Float) : Component;
	public static function newButton(text:String, x:Float, y:Float, ?w:Float, ?h:Float) : Component;
	public static function newSlider(value:Float, x:Float, y:Float, ?w:Float, ?h:Float) : Component;
	public static function newCheck(text:String, x:Float, y:Float, ?w:Float, ?h:Float) : Component;
	public static function newRadio(text:String, radioGroup:String, x:Float, y:Float, ?w:Float, ?h:Float) : Component;
	public static function newText(text:String, x:Float, y:Float, ?w:Float, ?h:Float) : Component;
	public static function newBar(value:Float, x:Float, y:Float, ?w:Float, ?h:Float) : Component;
	public static function newSpinner(min:Float, max:Float, value:Float, x:Float, y:Float, ?w:Float, ?h:Float) : Component;
	public static function newJoy(x:Float, y:Float, size:Float, deadZone:Float, image:Image) : Component;
	public static function newKnob(value:Float, x:Float, y:Float, size:Float) : Component;
	public static function newPanel(x:Float, y:Float, w:Float, h:Float, theLayout:String) : Component;

	public static function alert(msg:String, ?fOK:Dynamic) : Void;
	public static function confirm(msg:String, fYes:Dynamic, fNo:Dynamic) : Void;
	public static function dialog(msg:String, fPositive:Dynamic, fNegative:Dynamic, kind:String) : Void;
	public static function closeDialog() : Void;

	public static function setCanvas(c:Dynamic) : Void;
	public static function round(num:Float, ?numDecimalPlaces:Int) : Float;
	public static function removeComponent(comp:Component) : Void;
	public static function processStyle(style:Table<Dynamic, Dynamic>) : Table<Dynamic, Dynamic>;
	public static function deepcopy(orig:Dynamic) : Dynamic;
	public static function setStyleComp(c:Component) : Component;
	public static function setStyle(style:Table<Dynamic, Dynamic>) : Void;

	public static function update(dt:Float) : Void;
	public static function draw(?group:String) : Void;

	public static function toRGBA(hex:String) : Table<Dynamic, Float>;
	public static function getByType(theType:Dynamic) : Table<Dynamic, Dynamic>;

	public static var get : Int->Component;
	public static var setGroupVisible : String->Bool->Void;
	public static var setGroupEnabled : String->Bool->Void;
	public static var getByGroup : String->Table<Dynamic, Component>;
	public static var getByGroupAndType : String->Dynamic->Table<Dynamic, Dynamic>;

	public static var pressed : ?Int->?Float->?Float->Void;
	public static var moved : Int->Float->Float->Void;
	public static var released : ?Int->?Float->?Float->Void;

	public static var updateFocus : Void->Void;
	public static var changeFont : love.graphics.Font->Void;
	public static var keypressed : String->Void;
	public static var textinput : String->Void;
	public static var checkAndSetCode : Dynamic->String->Void;
	public static var getFocused : Void->Component;
	public static function checkBounds(text:String, x:Float, y:Float, w:Float, h:Float, t:String) : Table<Dynamic, Dynamic>;
	public static var getFont : Component->love.graphics.Font;
	public static var split : String->String->String;
	public static var invert : Table<Float, Void>->Table<Float, Void>;
}