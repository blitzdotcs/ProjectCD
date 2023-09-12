package;

import flixel.FlxState;
import hxcodec.flixel.FlxVideo;
import flixel.FlxG;
import flixel.FlxSprite;

class SegaScreen extends MusicBeatState
{
    var video:FlxVideo;

	override public function create():Void
	{
		var video:FlxVideo = new FlxVideo();
		video.onEndReached.add(onVideoEnd);
		video.play('assets/videos/intro/2011introretake.mp4');

		super.create();
	}

    public function onVideoEnd():Void
    {
        FlxG.switchState(new TitleState());
    }    
}