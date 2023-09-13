package;

import flixel.FlxG;
import flixel.text.FlxText;

class MenuState extends FlxState
{
    var text:FlxText;

	override public function create()
	{
		super.create();

        text = new FlxText(0, 0, 0, "Sonic CD Haxe Remake Proof of Concept", 32);
        text.screenCenter();
        add(text);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

        if (FlxG.keys.justPressed.ENTER) {
            FlxG.switchState(new PlayState());
        }
	}
}