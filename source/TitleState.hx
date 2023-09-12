package;

import flash.text.TextField;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.display.FlxGridOverlay;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.input.keyboard.FlxKey;
import flixel.math.FlxMath;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import lime.utils.Assets;
import flixel.FlxState;

class TitleState extends FlxState
{
	override function create()
	{
		if (!FlxG.sound.music.playing)
			FlxG.sound.playMusic(Paths.menumusic('MenuIntro'));

		super.create();
	}

	override function update(elapsed:Float)
	{
		super.update(elapsed);

        if (FlxG.keys.justPressed.ENTER) 
        {
            FlxG.switchState(new MainMenu()); 
        }        
	}
}