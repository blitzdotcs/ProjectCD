package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSubState;
import flixel.FlxObject;
import flixel.FlxCamera;

class PlayState extends FlxState
{
    var cdsonic:FlxSprite;
    var soniccamera:FlxCamera;
	public var camHUD:FlxCamera;
    public var rings:Float = 0;
    public var lives:Float = 3;
    public var timestones:Float = 0;

    // Jump shits
    var isJumping:Bool = false;
    var jumpTimer:Float = 0;
    var maxJumpTime:Float = 0.2;

    public function new()
    {
        super();

        cdsonic = new FlxSprite(0, 0, "assets/images/SonicPlayer.png");
        setupCharacter(cdsonic, FlxG.width / 2, FlxG.height / 2);
    }

    function setupCharacter(character:FlxSprite, locationX:Float = 0, locationY:Float = 250)
    {
        character.x = locationX;
        character.y = locationY;

        var scaleFactor:Float = 0.75;
        character.scale.x = scaleFactor;
        character.scale.y = scaleFactor;

        character.setGraphicSize(Std.int(character.width));
        if (character == cdsonic)
        {
            character.frames = Paths.getSparrowAtlas('SonicPlayer');
            character.animation.addByPrefix('down', "down", 6);
            character.animation.addByPrefix('up', "up", 6);
            character.animation.addByPrefix('soncrunanim', "soncrun", 6);
			character.animation.addByPrefix('balance', "balancing", 6);
			character.animation.addByPrefix('idle', "bored", 6);
			character.animation.addByPrefix('idleLOOP', "boredloop", 6);
			character.animation.addByPrefix('jumpie', "ball", 6);
            character.animation.play('idleLOOP');
        }
    }

    override public function create()
    {
        soniccamera = new FlxCamera(0, 0, FlxG.width, FlxG.height);
        FlxG.cameras.add(soniccamera);

		camHUD = new FlxCamera();
		camHUD.bgColor.alpha = 0;

		FlxG.cameras.add(camHUD);
		FlxCamera.defaultCameras = [soniccamera];

		var bg:FlxSprite = new FlxSprite(-600, -200).loadGraphic(Paths.image('ptpbg'));
		bg.antialiasing = true;
		bg.scrollFactor.set(0.9, 0.9);
		bg.active = false;
		add(bg);

        cdsonic.antialiasing = true;
        add(cdsonic);

        soniccamera.follow(cdsonic, FlxCameraFollowStyle.LOCKON);
        soniccamera.zoom = 2.5;

        super.create();
    }

    override public function update(elapsed:Float)
    {
        super.update(elapsed);

        var movementSpeed:Float = 5;

        if (!FlxG.keys.pressed.LEFT || !FlxG.keys.pressed.RIGHT || !FlxG.keys.pressed.UP || !FlxG.keys.pressed.DOWN || !FlxG.keys.pressed.Z)
        {  
            cdsonic.animation.play('idleLOOP');
        }

        if (FlxG.keys.pressed.LEFT)
        {  
            cdsonic.x -= movementSpeed;
            cdsonic.animation.play('soncrunanim');
            cdsonic.scale.x = -1;
        }
        else if (FlxG.keys.pressed.RIGHT)
        {
            cdsonic.x += movementSpeed;
            cdsonic.animation.play('soncrunanim');
            cdsonic.scale.x = 1;
        }

        if (FlxG.keys.pressed.UP)
        {
            cdsonic.animation.play('up');
        }
        else if (FlxG.keys.pressed.DOWN)
        {
            cdsonic.animation.play('down');
        }

        if (FlxG.keys.pressed.Z)
        {
            cdsonic.animation.play('jumpie');
            FlxG.sound.play(Paths.sound('scdjump'));
        }
    }
}
