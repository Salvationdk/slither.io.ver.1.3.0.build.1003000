package gaim
{
    import __AS3__.vec.*;
    import flash.desktop.*;
    import flash.display.*;
    import flash.events.*;
    import flash.filters.*;
    import flash.geom.*;
    import flash.media.*;
    import flash.net.*;
    import flash.system.*;
    import flash.text.*;
    import flash.ui.*;
    import flash.utils.*;
    import hypah.mode4.*;
    import org.villekoskela.utils.*;
    import starling.core.*;
    import starling.display.*;
    import starling.events.*;
    import starling.textures.*;

    public class Main extends Object
    {
        var root_mc:Object;
        var stg:Object;
        var a:Number;
        var c:Number;
        var d:Number;
        var d2:Number;
        var mxd:Number;
        var d3:Number;
        var dcsc:Number;
        var i:int;
        var j:int;
        var j2:int;
        var j3:int;
        var j4:int;
        var plm1:int;
        var ki:int;
        var frq:int;
        var km:Number;
        var cm1:int;
        var snx:Number;
        var sny:Number;
        var msl:Number = 42;
        const pih:Number = 1.5708;
        const pi1:Number = 3.14159;
        const pi2:Number = 6.28319;
        const pm2:Number = 10430.4;
        var angx:Vector.<Number>;
        var angy:Vector.<Number>;
        var angx4:Vector.<Number>;
        var angy4:Vector.<Number>;
        var angx6:Vector.<Number>;
        var angy6:Vector.<Number>;
        const plm:Number = 9.58738e-005;
        var k:Number;
        var l:Number;
        var m:Number;
        var n:Number;
        var spm:Number;
        var mst:Number;
        var fj:Number;
        var sgp:int;
        var sgo:Segment;
        var sgo2:Segment;
        var sgtc:Boolean;
        var slax:Number;
        var slay:Number;
        var k2:Number;
        var r:Rectangle;
        var qq:int;
        var sc:Number;
        var csp:Number;
        var ssc:Number;
        var lsz:Number;
        var ochl:Number;
        var sep:Number;
        var wsep:Number;
        var mwsep:Number;
        public var bsep:Number = 8.5;
        var rmr:Number;
        var mr:Number;
        var om:Number;
        var am:Number;
        var falf:Number;
        var id:int;
        var snake_id:int;
        var speed:Number;
        var dir:Number;
        var ang:Number;
        var wang:Number;
        var fang:Number;
        var sang:Number;
        var lsang:Number = -12345;
        var mang:Number;
        var vang:Number;
        var emang:Number;
        var cv:int;
        var rad:Number;
        var o:Object;
        var o2:Object;
        var o3:Object;
        var ho:Object;
        var fo:Food;
        var pr:Prey;
        var po:SnakePoint;
        var lpo:SnakePoint;
        var avpo:SnakePoint;
        var bidt:Number;
        var idx:Number;
        var idy:Number;
        var idt:Number;
        var bfo:Food;
        var bfv:Number;
        var sk:Snake;
        var sk2:Snake;
        var lsgo:Segment;
        var pci:PerColor;
        var cha:Char;
        var rl:Number;
        var iiv:Boolean;
        var bpx1:Number;
        var bpy1:Number;
        var bpx2:Number;
        var bpy2:Number;
        var fpx1:Number;
        var fpy1:Number;
        var fpx2:Number;
        var fpy2:Number;
        var apx1:Number;
        var apy1:Number;
        var apx2:Number;
        var apy2:Number;
        var spx1:Number;
        var spy1:Number;
        var spx2:Number;
        var spy2:Number;
        var ii:Image;
        var pid:Number;
        var tx:Number;
        var ty:Number;
        var tx1:Number;
        var ty1:Number;
        var tx2:Number;
        var ty2:Number;
        var dx:Number;
        var dy:Number;
        var wx:Number;
        var wy:Number;
        var fx:Number;
        var fy:Number;
        var px:Number;
        var py:Number;
        var hx:Number;
        var hy:Number;
        var ax:Number;
        var ay:Number;
        var tax:Number;
        var tay:Number;
        var lax:Number;
        var lay:Number;
        var lang:Number;
        var kang:Number;
        var cang:Number;
        var da:Number;
        var oang:Number;
        var tang:Number;
        var slang:Number;
        var lpx:Number;
        var lpy:Number;
        var ix1:Number;
        var iy1:Number;
        var ix2:Number;
        var iy2:Number;
        var ax1:Number;
        var ay1:Number;
        var ax2:Number;
        var ay2:Number;
        var cx2:Number;
        var cy2:Number;
        var s_amt:Number;
        var cx:Number;
        var cy:Number;
        var lcx:Number;
        var lcy:Number;
        var ed:Number;
        var esp:Number;
        var ex:Number;
        var ey:Number;
        var xx1:Number;
        var yy1:Number;
        var xx2:Number;
        var yy2:Number;
        var xamt:Number;
        var yamt:Number;
        var sx:int;
        var sy:int;
        var xx:Number;
        var yy:Number;
        var nx:Number;
        var ny:Number;
        var ox:Number;
        var oy:Number;
        var rr:Number;
        var gg:Number;
        var bb:Number;
        var aa:Number;
        var aa2:Number;
        var bgx:Number = 0;
        var bgy:Number = 0;
        var bgw:Number = 256;
        var bgh:Number = 256;
        var bgw2:Number;
        var bgh2:Number;
        var mww:Number;
        var mhh:Number;
        var mww2:Number;
        var mhh2:Number;
        var sso:Object;
        var sso_lsmtm:Object = -1;
        public var is_mac:Object = false;
        public var has_generic_share:Object = false;
        public var iaps_enabled:Object = false;
        public var ads_removed:Boolean = false;
        var mouse_is_down:Object = false;
        var my_nick:Object = "";
        var mtx:Matrix;
        var mtx2:Matrix;
        var ctf:ColorTransform;
        var dfctf:ColorTransform;
        var ectf:ColorTransform;
        var smtx:Matrix;
        var sh:Shape;
        var g:Graphics;
        var sh2:Shape;
        var g2:Graphics;
        var sh3:Shape;
        var g3:Graphics;
        var sh4:Shape;
        var g4:Graphics;
        var sh5:Shape;
        var g5:Graphics;
        var p_sh:Shape;
        var p_g:Graphics;
        var ew_sh:Shape;
        var ew_g:Graphics;
        var bm:BitmapData;
        var bm2:BitmapData;
        var bm3:BitmapData;
        var bm4:BitmapData;
        var bm5:BitmapData;
        var bm6:BitmapData;
        var bm7:BitmapData;
        var bt:Bitmap;
        var tbt:Bitmap;
        var fl:Object;
        var fl2:Object;
        var fls:Object;
        var ww:Object;
        var hh:Object;
        var aww:Object;
        var ahh:Object;
        var lfr:Number = 0;
        var fr:Number = 0;
        var ccfr:Number = 0;
        var lfr2:Number = 0;
        var fr2:Number = 0;
        var frb:int = 0;
        var lfrb:int = 0;
        var vfr:Number = 0;
        var vfrb:int = 0;
        var vfrb2:int = 0;
        var ctm:Number;
        var ltm:Number;
        var cptm:Number = 0;
        var lptm:Number = 0;
        var last_fake_snake_creation_tm:Number = 0;
        var allow_violence_after_tm:Number = 0;
        var lspfmtm:Number = 0;
        var lcfsbtm:Number = 0;
        var lfhsutm:Number = 0;
        var last_ping_mtm:Object = 0;
        var lagging:Object = false;
        var lag_mult:Number = 1;
        var wfpr:Object = false;
        var locu_mtm:Number = 0;
        var last_accel_mtm:Number = 0;
        var want_e:Boolean = false;
        var last_e_mtm:Number = 0;
        var force_game_scale:Object = 1;
        var built_game:Object = false;
        var all_layer:Sprite;
        var game_layer:Sprite;
        var gameholder_layer:Sprite;
        var bg_layer:Sprite;
        var food_layer:Sprite;
        var food_batch:FoodBatch;
        var food_batches:Vector.<FoodBatch>;
        var any_regenerating:Boolean = false;
        var has_moving_food:Boolean = false;
        var moving_food_batch:QuadBatch;
        var fbrc:Object = 0;
        var snake_batch:QuadBatch;
        var snake_add_batch:QuadBatch;
        var stats_layer:Sprite;
        var victor_batch:QuadBatch;
        var highscore_batch:QuadBatch;
        var length_batch:QuadBatch;
        var login_layer:Sprite;
        var bgballs:QuadBatch;
        var skin_layer:Sprite;
        var settings_layer:Sprite;
        var arrow_batch:QuadBatch;
        var arrow_add_batch:QuadBatch;
        var final_text_batch:QuadBatch;
        var bgbs:Object;
        var bofa:Number = 2000;
        var nick_w:Object = 180;
        var nick_h:Object = 50;
        var nick_input_mc:MovieClip;
        var nick_tf:TextField;
        var tft:TextFormat;
        var victory_w:Object = 530;
        var victory_h:Object = 50;
        var victory_input_mc:MovieClip;
        var victory_tf:TextField;
        var vic_ph:Object;
        var btns:Object;
        var down_btns:Object;
        var logo_ii:Image;
        var glx:Object = 0;
        var gly:Object = 0;
        var aglx:Object = 0;
        var agly:Object = 0;
        var glr:Object = 0;
        var gvx:Object = 0;
        var gvy:Object = 0;
        var gvx2:Object = 0;
        var gvy2:Object = 0;
        var glm:Object = false;
        var starfield:Gaim;
        var fps:int = 0;
        var nfctm:Number;
        var lmtm:Number;
        var want_close_socket:Boolean = false;
        var want_victory_message:Boolean = false;
        var want_hide_victory:Number = 0;
        var hvfr:Number = 0;
        var ptc:int;
        var iivc:int;
        var dgsc:Number;
        var shake_ang:Object = 0;
        var is_air:Object = true;
        var screenWidth:int;
        var screenHeight:int;
        var viewPort:Rectangle;
        var _starling:Starling;
        var rendering_paused:Object = false;
        var current_touches:Object;
        var touch_regions:Object;
        var last_touch_mtm:Object = 0;
        var ltxx:Object = 2147483647;
        var ltyy:Object = 2147483647;
        var texture_sheets:Object;
        var sprite_textures:Object;
        var textures:Object;
        var had_textures_before:Object = false;
        var src:Sound;
        var snt:SoundTransform;
        var bgb_t:Object;
        var bgb_ii:Image;
        var lbg_t:Object;
        var lbg_ii:Image;
        var border_t:Object;
        var border_ii:Image;
        var logo_t:Object;
        var eye_t:Object;
        var cdbulb_t:Object;
        var acbulb_t:Object;
        var antenna_segment_t:Object;
        var jsebi_t:Object;
        var jsepi_t:Object;
        var ksmc_t:Object;
        var kmc_ts:Vector.<Vector.<Object>>;
        var kmc_add_ts:Vector.<Object>;
        var eye_ii:Image;
        var ksmc_ii:Image;
        var kmc_iis:Vector.<Vector.<Image>>;
        var kmc_add_iis:Vector.<Image>;
        var jsebi_ii:Image;
        var jsepi_ii:Image;
        var cdbulb_ii:Image;
        var acbulb_ii:Image;
        var antenna_segment_ii:Image;
        var antenna_width:Number;
        var changeskin_t:Object;
        var playonline_t:Object;
        var playoffline_t:Object;
        var removeads_t:Object;
        var restorepurchases_t:Object;
        var settings_t:Object;
        var sbg_t:Object;
        var sbg_ii:Image;
        var sfa_t:Object;
        var sff_t:Object;
        var sfj_t:Object;
        var sfa_ii:Image;
        var sff_ii:Image;
        var sfj_ii:Image;
        var arrow_t:Object;
        var arrow_ii:Image;
        var arrow_add_ii:Image;
        var next_t:Object;
        var next_ii:Image;
        var fing:Finger;
        var fingers:Array;
        var finger_count:int = 0;
        var had_fingers:Boolean = false;
        var cur_finger:Finger = null;
        var boost_a:Number = 0;
        var boosting:Boolean = false;
        var boost_touch_id:Number = -1;
        var double_tap_accel:Boolean = false;
        var control_touch_down:Boolean = false;
        var control_touch_id:Number = -1;
        var minimap_t:Object;
        var minimap_ii:Image;
        var boost_t:Object;
        var boost_ii:Image;
        var bsx:Number;
        var bsy:Number;
        var joystick_bg_t:Object;
        var joystick_t:Object;
        var joystick_bg_ii:Image;
        var joystick_ii:Image;
        var alert_t:Object;
        var alert_ii:Image;
        var alert_v:Boolean = false;
        var jsx:Number;
        var jsy:Number;
        var mmx:Number;
        var mmy:Number;
        var flippa_t:Object;
        var flippa_ii:Image;
        var flipped_controls:Boolean = false;
        var myloc_t:Object;
        var myloc_ii:Image;
        var btnleftup_t:Object;
        var btnmidup_t:Object;
        var btnleftup_ii:Image;
        var btnmidup_ii:Image;
        var connect_spinner_t:Object;
        var connect_spinner_ii:Image;
        var chars:Vector.<Char>;
        var chars_lh:Number;
        var chsz:Number;
        var at2lt:Vector.<Number>;
        var dist16t:Vector.<Number>;
        var sqrtt:Vector.<Number>;
        var bgp_t:Object;
        var bgs:Object;
        var playbtn:Object;
        var offlinebtn:Object;
        var sharebtn:Object;
        var skinbtn:Object;
        var extrabtn1:Object = null;
        var extrabtn1_a:Object = 0;
        var extrabtn_click_url:Object = "";
        var removeadsbtn:Object;
        var restorepurchasesbtn:Object;
        var csrab:Boolean = false;
        var raba:Number = 0;
        var settingsbtn:Object;
        var settingsokbtn:Object;
        var sfabtn:Object;
        var sffbtn:Object;
        var sfjbtn:Object;
        var prevskinbtn:Object;
        var nextskinbtn:Object;
        var skinokbtn:Object;
        var savemsgbtn:Object;
        var gsc:Number = 1.01;
        var sgsc:Number = 0.7;
        var grd:Number = 16384;
        var grd98:Number;
        var per_color_imgs:Vector.<PerColor>;
        var rrs:Object;
        var ggs:Object;
        var bbs:Object;
        var max_skin_cv:int = 38;
        var rank:Object = 0;
        var snake_count:Object = 0;
        var os:Object;
        var foods:Vector.<Food>;
        var foods_cm1:int = -1;
        var preys:Vector.<Prey>;
        var preys_cm1:int = -1;
        var points_dp:SnakePointDeadpool;
        var snakes:Vector.<Snake>;
        var segs:Vector.<Segment>;
        var sgc:int = 0;
        var total_foodz:Object = 0;
        var nfps:Object = 0;
        var sbic:Object = 0;
        var sectors:Object;
        var sector_size:int = 480;
        var spangdv:Number = 4.8;
        var nsp1:Number = 4.25;
        var nsp2:Number = 0.5;
        var nsp3:Number = 12;
        var cst:Number = 0.43;
        var mamu:Number = 0.033;
        var mamu2:Number = 0.028;
        var lfc:int = 128;
        var lfas:Vector.<Number>;
        var rfc:int = 42;
        var rfas:Vector.<Number>;
        var nfc:int = 102;
        var nfas:Vector.<Number>;
        var afc:int = 26;
        var afas:Vector.<Number>;
        var hfc:int = 92;
        var hfas:Vector.<Number>;
        var vfc:int = 62;
        var fvpos:int = 0;
        var fvtg:int = 0;
        var ovxx:Number;
        var ovyy:Number;
        var vfas:Vector.<Number>;
        var fvxs:Vector.<Number>;
        var fvys:Vector.<Number>;
        var orl:Number;
        var snld:Number;
        var snlj:int;
        var snlk:int;
        var view_xx:Number = 0;
        var view_yy:Number = 0;
        var lvx:Number = 0;
        var lvy:Number = 0;
        var view_ang:Number = 0;
        var view_dist:Number = 0;
        var fvx:Number = 0;
        var fvy:Number = 0;
        var xm:Number = 0;
        var ym:Number = 0;
        var lsxm:Number = 0;
        var lsym:Number = 0;
        var protocol_version:int = 2;
        var control_mode:int = 2;
        var snake:Snake = null;
        var snake_wmd:Boolean = false;
        var snake_md:Boolean = false;
        var choosing_skin:Boolean = false;
        var ending_skin:Boolean = false;
        var cska:Number = 0;
        var hiding_settings:Boolean = false;
        var settings_shown:Boolean = false;
        var stgsa:Number = 0;
        var twang:Number;
        public var final_score:Number = 0;
        var dead_mtm:Number = -1;
        var want_ad:Object = false;
        var wumsts:Boolean = false;
        public var flt_a:Vector.<String>;
        public var flt_g:Vector.<String>;
        public var flt_w:Vector.<String>;
        var mscps:Number = 0;
        var fmlts:Vector.<Number>;
        var fpsls:Vector.<Number>;
        var etm:Number = 0;
        var etm_mults:Vector.<Number>;
        var lb_fr:Number = -1;
        var ws:Mode4Socket = null;
        var connecting:Boolean = false;
        var connected:Boolean = false;
        var start_connect_mtm:Number;
        var waiting_for_sos:Boolean = false;
        var sos_ready_after_mtm:Number;
        var playing:Boolean = false;
        var single_player:Boolean = false;
        var jcfr:Number = 0;
        public var allow_ads:Object = false;
        var sos:Object;
        var clus:Object;
        var bso:Object = null;
        var promo:Object;
        var promoh:Object;
        var promo_click_url:Object = "";
        var promo_a:Object = 0;
        var promo_ang:Object = 30;
        var promo_sc:Object = 0;
        var promo_visible:Object = false;
        var promo_dying:Object = false;
        var promo_sw:Object;
        var promo_sh:Object;
        var promo_scatm:Object = 0;
        var promo_catm:Object = 0;
        var promo_close:Object;
        var promo_close_a:Object = 0;
        var promo_lmtm:Object;
        var has_ads:Object = false;
        var is_android:Object = false;
        var is_kindle:Object = false;
        var is_ios:Object = false;
        var final_build:Object = false;
        var fake_names:Object = "Bumba`nick26`jjjjj`Rigor`meow`cookie `HAHA`Meep`paige`tico`Donald`Wander`dmcjjebdgdhwhrjjeei`Wormy`hit a home run today `I don\'t wanna kill`ajlaaaaaaaa`Loser`bg master xNx`Miguel`MAZORCA`Otto the Otter`Zombies32`lc`nom nom`Juega German`yum yum`djdjdjdjdjdjd`hi`tonyotag`gg`cuty`mota`MasterLeo`ike`Kyle`YOLO`ooooooh noo`brynna`ROOMBA`Jay`Christina `fire`lizabot`GLITTER BUTT`Nub`YUM-YUM `the master`missdee`Fuscao`ouchie`poma`Said`seek`livia`lol`ant`brett`SARAAWESOMEFACE `DOOM`MustachioMan`PootatoQuee`Layla`anaconda`gdf`daplug`lol everyday`fart`HELLO`master ov`dangerous woman `hsjsgihiehreuryu`Kunshiwa`tootie`shrimp flipin`Jillian`fartie mcfartersen`Peeps`List Of Noobs: `gage`abel`savage`i taste like poop`HIURDELYN`jibberish13`bob`YA BOI TYRONE`o()xxx():::::::::::::::>`GOKU`consumerism`AbusamadresjONES`Quicksnake`tee`M E G A S N A K E`you`IDon\'tLikeTheOneEyedSkin`Mister Snake`tinySATAN`The Lambo aid`maggie`XKENNEDYX`Jareds Box`Plumbing Snake `dsa   `R`McDillius`bubble buns`fufufu :3`Snakey McSnakeface`iNFeCTioN`mole`Pope`Yolllps`Zam`Chameleon`hero`Alien`snake of d00m`Seymour`firecracker`i like rice krispies`andrusha`JEPEDEAR`ToeJam`Fungii`ali`matthew`Darwin`Bozo`h3h3                    `kitkat`DONT TOUCH ME`Amek`Dexter`Hypnotizer`Retrobug`the_one_who_knocks`DancingBlueBananas`yes`jotham`weasel`Critical`KING OF THE SNAKES`RainbowDragonEyes`KOSME`Kaspa`clevel`Sarah`Iron Chef`Goose`Avroceptyr`Nimble Navigator`sabina`channing`cow`elite`CJ`wire`Matrix`Hey`miranda`phish`Lucky`Bounty`jgamer`Rebound`Emmitt`LyriX`Panda`Brianna`calvin`mystical`chelle`bot`Filth`Kuavos`slacker`fabian`Toonfirst`sarx543`jjpp<3`rboss`emma`lolipop`the big one`AWESOME GAMER`PARAGONIMUS`Saul`leave me be`Matt Damon `Gianna                  `lexx`nico`bh`Kady`sam`avie`Hank`Big Dog`korea`snake sniper`Espio`v5fdffi`Bum`Sloth`the dude`p`radial floral`Han Solo`JuliaPlayz_`mag`Leo`j3nnif3r`Shriek`germ`beavis`cpt dix`hhhh                    `jtanner `Karen `God Of Worms`kozok`Hodor`Snake That Grows`JOJO`Jvous decalis`King of worms`hgcya`Antani`what what`tyler`whatever`little snakey foo foo`hi`Donald`Carlos`moonowl`frieza`Thunder`cookie`RAPTORS WILL WIN`yoyo`Gumby`hola`Cook111`Anaconda`Amen`Texas`WHY.`melodia`$mira$`Chriz`\'~\'`sammyfireflames `hong kong`master`YOLO`Amerifreedom`oli`Matt`Alli`hun`Savvy Snake`p2`Seth`Babe`WATCHU SAAAAY`Alexis `jj`LUDOPATA`Kwebbelkop`you can eat me`5151`Mcnugget`Miami Heat`Akuma`let\'s team up`Joe `wicked_killerklownz`gdfgf`FlyBoiMann `hi                      `100% AWESOME `spare me.. i have kids`Ry`Priscilla`Mando`rooster`Erin`SAVAGE`King Kong MF`kop`k`cass`DEEZ`I love monkeys`Kylo ren is mine`boss`yayaya`king`Rotton`sabeina`mm7games`friendly worm`Wormie Sanders`Wormie McSquirmie`ouch`watch out, i bite`USA`Cookies4Life`top cheese`hazzzzed`Tatirannosaurus`afffffaaffafffffaaaafa`Dheklin`Emma`SWEG`Brandon`mia`I. DO NOT. CARE`ava`hdjid`Mustachio`sochi`M A D I S O N`GINORMOUS`QooL`omnomasouras`premium munch`Bridget`Surge`Blak`Fulcrum`Tagger`live`lunatic`jojo`Axe Capital`pro gamer`skunky`binary`Ammo`Blargle`death is inevitable`Ariel`BONE`Ambient`Deep`monkey`panic`simon!`i like drums`dutyrhgfdg`Gradient`Goron`myke`CAT POOP NINJA`Freakin\' worms!`Happy`Dakota BH`Vernworm`Scribe`I love this game`Lucifer`murdoc`Snake Muncher`ender`logan`Pepe`Viper`Mikey D`Dawgg`Sticks -N- Stones`KittyKitty`Neuro`hello`Pocky`Hoyle`Sn0w Dr@g0n`Lex Luthor`Elite Mac`Blaxors`BaRt`ADIDAS`Mercy`THE EMPEROR`NeoN`Babyzan`Ground Zero`arvo`Hotwheels`Ally`alyssa`u wot m8?`Tcoy`Jlabbot`Sonic the Snakehog`qwerty`junior`pro+}`flip you`Jane Doe`SnakeFace Killah`robert`pie`Dirty Bird`Paint`WASP`LUCKY`DEMON`smack`wacko`nine`Bronze`Kane`Paco`Mancow`Surucucu`Maholic`Becky`BananaPro`JeNNoCiDe`ZeaL`Zeno\'s Paradox`lex`m8`boris`Wamp`Pink`please be my friend`Rusty`Bud`DoE`Nazgul`COOKIE`Couz`Dazed`HUGo`atomic`fireblade ffirfireblade`FoXX`poopsnoot`Cole`wayoooo`Myst`see you in my stomach`[=- ivy -=]`JAK`Overlord`zig-zag`kakapo`broham`Fetus`Ceaser`Loki`Bobby`yvon`Bama`Christie`el scorcho`one dolla snake`The Storm Surfer`Chubster McDaniel`Buzz`Dude...Seriously??!`twenty dollar peanut`Booka`Asassin8er`Ogre`Oxide`Peon`;)`galit`Clown`Cain`Roman`nanii_is_here`shell`Enderegg336`[MG] masterov`nikki`Sophia`Ju`cameryn`kmass`West Broom Albion`poo`get off me`shaggy`Ledesma`Brou`meechydanko`J`cat`Crystalision`homer`kat`no gods`best game eva`bleach`jellyYT`Make Circles around me`me`Don Worm`taz`tengo hambre :v`fun`baby`Schuy4`CHARA`lib`slither!`wtfffff`Timmons`pj`goku`beerninja`what ever girl`Athoo05`[MG] OvDoom`ljflagg`Orange Extreme`ricky`123`why me?`elrubius`catsnake`amigo`LeMax`Jc`Loading...`slurpie`Trent`demention`Bane`SpOt`flanken`foolio`THAT SWEDISH SNAKE`H a c k e r`Miss Cleo`mouse`GabriellaGabriel`duddy`CGGGGGHGNJGHJYJYJV`Hype`Caustic`i will kill you >:O`axe`plasma`Pandora`Shilo`Federal Agent`atom`Erik`Cube`frog`Cypher`Optical`Glory`Fish`Markiplier`Krynn`Usher`come to me`Fairweather Foe`gooby pls`Candice`Justin Bieber (real!)`Homie`Special Snowflake`Wojak`MuSuC`ICE`ashlee`ri`Tator`rosa`erickchelo`pablo`I\'m Massive Mate`ELIAS`FREE food to help out`I\'M THE BO$$$$$$$$$$$$$$`dad`Superswaglez`big`[MG]masterov`MarMar`SpiderGwen`DIRTY`Mad Max`Press W to team`shadow`bebe`I\'ll be #1 watch`hippo`fdp`--------`lll`Kamakaziiiii`kb`Badger`andres`hutch`manuman`tnjsjdj`do0d`Spot ON`let me eat u`slitherioguy`kaki`Kat`TNT`Becca`supriseme`Protoman`dannifood4Less`Clark`spooky`The Chose One`crack`M.ov.f`midget`fred`gianna`fanitta`septicgirl`dub step`=]]]]]]]`2/22/16`lissss`adem im so in love w u`Dave`PEACHES`JB`ogmudbonew`aTTention Paid`bernie`spare my life!!`ABODZ`slither Jim`jajaja`cactus`Oklahoma`Pooptart`SlitherA1`gleen`boggs`the  killr`kj\\`Mattie R. H.`Claude`blue1`carobu`cube`evelyn`hila`elias`fffs`maikol`hey`en`Trayvon`adam`Blaze`rscott782 `Tom Riddle`CHINCHILLA`omgomgomg`CPSP`STEW`NOW U DIE!!!!!`rommm`dishes `SHOWTIME`xbox`elastoworm`I\'m hungry`yolo`strong snek`names`Juan`Quake`Zoe`snek`your lady`thion greyjoy`wowza`Phunk`TDub`the cutest snake`frost`Alejo0313`Quebec`mo`ally`TheLordOfSkis`Adam`slimy`BoB`meBigworm`squirm`Mr. Pickles`rsj`Doom`paygo`autumn`levi`amor `Tidal`Destined to be #1`lokening`KrAzY`moot`Cord`happy`Cut`eat`the ol\' spicy keychain`MaYa`Omega`boy`Fly`Inferno`Brotherblood`I\'m vegan`THE WORMINATOR`Jo-E`khott`Fury`Bioten`Lulua`Popcapps`Neuf`sleepy`I\'m Mexican`john wayne`SAM`kj`nanner`LadyGiggles`ghf`Morpheus`H20`YES`SERGIO`Lea`Devil`marie`Photon`Mad Girl`I\'M A RAINBOW`bb8`Faux`Snake Herder`vertigo`Shaq`Dirt`Milk`Mystery Vortex`Huge Mother`Dang`boi`..I..`bells`gchjhkbkl`Pomka09`krystamisseszackkk`j`SWISHY`BOSS LADY`demon`The Top 1%`pui`Tricksterette`hogo`bbc`<3 AleDA <3`spenaso`Ricky is my friend`(TORLL)clan`Taco`Madres`richie`Lightning Bolt`Keelie`NO`rawr`o`TYPICAL GAMER`DODI`Apollo`chandisnidson`pro`Warrior`heheheheheh`ddd`Elwood`bo`CarLie`pop`abol`zeke`[EPIC] LagsterReborn`DOMINO`DarkAngel\'o\'Light`M741`toad`Beaver`SHARP`Aqua`blue`Anita`BoBB`kitty :3`Phun`Dark Destiny`Detox`Fire`Blew`jada`MrsDelgado `Bliz`why`Phreak`Admin`Cue`Don\'t test me`Nick`Bruno`xoxo`fart07`Chow Time!`yeboy`Guatemala `crow`sthilly sthnake`gym`aylin`kenny`matt`fernanfloo`yjhuhuu`Zero`Brady is my bro`comame!!!`Method`pd`kc`hungry snake`$sss`aries`dat boi`Cyco`lithium`Dolo`ick`laura palmer`KJ7`big angel`TrueBlue`extreme danger!!!`bill`gambino`[MG] Master`TheLazerTurtle`I hate you little worms`peaches`AlaskanBullWorm`fblmk;gnfjmnthko;fgbnd`gabby`ball is life`Slash`Loco`TRAPPED`Mounstro `Leviathan `SuperFaustone`Dont try it (Warned)`doc`Merica`hfh`I lag`tori`PooPoo`samuel`mick`Boldar Blood`King`ExtraTerrestrial`greatestwormintheworld`usher`OG Kev`ayy`Xiao Shu`please leave me alone!!`Vote for Pedro`Matuhka`Let\'s try this again `YM`Voldemort`don\'t touch me`KOFIII`u2`Babou`Nana`vinny`bdsusjsjdwj`emily`[MG] For you `:)`LeGPig`nick`gold nuggets `Karley kill u--->`MANDOLIN`L`My dame`james`YOU WILL DIE!!`Sulk`Dolphin`Mazy`raay`sra7794`abbey eats poo`i like turtles`hola`WWW`Snake from state farm`Jake from Snake Farm`Drake from Snake Farm`Jose`MockingJayCR`bite me `khoa`Hannah`Yana`REVENGE`FEED ME`grandma`Skyler`OhFarts`Nickname `tashi`ps900`MasterOv`duke`skyeler`joey`must`DRAKE THE SNAKE`awdawdlsom`slider`m`catch this shade`2lift`tom`cinthya`Ardabil Iran`mam `Kops`Sammie `Launcher`Daf`steel city`Habu`one punch`Franklin`11.6.15`middle of the map`cesauce`Euvel`gosma`emstars10`Maraa`im from atlanta`Im a noob`GraceTyler_07`killer`lissssa`ayyy`Sardean`die everyone`el mas loco`bennie`brandon`po`t55r`Thomas`A`ayy`Searching...`eattherich`JOSH`bit h`you <`Sam`Ima eat everyone`alexander_jbwkz`color`World Records`bean`Shut`king bach`ryanh`kas`Aizlyn`Mac`Cindy`aaa`ugh`Fonsy\'`Pig`Si`Mantwawn`City Of Lights`Federer`humming`im eating an apple`Big D`kaybae`joshua_the_SlayerZ`jonyboy12`$$`briian y diego`ALA`Osvaldo`van du`Can\'tKeepMyScales2MySelf`StanTheMan`peppa pig 10`the Stepup`spicy`Molotov`bryan`not today satan`Ssssssssssssss`Ginabella`AeroRanger100`Redbull`FeedMeBrothers `Rudy`Fernando`eat me`oh piece of candy`khan`Domo`dee`Juan `asdfghjkl`beep beep beep beep beep`jawith`peaches`uncharted`DFD`qwety`nub`actual trash`issac`Japan\'s `BUSTER`Herb`the new one of the world`Banana`frtholikefr`L A V E N D E R`andrii`lance boulderman`LUKE`SEU-JOOJ`Optik`DANGEROUS WOMAN`Puff Daddy`Cobra Commander`malindette`dasher`i grow big`$`moe`daddyO`||LOSERS||`peabody`damyan`Hi`Grave`Billy Jo Yates`Gigantor`Bunny`look at all them worms`henker`rabbit`el chapo`opal`quebec`hello!!!`ben`Pat`pb`Iosif`Katelyn`AlphonseElric`tryme`xxlarissajoyxx `OSCAR`SHUN`y`Princess`doodles`Defalt`Pathetic Attempt`mm`RattleSnakeJake`1st`LILUZI`stacy`Child\'s Play`Grant`djyonce`spy kid 101`albino`PLEASE DON\'T KILL ME`KOBE`G`ttt`dnuts`buttt`lrv`Teddie`special slithery editon`(s)laughter`mjk34`Jonnybananas`the maw`beep beep`teto`fofo`FELIX VARGAS`rt`Pokin Scrote`pmonk`haan`zzz`wake me up inside`jack is poopingggg`please let me get #1`Viagra`going for 100k`rrrr`owen`randdles`SHASH`crushers secret layer`JakeFromSnakeFarm`Breeeeeeeeeeeeeeeeee`Kota\'s babygirl`lpo`ghzella`8))))))))))))))))))))))`nu`Byahh`cdubs`haaha`pork`tericat`trish`jimy`yung KD`poopoopoopoo`2193`ole`Elan`kolbae`blackwidow`Cordarrel`Kamiikaze`The Beast`mts the king`team?`DON\'T EAT ME!!!`Mayberry`hi your dead`hex`sunshine`Jayden`hungry`WigglyWoo2`951`ja12`korebobjfgj`boossLOL`Nervada`savon`My X`jack`osva`Donut`Matthew`Jobe`get out my way`F caterpillar`QB`I dont like you`Sarah`uto fastnn`jollyjt`Hollywood Undead`paynetrain`ang`SSundee`barbjoob`gee`am`sula`FrenchWolf`Wallynator`harvalousk`Majestic`HODOR`jhjhb`jun`kitty`EAT THIS`EVERYN`1819`kghjnj`og`WILDCARD`cool dude`don\'t touch me!!!!`amirrr`Dang Daniel`dd`watch it!`noice`Hisssss`Moss`goku`tmr`bams`Fabian Gamer`shonny`nike`money18`ladymap`Guac Bowl Merchant`Kiss`Gunnz`Clone`W R A P P E D`bluto`DueX`ksi`cheshire`Croz`I am SLOW`Paste`friesB4guys`Snoop`reeeeee`Jaffar`ormi`Arrow`Airwalk`Spaz`sk8 or die`Milton`john`Husky Wolf`Chazite`Evan`Romeo`Boston`Nate`cash`sdfa`the great gatsby`Flip`princess`Wolfgirl`zombie`Bookworm`fiAscO`eli`hp`Pikachu`\'Murica`jepe`help :\"(er`awesome`Bernardo Sanderinos`momma bear`no`Ashley `barbies`IDA`Suh Dood`?`24`gwenie`Filter`Duane`tyler durden`Dahlia`red`stop pickin on me`_Cubed`Boss`pat`momo`DewLight`yara`Zira`SOMFAFSZV`Dio^-^)/`tamalero`TheAngel`Amirah`coldplayisthebest`Rose`jed`noticemesenpai`Josh`bDigital`potus`bsoo`be`carolina`mmm`fhrurir`Snow`rosuko`x`The TURK`Earthworm Jim`hello`[Hero] mimi27`yhhhh`soph`yeeaahh`M`sssssssss`carlos`lil cee`Arash`Crazy`Carson`geo`AniyaHearts`1124`alo`Varamond`ob1`Dip Dizzy Wizzle`Ferris Bueller`big worm`dooda `Slice                   `bessy`Brisk`Bomber`LaMeR`don\'t hurt me :(`Aeon`overnighter`the rat`major gains`Liz`JamesTheWormy`Straight Edge`Lola`skyclops23`mayk`ysnake eyes`cleanup crew`Jim`chelo`Cheese`FEAR ME`MissThugOlfe21`Kik me Excel782`Lil\' Worm`Chet`Dizz`Czibor`flying mint bunny`JAY JAY THe BREKFAST`that guy`Endo`kwik`Vato`Jester`mom`a`Lego`Marvin`aglel`Tadpole`\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"\"`nummy `Jweezzy_707`JAO VITO`Touch me and your Cursed`big haus`TV`dock`Mr. Daddy`hill`Stivaly`ONYSHCHAK the destroyer`For Every Kill I Rise`Prismic`suppp`Danilo`Sc:AFly.99`teejay.caban`maldo`Atari4600`huhu `boop`Poptart`You will die!!!`Diaz240`girl`JohnCena`concon`Memo`THN`these worms are gross!`ghjhvbj,nk.`whiplash`yess`Zoomer`Mangel`[AG] 123`youtube is life`iFlxsh`105`Smooth Operator`yep it\'s me again...`Trolling`nuthing`katun`H`Max Mad`boo`KLL`lj`kwebbelkop and jelly`nae`Ayam:V:V`woof`ganda`jace`dj`Dantecg`julienne01`jax`lovely`Pink Sheep loves me`^_^`tre`elefante`herman `fkboy`tril for`yup`b`qqqqq`American`Petra`spawn killing=no no`Pa3`ponman`loud fart`tay`Raging noob`twisted`Marroz Is Goddess`Big Daddy K`bkmzc44`robe`Chase the hacker`PIVOT`TEHRAN`YOU CANT READ THIS`JonnyX`kill me`helena`sookie`TOP TEN LEGGGOOO`Logic`runt poop`fux`Whacking Day`naomi`DA BEARS`too big too quick`STC IS THE GREATEST!!!`Cor`Cap`Pumba`PANDA`cheemers `N`clau`the void`erika`bubbyeee`Smuufy`Allie`A/N`steelers fan`emcclana`workwithme`omid`nine mil`Terminator`Keez`yo mama`POOP`Cody`crystal`hoi`dirtykiller`hmatanza`BRENNY`joeytwist1up`Jok`Heguasa`kau`soolak`sodium`EyeGor `timmm                   `Zero Bytez`joh`-shadow-`BAZOOKA666`saahar`Run for your life :]`Feel the BERN`Tsunami`jae`wenom`Minhchie`(MG)masterOv`AJ`BUD `subscribe to Kei`Nintendo`MOFO J. BACON`Nimbus`TROLOLOLOLOLOL`bool`Got a Bern in my wallet`Ashez`qp`Delegato`Domhnall`Kevin`oscar`TREMOR`OOOOOOOOOOOOOOOOOOO`im nice, dont eat me`Adidas NMD_R1`joel`try me`brekkan`vvvmmm`LTHV`Bernie`O`skin suit`Rooobells`K I N G   S N A K E`ANDREW`AstroNestSpicaSOMLynx`game of worms`meep`Broby`get rekt noob`Medeiros `Bad Driver`Trapper`syd`daka`slithery`crzybvr`liquid`lel`I like you`ninja`RAYRAY`Cache`FaCe YouR FeaRs`Delphinio`Cool Snake #1`piggy`DEWEZ`Dokdo = Korea`Angel`Dicey21`fat mike`YAY DOTS`Hydra`basher`im a noob :(`Arlene`Chaos`Jeffrey`jackal`holier`agbd`D1`Ape`uhhhh`sf~:,39`justin biebier`tasty soup time`Bernie Sanders`caos`Joker`KING`dirge`liv`Taylor`Scrubs`LILWORM`miz`ag`Bluefireify`Mal`0`Xiikiitop`Meli`NEWRECORD`Nhao\' Vo^ Kiem\' An!!!!!`arda`sosa`tina `wojtek`Gauntlets gaming`bad luck `cris the bAller `macbeth`Hobbes`Don\'t  please`Toxic`swashbuckler`pab0`Hax`big snake`041mike`tri $ta`...oooOOOooo...`NOM NOM NOM`Sephiroth <3`BekaWolf`#1`SADRAZAM`Acid`Bob`Spawn`ChunkyyEyes`Mecca`try hard people in game`wilsnakeon`@----(------>`HI HOW ARE YOU?`fair `an`canada`itsAbig1`avocado`eyeball`poop`Alejandra....`he\'ll no`YOU LOST`Yellow!`timicc`ep`khaleesi`[HERO] PURPL3 KITTI3`rr14`Doctor Snakeberg`I RULE THE CENTER`bubb`JC`Ctrl`mendingo`Pete McPython`moali`Merticus`HellDoor`Darude - Sandtorm`emotion girl`Blo`turk girl`Sad worm`nom nom nom`Big Dough`bop`Blazer`c`please clap`@$&@.....`Sick`gg`Lana_Del_Snek`aj`Flare`proud alfalfa`LJ`Nightmare pig`:3`b eatn u`.`jacob`veer`NAIMAN`SNAKES`INDIA`ACUV6`gizmo`oh hi`last one`toto`iluu`smd`champ`jvalles`GSG`sine wave`asdfjkl;`MAGz`kirbyt`MAF`Scavenger`help`twobabyducks`Hotshot_______7`maicol_504`Baz`i love slither.io`Zebo`Oz`new`vuj`Rubinho`CccCurtis`hjbjnkhbkhvkhvjhviycuvjv`Eriq`grrrrrrrrrrr bark`hungry hippo`DantBOi`Jride`MASTER PO`SnakeInEagle\'sEar`ni`ayo`deez nuts`Snake on a 2D plane`bruce`serbia idemooo`Akif tutus,`DK`Tony Blacks`hsjfnfnakfndnskfbfnnfnj`sorry mom`el jose`Jaynerf`zmijaaa`El piton`Romik`MadeYouSplit:D`Erik<3`Dane Chris`cough`Kobe`Chase`el salvador`Nitrous`Lorde`dami`Q-Tip`R.C.`Nexus`call your parents`fuzzy snake`grim reaper`guru`newbie`lily`Crossfade`owwie`Brad`Apocalypse`Cameo`Andrew`kid`AT&T `niuB`marie <3`Putin`Soul`Flava`Hopsin`wormy`hold the door`Jesta`PopularMMOs`da preacha`Ashy`[HERO] Rockhound06`lisa simpson`jUMBO`~!~!~42GINGRSPICE42~!~!~`tori_ann1`Glitter & Doom`Ryan `Kanye West`fff`udara`views`TIJUANA MX`Elsa `k patel`Moodie `voss`WarZ0ne`jjj`BI BI BI`SUMADREHPTA`Siam`arcadego`MMatixo`tuou`What A GOD`EUGENESAGAZ`HOLD THE DOOR`tung`peluuka.gram`Raps in 6`ErtErtErtErt `DevilPhart`EatUm`NOOB`Haze`Mute`ruthless`omen`jeppe`killer`ToxicFlyer`irmuun`eh`ELi`peachtoad`BMW`Az`Drake`Ebby`kaan`runnnnn`great game`sasasasasa`chunk`Paulo`mop`nadiacraftt`henk`Lk`bigydargan`$_$_I_iU_nCt_$_$`high`SEATTLE2 `weekwah`GTA5 `bal`YUMYUMYUM`shenron`Dip`ALEX`Star Slither`lil boose`jeb!!`re`yumyumz`looner `JakethesweetSnake`jody `Nom Nom Nom`11111`MY BANANA`Shakira`bambam`Spider-Man `I got a big big booty`kk`slitherin her DMs like`hg`jespo`1000%%`AG`bad at slither`run around and scream!`e`fccccc`Kavish`yusuf`savage af `sssssss`William Snakespeare`Bot`Hawai`Adrian`QuinnXCII`extradrops `5k nmmmmmmmmmm`slog`buncha jerkfaces`earthquake`Feeeedd Mmmeee!!!`gwen`Balduz`110011`danu`Tiny`565`savage `The Illuminator`Daisy`Jiggly Jello`dx`Skinny`akira`noah`MRtermi101`Protomic`jacobbbb`alanis`kuba`leave me alone!`schlingelchen`bird`Scorpio`ggu`Not afraid of MG`catdog`1111`steven`kjhchl`toven`E D A`Regina`Slayer!`wwwwwwwwwwwwwwww`ratz`Inga`slim`DBZ`**killer** MOCKBA`Sans Cena`tex`Dye`Frodo Baggins`Cryptical`#RedMachine`DEADLY SNAKE...STAY AWAY`cenko`<<<fjdlafjdla>>>`Dino`Brizzaro`Lil Mama`pewdiepie`fame`thatbrothakd`RaSkO`MrGame`~*~*~*~Wissy~*~*~*~`ILikeDonuts`Brady 2020`Onyx`Torch`evil snake`Blip`1 I`Cthuhlu`Cutie`Killah`Risk Taker`Mr king`Crow`i LOVE THIS GAME`DA CHESSSSSSSSSSSSSSBOX`soomi`travis`GOTCHA!!`Riv`mike`Droid`tokes412`WR`Austin Mac`Worm`huy`Johnny Depp`NAS`Poster Child`pp`ellen`Dunk Diver`Mephisto`TOMY`fffacffa`jeb is a mess`doll-e`I will eat u all`Mike`SSSniperwolf`smma`juicy juice`MG BRAYDEN`COLOMBIA`sibal`beep`seli`MIDNIGHT SNACK`dantdm`Christiana`...00...ww`jules`Dark`JoJo`kid123`BRAAP`jair***elteam$`nice`V_V Black Mamba`fake`@#%!`robrt`PENGUIN`freddy`slimy slug`vman`5555`ris`129`omar`EAT`Duck luck`Nelson`Nemo`breakfast`\\(^-^)/ Majik411`back off`ellie`Abraham`Hol Mah Rangs`huj`LEO-PERU`bubba`Terminator`noon`Hypah`piksaasd`Alright`TurnTheSaige`rick`blackhamer `Clear`Kodak`nune`Almor Fjalberd`DTP`Cloud`ash`don\'t touch me!`katie`Falkor`dream`catch me if you can`dammmmmnnnn`Blame The Lag `Emilie Autumn`PewDiePie`sifting`please run into me`68k`Cybo`bobo`jinx`PERU #1`Hey you`hfhdjejsbf`Chatta`looooooooooooooooong`stranger danger`No one`Angie`[BERN] Ghost`+--(T3T)--+`hey you!`Flea`jordvn`LITTLE BANANA`Snake Cop`lol :)`eatme`f5g`Sasuke`maaxwell`Dema`the smurf`Batsnake`Beyond`What If Zelda Was A Girl`DiSaStEr`Goofy`Gazelle`Cypris`Seahawk`laura`Logik`BoA`Drawball`Krakatau`vanessa`Dogg`Boba`dan`come get me`STuSSy`Czar`Cobra`Jaguar`banzi`E R R O R`miss flockhart`PSYCHO`Mi Primera Vez`Candy`evgenlox`iphone6s`sese`Phat`Fred Fred burger`septiceye`maverick`alex`gorgeousgoof`VVish`SuperWog`FabianXD`suh dude `ops`Blue Berry`slurpie`zee`NSNSN`Rider`Sos`jojo`jamie#3`Tuan`ajax`my kill MY FOOD`TATA`i.hate.my.haircut`MANDRGA`GoddessDemon`Szymi04`yo man`sara`dragon`The Duck`The Wolf`Snake Silencer`shylee`PLEASE! !!!`banksy`under the rainbow`Dat Boi`biu`K`QUEENB`anathema`i gon eat yo life source`american dream`sol`Sup dun sun`hehe`MarkiTHEMOOMOO`master blaster`imonanewlevel`Springtrap`zombie_killer`ich schlange`I love blue`sk`CKY`stamook`ok`La Fox`CANADA RULES`andrey`Eat me !!!`I love hockey`Bernie2016`Joe Dirt`dfg`Mr. Slithers`vdfg`elf`outlaw`mary`michellebelle`RaihanNakNuha`ele`Fate`fion`I am Adele`arianemm`zanerzane`Dono`leandro`whitney`Snake Smacker`Fetch`bellsnall`Proud_Jamaican`fang`Chop`lazy snake`orange`yessir`Diva`here we go agin`adio`Dine&Dash`freak`diablo`Ma$e`Blur`Snap`wurm`hornet`Trauma`Dinner time`MM`AAA`This Game Is Cannibalism`suh`athena`Apex`squeamish`navysnake`cyclone`Centipede`Squirmy Wormy`stereo`mafioso`louie`sergy`unicorn`jsun`yemeyinn :D`Franklin James Cat`Sour Gummi Worm`FUNNY names makes on TOP`BB`222`SERGIO`Coaster`Homer Simpson`Gurl`Dante`guter`serial`Cubb`danomite`File`anoop `I Like Beans`bug`Eattt Meee`wormie`freyja`Roll Tide`Belle`rip prince`beast boy414`READY TO DIE`IllusiveUprise`erock`slithery flow`watch out`goaway`Jumbo`premium scrunch`molly`azerum`angry beaver`Nyeh Heh Heh!`turk`Setra`Lieutenant`wert08TCDD`Adj`Thedimondminecrat`lynne`My Name Is Jeff`tampon`MIMKA`greedo`dubdriver`anstantino`Ouch`satan`can\'t sleep`julianchis`445`cure`Hillo`Chadderandom`pawel`soy noob`zackw`710`let me liveeeeee`kingcal`NICK THE NAME`jelly`wiki123ks`BFAM`KC`zoberk`PIG`ffggh`Jelly`Burning Snake`wow`The White Rabbit`lukemeister`Live Die Repeat`KEEPER OF THE SNAKES`Qberr`Nickname`Epic`NONO_16`CheetahHawk`fgdsa`frig.`ghostar`8==o`queen bey`krazykay`emilhlauritsen`mert`hamza`killit before itlayseggs`BLITZ WINGER 2.0`tips`niam`BRE`cute kitty`MaTo`hicrush`Stumpy`Zilla`cy`1`528`creuse ta  tombe `Bsaa`Beebop`MissTiff`ProScripter`Tnxcya`KING ET`SAVAGE SNAKE`iris`no kill me`sniper `mmm delicious water`Chewie";
        var fake_top:Array;
        var fake_me:Object;
        public var external_oef:Object;
        public var ready:Object;
        public var showAd:Object;
        public var share:Object;
        public var purchase:Object;
        public var restorePurchases:Object;
        public var rbcs_pre:Vector.<Vector.<int>>;

        public function Main(param1, param2, param3, param4, param5, param6)
        {
            var i:Number;
            var j:Number;
            var cv:Number;
            var rbcs:*;
            var sg:* = param1;
            var rmc:* = param2;
            var ha:* = param3;
            var ia:* = param4;
            var ik:* = param5;
            var fbl:* = param6;
            this.angx = new Vector.<Number>(65536);
            this.angy = new Vector.<Number>(65536);
            this.angx4 = new Vector.<Number>(65536);
            this.angy4 = new Vector.<Number>(65536);
            this.angx6 = new Vector.<Number>(65536);
            this.angy6 = new Vector.<Number>(65536);
            this.dfctf = new ColorTransform(0.2, 0.2, 0.2, 1, 200, 150, 100, 0);
            this.ectf = new ColorTransform(1, 1, 1, 0.75, 0, 0, 0, 0);
            this.smtx = new Matrix();
            this.ltm = new Date().time;
            this.food_batches = new Vector.<FoodBatch>;
            this.bgbs = [];
            this.btns = [];
            this.down_btns = [];
            this.nfctm = new Date().time;
            this.lmtm = new Date().time;
            this.viewPort = new Rectangle();
            this.current_touches = [];
            this.touch_regions = [];
            this.texture_sheets = [];
            this.sprite_textures = [];
            this.textures = [];
            this.kmc_ts = new Vector.<Vector.<Object>>;
            this.kmc_add_ts = new Vector.<Object>;
            this.kmc_iis = new Vector.<Vector.<Image>>;
            this.kmc_add_iis = new Vector.<Image>;
            this.fingers = [];
            this.chars = new Vector.<Char>(256);
            this.bgs = [];
            this.per_color_imgs = new Vector.<PerColor>;
            this.rrs = [192, 144, 128, 128, 238, 255, 255, 255, 224, 255, 144, 80, 255, 40, 100, 120, 72, 160, 255, 56, 56, 78, 255, 101, 128, 60];
            this.ggs = [128, 153, 208, 255, 238, 160, 144, 64, 48, 255, 153, 80, 192, 136, 117, 134, 84, 80, 224, 68, 68, 35, 86, 200, 132, 192];
            this.bbs = [255, 255, 208, 128, 112, 96, 144, 64, 224, 255, 255, 80, 80, 96, 255, 255, 255, 255, 64, 255, 255, 192, 9, 232, 144, 72];
            this.os = {};
            this.foods = new Vector.<Food>;
            this.preys = new Vector.<Prey>;
            this.points_dp = new SnakePointDeadpool();
            this.snakes = new Vector.<Snake>;
            this.segs = new Vector.<Segment>;
            this.sectors = [];
            this.flt_a = new Vector.<String>;
            this.flt_g = new Vector.<String>;
            this.flt_w = new Vector.<String>;
            this.sos = [];
            this.clus = [];
            this.promo_lmtm = new Date().time;
            this.fake_top = [];
            this.external_oef = function ()
            {
                return;
            }// end function
            ;
            this.ready = function ()
            {
                return;
            }// end function
            ;
            this.showAd = function ()
            {
                return;
            }// end function
            ;
            this.share = function (param1, param2)
            {
                return;
            }// end function
            ;
            this.purchase = function (param1)
            {
                return;
            }// end function
            ;
            this.restorePurchases = function ()
            {
                return;
            }// end function
            ;
            this.fake_names = this.fake_names.split("`");
            i;
            while (i < 50)
            {
                
                j = Math.floor(Math.random() * this.fake_names.length);
                this.fake_top.push({n:this.fake_names[j], v:75 + Math.pow(Math.random(), 2.3) * (325 - 75), cv:Math.floor(Math.random() * 8)});
                this.fake_names.splice(j, 1);
                i = (i + 1);
            }
            this.fake_me = {n:"", v:0, cv:0};
            this.fake_top.push(this.fake_me);
            this.stg = sg;
            this.root_mc = rmc;
            this.has_ads = ha;
            this.is_android = ia;
            this.is_kindle = ik;
            this.final_build = fbl;
            if (!this.is_android && !this.is_kindle)
            {
                this.is_ios = true;
            }
            if (!this.isPhone())
            {
                this.bsep = 6.5;
            }
            try
            {
                this.sso = SharedObject.getLocal("game");
            }
            catch (ee)
            {
            }
            this.is_mac = Capabilities.version.substr(0, 3) == "MAC";
            Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
            this.stg.addEventListener(TouchEvent.TOUCH_BEGIN, this.startTouch);
            this.stg.addEventListener(TouchEvent.TOUCH_MOVE, this.trackTouch);
            this.stg.addEventListener(TouchEvent.TOUCH_END, this.endTouch);
            i;
            while (i < 65536)
            {
                
                this.n = this.plm * i;
                this.angx[i] = Math.cos(this.n);
                this.angy[i] = Math.sin(this.n);
                this.angx4[i] = this.angx[i] * 4;
                this.angy4[i] = this.angy[i] * 4;
                this.angx6[i] = this.angx[i] * 6;
                this.angy6[i] = this.angy[i] * 6;
                i = (i + 1);
            }
            this.p_sh = new Shape();
            this.p_g = this.p_sh.graphics;
            this.p_g.beginFill(0, 1);
            this.p_g.drawCircle(0, 0, 3.5);
            this.p_g.endFill();
            this.ew_sh = new Shape();
            this.ew_g = this.ew_sh.graphics;
            this.ew_g.beginFill(16777215, 1);
            this.ew_g.drawCircle(0, 0, 6);
            this.ew_g.endFill();
            this.stg.scaleMode = StageScaleMode.NO_SCALE;
            this.stg.align = StageAlign.TOP_LEFT;
            this.sh = new Shape();
            this.g = this.sh.graphics;
            this.g.beginFill(5545088, 1);
            this.g.moveTo((-this.nick_w) / 2, (-this.nick_h) / 2);
            this.g.lineTo(this.nick_w / 2, (-this.nick_h) / 2);
            j;
            while (j <= 100)
            {
                
                this.g.lineTo(this.nick_w / 2 + Math.cos(Math.PI * j / 100 - Math.PI / 2) * this.nick_h / 2, 0 + Math.sin(Math.PI * j / 100 - Math.PI / 2) * this.nick_h / 2);
                j = (j + 1);
            }
            this.g.lineTo((-this.nick_w) / 2, this.nick_h / 2);
            j;
            while (j <= 100)
            {
                
                this.g.lineTo((-this.nick_w) / 2 + Math.cos(Math.PI * j / 100 + Math.PI / 2) * this.nick_h / 2, 0 + Math.sin(Math.PI * j / 100 + Math.PI / 2) * this.nick_h / 2);
                j = (j + 1);
            }
            this.g.endFill();
            this.fl = new DropShadowFilter(4, 90, 0, 0.5, 12, 12, 1, 3, false, false, false);
            this.sh.filters = [this.fl];
            this.nick_input_mc = new MovieClip();
            this.nick_input_mc.addChild(this.sh);
            this.nick_tf = new TextField();
            this.tft = new TextFormat("Arial", 16, 16777215, false);
            this.nick_tf.setTextFormat(this.tft);
            this.nick_tf.defaultTextFormat = this.tft;
            this.nick_tf.alpha = 0.5;
            this.nick_tf.text = "Ayj@|/\"_";
            var tfh:* = this.nick_tf.textHeight;
            this.nick_tf.text = "Nickname";
            this.nick_tf.width = this.nick_w + 12;
            this.nick_tf.height = tfh + 10;
            this.nick_tf.multiline = false;
            this.nick_tf.wordWrap = false;
            this.nick_tf.embedFonts = true;
            this.nick_tf.restrict = " -~";
            this.nick_tf.type = TextFieldType.INPUT;
            this.nick_tf.addEventListener(FocusEvent.FOCUS_IN, this.nick_focus);
            this.nick_tf.addEventListener(FocusEvent.FOCUS_OUT, this.nick_unfocus);
            this.nick_tf.x = (-this.nick_tf.width) / 2;
            this.nick_tf.y = (-tfh) / 2 - 2;
            this.nick_input_mc.addChild(this.nick_tf);
            this.rbcs_pre = new Vector.<Vector.<int>>(256);
            cv;
            while (cv <= 255)
            {
                
                if (cv == 9)
                {
                    rbcs;
                }
                else if (cv == 10)
                {
                    rbcs;
                }
                else if (cv == 11)
                {
                    rbcs;
                }
                else if (cv == 12)
                {
                    rbcs;
                }
                else if (cv == 13)
                {
                    rbcs;
                }
                else if (cv == 14)
                {
                    rbcs;
                }
                else if (cv == 15)
                {
                    rbcs;
                }
                else if (cv == 16)
                {
                    rbcs;
                }
                else if (cv == 17)
                {
                    rbcs;
                }
                else if (cv == 18)
                {
                    rbcs;
                }
                else if (cv == 19)
                {
                    rbcs;
                }
                else if (cv == 20)
                {
                    rbcs;
                }
                else if (cv == 21)
                {
                    rbcs;
                }
                else if (cv == 22)
                {
                    rbcs;
                }
                else if (cv == 23)
                {
                    rbcs;
                }
                else if (cv == 24)
                {
                    rbcs;
                }
                else if (cv == 25)
                {
                    rbcs;
                }
                else if (cv == 26)
                {
                    rbcs;
                }
                else if (cv == 27)
                {
                    rbcs;
                }
                else if (cv == 28)
                {
                    rbcs;
                }
                else if (cv == 29)
                {
                    rbcs;
                }
                else if (cv == 30)
                {
                    rbcs;
                }
                else if (cv == 31)
                {
                    rbcs;
                }
                else if (cv == 32)
                {
                    rbcs;
                }
                else if (cv == 33)
                {
                    rbcs;
                }
                else if (cv == 34)
                {
                    rbcs;
                }
                else if (cv == 35)
                {
                    rbcs;
                }
                else if (cv == 36)
                {
                    rbcs;
                }
                else if (cv == 37)
                {
                    rbcs;
                }
                else if (cv == 38)
                {
                    rbcs;
                }
                else
                {
                    rbcs;
                }
                this.rbcs_pre[cv] = new Vector.<int>(rbcs.length);
                i;
                while (i < rbcs.length)
                {
                    
                    this.rbcs_pre[cv][i] = rbcs[i];
                    i = (i + 1);
                }
                cv = (cv + 1);
            }
            this.sh = new Shape();
            this.g = this.sh.graphics;
            this.g.lineStyle(4, 14541823, 1);
            this.g.beginFill(4356284, 1);
            this.g.moveTo((-this.victory_w) / 2, (-this.victory_h) / 2);
            this.g.lineTo(this.victory_w / 2, (-this.victory_h) / 2);
            j;
            while (j <= 100)
            {
                
                this.g.lineTo(this.victory_w / 2 + Math.cos(Math.PI * j / 100 - Math.PI / 2) * this.victory_h / 2, 0 + Math.sin(Math.PI * j / 100 - Math.PI / 2) * this.victory_h / 2);
                j = (j + 1);
            }
            this.g.lineTo((-this.victory_w) / 2, this.victory_h / 2);
            j;
            while (j <= 100)
            {
                
                this.g.lineTo((-this.victory_w) / 2 + Math.cos(Math.PI * j / 100 + Math.PI / 2) * this.victory_h / 2, 0 + Math.sin(Math.PI * j / 100 + Math.PI / 2) * this.victory_h / 2);
                j = (j + 1);
            }
            this.g.endFill();
            this.victory_input_mc = new MovieClip();
            this.victory_input_mc.addChild(this.sh);
            this.victory_tf = new TextField();
            this.tft = new TextFormat("Arial", 16, 16777215, false);
            this.victory_tf.setTextFormat(this.tft);
            this.victory_tf.defaultTextFormat = this.tft;
            this.victory_tf.alpha = 0.4;
            this.victory_tf.text = "Ayj@|/\"_";
            tfh = this.victory_tf.textHeight;
            this.vic_ph = "You are today\'s champion! Enter your victory message for all to see!";
            this.victory_tf.text = this.vic_ph;
            this.victory_tf.width = this.victory_w + 12;
            this.victory_tf.height = tfh + 10;
            this.victory_tf.multiline = false;
            this.victory_tf.wordWrap = false;
            this.victory_tf.embedFonts = true;
            this.victory_tf.restrict = " -~";
            this.victory_tf.type = TextFieldType.INPUT;
            this.victory_tf.addEventListener(FocusEvent.FOCUS_IN, this.victory_focus);
            this.victory_tf.addEventListener(FocusEvent.FOCUS_OUT, this.victory_unfocus);
            this.victory_tf.x = (-this.victory_tf.width) / 2;
            this.victory_tf.y = (-tfh) / 2 - 2;
            this.victory_input_mc.addChild(this.victory_tf);
            if (this.is_air)
            {
                this.screenWidth = Math.max(this.stg.fullScreenWidth, this.stg.fullScreenHeight);
                this.screenHeight = Math.min(this.stg.fullScreenWidth, this.stg.fullScreenHeight);
                this.viewPort.width = this.screenWidth;
                this.viewPort.height = this.screenHeight;
            }
            else
            {
                this.viewPort.width = 800;
                this.viewPort.height = 480;
            }
            Starling.handleLostContext = true;
            this._starling = new Starling(Gaim, this.stg, this.viewPort, null, "auto", "auto");
            this._starling.antiAliasing = 16;
            if (!this.is_mac)
            {
                NativeApplication.nativeApplication.addEventListener(Event.ACTIVATE, this.onStageActive);
                NativeApplication.nativeApplication.addEventListener(Event.DEACTIVATE, this.onStageDeactivate);
                NativeApplication.nativeApplication.systemIdleMode = SystemIdleMode.KEEP_AWAKE;
            }
            this.lfas = new Vector.<Number>(this.lfc);
            i;
            while (i < this.lfc)
            {
                
                this.d = 0.5 * (1 - Math.cos(Math.PI * ((this.lfc - 1) - i) / (this.lfc - 1)));
                this.lfas[i] = this.d;
                i = (i + 1);
            }
            this.rfas = new Vector.<Number>(this.rfc);
            i;
            while (i < this.rfc)
            {
                
                this.d = 0.5 * (1 - Math.cos(Math.PI * ((this.rfc - 1) - i) / (this.rfc - 1)));
                this.rfas[i] = this.d;
                i = (i + 1);
            }
            this.hfas = new Vector.<Number>(this.hfc);
            i;
            while (i < this.hfc)
            {
                
                this.d = 0.5 * (1 - Math.cos(Math.PI * ((this.hfc - 1) - i) / (this.hfc - 1)));
                this.hfas[i] = this.d;
                i = (i + 1);
            }
            this.nfas = new Vector.<Number>(this.nfc);
            i;
            while (i < this.nfc)
            {
                
                this.d = 0.5 * (1 - Math.cos(Math.PI * ((this.nfc - 1) - i) / (this.nfc - 1)));
                this.nfas[i] = this.d;
                i = (i + 1);
            }
            this.afas = new Vector.<Number>(this.afc);
            i;
            while (i < this.afc)
            {
                
                this.d = 0.5 * (1 - Math.cos(Math.PI * ((this.afc - 1) - i) / (this.afc - 1)));
                this.afas[i] = this.d;
                i = (i + 1);
            }
            this.vfas = new Vector.<Number>(this.vfc);
            this.fvxs = new Vector.<Number>(this.vfc);
            this.fvys = new Vector.<Number>(this.vfc);
            i;
            while (i < this.vfc)
            {
                
                this.d = 0.5 * (1 - Math.cos(Math.PI * ((this.vfc - 1) - i) / (this.vfc - 1)));
                this.d = this.d + (0.5 * (1 - Math.cos(Math.PI * this.d)) - this.d) * 0.5;
                this.vfas[i] = this.d;
                this.fvxs[i] = 0;
                this.fvys[i] = 0;
                i = (i + 1);
            }
            this.fmlts = new Vector.<Number>;
            this.fpsls = new Vector.<Number>;
            this.etm_mults = new Vector.<Number>;
            i;
            while (i < 80)
            {
                
                this.etm_mults.push(Math.pow(0.993, i));
                i = (i + 1);
            }
            this._starling.addEventListener("rootCreated", this.rootCreated);
            this.loadWordFilters();
            setTimeout(function ()
            {
                loadIPfile();
                return;
            }// end function
            , 666);
            this.loadExtraButtons();
            return;
        }// end function

        public function getSo(param1)
        {
            var _loc_2:* = undefined;
            try
            {
                if (this.sso)
                {
                    if (this.sso.data)
                    {
                        _loc_2 = this.sso.data[param1];
                        trace("typeof(sso.data." + param1 + ") == " + (typeof(_loc_2)));
                        if (_loc_2)
                        {
                            return _loc_2;
                        }
                    }
                }
            }
            catch (e)
            {
            }
            return "";
        }// end function

        public function setSo(param1, param2)
        {
            try
            {
                if (this.sso)
                {
                    if (this.sso.data)
                    {
                        this.sso.data[param1] = param2;
                        if (this.sso_lsmtm == -1)
                        {
                            this.sso_lsmtm = new Date().time;
                        }
                    }
                }
            }
            catch (e)
            {
            }
            return;
        }// end function

        public function md(param1)
        {
            var _loc_7:* = undefined;
            var _loc_8:* = undefined;
            var _loc_9:* = undefined;
            var _loc_10:* = undefined;
            var _loc_11:* = undefined;
            var _loc_2:* = param1.stageX;
            var _loc_3:* = param1.stageY;
            this.mouse_is_down = true;
            _loc_2 = _loc_2 * this.force_game_scale;
            _loc_3 = _loc_3 * this.force_game_scale;
            var _loc_4:* = _loc_2;
            var _loc_5:* = _loc_3;
            var _loc_6:* = this.inputDown(_loc_2, _loc_3, param1.stageX, param1.stageY);
            if (this.inputDown(_loc_2, _loc_3, param1.stageX, param1.stageY))
            {
                return;
            }
            _loc_7 = this.btns.length - 1;
            while (_loc_7 >= 0)
            {
                
                _loc_8 = this.btns[_loc_7];
                if (!_loc_8.disabled)
                {
                    if (_loc_8.ii)
                    {
                        _loc_11 = _loc_8.ii.getBounds(this.starfield);
                    }
                    else
                    {
                        _loc_11 = _loc_8.iis[0].getBounds(this.starfield);
                    }
                    this.setTouchRegion(_loc_8, _loc_11);
                }
                _loc_7 = _loc_7 - 1;
            }
            _loc_7 = this.touch_regions.length - 1;
            while (_loc_7 >= 0)
            {
                
                _loc_9 = this.touch_regions[_loc_7];
                _loc_11 = _loc_9.r;
                if (_loc_4 >= _loc_11.left && _loc_5 >= _loc_11.top && _loc_4 <= _loc_11.right && _loc_5 <= _loc_11.bottom)
                {
                    _loc_10 = _loc_9.tgo;
                    _loc_9.start_tm = new Date().time;
                    _loc_9.id = -1;
                    var _loc_12:* = _loc_4;
                    _loc_9.lx = _loc_4;
                    _loc_9.xx = _loc_12;
                    var _loc_12:* = _loc_5;
                    _loc_9.ly = _loc_5;
                    _loc_9.yy = _loc_12;
                    _loc_9.vx = 0;
                    _loc_9.vy = 0;
                    _loc_9.inside = true;
                    _loc_10.touchDown(_loc_9);
                    return;
                }
                _loc_7 = _loc_7 - 1;
            }
            _loc_6 = this.unhandledInputDown(_loc_2, _loc_3, param1.stageX, param1.stageY);
            if (_loc_6)
            {
                return;
            }
            return;
        }// end function

        public function mm(param1)
        {
            var _loc_4:* = undefined;
            var _loc_5:* = undefined;
            var _loc_6:* = undefined;
            var _loc_7:* = null;
            var _loc_8:* = undefined;
            var _loc_2:* = param1.stageX;
            var _loc_3:* = param1.stageY;
            _loc_2 = _loc_2 * this.force_game_scale;
            _loc_3 = _loc_3 * this.force_game_scale;
            this.xm = _loc_2 - this.mww2;
            this.ym = _loc_3 - this.mhh2;
            if (this.mouse_is_down)
            {
                _loc_4 = _loc_2;
                _loc_5 = _loc_3;
                _loc_8 = this.touch_regions.length - 1;
                while (_loc_8 >= 0)
                {
                    
                    _loc_6 = this.touch_regions[_loc_8];
                    if (_loc_6.id == -1)
                    {
                        _loc_6.vx = _loc_6.xx - _loc_6.lx;
                        _loc_6.vy = _loc_6.yy - _loc_6.ly;
                        _loc_6.lx = _loc_6.xx;
                        _loc_6.ly = _loc_6.yy;
                        _loc_6.xx = _loc_4;
                        _loc_6.yy = _loc_5;
                        _loc_7 = _loc_6.r;
                        if (_loc_4 >= _loc_7.left && _loc_5 >= _loc_7.top && _loc_4 <= _loc_7.right && _loc_5 <= _loc_7.bottom)
                        {
                            _loc_6.inside = true;
                        }
                        else
                        {
                            _loc_6.inside = false;
                        }
                        _loc_6.tgo.touchMove(_loc_6);
                    }
                    _loc_8 = _loc_8 - 1;
                }
            }
            return;
        }// end function

        public function mu(param1, param2 = false)
        {
            var _loc_3:* = undefined;
            var _loc_4:* = undefined;
            var _loc_6:* = undefined;
            var _loc_7:* = undefined;
            var _loc_8:* = undefined;
            var _loc_9:* = undefined;
            var _loc_10:* = undefined;
            var _loc_5:* = false;
            if (!param2)
            {
                this.mouse_is_down = false;
                _loc_3 = param1.stageX;
                _loc_4 = param1.stageY;
                _loc_3 = _loc_3 * this.force_game_scale;
                _loc_4 = _loc_4 * this.force_game_scale;
                _loc_5 = true;
                _loc_6 = _loc_3;
                _loc_7 = _loc_4;
                _loc_9 = this.touch_regions.length - 1;
                while (_loc_9 >= 0)
                {
                    
                    _loc_10 = this.touch_regions[_loc_9];
                    if (_loc_10.id == -1)
                    {
                        _loc_8 = _loc_10.r;
                        if (_loc_6 >= _loc_8.left && _loc_7 >= _loc_8.top && _loc_6 <= _loc_8.right && _loc_7 <= _loc_8.bottom)
                        {
                            _loc_10.inside = true;
                            _loc_10.tgo.touchUp(_loc_10);
                            _loc_10.inside = false;
                            return;
                        }
                        _loc_10.inside = false;
                        _loc_10.tgo.touchUp(_loc_10);
                    }
                    _loc_9 = _loc_9 - 1;
                }
                this.unhandledInputUp(_loc_3, _loc_4, param1.stageX, param1.stageY);
            }
            return;
        }// end function

        public function inputDown(param1, param2, param3, param4)
        {
            var _loc_5:* = undefined;
            var _loc_6:* = undefined;
            var _loc_7:* = undefined;
            if (this.promo_visible)
            {
                if (new Date().time > this.promo_catm)
                {
                    if (new Date().time < this.promo_scatm || !this.promo_close.hitTestPoint(param3, param4, true))
                    {
                        try
                        {
                            navigateToURL(new URLRequest(this.promo_click_url));
                        }
                        catch (qe)
                        {
                        }
                    }
                    this.promo_dying = true;
                    this.promo_visible = false;
                }
                return true;
            }
            return;
        }// end function

        public function unhandledInputDown(param1, param2, param3, param4)
        {
            trace("plain xx, yy = " + Math.round(param1) + "," + Math.round(param2));
            var _loc_5:* = param1;
            var _loc_6:* = param2;
            trace("gsc = " + this.gsc);
            var _loc_7:* = new Date().time;
            if (this.connected || this.single_player)
            {
                if (_loc_7 - this.last_touch_mtm < 400)
                {
                    if (Math.abs(param1 - this.ltxx) < 92)
                    {
                        if (Math.abs(param2 - this.ltyy) < 92)
                        {
                            this.double_tap_accel = true;
                            this.setAcceleration(true);
                        }
                    }
                }
            }
            this.last_touch_mtm = _loc_7;
            this.ltxx = param1;
            this.ltyy = param2;
            return false;
        }// end function

        public function unhandledInputUp(param1, param2, param3, param4)
        {
            if (this.snake_wmd)
            {
                if (this.double_tap_accel)
                {
                    this.double_tap_accel = false;
                    this.setAcceleration(false);
                }
            }
            return;
        }// end function

        public function newSprite()
        {
            var _loc_1:* = new Sprite();
            _loc_1.touchable = false;
            return _loc_1;
        }// end function

        public function grsz()
        {
            this.gameholder_layer.scaleX = this.gsc;
            this.gameholder_layer.scaleY = this.gsc;
            return;
        }// end function

        public function resize(... args)
        {
            args = undefined;
            var _loc_3:* = undefined;
            var _loc_4:* = undefined;
            var _loc_5:* = undefined;
            var _loc_6:* = undefined;
            var _loc_7:* = undefined;
            var _loc_8:* = undefined;
            var _loc_9:* = undefined;
            var _loc_10:* = undefined;
            var _loc_11:* = undefined;
            var _loc_12:* = null;
            var _loc_13:* = undefined;
            var _loc_14:* = this.stg.stageWidth;
            this.aww = this.stg.stageWidth;
            this.ww = _loc_14;
            var _loc_14:* = this.stg.stageHeight;
            this.ahh = this.stg.stageHeight;
            this.hh = _loc_14;
            this.ww = this.ww * this.force_game_scale;
            this.hh = this.hh * this.force_game_scale;
            trace("final ww/hh after force_game_scale was applied: " + this.ww + ", " + this.hh);
            this.mww = Math.ceil(this.ww);
            this.mhh = Math.ceil(this.hh);
            this.mww2 = Math.ceil(this.mww / 2);
            this.mhh2 = Math.ceil(this.mhh / 2);
            trace("mww: " + this.mww);
            trace("mhh: " + this.mhh);
            var _loc_14:* = 1 / this.force_game_scale;
            this.nick_input_mc.scaleY = 1 / this.force_game_scale;
            this.nick_input_mc.scaleX = _loc_14;
            this.nick_input_mc.x = this.ww / 2 / this.force_game_scale;
            this.nick_input_mc.y = (this.hh / 2 - 20) / this.force_game_scale;
            var _loc_14:* = 1 / this.force_game_scale;
            this.victory_input_mc.scaleY = 1 / this.force_game_scale;
            this.victory_input_mc.scaleX = _loc_14;
            this.victory_input_mc.x = this.ww / 2 / this.force_game_scale;
            this.victory_input_mc.y = (this.hh / 2 - 20) / this.force_game_scale;
            this.skinbtn.ii.x = 8 - this.mww / 2;
            this.skinbtn.ii.y = this.mhh / 2 - this.skinbtn.ii.height - 8;
            if (this.extrabtn1 != null)
            {
                this.extrabtn1.ii.x = 128 - this.mww / 2;
                this.extrabtn1.ii.y = this.mhh / 2 - this.extrabtn1.ii.height - 8;
            }
            if (this.is_ios)
            {
                this.restorepurchasesbtn.ii.x = 8 - this.mww / 2;
                this.restorepurchasesbtn.ii.y = 8 - this.mhh / 2;
                this.removeadsbtn.ii.x = 8 - this.mww / 2;
                this.removeadsbtn.ii.y = 98 - this.mhh / 2;
            }
            else
            {
                this.removeadsbtn.ii.x = 8 - this.mww / 2;
                this.removeadsbtn.ii.y = 8 - this.mhh / 2;
            }
            this.playbtn.ii.x = (-this.playbtn.ii.width) / 2;
            this.playbtn.ii.y = 15;
            this.offlinebtn.ii.x = (-this.offlinebtn.ii.width) / 2;
            this.offlinebtn.ii.y = 126;
            this.settingsbtn.ii.x = this.mww / 2 - this.settingsbtn.ii.width - 8;
            this.settingsbtn.ii.y = (-this.mhh) / 2 + 8;
            this.alert_ii.x = this.mww / 2 - 27;
            this.alert_ii.y = (-this.mhh) / 2 + 58;
            this.sbg_ii.x = (-this.mww) / 2 - 320;
            this.sbg_ii.y = (-this.mhh) / 2 - 320;
            this.sbg_ii.width = this.mww + 320 * 2;
            this.sbg_ii.height = this.mhh + 320 * 2;
            this.prevskinbtn.ii.x = (-this.mww) / 2 + 146;
            this.prevskinbtn.ii.y = (-this.prevskinbtn.ii.height) / 2;
            this.nextskinbtn.ii.x = this.mww / 2 - 146;
            this.nextskinbtn.ii.y = (-this.nextskinbtn.ii.height) / 2;
            this.skinokbtn.holder.y = 150;
            this.settingsokbtn.holder.y = 150;
            if (this.built_game)
            {
                this.wx = 0 + Math.ceil(this.mww / 0.3 / this.bgw);
                this.wy = 0 + Math.ceil(this.mhh / 0.3 / this.bgh);
                _loc_13 = this.wx * this.wy;
                if (this.bgs.length > _loc_13)
                {
                    args = this.bgs.length - 1;
                    while (args >= _loc_13)
                    {
                        
                        _loc_10 = this.bgs[args];
                        this.bg_layer.removeChild(_loc_10);
                        _loc_10.dispose();
                        args = args - 1;
                    }
                }
                else
                {
                    args = _loc_13 - this.bgs.length;
                    while (args >= 1)
                    {
                        
                        _loc_10 = new Image(this.bgp_t.texture);
                        this.bg_layer.addChild(_loc_10);
                        this.bgs.push(_loc_10);
                        args = args - 1;
                    }
                }
                this.bg_layer.flatten(true);
                this.tx = (-this.wx) * this.bgw / 2;
                this.ty = (-this.wy) * this.bgh / 2;
                args = 0;
                _loc_5 = 0;
                while (_loc_5 < this.wx)
                {
                    
                    _loc_6 = 0;
                    while (_loc_6 < this.wy)
                    {
                        
                        this.bgs[args].x = _loc_5 * this.bgw + this.tx;
                        this.bgs[args].y = _loc_6 * this.bgh + this.ty;
                        args = args + 1;
                        _loc_6 = _loc_6 + 1;
                    }
                    _loc_5 = _loc_5 + 1;
                }
                this.grsz();
                this.all_layer.x = this.mww2;
                this.all_layer.y = this.mhh2;
                this.victor_batch.x = -this.mww2;
                this.victor_batch.y = -this.mhh2;
                this.highscore_batch.x = this.mww2 - 183;
                this.highscore_batch.y = -this.mhh2;
                this.length_batch.x = -this.mww2;
                this.length_batch.y = this.mhh2;
                this.repositionControls();
                this.flippa_ii.x = 0;
                this.flippa_ii.y = -this.mhh2 + 32;
                this.lbg_ii.x = -this.mww2 - 10;
                this.lbg_ii.y = -this.mhh2 - 10;
                this.lbg_ii.width = this.mww + 20;
                this.lbg_ii.height = this.mhh + 20;
                this.sharebtn.holder.x = this.mww2 - 78;
            }
            return;
        }// end function

        public function repositionControls()
        {
            this.bsx = this.mww2 - 120;
            this.bsy = this.mhh2 - 120;
            this.jsx = -this.mww2 + 90;
            this.jsy = this.mhh2 - 90;
            this.mmx = this.mww2 - 96;
            this.mmy = this.mhh2 - 96;
            if (this.flipped_controls)
            {
                this.bsx = -this.bsx;
                this.jsx = -this.jsx;
                this.mmx = -this.mmx - 94;
                this.mmy = this.mmy - 28;
            }
            this.boost_ii.x = this.bsx;
            this.boost_ii.y = this.bsy;
            this.joystick_bg_ii.x = this.jsx;
            this.joystick_bg_ii.y = this.jsy;
            this.joystick_ii.x = this.jsx;
            this.joystick_ii.y = this.jsy;
            this.minimap_ii.x = this.mmx;
            this.minimap_ii.y = this.mmy;
            return;
        }// end function

        public function gdnm(param1) : Boolean
        {
            var _loc_8:* = 0;
            var _loc_9:* = 0;
            var _loc_10:* = 0;
            var _loc_2:* = "";
            var _loc_3:* = "";
            var _loc_4:* = "";
            var _loc_5:* = 0;
            var _loc_6:* = false;
            var _loc_7:* = false;
            _loc_8 = 0;
            while (_loc_8 < param1.length)
            {
                
                _loc_10 = param1.charCodeAt(_loc_8);
                if (_loc_10 == 32)
                {
                    if (!_loc_7)
                    {
                        _loc_7 = true;
                        _loc_2 = _loc_2 + " ";
                    }
                }
                else
                {
                    _loc_7 = false;
                    _loc_2 = _loc_2 + String.fromCharCode(_loc_10);
                }
                _loc_8++;
            }
            _loc_7 = false;
            _loc_8 = 0;
            while (_loc_8 < param1.length)
            {
                
                _loc_10 = param1.charCodeAt(_loc_8);
                _loc_6 = _loc_10 >= 48 && _loc_10 <= 57;
                if (_loc_6 || _loc_10 >= 65 && _loc_10 <= 90 || _loc_10 >= 97 && _loc_10 <= 122)
                {
                    _loc_3 = _loc_3 + String.fromCharCode(_loc_10);
                    _loc_4 = _loc_4 + String.fromCharCode(_loc_10);
                    _loc_7 = false;
                    if (_loc_6)
                    {
                        _loc_5++;
                        if (_loc_5 >= 7)
                        {
                            return false;
                        }
                    }
                    else
                    {
                        _loc_5 = 0;
                    }
                }
                else if (!_loc_7)
                {
                    _loc_7 = true;
                    _loc_4 = _loc_4 + " ";
                }
                _loc_8++;
            }
            var _loc_11:* = _loc_2.toLowerCase();
            _loc_8 = this.flt_a.length - 1;
            while (_loc_8 >= 0)
            {
                
                if (_loc_11.indexOf(this.flt_a[_loc_8]) >= 0)
                {
                    return false;
                }
                _loc_8 = _loc_8 - 1;
            }
            var _loc_12:* = _loc_3.toLowerCase();
            _loc_8 = this.flt_g.length - 1;
            while (_loc_8 >= 0)
            {
                
                if (_loc_12.indexOf(this.flt_g[_loc_8]) >= 0)
                {
                    return false;
                }
                _loc_8 = _loc_8 - 1;
            }
            var _loc_13:* = _loc_4.toLowerCase();
            var _loc_14:* = _loc_13.split(" ");
            _loc_8 = _loc_14.length - 1;
            while (_loc_8 >= 0)
            {
                
                _loc_9 = this.flt_w.length - 1;
                while (_loc_9 >= 0)
                {
                    
                    if (_loc_14[_loc_8] == this.flt_w[_loc_9])
                    {
                        return false;
                    }
                    _loc_9 = _loc_9 - 1;
                }
                _loc_8 = _loc_8 - 1;
            }
            return true;
        }// end function

        public function nick_focus(param1)
        {
            if (this.nick_tf.text == "Nickname")
            {
                this.nick_tf.text = "";
                this.nick_tf.alpha = 1;
            }
            return;
        }// end function

        public function nick_unfocus(param1)
        {
            if (this.nick_tf.text == "")
            {
                this.nick_tf.text = "Nickname";
                this.nick_tf.alpha = 0.5;
            }
            return;
        }// end function

        public function victory_focus(param1)
        {
            if (this.victory_tf.text == this.vic_ph)
            {
                this.victory_tf.text = "";
                this.victory_tf.alpha = 0.8;
            }
            return;
        }// end function

        public function victory_unfocus(param1)
        {
            if (this.victory_tf.text == "")
            {
                this.victory_tf.text = this.vic_ph;
                this.victory_tf.alpha = 0.4;
            }
            return;
        }// end function

        public function makeBtn(param1)
        {
            var o:* = param1;
            this.btns.push(o);
            o.uv = 1;
            o.wuv = 1;
            if (!o.touch_padding)
            {
                o.touch_padding = 0;
            }
            if (!o.clicked)
            {
                o.clicked = function ()
            {
                return;
            }// end function
            ;
            }
            if (!o.killed)
            {
                o.killed = function ()
            {
                return;
            }// end function
            ;
            }
            o.touchDown = function ()
            {
                if (!this.disabled)
                {
                    if (!this.down)
                    {
                        this.down = true;
                        this.wuv = 0.4;
                        down_btns.push(this);
                    }
                }
                return;
            }// end function
            ;
            o.touchMove = function (param1)
            {
                if (this.down)
                {
                    if (param1.inside)
                    {
                        this.wuv = 0.4;
                    }
                    else
                    {
                        this.wuv = 1;
                    }
                }
                return;
            }// end function
            ;
            o.touchUp = function (param1)
            {
                if (this.down)
                {
                    this.down = false;
                    if (param1.inside)
                    {
                        this.uv = 0.4;
                        this.clicked();
                    }
                    this.wuv = 1;
                }
                return;
            }// end function
            ;
            o.enable = function ()
            {
                if (this.disabled)
                {
                    this.disabled = false;
                }
                return;
            }// end function
            ;
            o.disable = function ()
            {
                if (!this.disabled)
                {
                    this.disabled = true;
                    clearTouchRegion(this);
                }
                return;
            }// end function
            ;
            o.kill = function ()
            {
                var _loc_1:* = undefined;
                clearTouchRegion(this);
                _loc_1 = btns.length - 1;
                while (_loc_1 >= 0)
                {
                    
                    if (btns[_loc_1] == this)
                    {
                        btns.splice(_loc_1, 1);
                    }
                    _loc_1 = _loc_1 - 1;
                }
                _loc_1 = down_btns.length - 1;
                while (_loc_1 >= 0)
                {
                    
                    if (down_btns[_loc_1] == this)
                    {
                        down_btns.splice(_loc_1, 1);
                    }
                    _loc_1 = _loc_1 - 1;
                }
                this.killed();
                return;
            }// end function
            ;
            return;
        }// end function

        public function makeTextBtn(param1, param2, param3, param4 = 16777215, param5 = 21, param6 = 7789729, param7 = 3699029, param8 = 52, param9 = 35, param10 = 0)
        {
            var ii:*;
            var qb:QuadBatch;
            var btn:* = param1;
            var layer:* = param2;
            var s:* = param3;
            var c:* = param4;
            var tsz:* = param5;
            var gc1:* = param6;
            var gc2:* = param7;
            var bh:* = param8;
            var tp:* = param9;
            var vta:* = param10;
            var text_qb:* = new QuadBatch();
            var txo:* = this.drawText(s, text_qb, 0, 0, tsz, c, 1, 1);
            var tw:* = txo.w;
            tw = Math.ceil(tw + tp);
            btn.text_qb = text_qb;
            var sp:* = new Sprite();
            btn.ii = sp;
            var cbw:* = tw * 2;
            var cbh:* = bh * 2;
            var cbm:* = new BitmapData(cbw + 40, cbh + 40, true, 0);
            var sh:* = new Shape();
            var g:* = sh.graphics;
            var j:* = int(cbh / 2) - 2;
            var mtx:* = new Matrix();
            mtx.createGradientBox(cbm.width, cbm.height, Math.PI / 2, 0, 0);
            g.beginGradientFill(GradientType.LINEAR, [gc1, gc2], [1, 1], [0, 255], mtx);
            g.moveTo(j, 0);
            g.lineTo(cbw - j, 0);
            this.k = 0;
            while (this.k <= 32)
            {
                
                g.lineTo(cbw - j + Math.cos(0.5 * Math.PI * this.k / 32 - Math.PI / 2) * j, j + Math.sin(0.5 * Math.PI * this.k / 32 - Math.PI / 2) * j);
                var _loc_12:* = this;
                var _loc_13:* = this.k + 1;
                _loc_12.k = _loc_13;
            }
            g.lineTo(cbw, cbw - j);
            this.k = 0;
            while (this.k <= 32)
            {
                
                g.lineTo(cbw - j + Math.cos(0.5 * Math.PI * this.k / 32) * j, cbh - j + Math.sin(0.5 * Math.PI * this.k / 32) * j);
                var _loc_12:* = this;
                var _loc_13:* = this.k + 1;
                _loc_12.k = _loc_13;
            }
            g.lineTo(j, cbh);
            this.k = 0;
            while (this.k <= 32)
            {
                
                g.lineTo(j + Math.cos(0.5 * Math.PI * this.k / 32 + Math.PI / 2) * j, cbh - j + Math.sin(0.5 * Math.PI * this.k / 32 + Math.PI / 2) * j);
                var _loc_12:* = this;
                var _loc_13:* = this.k + 1;
                _loc_12.k = _loc_13;
            }
            g.lineTo(0, j);
            this.k = 0;
            while (this.k <= 32)
            {
                
                g.lineTo(j + Math.cos(0.5 * Math.PI * this.k / 32 + Math.PI) * j, j + Math.sin(0.5 * Math.PI * this.k / 32 + Math.PI) * j);
                var _loc_12:* = this;
                var _loc_13:* = this.k + 1;
                _loc_12.k = _loc_13;
            }
            g.endFill();
            mtx = new Matrix();
            mtx.translate(20, 20);
            cbm.draw(sh, mtx);
            var fl:* = new DropShadowFilter(4, 90, 0, 0.5, 16, 16, 1, 3, false, false, false);
            cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
            btn.bm = cbm;
            var t:* = Texture.fromBitmapData(cbm);
            btn.txr = t;
            ii = new Image(t);
            btn.up1 = ii;
            ii.pivotX = ii.width / 2;
            ii.pivotY = ii.height / 2;
            ii.scaleX = 0.5;
            ii.scaleY = 0.5;
            sp.addChild(ii);
            btn.colorable = [btn.up1];
            btn.holder = new Sprite();
            btn.holder.addChild(btn.ii);
            btn.holder.addChild(btn.text_qb);
            btn.text_qb.y = (-txo.h) / 2 + vta;
            btn.layer = layer;
            layer.addChild(btn.holder);
            this.makeBtn(btn);
            btn.killed = function ()
            {
                if (this.layer)
                {
                    this.ii.removeChild(this.up1);
                    this.layer.removeChild(this.ii);
                    this.layer.removeChild(this.text_qb);
                    this.ii.dispose();
                    this.text_qb.dispose();
                    this.up1.dispose();
                    this.txr.dispose();
                    this.bm.dispose();
                    this.layer = null;
                }
                return;
            }// end function
            ;
            return;
        }// end function

        public function cae(param1)
        {
            return;
        }// end function

        public function promo_oef()
        {
            var _loc_8:* = undefined;
            var _loc_9:* = undefined;
            var _loc_10:* = undefined;
            var _loc_11:* = undefined;
            var _loc_1:* = new Date().time;
            var _loc_2:* = _loc_1 - this.promo_lmtm;
            this.promo_lmtm = _loc_1;
            var _loc_3:* = 1 - Math.pow(1 - 0.02, _loc_2 / 25);
            var _loc_4:* = 1 - Math.pow(1 - 0.06, _loc_2 / 25);
            var _loc_5:* = 1 - Math.pow(1 - 0.08, _loc_2 / 25);
            var _loc_6:* = 1 - Math.pow(1 - 0.1, _loc_2 / 25);
            var _loc_7:* = 1 - Math.pow(1 - 0.13, _loc_2 / 25);
            if (this.promo_visible)
            {
                this.promo_a = this.promo_a + _loc_2 / 666;
                if (this.promo_a >= 1)
                {
                    this.promo_a = 1;
                }
                this.promo_ang = this.promo_ang + -this.promo_ang * _loc_5;
                if (this.promo_ang <= 0.1)
                {
                    this.promo_ang = 0;
                }
                this.promo_sc = this.promo_sc + (1 - this.promo_sc) * _loc_5;
                if (this.promo_sc >= 1)
                {
                    this.promo_sc = 1;
                }
                if (new Date().time > this.promo_scatm)
                {
                    this.promo_close_a = this.promo_close_a + _loc_2 / 666;
                    if (this.promo_close_a >= 1)
                    {
                        this.promo_close_a = 1;
                    }
                    this.promo_close.alpha = this.promo_close_a;
                }
                _loc_8 = this.promo_sw;
                _loc_9 = this.promo_sh;
                _loc_10 = this.stg.stageWidth / _loc_8;
                _loc_11 = this.stg.stageHeight / _loc_9;
                if (_loc_11 > _loc_10)
                {
                    _loc_10 = _loc_11;
                }
                _loc_8 = Math.ceil(_loc_8 * _loc_10);
                _loc_9 = Math.ceil(_loc_9 * _loc_10);
                this.promo.width = _loc_8;
                this.promo.height = _loc_9;
                this.promo.x = (-_loc_8) / 2;
                this.promo.y = (-_loc_9) / 2;
                this.promo_close.x = this.stg.stageWidth / 2 - 74;
                this.promo_close.y = (-this.stg.stageHeight) / 2 + 74;
                this.promoh.alpha = this.promo_a;
                this.promoh.rotationX = this.promo_ang;
                var _loc_12:* = 0.5 + 0.5 * this.promo_sc;
                this.promoh.scaleY = 0.5 + 0.5 * this.promo_sc;
                this.promoh.scaleX = _loc_12;
                this.promoh.x = this.stg.stageWidth / 2;
                this.promoh.y = this.stg.stageHeight / 2;
            }
            else if (this.promo_dying)
            {
                this.promo_a = this.promo_a - _loc_2 / 666;
                this.promo_sc = this.promo_sc - _loc_2 / 999;
                this.promo_ang = this.promo_ang - _loc_2 / 67;
                if (this.promo_a <= 0)
                {
                    this.promo_a = 0;
                    this.promo_dying = false;
                    this.promoh.removeChild(this.promo);
                    this.promoh.removeChild(this.promo_close);
                    this.stg.removeChild(this.promoh);
                }
                else
                {
                    this.promoh.alpha = this.promo_a;
                    var _loc_12:* = 0.5 + 0.5 * this.promo_sc;
                    this.promoh.scaleY = 0.5 + 0.5 * this.promo_sc;
                    this.promoh.scaleX = _loc_12;
                    this.promoh.rotationX = this.promo_ang;
                }
            }
            return;
        }// end function

        public function oef(event:EnterFrameEvent)
        {
            var _loc_2:* = undefined;
            var _loc_3:* = null;
            var _loc_4:* = undefined;
            var _loc_5:* = undefined;
            var _loc_6:* = undefined;
            var _loc_7:* = undefined;
            var _loc_8:* = NaN;
            var _loc_9:* = undefined;
            var _loc_10:* = undefined;
            var _loc_11:* = undefined;
            var _loc_12:* = undefined;
            var _loc_13:* = undefined;
            var _loc_14:* = undefined;
            var _loc_15:* = undefined;
            var _loc_16:* = null;
            var _loc_17:* = undefined;
            var _loc_18:* = undefined;
            var _loc_19:* = null;
            var _loc_20:* = undefined;
            var _loc_21:* = null;
            var _loc_22:* = NaN;
            var _loc_23:* = NaN;
            var _loc_24:* = NaN;
            var _loc_25:* = undefined;
            if (this.ccfr != 8)
            {
                var _loc_26:* = this;
                var _loc_27:* = this.ccfr + 1;
                _loc_26.ccfr = _loc_27;
            }
            this.ctm = new Date().time;
            if (this.ctm < this.ltm)
            {
                this.ctm = this.ltm;
            }
            this.vfr = (this.ctm - this.ltm) / 8;
            if (this.vfr > 5)
            {
                this.vfr = 5;
            }
            if (this.vfr < 1.56)
            {
                this.vfr = 1.56;
            }
            if (this.single_player)
            {
                this.vfr = this.vfr * 1.3;
            }
            this.ltm = this.ctm;
            if (!this.choosing_skin)
            {
                if (!this.lagging)
                {
                    if (this.wfpr && this.ctm - this.last_ping_mtm > 500)
                    {
                        this.lagging = true;
                    }
                }
                if (this.lagging)
                {
                    this.lag_mult = this.lag_mult * 0.85;
                    if (this.lag_mult < 0.01)
                    {
                        this.lag_mult = 0.01;
                    }
                }
                else if (this.lag_mult < 1)
                {
                    this.lag_mult = this.lag_mult + 0.05;
                    if (this.lag_mult >= 1)
                    {
                        this.lag_mult = 1;
                    }
                }
            }
            this.vfr = this.vfr * this.lag_mult;
            this.etm = this.etm * this.lag_mult;
            if (this.vfr > 64)
            {
                this.vfr = 64;
            }
            this.lfr = this.fr;
            this.fr = this.fr + this.vfr;
            this.vfrb = int(this.fr) - int(this.lfr);
            this.lfr2 = this.fr2;
            this.fr2 = this.fr2 + this.vfr * 2;
            this.vfrb2 = int(this.fr2) - int(this.lfr2);
            if (this.extrabtn1 != null)
            {
                if (this.extrabtn1_a != 1)
                {
                    this.extrabtn1_a = this.extrabtn1_a + Math.min(0.04, this.vfr * 0.01);
                    if (this.extrabtn1_a >= 1)
                    {
                        this.extrabtn1_a = 1;
                    }
                    this.extrabtn1.ii.alpha = this.extrabtn1_a;
                }
            }
            if (this.alert_v)
            {
                this.alert_ii.alpha = 0.9 + 0.1 * Math.cos(this.fr / 66);
                var _loc_26:* = 0.35 + 0.04 * Math.cos(this.fr / 13);
                this.alert_ii.scaleY = 0.35 + 0.04 * Math.cos(this.fr / 13);
                this.alert_ii.scaleX = _loc_26;
            }
            if (this.boosting)
            {
                if (this.boost_a != 0.6)
                {
                    this.boost_a = this.boost_a + this.vfr * 0.05;
                    if (this.boost_a >= 0.6)
                    {
                        this.boost_a = 0.6;
                    }
                    this.boost_ii.alpha = this.boost_a;
                }
            }
            else if (this.boost_a != 0.3)
            {
                this.boost_a = this.boost_a - this.vfr * 0.05;
                if (this.boost_a <= 0.3)
                {
                    this.boost_a = 0.3;
                }
                this.boost_ii.alpha = this.boost_a;
            }
            if (this.snake != null)
            {
                if (this.cur_finger != null)
                {
                    if (this.snake.tsp > this.snake.fsp)
                    {
                        this.cur_finger.accel = true;
                    }
                    else
                    {
                        this.cur_finger.accel = false;
                    }
                }
            }
            this.i = this.finger_count - 1;
            while (this.i >= 0)
            {
                
                this.fing = this.fingers[this.i];
                if (this.fing.accel)
                {
                    if (this.fing.accel_a != 1)
                    {
                        this.fing.accel_a = this.fing.accel_a + this.vfr * 0.02;
                        if (this.fing.accel_a >= 1)
                        {
                            this.fing.accel_a = 1;
                        }
                    }
                    this.fing.accel_fr = this.fing.accel_fr + this.vfr * 0.22;
                }
                else if (this.fing.accel_a != 0)
                {
                    this.fing.accel_a = this.fing.accel_a - this.vfr * 0.03;
                    if (this.fing.accel_a <= 0)
                    {
                        this.fing.accel_a = 0;
                    }
                    this.fing.accel_fr = this.fing.accel_fr + this.vfr * 0.22;
                }
                if (this.fing.dead)
                {
                    this.fing.dead_fr = this.fing.dead_fr + this.vfr * 0.01;
                    if (this.fing == this.cur_finger)
                    {
                        this.fing.a = this.fing.a - this.vfr * 0.01;
                    }
                    else
                    {
                        this.fing.a = this.fing.a - this.vfr * 0.06;
                    }
                    if (this.fing.a <= 0)
                    {
                        var _loc_26:* = this;
                        var _loc_27:* = this.finger_count - 1;
                        _loc_26.finger_count = _loc_27;
                        if (this.i == this.finger_count)
                        {
                            this.fingers[this.i] = null;
                        }
                        else
                        {
                            this.fingers[this.i] = this.fingers[this.finger_count];
                            this.fingers[this.finger_count] = null;
                        }
                    }
                }
                else
                {
                    if (this.fing.dead_fr != 0)
                    {
                        this.fing.dead_fr = this.fing.dead_fr - this.vfr * 0.02;
                        if (this.fing.dead_fr <= 0)
                        {
                            this.fing.dead_fr = 0;
                        }
                    }
                    if (this.fing.a != 0.85)
                    {
                        this.fing.a = this.fing.a + this.vfr * 0.03;
                        if (this.fing.a >= 0.85)
                        {
                            this.fing.a = 0.85;
                        }
                    }
                }
                var _loc_26:* = this;
                var _loc_27:* = this.i - 1;
                _loc_26.i = _loc_27;
            }
            if (this.ending_skin)
            {
                if (this.cska != 0)
                {
                    this.cska = this.cska - this.vfr / 100;
                    if (this.cska <= 0)
                    {
                        this.cska = 0;
                        this.skin_layer.visible = false;
                        this.prevskinbtn.disable();
                        this.nextskinbtn.disable();
                        this.skinokbtn.disable();
                        this.ending_skin = false;
                        this.choosing_skin = false;
                        this.stats_layer.visible = true;
                        this.resetGame();
                    }
                    this.skin_layer.alpha = this.cska;
                }
            }
            else if (this.choosing_skin)
            {
                if (this.cska != 1)
                {
                    if (this.cska == 0)
                    {
                        this.skin_layer.alpha = 0;
                        this.skin_layer.visible = true;
                        this.prevskinbtn.enable();
                        this.nextskinbtn.enable();
                        this.skinokbtn.enable();
                    }
                    this.cska = this.cska + this.vfr / 100;
                    if (this.cska >= 1)
                    {
                        this.cska = 1;
                    }
                    this.skin_layer.alpha = this.cska;
                }
            }
            if (this.hiding_settings)
            {
                if (this.stgsa == 1)
                {
                    this._starling.nativeOverlay.addChild(this.nick_input_mc);
                }
                if (this.stgsa != 0)
                {
                    this.stgsa = this.stgsa - this.vfr / 20;
                    if (this.stgsa <= 0)
                    {
                        this.stgsa = 0;
                        this.settings_layer.visible = false;
                        this.hiding_settings = false;
                        this.settings_shown = false;
                        this.settings_layer.visible = true;
                        this.settingsokbtn.disable();
                    }
                    this.nick_input_mc.alpha = 1 - this.stgsa;
                    this.settings_layer.alpha = this.stgsa;
                }
            }
            else if (this.settings_shown)
            {
                if (this.stgsa != 1)
                {
                    if (this.stgsa == 0)
                    {
                        this.settings_layer.alpha = 0;
                        this.settings_layer.visible = true;
                        this.settingsokbtn.enable();
                    }
                    this.stgsa = this.stgsa + this.vfr / 20;
                    if (this.stgsa >= 1)
                    {
                        this.stgsa = 1;
                        this._starling.nativeOverlay.removeChild(this.nick_input_mc);
                    }
                    this.nick_input_mc.alpha = 1 - this.stgsa;
                    this.settings_layer.alpha = this.stgsa;
                }
            }
            if (this.sso_lsmtm != -1)
            {
                if (this.ctm - this.sso_lsmtm > 1000)
                {
                    this.sso.flush();
                    this.sso_lsmtm = -1;
                }
            }
            if (this.rendering_paused)
            {
                return;
            }
            if (this.promo_visible || this.promo_dying)
            {
                this.promo_oef();
                return;
            }
            if (this.waiting_for_sos)
            {
                if (this.ctm > this.sos_ready_after_mtm)
                {
                    if (!this.connecting)
                    {
                        if (!this.connected)
                        {
                            this.connect();
                        }
                    }
                }
            }
            if (this.connecting)
            {
                if (this.ctm - this.start_connect_mtm > 2700)
                {
                    if (this.bso != null)
                    {
                        this.bso.tainted = true;
                    }
                    this.connect();
                }
            }
            if (this.choosing_skin)
            {
                this.i = this.snakes.length - 1;
                while (this.i >= 0)
                {
                    
                    this.sk = this.snakes[this.i];
                    this.j = this.sk.pts.length - 1;
                    while (this.j >= 0)
                    {
                        
                        this.sk.pts[this.j].yy = this.grd / 2 + Math.cos(this.j / 4 + this.fr / 19) * 15 * (1 - this.j / this.sk.pts.length);
                        var _loc_26:* = this;
                        var _loc_27:* = this.j - 1;
                        _loc_26.j = _loc_27;
                    }
                    var _loc_26:* = this;
                    var _loc_27:* = this.i - 1;
                    _loc_26.i = _loc_27;
                }
                this.view_xx = this.view_xx - this.vfr;
            }
            var _loc_26:* = this;
            var _loc_27:* = this.fps + 1;
            _loc_26.fps = _loc_27;
            if (new Date().time > this.nfctm)
            {
                this.nfctm = new Date().time + 1000;
                this.ptc = 0;
                this.iivc = 0;
                this.i = this.snakes.length - 1;
                while (this.i >= 0)
                {
                    
                    this.ptc = this.ptc + this.snakes[this.i].pts.length;
                    if (this.snakes[this.i].iiv)
                    {
                        var _loc_26:* = this;
                        var _loc_27:* = this.iivc + 1;
                        _loc_26.iivc = _loc_27;
                    }
                    var _loc_26:* = this;
                    var _loc_27:* = this.i - 1;
                    _loc_26.i = _loc_27;
                }
                if (this.snake != null)
                {
                }
                this.nfps = 0;
                this.fps = 0;
                this.fbrc = 0;
            }
            this.external_oef();
            this.i = this.down_btns.length - 1;
            while (this.i >= 0)
            {
                
                this.o = this.down_btns[this.i];
                if (this.o.uv < this.o.wuv)
                {
                    this.o.uv = this.o.uv + this.vfr / 40;
                    if (this.o.uv >= this.o.wuv)
                    {
                        this.o.uv = this.o.wuv;
                    }
                }
                if (this.o.uv > this.o.wuv)
                {
                    this.o.uv = this.o.uv - this.vfr / 40;
                    if (this.o.uv <= this.o.wuv)
                    {
                        this.o.uv = this.o.wuv;
                    }
                }
                if (this.o.iid)
                {
                    this.o.iid.alpha = 1 - (this.o.uv - 0.5) * 2;
                }
                else
                {
                    _loc_24 = 65793 * Math.max(0, Math.min(255, Math.round(this.o.uv * 256)));
                    if (this.o.colorable)
                    {
                        this.j = this.o.colorable.length - 1;
                        while (this.j >= 0)
                        {
                            
                            this.o.colorable[this.j].color = _loc_24;
                            var _loc_26:* = this;
                            var _loc_27:* = this.j - 1;
                            _loc_26.j = _loc_27;
                        }
                    }
                    else if (this.o.ii)
                    {
                        this.o.ii.color = _loc_24;
                    }
                    else if (this.o.iis)
                    {
                        this.j = this.o.iis.length - 1;
                        while (this.j >= 0)
                        {
                            
                            this.o.iis[this.j].color = _loc_24;
                            var _loc_26:* = this;
                            var _loc_27:* = this.j - 1;
                            _loc_26.j = _loc_27;
                        }
                    }
                    if (!this.o.down)
                    {
                        if (this.o.uv == 1)
                        {
                            this.down_btns.splice(this.i, 1);
                        }
                    }
                }
                var _loc_26:* = this;
                var _loc_27:* = this.i - 1;
                _loc_26.i = _loc_27;
            }
            if (this.glm)
            {
                this.frq = 0;
                while (this.frq < this.vfrb)
                {
                    
                    if (this.glm)
                    {
                        this.shake_ang = this.shake_ang + 0.23;
                        this.glx = this.glx + (this.gvx + this.gvx2);
                        this.gly = this.gly + (this.gvy + this.gvy2);
                        this.gvx = this.gvx + -this.glx * 0.095;
                        this.gvy = this.gvy + -this.gly * 0.095;
                        this.gvx = this.gvx * 0.9;
                        this.gvy = this.gvy * 0.9;
                        this.gvx2 = this.gvx2 + -this.glx * 0.205;
                        this.gvy2 = this.gvy2 + -this.gly * 0.205;
                        this.gvx2 = this.gvx2 * 0.8;
                        this.gvy2 = this.gvy2 * 0.8;
                        if (Math.abs(this.glx) < 0.1 && Math.abs(this.gly) < 0.1 && Math.abs(this.gvx) < 0.1 && Math.abs(this.gvy) < 0.1)
                        {
                            if (Math.abs(this.gvx2) < 0.1 && Math.abs(this.gvy2) < 0.1)
                            {
                                this.glx = 0;
                                this.gly = 0;
                                this.gvx = 0;
                                this.gvy = 0;
                                this.gvx2 = 0;
                                this.gvy2 = 0;
                                this.glm = false;
                            }
                        }
                    }
                    var _loc_26:* = this;
                    var _loc_27:* = this.frq + 1;
                    _loc_26.frq = _loc_27;
                }
                this.gameholder_layer.x = this.glx + this.aglx;
                this.gameholder_layer.y = this.gly + this.agly;
            }
            if (this.want_victory_message)
            {
                if (this.victory_tf.text.length > 140)
                {
                    _loc_2 = this.victory_tf.text;
                    this.victory_tf.text = _loc_2.substr(0, 140);
                }
            }
            if (this.jcfr != 1)
            {
                if (this.nick_tf.text.length > 24)
                {
                    _loc_2 = this.nick_tf.text;
                    this.nick_tf.text = _loc_2.substr(0, 24);
                }
                this.bgballs.reset();
                this.i = this.bgbs.length - 1;
                while (this.i >= 0)
                {
                    
                    this.o = this.bgbs[this.i];
                    this.o.xx = this.o.xx + this.o.vx;
                    this.o.yy = this.o.yy + this.o.vy;
                    while (this.o.xx < -(this.ww / 2 + this.bofa))
                    {
                        
                        this.o.xx = this.o.xx + (this.ww + this.bofa * 2);
                    }
                    while (this.o.yy < -(this.hh / 2 + this.bofa))
                    {
                        
                        this.o.yy = this.o.yy + (this.hh + this.bofa * 2);
                    }
                    while (this.o.xx > this.ww / 2 + this.bofa)
                    {
                        
                        this.o.xx = this.o.xx - (this.ww + this.bofa * 2);
                    }
                    while (this.o.yy > this.hh / 2 + this.bofa)
                    {
                        
                        this.o.yy = this.o.yy - (this.hh + this.bofa * 2);
                    }
                    this.bgb_ii.x = this.o.xx;
                    this.bgb_ii.y = this.o.yy;
                    this.bgb_ii.color = this.o.c;
                    this.bgballs.addImage(this.bgb_ii);
                    var _loc_26:* = this;
                    var _loc_27:* = this.i - 1;
                    _loc_26.i = _loc_27;
                }
                if (this.csrab && !this.ads_removed)
                {
                    if (this.raba != 0.75)
                    {
                        this.raba = this.raba + Math.min(0.04, this.vfr * 0.01);
                        if (this.raba >= 0.75)
                        {
                            this.raba = 0.75;
                        }
                        this.removeadsbtn.ii.alpha = this.raba;
                    }
                }
                else if (this.raba != 0)
                {
                    this.raba = this.raba - this.vfr * 0.01;
                    if (this.raba <= 0)
                    {
                        this.raba = 0;
                    }
                    this.removeadsbtn.ii.alpha = this.raba;
                }
            }
            if (this.want_hide_victory != 0)
            {
                if (this.want_hide_victory == 1)
                {
                    this.hvfr = this.hvfr + this.vfr * 0.02;
                    if (this.hvfr >= 1)
                    {
                        this.hvfr = 0;
                        this.want_hide_victory = 2;
                        this.nick_input_mc.alpha = 0;
                        this.nick_input_mc.visible = true;
                        this._starling.nativeOverlay.removeChild(this.victory_input_mc);
                        this._starling.nativeOverlay.addChild(this.nick_input_mc);
                        this.savemsgbtn.holder.visible = false;
                        this.savemsgbtn.disable();
                        this.playbtn.ii.alpha = 0;
                        this.playbtn.ii.visible = true;
                        this.playbtn.enable();
                        this.offlinebtn.ii.alpha = 0;
                        this.offlinebtn.ii.visible = true;
                        this.offlinebtn.enable();
                        this.skinbtn.ii.alpha = 0;
                        this.skinbtn.ii.visible = true;
                        this.skinbtn.enable();
                        if (this.extrabtn1 != null)
                        {
                            this.extrabtn1.ii.alpha = 0;
                            this.extrabtn1.ii.visible = true;
                            this.extrabtn1.enable();
                        }
                        this.removeadsbtn.ii.alpha = 0;
                        this.removeadsbtn.ii.visible = true;
                        this.removeadsbtn.enable();
                        if (this.is_ios)
                        {
                            this.restorepurchasesbtn.ii.alpha = 0;
                            this.restorepurchasesbtn.ii.visible = true;
                            this.restorepurchasesbtn.enable();
                        }
                        this.settingsbtn.ii.alpha = 0;
                        this.settingsbtn.ii.visible = true;
                        this.settingsbtn.enable();
                        this.sharebtn.holder.alpha = 0;
                        if (this.has_generic_share)
                        {
                            this.sharebtn.holder.visible = true;
                            this.sharebtn.enable();
                        }
                    }
                    else
                    {
                        this.victory_input_mc.alpha = 1 - this.hvfr;
                        this.savemsgbtn.holder.alpha = 1 - this.hvfr;
                    }
                }
                else if (this.want_hide_victory == 2)
                {
                    this.hvfr = this.hvfr + this.vfr * 0.02;
                    if (this.hvfr >= 1)
                    {
                        this.hvfr = 1;
                        this.want_hide_victory = 0;
                    }
                    this.nick_input_mc.alpha = this.hvfr;
                    this.playbtn.ii.alpha = this.hvfr;
                    this.offlinebtn.ii.alpha = this.hvfr;
                    this.skinbtn.ii.alpha = this.hvfr;
                    if (this.extrabtn1 != null)
                    {
                        this.extrabtn1.ii.alpha = this.hvfr;
                    }
                    this.settingsbtn.ii.alpha = this.hvfr;
                    this.removeadsbtn.ii.alpha = this.hvfr * this.raba;
                    this.restorepurchasesbtn.ii.alpha = this.hvfr * 0.75;
                    this.sharebtn.holder.alpha = this.hvfr;
                }
            }
            if (this.dead_mtm == -1)
            {
                if (this.lb_fr != -1)
                {
                    if (this.lb_fr != 1)
                    {
                        this.lb_fr = this.lb_fr + this.vfr * 0.01;
                        if (this.lb_fr >= 1)
                        {
                            this.lb_fr = 1;
                        }
                    }
                }
            }
            if (!this.choosing_skin)
            {
                if (this.connected)
                {
                    if (!this.wfpr)
                    {
                        if (this.ctm - this.last_ping_mtm > 300)
                        {
                            this.last_ping_mtm = this.ctm;
                            this.wfpr = true;
                            _loc_3 = new ByteArray();
                            _loc_3.length = 1;
                            if (this.protocol_version >= 5)
                            {
                                _loc_3[0] = 251;
                            }
                            else
                            {
                                _loc_3[0] = 112;
                            }
                            this.ws.sendBytes(_loc_3);
                        }
                    }
                }
            }
            if (this.playing)
            {
                if (this.jcfr < 1)
                {
                    if (this.dead_mtm == -1)
                    {
                        this.jcfr = this.jcfr + this.vfr / 100;
                        if (this.choosing_skin)
                        {
                            this.jcfr = this.jcfr + this.vfr / 90;
                        }
                        if (this.jcfr >= 1)
                        {
                            this.jcfr = 1;
                            this.login_layer.visible = false;
                            this.bgballs.reset();
                            this._starling.nativeOverlay.removeChild(this.nick_input_mc);
                        }
                        var _loc_26:* = 1 + Math.pow(this.jcfr, 3);
                        this.login_layer.scaleY = 1 + Math.pow(this.jcfr, 3);
                        this.login_layer.scaleX = _loc_26;
                        this.login_layer.alpha = 1 - this.jcfr;
                        var _loc_26:* = 0.6 + 0.9 * Math.pow(this.jcfr, 2);
                        this.connect_spinner_ii.scaleY = 0.6 + 0.9 * Math.pow(this.jcfr, 2);
                        this.connect_spinner_ii.scaleX = _loc_26;
                        this.connect_spinner_ii.alpha = Math.pow(1 - this.jcfr, 2);
                        var _loc_26:* = (1 + Math.pow(this.jcfr, 3)) / this.force_game_scale;
                        this.nick_input_mc.scaleY = (1 + Math.pow(this.jcfr, 3)) / this.force_game_scale;
                        this.nick_input_mc.scaleX = _loc_26;
                        var _loc_26:* = (1 + Math.pow(this.jcfr, 3)) / this.force_game_scale;
                        this.victory_input_mc.scaleY = (1 + Math.pow(this.jcfr, 3)) / this.force_game_scale;
                        this.victory_input_mc.scaleX = _loc_26;
                        this.nick_input_mc.alpha = 1 - this.jcfr;
                        this.victory_input_mc.alpha = 1 - this.jcfr;
                    }
                }
            }
            if (this.connecting || this.jcfr < 1)
            {
                this.connect_spinner_ii.rotation = this.connect_spinner_ii.rotation + this.vfr / 40;
            }
            if (this.dead_mtm != -1)
            {
                if (this.ctm - this.dead_mtm > 1600)
                {
                    if (!this.choosing_skin)
                    {
                        if (this.want_ad)
                        {
                            this.want_ad = false;
                            this.showAd();
                        }
                    }
                    this.jcfr = this.jcfr - this.vfrb / 280;
                    if (this.choosing_skin)
                    {
                        this.jcfr = this.jcfr - this.vfrb / 120;
                    }
                    if (this.jcfr <= 0)
                    {
                        this.jcfr = 0;
                        this.dead_mtm = -1;
                        this.playing = false;
                        if (this.choosing_skin || this.single_player)
                        {
                            this.resetGame();
                        }
                    }
                    var _loc_26:* = 1 + 0.5 * Math.pow(this.jcfr, 1.5);
                    this.login_layer.scaleY = 1 + 0.5 * Math.pow(this.jcfr, 1.5);
                    this.login_layer.scaleX = _loc_26;
                    this.login_layer.alpha = 1 - this.jcfr;
                    var _loc_26:* = 0.6 + 0.9 * Math.pow(this.jcfr, 2);
                    this.connect_spinner_ii.scaleY = 0.6 + 0.9 * Math.pow(this.jcfr, 2);
                    this.connect_spinner_ii.scaleX = _loc_26;
                    this.connect_spinner_ii.alpha = Math.pow(1 - this.jcfr, 2);
                    var _loc_26:* = (1 + 0.5 * Math.pow(this.jcfr, 1.5)) / this.force_game_scale;
                    this.nick_input_mc.scaleY = (1 + 0.5 * Math.pow(this.jcfr, 1.5)) / this.force_game_scale;
                    this.nick_input_mc.scaleX = _loc_26;
                    var _loc_26:* = (1 + 0.5 * Math.pow(this.jcfr, 1.5)) / this.force_game_scale;
                    this.victory_input_mc.scaleY = (1 + 0.5 * Math.pow(this.jcfr, 1.5)) / this.force_game_scale;
                    this.victory_input_mc.scaleX = _loc_26;
                    this.nick_input_mc.alpha = 1 - this.jcfr;
                    this.victory_input_mc.alpha = 1 - this.jcfr;
                }
            }
            if (this.want_close_socket)
            {
                if (this.dead_mtm == -1)
                {
                    this.want_close_socket = false;
                    if (this.ws)
                    {
                        this.ws.close();
                        this.ws = null;
                        this.connected = false;
                        this.playing = false;
                    }
                    this.resetGame();
                }
            }
            if (this.snake != null)
            {
                if (this.grd != 2147483647)
                {
                    if (this.ctm - this.locu_mtm > 1000)
                    {
                        this.locu_mtm = new Date().time;
                        this.myloc_ii.x = 47 + this.mww2 - 96 + 37 * (this.snake.xx - this.grd) / this.grd;
                        this.myloc_ii.y = 47 + this.mhh2 - 96 + 37 * (this.snake.yy - this.grd) / this.grd;
                    }
                }
                if (this.snake.na > 0)
                {
                    this.snake.fnfr = this.snake.fnfr + this.vfrb;
                    if (this.snake.fnfr > 500)
                    {
                        this.snake.na = this.snake.na - this.vfr * 0.001;
                        if (this.snake.na < 0)
                        {
                            this.snake.na = 0;
                        }
                    }
                }
            }
            this.etm = this.etm * this.etm_mults[this.vfrb];
            if (!this.choosing_skin)
            {
                if (this.single_player)
                {
                    if (this.xm != this.lsxm || this.ym != this.lsym)
                    {
                        this.lsxm = this.xm;
                        this.lsym = this.ym;
                        this.d2 = this.xm * this.xm + this.ym * this.ym;
                        if (this.control_mode == 3)
                        {
                            this.tx = this.jsx;
                            this.ty = this.jsy;
                            this.ang = Math.atan2(this.ym - this.ty, this.xm - this.tx);
                            this.snake.eang = this.ang;
                            this.joystick_ii.x = this.jsx + Math.cos(this.ang) * 24;
                            this.joystick_ii.y = this.jsy + Math.sin(this.ang) * 24;
                        }
                        else if (this.control_mode == 2)
                        {
                            this.ang = this.twang;
                            this.snake.eang = this.twang;
                        }
                        else if (this.d2 > 256)
                        {
                            this.ang = Math.atan2(this.ym, this.xm);
                            this.snake.eang = this.ang;
                        }
                        else
                        {
                            this.ang = this.snake.wang;
                        }
                        this.ang = this.ang % this.pi2;
                        if (this.ang < 0)
                        {
                            this.ang = this.ang + this.pi2;
                        }
                        this.vang = (this.ang - this.snake.ang) % this.pi2;
                        if (this.vang < 0)
                        {
                            this.vang = this.vang + this.pi2;
                        }
                        if (this.vang > Math.PI)
                        {
                            this.vang = this.vang - this.pi2;
                        }
                        if (this.vang != 0)
                        {
                            if (this.vang < 0)
                            {
                                this.snake.dir = 1;
                            }
                            else if (this.vang > 0)
                            {
                                this.snake.dir = 2;
                            }
                            this.snake.wang = this.ang;
                        }
                    }
                    this.j = Math.random();
                    if (this.foods_cm1 < 150)
                    {
                        if (this.foods_cm1 < 25 && this.j < 0.3 || this.j < 0.1)
                        {
                            _loc_8 = Math.floor(Math.random() * 9);
                            this.ang = Math.random() * this.pi2;
                            this.rad = 300 + Math.pow(Math.random(), 0.3) * 950;
                            _loc_4 = int(this.snake.xx + Math.cos(this.ang) * this.rad);
                            _loc_5 = int(this.snake.yy + Math.sin(this.ang) * this.rad);
                            this.d = Math.sqrt(Math.pow(_loc_4 - this.grd, 2) + Math.pow(_loc_5 - this.grd, 2));
                            if (this.d < this.grd98)
                            {
                                this.rad = 2 + Math.pow(Math.random(), 2.5) * 14.5;
                                this.fo = this.newFood(_loc_4, _loc_5, this.rad, false, _loc_8);
                                this.sx = int(_loc_4 / this.sector_size);
                                this.sy = int(_loc_5 / this.sector_size);
                                this.fo.sx = this.sx;
                                this.fo.sy = this.sy;
                            }
                        }
                    }
                    if (this.ctm - this.lcfsbtm > 1000)
                    {
                        this.lcfsbtm = this.ctm;
                        this.j = this.snakes.length - 1;
                        while (this.j >= 0)
                        {
                            
                            this.sk = this.snakes[this.j];
                            if (this.sk != this.snake)
                            {
                                _loc_24 = 0;
                                this.i = this.sk.pts.length - 1;
                                while (this.i >= 0)
                                {
                                    
                                    this.po = this.sk.pts[this.i];
                                    if (!this.po.dying)
                                    {
                                        this.tx = this.po.xx;
                                        this.ty = this.po.yy;
                                        if (this.tx >= this.spx1 && this.ty >= this.spy1 && this.tx <= this.spx2 && this.ty <= this.spy2)
                                        {
                                            _loc_24 = 1;
                                            break;
                                        }
                                    }
                                    var _loc_26:* = this;
                                    var _loc_27:* = this.i - 1;
                                    _loc_26.i = _loc_27;
                                }
                                if (_loc_24 == 0)
                                {
                                    this.snakes.splice(this.j, 1);
                                    delete this.os["s" + this.sk.id];
                                }
                            }
                            var _loc_26:* = this;
                            var _loc_27:* = this.j - 1;
                            _loc_26.j = _loc_27;
                        }
                    }
                    if (this.ctm - this.lfhsutm > 1500)
                    {
                        this.lfhsutm = this.ctm;
                        if (Math.random() < 0.33)
                        {
                            if (this.snake_count < 470)
                            {
                                var _loc_26:* = this;
                                var _loc_27:* = this.snake_count + 1;
                                _loc_26.snake_count = _loc_27;
                            }
                            else if (this.snake_count > 530)
                            {
                                var _loc_26:* = this;
                                var _loc_27:* = this.snake_count - 1;
                                _loc_26.snake_count = _loc_27;
                            }
                            else if (Math.random() < 0.5)
                            {
                                var _loc_26:* = this;
                                var _loc_27:* = this.snake_count + 1;
                                _loc_26.snake_count = _loc_27;
                            }
                            else
                            {
                                var _loc_26:* = this;
                                var _loc_27:* = this.snake_count - 1;
                                _loc_26.snake_count = _loc_27;
                            }
                            if (this.rank > this.snake_count)
                            {
                                this.rank = this.snake_count;
                            }
                        }
                        this.j = this.fake_top.length - 1;
                        while (this.j >= 0)
                        {
                            
                            _loc_24 = this.int(this.fake_top[this.j].v);
                            if (_loc_24 >= this.mscps)
                            {
                                _loc_24 = this.mscps - 1;
                            }
                            if (this.fake_top[this.j] != this.fake_me)
                            {
                                this.fake_top[this.j].v = this.fake_top[this.j].v + this.fmlts[_loc_24] * (Math.random() - 0.5);
                                if (this.fake_top[this.j].v < 75)
                                {
                                    this.fake_top[this.j].v = 75;
                                }
                                else if (this.fake_top[this.j].v > 325)
                                {
                                    this.fake_top[this.j].v = 325;
                                }
                            }
                            var _loc_26:* = this;
                            var _loc_27:* = this.j - 1;
                            _loc_26.j = _loc_27;
                        }
                        this.fake_me.v = this.snake.sct + this.snake.fam;
                        this.fake_top.sortOn("v", Array.NUMERIC);
                        if (this.fake_top[0] == this.fake_me)
                        {
                            this.rank = this.fake_top.length + Math.floor((this.snake_count - this.fake_top.length) * (1 - this.fake_me.v / 75));
                        }
                        else
                        {
                            this.j = this.fake_top.length - 1;
                            while (this.j >= 0)
                            {
                                
                                if (this.fake_top[this.j] == this.fake_me)
                                {
                                    this.rank = this.fake_top.length - this.j;
                                    break;
                                }
                                var _loc_26:* = this;
                                var _loc_27:* = this.j - 1;
                                _loc_26.j = _loc_27;
                            }
                        }
                        this.highscore_batch.reset();
                        _loc_4 = 0;
                        _loc_5 = 5;
                        this.wumsts = true;
                        _loc_6 = 0;
                        _loc_7 = 0;
                        if (this.lb_fr == -1)
                        {
                            if (this.dead_mtm == -1)
                            {
                                this.lb_fr = 0;
                            }
                        }
                        this.n = 0;
                        this.m = Math.min(this.fake_top.length, 10);
                        this.j = this.fake_top.length - 1;
                        while (this.j >= 0)
                        {
                            
                            var _loc_26:* = this;
                            var _loc_27:* = this.n + 1;
                            _loc_26.n = _loc_27;
                            if (this.n > 10)
                            {
                                break;
                            }
                            _loc_8 = this.fake_top[this.j].cv;
                            _loc_9 = Math.floor(this.fake_top[this.j].v);
                            _loc_10 = this.fake_top[this.j].v - _loc_9;
                            _loc_11 = int((this.fpsls[_loc_9] + _loc_10 / this.fmlts[_loc_9] - 1) * 15 - 5) / 1;
                            if (this.fake_top[this.j] == this.fake_me)
                            {
                                _loc_24 = 1;
                            }
                            else
                            {
                                _loc_24 = 0.9 * (0.2 + 0.8 * Math.pow(1 - _loc_6 / 10, 2));
                            }
                            this.drawText("#" + this.n, this.highscore_batch, _loc_4 - 28, _loc_5, 11, this.per_color_imgs[_loc_8].cs, _loc_24);
                            this.drawText(this.fake_top[this.j].n, this.highscore_batch, _loc_4, _loc_5, 11, this.per_color_imgs[_loc_8].cs, _loc_24, 0, 125);
                            this.drawText("" + _loc_11, this.highscore_batch, _loc_4 + 173, _loc_5, 11, this.per_color_imgs[_loc_8].cs, _loc_24, 2);
                            _loc_5 = _loc_5 + 14;
                            var _loc_26:* = this;
                            var _loc_27:* = this.j - 1;
                            _loc_26.j = _loc_27;
                        }
                    }
                    if (this.ctm - this.lspfmtm > 100)
                    {
                        this.lspfmtm = this.ctm;
                        this.i = this.foods_cm1;
                        while (this.i >= 0)
                        {
                            
                            this.fo = this.foods[this.i];
                            if (this.snake.xx > this.fo.xx)
                            {
                                _loc_22 = this.snake.xx - this.fo.xx;
                            }
                            else
                            {
                                _loc_22 = this.fo.xx - this.snake.xx;
                            }
                            if (this.snake.yy > this.fo.yy)
                            {
                                _loc_23 = this.snake.yy - this.fo.yy;
                            }
                            else
                            {
                                _loc_23 = this.fo.yy - this.snake.yy;
                            }
                            if (_loc_22 >= 1600 || _loc_23 >= 1600)
                            {
                                if (this.fo.food_batch != null)
                                {
                                    this.fo.food_batch.regenerating = true;
                                    var _loc_26:* = this.fo.food_batch;
                                    var _loc_27:* = _loc_26.count - 1;
                                    _loc_26.count = _loc_27;
                                    this.fo.food_batch = null;
                                }
                                this.foods[this.i] = this.foods[this.foods_cm1];
                                this.foods[this.foods_cm1] = null;
                                var _loc_26:* = this;
                                var _loc_27:* = this.foods_cm1 - 1;
                                _loc_26.foods_cm1 = _loc_27;
                            }
                            var _loc_26:* = this;
                            var _loc_27:* = this.i - 1;
                            _loc_26.i = _loc_27;
                        }
                        this.j = this.snakes.length - 1;
                        while (this.j >= 0)
                        {
                            
                            this.sk = this.snakes[this.j];
                            if (!this.sk.dead && !this.sk.collided)
                            {
                                this.nx = this.sk.xx + Math.cos(this.sk.ang) * (0.36 * this.sk.lsz + 31) * this.sk.sp / 4.8;
                                this.ny = this.sk.yy + Math.sin(this.sk.ang) * (0.36 * this.sk.lsz + 31) * this.sk.sp / 4.8;
                                this.i = this.foods_cm1;
                                while (this.i >= 0)
                                {
                                    
                                    this.fo = this.foods[this.i];
                                    if (!this.fo.eaten)
                                    {
                                        if (this.nx > this.fo.xx)
                                        {
                                            _loc_22 = this.nx - this.fo.xx;
                                        }
                                        else
                                        {
                                            _loc_22 = this.fo.xx - this.nx;
                                        }
                                        if (this.ny > this.fo.yy)
                                        {
                                            _loc_23 = this.ny - this.fo.yy;
                                        }
                                        else
                                        {
                                            _loc_23 = this.fo.yy - this.ny;
                                        }
                                        this.d3 = 70 * this.sk.sc13;
                                        if (_loc_22 <= this.d3 && _loc_23 <= this.d3)
                                        {
                                            this.d2 = _loc_22 * _loc_22 + _loc_23 * _loc_23;
                                            this.dcsc = 1600 * this.sk.sc13;
                                            if (this.d2 < this.dcsc)
                                            {
                                                this.fo.eaten = true;
                                                if (this.fo.food_batch != null)
                                                {
                                                    this.fo.food_batch.regenerating = true;
                                                    var _loc_26:* = this.fo.food_batch;
                                                    var _loc_27:* = _loc_26.count - 1;
                                                    _loc_26.count = _loc_27;
                                                    this.fo.food_batch = null;
                                                }
                                                this.fo.eaten_by = this.sk;
                                                this.fo.eaten_fr = 0;
                                                _loc_24 = this.int(this.sk.sct + this.sk.fam);
                                                if (_loc_24 >= this.mscps)
                                                {
                                                    _loc_24 = this.mscps - 1;
                                                }
                                                this.sk.fam = this.sk.fam + this.fmlts[_loc_24] * this.fo.sz * this.fo.sz * 25 / 7845;
                                                this.snl(this.sk);
                                            }
                                        }
                                    }
                                    var _loc_26:* = this;
                                    var _loc_27:* = this.i - 1;
                                    _loc_26.i = _loc_27;
                                }
                                if (this.sk.accelerating)
                                {
                                    if (this.ctm - this.sk.last_poop_tm > 150)
                                    {
                                        this.sk.last_poop_tm = this.ctm;
                                        if (this.sk.sct > 2 || this.sk.fam >= 0.14)
                                        {
                                            this.i = 0;
                                            while (this.i < this.sk.pts.length)
                                            {
                                                
                                                if (!this.sk.pts[this.i].dying)
                                                {
                                                    _loc_8 = Math.floor(Math.random() * 9);
                                                    _loc_4 = int(this.sk.pts[this.i].xx);
                                                    _loc_5 = int(this.sk.pts[this.i].yy);
                                                    this.d = Math.sqrt(Math.pow(_loc_4 - this.grd, 2) + Math.pow(_loc_5 - this.grd, 2));
                                                    if (this.d < this.grd98)
                                                    {
                                                        this.rad = 3 + Math.pow(Math.random(), 2.5) * 1;
                                                        this.fo = this.newFood(_loc_4, _loc_5, this.rad, true, _loc_8);
                                                        this.sx = int(_loc_4 / this.sector_size);
                                                        this.sy = int(_loc_5 / this.sector_size);
                                                        this.fo.sx = this.sx;
                                                        this.fo.sy = this.sy;
                                                    }
                                                    break;
                                                }
                                                var _loc_26:* = this;
                                                var _loc_27:* = this.i + 1;
                                                _loc_26.i = _loc_27;
                                            }
                                        }
                                        _loc_24 = this.int(this.sk.sct + this.sk.fam);
                                        if (_loc_24 >= this.mscps)
                                        {
                                            _loc_24 = this.mscps - 1;
                                        }
                                        this.sk.fam = this.sk.fam - 0.16 * this.fmlts[_loc_24];
                                        if (this.sk.fam <= 0)
                                        {
                                            if (this.sk.sct == 2)
                                            {
                                                this.sk.fam = 0;
                                                this.sk.accelerating = false;
                                            }
                                            else
                                            {
                                                this.sk.fam = this.sk.fam + 1;
                                                this.i = 0;
                                                while (this.i < this.sk.pts.length)
                                                {
                                                    
                                                    if (!this.sk.pts[this.i].dying)
                                                    {
                                                        this.sk.pts[this.i].dying = true;
                                                        var _loc_26:* = this.sk;
                                                        var _loc_27:* = _loc_26.sct - 1;
                                                        _loc_26.sct = _loc_27;
                                                        _loc_26.sc = Math.min(6, 1 + (_loc_26.sct - 2) / 106);
                                                        _loc_26.sc13 = Math.pow(_loc_26.sc, 1.3);
                                                        _loc_26.lsz = 29 * _loc_26.sc;
                                                        _loc_26.scang = 0.13 + 0.87 * Math.pow((7 - _loc_26.sc) / 6, 2);
                                                        _loc_26.normal_speed = this.nsp1 + this.nsp2 * _loc_26.sc;
                                                        _loc_26.ssp = this.nsp1 + this.nsp2 * _loc_26.sc;
                                                        _loc_26.fsp = _loc_26.ssp + 0.1;
                                                        _loc_26.wsep = this.bsep * _loc_26.sc;
                                                        this.mwsep = 4.5 / this.gsc;
                                                        if (_loc_26.wsep < this.mwsep)
                                                        {
                                                            _loc_26.wsep = this.mwsep;
                                                        }
                                                        break;
                                                    }
                                                    var _loc_26:* = this;
                                                    var _loc_27:* = this.i + 1;
                                                    _loc_26.i = _loc_27;
                                                }
                                            }
                                        }
                                        this.snl(this.sk);
                                    }
                                }
                            }
                            var _loc_26:* = this;
                            var _loc_27:* = this.j - 1;
                            _loc_26.j = _loc_27;
                        }
                        if (this.snakes.length < 15)
                        {
                            if (this.ctm - this.last_fake_snake_creation_tm > 700)
                            {
                                this.last_fake_snake_creation_tm = this.ctm;
                                this.j = 0;
                                while (this.j < 20)
                                {
                                    
                                    this.id = int(10 + Math.random() * 65000);
                                    if (!this.os["s" + this.id])
                                    {
                                        break;
                                    }
                                    this.id = -1;
                                    var _loc_26:* = this;
                                    var _loc_27:* = this.j + 1;
                                    _loc_26.j = _loc_27;
                                }
                                if (this.id != -1)
                                {
                                    this.ang = 2 * Math.random() * Math.PI;
                                    this.dir = 0;
                                    _loc_8 = int(Math.random() * 9);
                                    if (Math.random() < 0.3)
                                    {
                                        _loc_8 = int(Math.random() * (this.max_skin_cv + 1));
                                        if (_loc_8 > this.max_skin_cv)
                                        {
                                            _loc_8 = this.max_skin_cv;
                                        }
                                    }
                                    this.rad = 1200;
                                    _loc_4 = int(this.snake.xx + Math.cos(this.ang) * this.rad);
                                    _loc_5 = int(this.snake.yy + Math.sin(this.ang) * this.rad);
                                    this.tx = _loc_4;
                                    this.ty = _loc_5;
                                    _loc_12 = this.fake_names[Math.floor(Math.random() * this.fake_names.length)];
                                    _loc_13 = 0;
                                    _loc_14 = 0;
                                    _loc_15 = false;
                                    this.pid = 0;
                                    _loc_9 = 2 + Math.floor(70 * Math.pow(Math.random(), 2));
                                    _loc_16 = new Vector.<SnakePoint>(_loc_9);
                                    this.ang = this.ang + (Math.random() * 0.9 - 0.45);
                                    this.wang = this.ang + Math.PI;
                                    this.j2 = 0;
                                    while (this.j2 < _loc_9)
                                    {
                                        
                                        _loc_13 = _loc_4;
                                        _loc_14 = _loc_5;
                                        _loc_4 = _loc_4 + Math.cos(this.ang) * this.msl;
                                        _loc_5 = _loc_5 + Math.sin(this.ang) * this.msl;
                                        this.ang = this.ang + 3 * (Math.random() - 0.5) / _loc_9;
                                        _loc_22 = _loc_4 - this.grd;
                                        _loc_23 = _loc_5 - this.grd;
                                        this.d = Math.sqrt(_loc_22 * _loc_22 + _loc_23 * _loc_23);
                                        if (this.d > this.grd98)
                                        {
                                            this.id = -1;
                                            break;
                                        }
                                        this.po = this.points_dp.get();
                                        if (!this.po)
                                        {
                                            this.po = new SnakePoint();
                                        }
                                        this.po.eiu = 0;
                                        this.po.xx = _loc_4;
                                        this.po.yy = _loc_5;
                                        this.po.fx = 0;
                                        this.po.fy = 0;
                                        this.po.da = 0;
                                        this.po.ebx = _loc_4 - _loc_13;
                                        this.po.eby = _loc_5 - _loc_14;
                                        this.po.pid = this.pid;
                                        var _loc_26:* = this;
                                        var _loc_27:* = this.pid + 1;
                                        _loc_26.pid = _loc_27;
                                        _loc_16[(_loc_9 - 1) - this.j2] = this.po;
                                        var _loc_26:* = this;
                                        var _loc_27:* = this.j2 + 1;
                                        _loc_26.j2 = _loc_27;
                                    }
                                    if (this.id != -1)
                                    {
                                        this.sk = this.newSnake(this.id, this.tx, this.ty, _loc_8, this.wang, _loc_16);
                                        this.sk.cpid = this.pid;
                                        this.sk.nick = _loc_12;
                                        var _loc_26:* = this.wang;
                                        this.sk.wang = this.wang;
                                        this.sk.eang = _loc_26;
                                        this.sk.sp = this.nsp1;
                                        this.sk.spang = this.sk.sp / this.spangdv;
                                        if (this.sk.spang > 1)
                                        {
                                            this.sk.spang = 1;
                                        }
                                        this.sk.fam = 0;
                                        this.sk.cowardice = 84 * (1.5 + Math.random() * 4);
                                        this.sk.sc = Math.min(6, 1 + (this.sk.sct - 2) / 106);
                                        this.sk.sc13 = Math.pow(this.sk.sc, 1.3);
                                        this.sk.lsz = 29 * this.sk.sc;
                                        this.sk.scang = 0.13 + 0.87 * Math.pow((7 - this.sk.sc) / 6, 2);
                                        this.sk.normal_speed = this.nsp1 + this.nsp2 * this.sk.sc;
                                        this.sk.ssp = this.nsp1 + this.nsp2 * this.sk.sc;
                                        this.sk.fsp = this.sk.ssp + 0.1;
                                        this.sk.wsep = this.bsep * this.sk.sc;
                                        this.mwsep = 4.5 / this.gsc;
                                        if (this.sk.wsep < this.mwsep)
                                        {
                                            this.sk.wsep = this.mwsep;
                                        }
                                        this.sk.sep = this.sk.wsep;
                                        this.snl(this.sk);
                                    }
                                }
                            }
                        }
                        this.i = this.snakes.length - 1;
                        while (this.i >= 0)
                        {
                            
                            this.sk = this.snakes[this.i];
                            if (this.sk != this.snake)
                            {
                                this.avpo = null;
                                this.bidt = this.sk.cowardice;
                                if (this.sk.accelerating)
                                {
                                    this.bidt = this.bidt * 2;
                                }
                                this.j = this.snakes.length - 1;
                                while (this.j >= 0)
                                {
                                    
                                    this.sk2 = this.snakes[this.j];
                                    if (this.sk != this.sk2)
                                    {
                                        this.m = 0;
                                        _loc_24 = this.sk2.pts.length - 1;
                                        while (_loc_24 >= 0)
                                        {
                                            
                                            var _loc_26:* = this;
                                            var _loc_27:* = this.m + 1;
                                            _loc_26.m = _loc_27;
                                            this.po = this.sk2.pts[_loc_24];
                                            if (this.po.dying)
                                            {
                                                break;
                                            }
                                            if (this.sk.xx > this.po.xx)
                                            {
                                                this.idx = this.sk.xx - this.po.xx;
                                            }
                                            else
                                            {
                                                this.idx = this.po.xx - this.sk.xx;
                                            }
                                            if (this.sk.yy > this.po.yy)
                                            {
                                                this.idy = this.sk.yy - this.po.yy;
                                            }
                                            else
                                            {
                                                this.idy = this.po.yy - this.sk.yy;
                                            }
                                            if (this.idx > this.idy)
                                            {
                                                this.idt = this.idx;
                                            }
                                            else
                                            {
                                                this.idt = this.idy;
                                            }
                                            if (this.idt < this.bidt)
                                            {
                                                if (this.sk2 != this.snake || this.m >= 3)
                                                {
                                                    if (this.avpo == null)
                                                    {
                                                        this.sk.change_target_after_mtm = this.ctm + 1000 + int(Math.random() * 500);
                                                    }
                                                    this.bidt = this.idt;
                                                    this.avpo = this.po;
                                                }
                                            }
                                            _loc_24 = _loc_24 - 1;
                                        }
                                    }
                                    var _loc_26:* = this;
                                    var _loc_27:* = this.j - 1;
                                    _loc_26.j = _loc_27;
                                }
                                if (this.ctm - this.sk.last_avoidance_dir_change_mtm > 2000)
                                {
                                    if (this.avpo == null)
                                    {
                                        this.sk.last_avoidance_dir_change_mtm = this.ctm;
                                        if (this.sk.avoidance_dir == 1)
                                        {
                                            this.sk.avoidance_dir = 2;
                                        }
                                        else
                                        {
                                            this.sk.avoidance_dir = 1;
                                        }
                                    }
                                }
                                this.bfo = null;
                                this.bfv = 999999;
                                if (this.ctm > this.sk.change_target_after_mtm || this.sk.target_food != null && this.sk.target_food.eaten)
                                {
                                    _loc_24 = this.foods_cm1;
                                    while (_loc_24 >= 0)
                                    {
                                        
                                        this.fo = this.foods[_loc_24];
                                        if (!this.fo.eaten)
                                        {
                                            if (this.sk.xx > this.fo.xx)
                                            {
                                                this.idx = this.sk.xx - this.fo.xx;
                                            }
                                            else
                                            {
                                                this.idx = this.fo.xx - this.sk.xx;
                                            }
                                            if (this.sk.yy > this.fo.yy)
                                            {
                                                this.idy = this.sk.yy - this.fo.yy;
                                            }
                                            else
                                            {
                                                this.idy = this.fo.yy - this.sk.yy;
                                            }
                                            if (this.idx > this.idy)
                                            {
                                                this.idt = this.idx;
                                            }
                                            else
                                            {
                                                this.idt = this.idy;
                                            }
                                            if (this.bfo == null || this.idt < this.bfv)
                                            {
                                                this.bfv = this.idt;
                                                this.bfo = this.fo;
                                            }
                                        }
                                        _loc_24 = _loc_24 - 1;
                                    }
                                    if (this.bfo != null)
                                    {
                                        this.sk.target_food = this.bfo;
                                        this.sk.change_target_after_mtm = this.ctm + 3000 + this.int(Math.random() * 500);
                                    }
                                }
                                if (this.sk.violent)
                                {
                                    if (this.ctm > this.sk.stop_violence_after_tm)
                                    {
                                        this.sk.violent = false;
                                    }
                                }
                                else if (this.sk.sct > 10)
                                {
                                    if (this.snake.sct > 7)
                                    {
                                        if (this.ctm > this.allow_violence_after_tm)
                                        {
                                            if (Math.random() < 0.3)
                                            {
                                                this.allow_violence_after_tm = this.ctm + 16000 - (this.snake.sct - 7) * 25;
                                                this.sk.violent = true;
                                                this.sk.stop_violence_after_tm = this.ctm + 4000 + Math.floor(Math.random() * 7500);
                                            }
                                        }
                                    }
                                }
                                if (!this.sk.excited)
                                {
                                    if (this.ctm > this.sk.stop_excitement_after_tm)
                                    {
                                        this.sk.excited = false;
                                    }
                                }
                                else if (this.sk.sct > 10)
                                {
                                    if (Math.random() < 0.001)
                                    {
                                        this.sk.excited = true;
                                        this.sk.stop_excitement_after_tm = this.ctm + 500 + Math.floor(Math.random() * 3000);
                                    }
                                }
                                if (this.sk.violent || this.sk.excited)
                                {
                                    this.sk.accelerating = true;
                                }
                                else
                                {
                                    this.sk.accelerating = false;
                                }
                                if (this.avpo != null)
                                {
                                    this.ang = (this.sk.avoidance_dir == 1 ? (0.26) : (-0.26)) + Math.atan2(this.sk.yy - this.avpo.yy, this.sk.xx - this.avpo.xx);
                                }
                                else if (this.sk.violent)
                                {
                                    this.ang = Math.atan2(this.snake.yy + Math.sin(this.snake.ang) * 95 - this.sk.yy, this.snake.xx + Math.cos(this.snake.ang) * 95 - this.sk.xx);
                                }
                                else if (this.sk.target_food != null)
                                {
                                    this.ang = Math.atan2(this.sk.target_food.yy - this.sk.yy, this.sk.target_food.xx - this.sk.xx);
                                }
                                else
                                {
                                    this.ang = Math.atan2(this.snake.yy - this.sk.yy, this.snake.xx - this.sk.xx);
                                }
                                this.ang = this.ang % this.pi2;
                                if (this.ang < 0)
                                {
                                    this.ang = this.ang + this.pi2;
                                }
                                this.vang = (this.ang - this.sk.ang) % this.pi2;
                                if (this.vang < 0)
                                {
                                    this.vang = this.vang + this.pi2;
                                }
                                if (this.vang > Math.PI)
                                {
                                    this.vang = this.vang - this.pi2;
                                }
                                if (this.vang != 0)
                                {
                                    if (this.vang < 0)
                                    {
                                        this.sk.dir = 1;
                                    }
                                    else if (this.vang > 0)
                                    {
                                        this.sk.dir = 2;
                                    }
                                    var _loc_26:* = this.ang;
                                    this.sk.eang = this.ang;
                                    this.sk.wang = _loc_26;
                                }
                            }
                            var _loc_26:* = this;
                            var _loc_27:* = this.i - 1;
                            _loc_26.i = _loc_27;
                        }
                    }
                    this.i = this.snakes.length - 1;
                    while (this.i >= 0)
                    {
                        
                        this.sk = this.snakes[this.i];
                        if (this.sk.accelerating)
                        {
                            if (this.sk.acceleration_amount < 0.9999)
                            {
                                this.sk.acceleration_amount = this.sk.acceleration_amount + 0.015 * this.vfr / (1 + 0.305 * (this.sk.sc - 1));
                                if (this.sk.acceleration_amount >= 1)
                                {
                                    this.sk.acceleration_amount = 1;
                                }
                                this.sk.sp = this.sk.normal_speed + (this.nsp3 - this.sk.normal_speed) * this.sk.acceleration_amount;
                                this.sk.spang = this.sk.sp / this.spangdv;
                                if (this.sk.spang > 1)
                                {
                                    this.sk.spang = 1;
                                }
                            }
                        }
                        else if (this.sk.acceleration_amount > 0)
                        {
                            this.sk.acceleration_amount = this.sk.acceleration_amount - 0.02 * this.vfr / (1 + 0.305 * (this.sk.sc - 1));
                            if (this.sk.acceleration_amount >= 1)
                            {
                                this.sk.acceleration_amount = 1;
                            }
                            this.sk.sp = this.sk.normal_speed + (this.nsp3 - this.sk.normal_speed) * this.sk.acceleration_amount;
                            this.sk.spang = this.sk.sp / this.spangdv;
                            if (this.sk.spang > 1)
                            {
                                this.sk.spang = 1;
                            }
                        }
                        var _loc_26:* = this;
                        var _loc_27:* = this.i - 1;
                        _loc_26.i = _loc_27;
                    }
                }
                else if (this.snake != null)
                {
                    if (this.xm != this.lsxm || this.ym != this.lsym)
                    {
                        this.want_e = true;
                    }
                    if (this.want_e && this.ctm - this.last_e_mtm > 100)
                    {
                        this.want_e = false;
                        this.last_e_mtm = this.ctm;
                        this.lsxm = this.xm;
                        this.lsym = this.ym;
                        this.d2 = this.xm * this.xm + this.ym * this.ym;
                        if (this.control_mode == 3)
                        {
                            this.tx = this.jsx;
                            this.ty = this.jsy;
                            this.ang = Math.atan2(this.ym - this.ty, this.xm - this.tx);
                            this.snake.eang = this.ang;
                            this.joystick_ii.x = this.jsx + Math.cos(this.ang) * 24;
                            this.joystick_ii.y = this.jsy + Math.sin(this.ang) * 24;
                        }
                        else if (this.control_mode == 2)
                        {
                            this.ang = this.twang;
                            this.snake.eang = this.twang;
                        }
                        else if (this.d2 > 256)
                        {
                            this.ang = Math.atan2(this.ym, this.xm);
                            this.snake.eang = this.ang;
                        }
                        else
                        {
                            this.ang = this.snake.wang;
                        }
                        this.ang = this.ang % this.pi2;
                        if (this.ang < 0)
                        {
                            this.ang = this.ang + this.pi2;
                        }
                        if (this.protocol_version >= 5)
                        {
                            this.sang = int((250 + 1) * this.ang / this.pi2);
                            if (this.sang != this.lsang)
                            {
                                this.lsang = this.sang;
                                _loc_3 = new ByteArray();
                                _loc_3.length = 1;
                                _loc_3[0] = this.sang & 255;
                                this.ws.sendBytes(_loc_3);
                            }
                        }
                        else
                        {
                            this.sang = int(16777215 * this.ang / this.pi2);
                            if (this.sang != this.lsang)
                            {
                                this.lsang = this.sang;
                                _loc_3 = new ByteArray();
                                _loc_3.length = 4;
                                _loc_3[0] = 101;
                                _loc_3[1] = this.sang >> 16 & 255;
                                _loc_3[2] = this.sang >> 8 & 255;
                                _loc_3[3] = this.sang & 255;
                                this.ws.sendBytes(_loc_3);
                            }
                        }
                    }
                    if (this.snake_md != this.snake_wmd && this.ctm - this.last_accel_mtm > 150)
                    {
                        this.snake_md = this.snake_wmd;
                        this.last_accel_mtm = this.ctm;
                        if (this.protocol_version >= 5)
                        {
                            _loc_3 = new ByteArray();
                            _loc_3.length = 1;
                            if (this.snake_md)
                            {
                                _loc_3[0] = 253;
                            }
                            else
                            {
                                _loc_3[0] = 254;
                            }
                            this.ws.sendBytes(_loc_3);
                        }
                        else
                        {
                            _loc_3 = new ByteArray();
                            _loc_3.length = 2;
                            _loc_3[0] = 109;
                            _loc_3[1] = this.snake_md ? (1) : (0);
                            this.ws.sendBytes(_loc_3);
                        }
                    }
                }
                this.i = this.snakes.length - 1;
                while (this.i >= 0)
                {
                    
                    this.sk = this.snakes[this.i];
                    this.mang = this.mamu * this.vfr * this.sk.scang * this.sk.spang;
                    this.csp = this.sk.sp * this.vfr / 4;
                    if (this.csp > this.sk.msl)
                    {
                        this.csp = this.sk.msl;
                    }
                    if (!this.sk.dead)
                    {
                        if (this.sk.iiv)
                        {
                            if (this.sk.tsp != this.sk.sp)
                            {
                                if (this.sk.tsp < this.sk.sp)
                                {
                                    this.sk.tsp = this.sk.tsp + 0.3 * this.vfr;
                                    if (this.sk.tsp > this.sk.sp)
                                    {
                                        this.sk.tsp = this.sk.sp;
                                    }
                                }
                                else
                                {
                                    this.sk.tsp = this.sk.tsp - 0.3 * this.vfr;
                                    if (this.sk.tsp < this.sk.sp)
                                    {
                                        this.sk.tsp = this.sk.sp;
                                    }
                                }
                            }
                            if (this.sk.tsp > this.sk.fsp)
                            {
                                this.sk.sfr = this.sk.sfr + (this.sk.tsp - this.sk.fsp) * this.vfr * 0.021;
                            }
                            if (this.sk.fltg > 0)
                            {
                                this.ki = this.vfrb;
                                if (this.ki > this.sk.fltg)
                                {
                                    this.ki = this.sk.fltg;
                                }
                                this.sk.fltg = this.sk.fltg - this.ki;
                                this.qq = 1;
                                while (this.qq <= this.ki)
                                {
                                    
                                    if (this.qq == this.ki)
                                    {
                                        this.sk.fl = this.sk.fls[this.sk.flpos];
                                    }
                                    this.sk.fls[this.sk.flpos] = 0;
                                    var _loc_26:* = this.sk;
                                    var _loc_27:* = _loc_26.flpos + 1;
                                    _loc_26.flpos = _loc_27;
                                    if (_loc_26.flpos >= this.lfc)
                                    {
                                        _loc_26.flpos = 0;
                                    }
                                    var _loc_26:* = this;
                                    var _loc_27:* = this.qq + 1;
                                    _loc_26.qq = _loc_27;
                                }
                            }
                            else if (this.sk.fltg == 0)
                            {
                                this.sk.fltg = -1;
                                this.sk.fl = 0;
                            }
                            this.sk.cfl = this.sk.tl + this.sk.fl;
                        }
                        else
                        {
                            this.sk.cfl = this.sk.tl;
                        }
                    }
                    if (this.sk.dir == 1)
                    {
                        this.sk.ang = this.sk.ang - this.mang;
                        if (this.sk.ang < 0 || this.sk.ang >= this.pi2)
                        {
                            this.sk.ang = this.sk.ang % this.pi2;
                        }
                        if (this.sk.ang < 0)
                        {
                            this.sk.ang = this.sk.ang + this.pi2;
                        }
                        this.vang = (this.sk.wang - this.sk.ang) % this.pi2;
                        if (this.vang < 0)
                        {
                            this.vang = this.vang + this.pi2;
                        }
                        if (this.vang > Math.PI)
                        {
                            this.vang = this.vang - this.pi2;
                        }
                        if (this.vang > 0)
                        {
                            this.sk.ang = this.sk.wang;
                            this.sk.dir = 0;
                        }
                    }
                    else if (this.sk.dir == 2)
                    {
                        this.sk.ang = this.sk.ang + this.mang;
                        if (this.sk.ang < 0 || this.sk.ang >= this.pi2)
                        {
                            this.sk.ang = this.sk.ang % this.pi2;
                        }
                        if (this.sk.ang < 0)
                        {
                            this.sk.ang = this.sk.ang + this.pi2;
                        }
                        this.vang = (this.sk.wang - this.sk.ang) % this.pi2;
                        if (this.vang < 0)
                        {
                            this.vang = this.vang + this.pi2;
                        }
                        if (this.vang > Math.PI)
                        {
                            this.vang = this.vang - this.pi2;
                        }
                        if (this.vang < 0)
                        {
                            this.sk.ang = this.sk.wang;
                            this.sk.dir = 0;
                        }
                    }
                    else
                    {
                        this.sk.ang = this.sk.wang;
                    }
                    if (this.sk.ehl != 1)
                    {
                        this.sk.ehl = this.sk.ehl + 0.03 * this.vfr;
                        if (this.sk.ehl >= 1)
                        {
                            this.sk.ehl = 1;
                        }
                    }
                    this.po = this.sk.pts[(this.sk.pts.length - 1)];
                    this.sk.wehang = Math.atan2(this.sk.yy + this.sk.fy - this.po.yy - this.po.fy + this.po.eby * (1 - this.sk.ehl), this.sk.xx + this.sk.fx - this.po.xx - this.po.fx + this.po.ebx * (1 - this.sk.ehl));
                    if (!this.sk.dead)
                    {
                        if (this.sk.ehang != this.sk.wehang)
                        {
                            this.vang = (this.sk.wehang - this.sk.ehang) % this.pi2;
                            if (this.vang < 0)
                            {
                                this.vang = this.vang + this.pi2;
                            }
                            if (this.vang > Math.PI)
                            {
                                this.vang = this.vang - this.pi2;
                            }
                            if (this.vang < 0)
                            {
                                this.sk.edir = 1;
                            }
                            else if (this.vang > 0)
                            {
                                this.sk.edir = 2;
                            }
                        }
                    }
                    if (this.sk.edir == 1)
                    {
                        this.sk.ehang = this.sk.ehang - 0.1 * this.vfr;
                        if (this.sk.ehang < 0 || this.sk.ehang >= this.pi2)
                        {
                            this.sk.ehang = this.sk.ehang % this.pi2;
                        }
                        if (this.sk.ehang < 0)
                        {
                            this.sk.ehang = this.sk.ehang + this.pi2;
                        }
                        this.vang = (this.sk.wehang - this.sk.ehang) % this.pi2;
                        if (this.vang < 0)
                        {
                            this.vang = this.vang + this.pi2;
                        }
                        if (this.vang > Math.PI)
                        {
                            this.vang = this.vang - this.pi2;
                        }
                        if (this.vang > 0)
                        {
                            this.sk.ehang = this.sk.wehang;
                            this.sk.edir = 0;
                        }
                    }
                    else if (this.sk.edir == 2)
                    {
                        this.sk.ehang = this.sk.ehang + 0.1 * this.vfr;
                        if (this.sk.ehang < 0 || this.sk.ehang >= this.pi2)
                        {
                            this.sk.ehang = this.sk.ehang % this.pi2;
                        }
                        if (this.sk.ehang < 0)
                        {
                            this.sk.ehang = this.sk.ehang + this.pi2;
                        }
                        this.vang = (this.sk.wehang - this.sk.ehang) % this.pi2;
                        if (this.vang < 0)
                        {
                            this.vang = this.vang + this.pi2;
                        }
                        if (this.vang > Math.PI)
                        {
                            this.vang = this.vang - this.pi2;
                        }
                        if (this.vang < 0)
                        {
                            this.sk.ehang = this.sk.wehang;
                            this.sk.edir = 0;
                        }
                    }
                    this.plm1 = this.sk.pts.length - 1;
                    if (!this.sk.dead)
                    {
                        this.j = this.sk.ang * this.pm2 & 65535;
                        this.sk.xx = this.sk.xx + this.angx[this.j] * this.csp;
                        this.sk.yy = this.sk.yy + this.angy[this.j] * this.csp;
                        this.sk.chl = this.sk.chl + this.csp / this.sk.msl;
                        if (this.single_player)
                        {
                            this.tx2 = this.sk.xx + this.angx[this.j] * this.sk.sc * 29 / 2;
                            this.ty2 = this.sk.yy + this.angy[this.j] * this.sk.sc * 29 / 2;
                            if (this.sk.hlt)
                            {
                                this.tx1 = this.sk.ltipx;
                                this.ty1 = this.sk.ltipy;
                            }
                            else
                            {
                                this.tx1 = this.tx2;
                                this.ty1 = this.ty2;
                                this.sk.hlt = true;
                            }
                            this.sk.ltipx = this.tx2;
                            this.sk.ltipy = this.ty2;
                            this.j = this.snakes.length - 1;
                            while (this.j >= 0)
                            {
                                
                                this.sk2 = this.snakes[this.j];
                                if (this.sk != this.sk2)
                                {
                                    if (!this.sk2.collided)
                                    {
                                        if (!this.sk2.dead)
                                        {
                                            this.l = this.sk2.pts.length;
                                            _loc_24 = this.l;
                                            while (_loc_24 >= 0)
                                            {
                                                
                                                if (_loc_24 == this.l)
                                                {
                                                    this.px = this.sk2.xx;
                                                    this.py = this.sk2.yy;
                                                }
                                                else
                                                {
                                                    this.po = this.sk2.pts[_loc_24];
                                                    if (this.po.dying)
                                                    {
                                                        break;
                                                    }
                                                    this.px = this.po.xx;
                                                    this.py = this.po.yy;
                                                }
                                                if (this.px > this.tx2)
                                                {
                                                    this.idx = this.px - this.tx2;
                                                }
                                                else
                                                {
                                                    this.idx = this.tx2 - this.px;
                                                }
                                                if (this.py > this.ty2)
                                                {
                                                    this.idy = this.py - this.ty2;
                                                }
                                                else
                                                {
                                                    this.idy = this.ty2 - this.py;
                                                }
                                                if (this.idx > this.idy)
                                                {
                                                    this.idt = this.idx;
                                                }
                                                else
                                                {
                                                    this.idt = this.idy;
                                                }
                                                this.mxd = 2 * (this.sk.sc + this.sk2.sc) * 29 / 2;
                                                if (this.idt < this.mxd)
                                                {
                                                    this.mxd = 0.975 * this.sk2.sc * 29 / 2;
                                                    this.spm = Math.sqrt(Math.pow(this.tx2 - this.tx1, 2) + Math.pow(this.ty2 - this.ty1, 2));
                                                    this.m = 0;
                                                    while (this.m <= this.spm)
                                                    {
                                                        
                                                        this.tx = this.tx1 + (this.tx2 - this.tx1) * this.m / 10;
                                                        this.ty = this.ty1 + (this.ty2 - this.ty1) * this.m / 10;
                                                        if (this.px > this.tx)
                                                        {
                                                            this.idx = this.px - this.tx;
                                                        }
                                                        else
                                                        {
                                                            this.idx = this.tx - this.px;
                                                        }
                                                        if (this.py > this.ty)
                                                        {
                                                            this.idy = this.py - this.ty;
                                                        }
                                                        else
                                                        {
                                                            this.idy = this.ty - this.py;
                                                        }
                                                        if (this.idx > this.idy)
                                                        {
                                                            this.idt = this.idx;
                                                        }
                                                        else
                                                        {
                                                            this.idt = this.idy;
                                                        }
                                                        if (this.idt < this.mxd)
                                                        {
                                                            this.d = Math.sqrt(this.idx * this.idx + this.idy * this.idy);
                                                            if (this.d < this.mxd)
                                                            {
                                                                this.sk.collided = true;
                                                                this.j = 0;
                                                                this.po = new SnakePoint();
                                                                this.po.xx = this.sk.xx;
                                                                this.po.yy = this.sk.yy;
                                                                _loc_24 = this.sk.pts.length - 1;
                                                                while (_loc_24 >= 0)
                                                                {
                                                                    
                                                                    this.lpo = this.po;
                                                                    this.po = this.sk.pts[_loc_24];
                                                                    if (this.po.dying)
                                                                    {
                                                                        break;
                                                                    }
                                                                    if (this.lpo != null)
                                                                    {
                                                                        this.j = 0;
                                                                        while (this.j < 2)
                                                                        {
                                                                            
                                                                            _loc_4 = this.lpo.xx + (this.po.xx - this.lpo.xx) * (this.j / 2);
                                                                            _loc_5 = this.lpo.yy + (this.po.yy - this.lpo.yy) * (this.j / 2);
                                                                            _loc_4 = _loc_4 + this.sk.lsz * (Math.random() - 0.5);
                                                                            _loc_5 = _loc_5 + this.sk.lsz * (Math.random() - 0.5);
                                                                            this.fo = this.newFood(_loc_4, _loc_5, 16, true, Math.floor(Math.random() * 8));
                                                                            this.fo.sx = int(_loc_4 / this.sector_size);
                                                                            this.fo.sy = int(_loc_5 / this.sector_size);
                                                                            var _loc_26:* = this;
                                                                            var _loc_27:* = this.j + 1;
                                                                            _loc_26.j = _loc_27;
                                                                        }
                                                                    }
                                                                    _loc_24 = _loc_24 - 1;
                                                                }
                                                                this.m = 99999;
                                                                _loc_24 = 0;
                                                                this.j = 0;
                                                                break;
                                                            }
                                                        }
                                                        this.m = this.m + 2;
                                                    }
                                                }
                                                _loc_24 = _loc_24 - 1;
                                            }
                                        }
                                    }
                                }
                                var _loc_26:* = this;
                                var _loc_27:* = this.j - 1;
                                _loc_26.j = _loc_27;
                            }
                            _loc_22 = this.sk.xx - this.grd;
                            _loc_23 = this.sk.yy - this.grd;
                            this.d = Math.sqrt(_loc_22 * _loc_22 + _loc_23 * _loc_23);
                            if (this.d > this.grd98 || this.sk.collided)
                            {
                                delete this.os["s" + this.sk.id];
                                this.sk.id = -1234;
                                this.sk.dead = true;
                                this.sk.dead_amt = 0;
                                this.sk.edir = 0;
                                this.sk.collided = false;
                                if (this.sk == this.snake)
                                {
                                    this.endSinglePlayer();
                                }
                            }
                            else
                            {
                                this.tx = this.sk.pts[this.plm1].xx;
                                this.ty = this.sk.pts[this.plm1].yy;
                                if (this.sk.xx > this.tx)
                                {
                                    _loc_22 = this.sk.xx - this.tx;
                                }
                                else
                                {
                                    _loc_22 = this.tx - this.sk.xx;
                                }
                                if (this.sk.yy > this.ty)
                                {
                                    _loc_23 = this.sk.yy - this.ty;
                                }
                                else
                                {
                                    _loc_23 = this.ty - this.sk.yy;
                                }
                                if (_loc_22 < 15 && _loc_23 < 15)
                                {
                                    this.d = this.dist16t[_loc_23 * 16 << 8 | _loc_22 * 16];
                                }
                                else
                                {
                                    this.d = Math.sqrt(_loc_22 * _loc_22 + _loc_23 * _loc_23);
                                }
                                if (this.d >= this.msl)
                                {
                                    _loc_17 = false;
                                    if (this.sk.fam >= 1)
                                    {
                                        var _loc_26:* = this.sk;
                                        var _loc_27:* = _loc_26.fam - 1;
                                        _loc_26.fam = _loc_27;
                                        _loc_17 = true;
                                    }
                                    if (_loc_17)
                                    {
                                        var _loc_26:* = this.sk;
                                        var _loc_27:* = _loc_26.sct + 1;
                                        _loc_26.sct = _loc_27;
                                    }
                                    else
                                    {
                                        this.j = 0;
                                        while (this.j <= this.plm1)
                                        {
                                            
                                            if (!_loc_26.pts[this.j].dying)
                                            {
                                                _loc_26.pts[this.j].dying = true;
                                                break;
                                            }
                                            var _loc_26:* = this;
                                            var _loc_27:* = this.j + 1;
                                            _loc_26.j = _loc_27;
                                        }
                                    }
                                    this.po = this.sk.pts[this.plm1];
                                    this.lpo = this.po;
                                    _loc_18 = false;
                                    _loc_4 = this.sk.xx;
                                    _loc_5 = this.sk.yy;
                                    this.po = this.points_dp.get();
                                    if (!this.po)
                                    {
                                        this.po = new SnakePoint();
                                    }
                                    this.po.eiu = 0;
                                    this.po.xx = _loc_4;
                                    this.po.yy = _loc_5;
                                    this.po.fx = 0;
                                    this.po.fy = 0;
                                    this.po.da = 0;
                                    this.po.ebx = this.po.xx - this.lpo.xx;
                                    this.po.eby = this.po.yy - this.lpo.yy;
                                    this.lpo = this.po;
                                    this.sk.pts.push(this.po);
                                    _loc_18 = true;
                                    _loc_24 = this.sk.pts.length - 3;
                                    if (_loc_24 >= 1)
                                    {
                                        _loc_21 = this.sk.pts[_loc_24];
                                        this.n = 0;
                                        _loc_20 = 0;
                                        this.j = _loc_24 - 1;
                                        while (this.j >= 0)
                                        {
                                            
                                            _loc_19 = this.sk.pts[this.j];
                                            var _loc_26:* = this;
                                            var _loc_27:* = this.n + 1;
                                            _loc_26.n = _loc_27;
                                            _loc_22 = _loc_19.xx;
                                            _loc_23 = _loc_19.yy;
                                            if (this.n <= 4)
                                            {
                                                _loc_20 = this.cst * this.n / 4;
                                            }
                                            _loc_19.xx = _loc_19.xx + (_loc_21.xx - _loc_19.xx) * _loc_20;
                                            _loc_19.yy = _loc_19.yy + (_loc_21.yy - _loc_19.yy) * _loc_20;
                                            if (this.sk.iiv)
                                            {
                                                _loc_22 = _loc_22 - _loc_19.xx;
                                                _loc_23 = _loc_23 - _loc_19.yy;
                                                _loc_19.fx = _loc_19.fx + _loc_22;
                                                _loc_19.fy = _loc_19.fy + _loc_23;
                                                _loc_19.exs[_loc_19.eiu] = _loc_22;
                                                _loc_19.eys[_loc_19.eiu] = _loc_23;
                                                _loc_19.efs[_loc_19.eiu] = 0;
                                                _loc_19.ems[_loc_19.eiu] = 2;
                                                var _loc_26:* = _loc_19;
                                                var _loc_27:* = _loc_19.eiu + 1;
                                                _loc_26.eiu = _loc_27;
                                            }
                                            _loc_21 = _loc_19;
                                            var _loc_26:* = this;
                                            var _loc_27:* = this.j - 1;
                                            _loc_26.j = _loc_27;
                                        }
                                    }
                                    this.sk.sc = Math.min(6, 1 + (this.sk.sct - 2) / 106);
                                    this.sk.sc13 = Math.pow(this.sk.sc, 1.3);
                                    this.sk.lsz = 29 * this.sk.sc;
                                    this.sk.scang = 0.13 + 0.87 * Math.pow((7 - this.sk.sc) / 6, 2);
                                    this.sk.normal_speed = this.nsp1 + this.nsp2 * this.sk.sc;
                                    this.sk.ssp = this.nsp1 + this.nsp2 * this.sk.sc;
                                    this.sk.fsp = this.sk.ssp + 0.1;
                                    this.sk.wsep = this.bsep * this.sk.sc;
                                    this.mwsep = 4.5 / this.gsc;
                                    if (this.sk.wsep < this.mwsep)
                                    {
                                        this.sk.wsep = this.mwsep;
                                    }
                                    if (_loc_17)
                                    {
                                        this.snl(this.sk);
                                    }
                                    this.sk.lnp = this.po;
                                    if (this.sk == this.snake)
                                    {
                                        this.ovxx = this.snake.xx + this.snake.fx;
                                        this.ovyy = this.snake.yy + this.snake.fy;
                                    }
                                    this.ochl = this.sk.chl - 1;
                                    this.sk.chl = 0;
                                    if (this.sk.iiv)
                                    {
                                        _loc_25 = this.sk.chl - this.ochl;
                                        _loc_24 = this.sk.fpos;
                                        this.j = 0;
                                        while (this.j < this.rfc)
                                        {
                                            
                                            this.sk.fchls[_loc_24] = this.sk.fchls[_loc_24] - _loc_25 * this.rfas[this.j];
                                            if (++_loc_24 >= this.rfc)
                                            {
                                                ++_loc_24 = 0;
                                            }
                                            var _loc_26:* = this;
                                            var _loc_27:* = this.j + 1;
                                            _loc_26.j = _loc_27;
                                        }
                                        this.sk.fchl = this.sk.fchls[this.sk.fpos];
                                        this.sk.ftg = this.rfc;
                                    }
                                    if (_loc_18)
                                    {
                                        this.sk.ehl = 0;
                                    }
                                    if (this.sk == this.snake)
                                    {
                                        this.lvx = this.view_xx;
                                        this.lvy = this.view_yy;
                                        this.view_xx = this.snake.xx + this.snake.fx;
                                        this.view_yy = this.snake.yy + this.snake.fy;
                                        this.bgx = this.bgx - (this.view_xx - this.lvx);
                                        this.bgy = this.bgy - (this.view_yy - this.lvy);
                                        _loc_22 = this.view_xx - this.ovxx;
                                        _loc_23 = this.view_yy - this.ovyy;
                                        ++_loc_24 = this.fvpos;
                                        this.j = 0;
                                        while (this.j < this.vfc)
                                        {
                                            
                                            this.fvxs[++_loc_24] = this.fvxs[++_loc_24] - _loc_22 * this.vfas[this.j];
                                            this.fvys[_loc_24] = this.fvys[_loc_24] - _loc_23 * this.vfas[this.j];
                                            if (++_loc_24 >= this.vfc)
                                            {
                                                ++_loc_24 = 0;
                                            }
                                            var _loc_26:* = this;
                                            var _loc_27:* = this.j + 1;
                                            _loc_26.j = _loc_27;
                                        }
                                        this.fvtg = this.vfc;
                                    }
                                }
                            }
                        }
                    }
                    if (this.vfrb > 0)
                    {
                        this.j = this.plm1;
                        while (this.j >= 0)
                        {
                            
                            this.po = this.sk.pts[this.j];
                            if (this.po.dying)
                            {
                                this.po.da = this.po.da + 0.0015 * this.vfr;
                                if (this.po.da > 1)
                                {
                                    this.sk.pts.splice(this.j, 1);
                                    var _loc_26:* = this;
                                    var _loc_27:* = this.plm1 - 1;
                                    _loc_26.plm1 = _loc_27;
                                    this.po.dying = false;
                                    this.points_dp.add(this.po);
                                }
                            }
                            var _loc_26:* = this;
                            var _loc_27:* = this.j - 1;
                            _loc_26.j = _loc_27;
                        }
                        this.j = this.plm1;
                        while (this.j >= 0)
                        {
                            
                            this.po = this.sk.pts[this.j];
                            if (this.po.eiu > 0)
                            {
                                this.fx = 0;
                                this.fy = 0;
                                this.cm1 = this.po.eiu - 1;
                                this.qq = this.cm1;
                                while (this.qq >= 0)
                                {
                                    
                                    if (this.po.ems[this.qq] == 2)
                                    {
                                        this.po.efs[this.qq] = this.po.efs[this.qq] + this.vfrb2;
                                    }
                                    else
                                    {
                                        this.po.efs[this.qq] = this.po.efs[this.qq] + this.vfrb;
                                    }
                                    ++_loc_24 = this.po.efs[this.qq];
                                    if (++_loc_24 >= this.hfc)
                                    {
                                        if (this.qq == this.cm1)
                                        {
                                            var _loc_26:* = this.po;
                                            var _loc_27:* = _loc_26.eiu - 1;
                                            _loc_26.eiu = _loc_27;
                                            var _loc_26:* = this;
                                            var _loc_27:* = this.cm1 - 1;
                                            _loc_26.cm1 = _loc_27;
                                        }
                                        else
                                        {
                                            this.po.exs[this.qq] = this.po.exs[this.cm1];
                                            this.po.eys[this.qq] = this.po.eys[this.cm1];
                                            this.po.efs[this.qq] = this.po.efs[this.cm1];
                                            this.po.ems[this.qq] = this.po.ems[this.cm1];
                                            var _loc_26:* = this.po;
                                            var _loc_27:* = _loc_26.eiu - 1;
                                            _loc_26.eiu = _loc_27;
                                            var _loc_26:* = this;
                                            var _loc_27:* = this.cm1 - 1;
                                            _loc_26.cm1 = _loc_27;
                                        }
                                    }
                                    else
                                    {
                                        this.fx = this.fx + this.po.exs[this.qq] * this.hfas[_loc_24];
                                        this.fy = this.fy + this.po.eys[this.qq] * this.hfas[_loc_24];
                                    }
                                    var _loc_26:* = this;
                                    var _loc_27:* = this.qq - 1;
                                    _loc_26.qq = _loc_27;
                                }
                                this.po.fx = this.fx;
                                this.po.fy = this.fy;
                            }
                            var _loc_26:* = this;
                            var _loc_27:* = this.j - 1;
                            _loc_26.j = _loc_27;
                        }
                    }
                    this.j2 = this.sk.eang * this.pm2 & 65535;
                    this.wx = this.angx[this.j2] * this.sk.pma;
                    this.wy = this.angy[this.j2] * this.sk.pma;
                    if (this.sk.rex < this.wx)
                    {
                        this.sk.rex = this.sk.rex + this.vfr / 6;
                        if (this.sk.rex >= this.wx)
                        {
                            this.sk.rex = this.wx;
                        }
                    }
                    if (this.sk.rey < this.wy)
                    {
                        this.sk.rey = this.sk.rey + this.vfr / 6;
                        if (this.sk.rey >= this.wy)
                        {
                            this.sk.rey = this.wy;
                        }
                    }
                    if (this.sk.rex > this.wx)
                    {
                        this.sk.rex = this.sk.rex - this.vfr / 6;
                        if (this.sk.rex <= this.wx)
                        {
                            this.sk.rex = this.wx;
                        }
                    }
                    if (this.sk.rey > this.wy)
                    {
                        this.sk.rey = this.sk.rey - this.vfr / 6;
                        if (this.sk.rey <= this.wy)
                        {
                            this.sk.rey = this.wy;
                        }
                    }
                    if (this.vfrb > 0)
                    {
                        if (this.sk.ftg > 0)
                        {
                            this.ki = this.vfrb;
                            if (this.ki > this.sk.ftg)
                            {
                                this.ki = this.sk.ftg;
                            }
                            this.sk.ftg = this.sk.ftg - this.ki;
                            this.qq = 1;
                            while (this.qq <= this.ki)
                            {
                                
                                if (this.qq == this.ki)
                                {
                                    this.sk.fx = this.sk.fxs[this.sk.fpos];
                                    this.sk.fy = this.sk.fys[this.sk.fpos];
                                    this.sk.fchl = this.sk.fchls[this.sk.fpos];
                                }
                                this.sk.fxs[this.sk.fpos] = 0;
                                this.sk.fys[this.sk.fpos] = 0;
                                this.sk.fchls[this.sk.fpos] = 0;
                                var _loc_26:* = this.sk;
                                var _loc_27:* = _loc_26.fpos + 1;
                                _loc_26.fpos = _loc_27;
                                if (_loc_26.fpos >= this.rfc)
                                {
                                    _loc_26.fpos = 0;
                                }
                                var _loc_26:* = this;
                                var _loc_27:* = this.qq + 1;
                                _loc_26.qq = _loc_27;
                            }
                        }
                        else if (this.sk.ftg == 0)
                        {
                            this.sk.ftg = -1;
                            this.sk.fx = 0;
                            this.sk.fy = 0;
                            this.sk.fchl = 0;
                        }
                        if (this.sk.fatg > 0)
                        {
                            this.ki = this.vfrb;
                            if (this.ki > this.sk.fatg)
                            {
                                this.ki = this.sk.fatg;
                            }
                            this.sk.fatg = this.sk.fatg - this.ki;
                            this.qq = 1;
                            while (this.qq <= this.ki)
                            {
                                
                                if (this.qq == this.ki)
                                {
                                    this.sk.fa = this.sk.fas[this.sk.fapos];
                                }
                                this.sk.fas[this.sk.fapos] = 0;
                                var _loc_26:* = this.sk;
                                var _loc_27:* = _loc_26.fapos + 1;
                                _loc_26.fapos = _loc_27;
                                if (_loc_26.fapos >= this.afc)
                                {
                                    _loc_26.fapos = 0;
                                }
                                var _loc_26:* = this;
                                var _loc_27:* = this.qq + 1;
                                _loc_26.qq = _loc_27;
                            }
                        }
                        else if (this.sk.fatg == 0)
                        {
                            this.sk.fatg = -1;
                            this.sk.fa = 0;
                        }
                    }
                    if (this.sk.dead)
                    {
                        this.sk.dead_amt = this.sk.dead_amt + this.vfr * 0.02;
                        if (this.sk.dead_amt >= 1)
                        {
                            this.snakes.splice(this.i, 1);
                        }
                    }
                    else if (this.sk.alive_amt != 1)
                    {
                        this.sk.alive_amt = this.sk.alive_amt + this.vfr * 0.015;
                        if (this.sk.alive_amt >= 1)
                        {
                            this.sk.alive_amt = 1;
                        }
                    }
                    var _loc_26:* = this;
                    var _loc_27:* = this.i - 1;
                    _loc_26.i = _loc_27;
                }
            }
            this.i = this.preys_cm1;
            while (this.i >= 0)
            {
                
                this.pr = this.preys[this.i];
                this.mang = this.mamu2 * this.vfr;
                this.csp = this.pr.sp * this.vfr / 4;
                if (this.vfrb > 0)
                {
                    if (this.pr.ftg > 0)
                    {
                        this.ki = this.vfrb;
                        if (this.ki > this.pr.ftg)
                        {
                            this.ki = this.pr.ftg;
                        }
                        this.pr.ftg = this.pr.ftg - this.ki;
                        this.qq = 1;
                        while (this.qq <= this.ki)
                        {
                            
                            if (this.qq == this.ki)
                            {
                                this.pr.fx = this.pr.fxs[this.pr.fpos];
                                this.pr.fy = this.pr.fys[this.pr.fpos];
                            }
                            this.pr.fxs[this.pr.fpos] = 0;
                            this.pr.fys[this.pr.fpos] = 0;
                            var _loc_26:* = this.pr;
                            var _loc_27:* = _loc_26.fpos + 1;
                            _loc_26.fpos = _loc_27;
                            if (_loc_26.fpos >= this.rfc)
                            {
                                _loc_26.fpos = 0;
                            }
                            var _loc_26:* = this;
                            var _loc_27:* = this.qq + 1;
                            _loc_26.qq = _loc_27;
                        }
                    }
                    else if (this.pr.ftg == 0)
                    {
                        this.pr.fx = 0;
                        this.pr.fy = 0;
                        this.pr.ftg = -1;
                    }
                }
                if (this.pr.dir == 1)
                {
                    this.pr.ang = this.pr.ang - this.mang;
                    if (this.pr.ang < 0 || this.pr.ang >= this.pi2)
                    {
                        this.pr.ang = this.pr.ang % this.pi2;
                    }
                    if (this.pr.ang < 0)
                    {
                        this.pr.ang = this.pr.ang + this.pi2;
                    }
                    this.vang = (this.pr.wang - this.pr.ang) % this.pi2;
                    if (this.vang < 0)
                    {
                        this.vang = this.vang + this.pi2;
                    }
                    if (this.vang > Math.PI)
                    {
                        this.vang = this.vang - this.pi2;
                    }
                    if (this.vang > 0)
                    {
                        this.pr.ang = this.pr.wang;
                        this.pr.dir = 0;
                    }
                }
                else if (this.pr.dir == 2)
                {
                    this.pr.ang = this.pr.ang + this.mang;
                    if (this.pr.ang < 0 || this.pr.ang >= this.pi2)
                    {
                        this.pr.ang = this.pr.ang % this.pi2;
                    }
                    if (this.pr.ang < 0)
                    {
                        this.pr.ang = this.pr.ang + this.pi2;
                    }
                    this.vang = (this.pr.wang - this.pr.ang) % this.pi2;
                    if (this.vang < 0)
                    {
                        this.vang = this.vang + this.pi2;
                    }
                    if (this.vang > Math.PI)
                    {
                        this.vang = this.vang - this.pi2;
                    }
                    if (this.vang < 0)
                    {
                        this.pr.ang = this.pr.wang;
                        this.pr.dir = 0;
                    }
                }
                else
                {
                    this.pr.ang = this.pr.wang;
                }
                this.j2 = this.pr.ang * this.pm2 & 65535;
                this.pr.xx = this.pr.xx + this.angx[this.j2] * this.csp;
                this.pr.yy = this.pr.yy + this.angy[this.j2] * this.csp;
                this.pr.gfr = this.pr.gfr + this.vfr;
                if (this.pr.eaten)
                {
                    if (this.pr.fr != 1.5)
                    {
                        this.pr.fr = this.pr.fr + this.vfr / 150;
                        if (this.pr.fr >= 1.5)
                        {
                            this.pr.fr = 1.5;
                        }
                    }
                    this.pr.eaten_fr = this.pr.eaten_fr + this.vfr / 41;
                    this.pr.gfr = this.pr.gfr + this.vfr;
                    this.sk = this.pr.eaten_by;
                    if (this.pr.eaten_fr >= 1 || !this.sk)
                    {
                        this.preys[this.i] = this.preys[this.preys_cm1];
                        this.preys[this.preys_cm1] = null;
                        var _loc_26:* = this;
                        var _loc_27:* = this.preys_cm1 - 1;
                        _loc_26.preys_cm1 = _loc_27;
                    }
                    else
                    {
                        this.pr.rad = 1 - Math.pow(this.pr.eaten_fr, 3);
                    }
                }
                else if (this.pr.fr != 1)
                {
                    this.pr.fr = this.pr.fr + this.vfr / 150;
                    if (this.pr.fr >= 1)
                    {
                        this.pr.fr = 1;
                        this.pr.rad = 1;
                    }
                    else
                    {
                        this.pr.rad = 0.5 * (1 - Math.cos(Math.PI * this.pr.fr));
                        this.pr.rad = this.pr.rad + (0.5 * (1 - Math.cos(Math.PI * this.pr.rad)) - this.pr.rad) * 0.66;
                    }
                }
                var _loc_26:* = this;
                var _loc_27:* = this.i - 1;
                _loc_26.i = _loc_27;
            }
            if (this.has_moving_food)
            {
                this.has_moving_food = false;
                this.moving_food_batch.reset();
            }
            this.i = this.foods_cm1;
            while (this.i >= 0)
            {
                
                this.fo = this.foods[this.i];
                this.fo.gfr = this.fo.gfr + this.vfr;
                if (this.fo.eaten)
                {
                    this.fo.eaten_fr = this.fo.eaten_fr + this.vfr / 41;
                    this.sk = this.fo.eaten_by;
                    if (this.fo.eaten_fr >= 1 || !this.sk)
                    {
                        if (this.fo.food_batch != null)
                        {
                            this.fo.food_batch.regenerating = true;
                            var _loc_26:* = this.fo.food_batch;
                            var _loc_27:* = _loc_26.count - 1;
                            _loc_26.count = _loc_27;
                            this.fo.food_batch = null;
                        }
                        this.foods[this.i] = this.foods[this.foods_cm1];
                        this.foods[this.foods_cm1] = null;
                        var _loc_26:* = this;
                        var _loc_27:* = this.foods_cm1 - 1;
                        _loc_26.foods_cm1 = _loc_27;
                    }
                    else
                    {
                        _loc_24 = this.fo.eaten_fr * this.fo.eaten_fr;
                        this.fo.rad = this.fo.lrrad * (1 - _loc_24 * this.fo.eaten_fr);
                        this.j2 = (this.sk.ang + this.sk.fa) * this.pm2 & 65535;
                        this.fo.rx = this.fo.xx + (this.sk.xx + this.sk.fx + this.angx[this.j2] * (43 - _loc_24 * 24) * (1 - _loc_24) - this.fo.xx) * _loc_24;
                        this.fo.ry = this.fo.yy + (this.sk.yy + this.sk.fy + this.angy[this.j2] * (43 - _loc_24 * 24) * (1 - _loc_24) - this.fo.yy) * _loc_24;
                        this.tx = this.fo.rx;
                        this.ty = this.fo.ry;
                        if (this.tx >= this.fpx1 && this.ty >= this.fpy1 && this.tx <= this.fpx2 && this.ty <= this.fpy2)
                        {
                            this.ii = this.per_color_imgs[this.fo.cv].imgs[this.fo.cv2];
                            this.ii.x = this.tx;
                            this.ii.y = this.ty;
                            this.ii.alpha = this.fo.fr;
                            var _loc_26:* = this.fo.rad * 1.35 * (this.fo.sz / 16 + 0.2);
                            this.ii.scaleY = this.fo.rad * 1.35 * (this.fo.sz / 16 + 0.2);
                            this.ii.scaleX = _loc_26;
                            if (!this.has_moving_food)
                            {
                                this.has_moving_food = true;
                            }
                            this.moving_food_batch.addImage(this.ii);
                        }
                    }
                }
                else
                {
                    if (this.fo.fr != 1)
                    {
                        this.fo.fr = this.fo.fr + this.fo.rsp * this.vfr / 150;
                        if (this.fo.fr >= 1)
                        {
                            this.fo.fr = 1;
                            this.fo.rad = 1;
                            this.food_batch = null;
                            this.j = this.food_batches.length - 1;
                            while (this.j >= 0)
                            {
                                
                                if (this.food_batches[this.j].sx == this.fo.sx && this.food_batches[this.j].sy == this.fo.sy && this.food_batches[this.j].used)
                                {
                                    this.food_batch = this.food_batches[this.j];
                                    break;
                                }
                                else if (this.food_batch == null && !this.food_batches[this.j].used)
                                {
                                    this.food_batch = this.food_batches[this.j];
                                }
                                var _loc_26:* = this;
                                var _loc_27:* = this.j - 1;
                                _loc_26.j = _loc_27;
                            }
                            if (!this.food_batch)
                            {
                                this.food_batch = new FoodBatch();
                                this.food_batches.push(this.food_batch);
                                this.food_batch.batch = new QuadBatch();
                                this.food_batch.shown = false;
                                this.food_batch.batch.visible = false;
                                this.food_batch.batch.touchable = false;
                                this.food_batch.sx = this.fo.sx;
                                this.food_batch.sy = this.fo.sy;
                                this.food_batch.xx = this.fo.sx * this.sector_size;
                                this.food_batch.yy = this.fo.sy * this.sector_size;
                                this.food_batch.xx2 = this.food_batch.xx + this.sector_size;
                                this.food_batch.yy2 = this.food_batch.yy + this.sector_size;
                                this.food_batch.batch.x = this.food_batch.xx;
                                this.food_batch.batch.y = this.food_batch.yy;
                                this.food_layer.addChild(this.food_batch.batch);
                                trace("new food_batches.length: " + this.food_batches.length);
                            }
                            else if (this.food_batch.sx != this.fo.sx || this.food_batch.sy != this.fo.sy)
                            {
                                this.food_batch.sx = this.fo.sx;
                                this.food_batch.sy = this.fo.sy;
                                this.food_batch.xx = this.fo.sx * this.sector_size;
                                this.food_batch.yy = this.fo.sy * this.sector_size;
                                this.food_batch.xx2 = this.food_batch.xx + this.sector_size;
                                this.food_batch.yy2 = this.food_batch.yy + this.sector_size;
                                this.food_batch.batch.x = this.food_batch.xx;
                                this.food_batch.batch.y = this.food_batch.yy;
                            }
                            if (!this.food_batch.used)
                            {
                                this.food_batch.used = true;
                            }
                            var _loc_26:* = this.food_batch;
                            var _loc_27:* = _loc_26.count + 1;
                            _loc_26.count = _loc_27;
                            this.fo.food_batch = this.food_batch;
                            this.ii = this.per_color_imgs[this.fo.cv].imgs[this.fo.cv2];
                            this.ii.x = this.fo.rx - this.fo.food_batch.xx;
                            this.ii.y = this.fo.ry - this.fo.food_batch.yy;
                            this.ii.alpha = 1;
                            var _loc_26:* = 1.35 * (this.fo.sz / 16 + 0.2);
                            this.ii.scaleY = 1.35 * (this.fo.sz / 16 + 0.2);
                            this.ii.scaleX = _loc_26;
                            this.food_batch.batch.addImage(this.ii);
                        }
                        else
                        {
                            this.fo.rad = 0.5 * (1 - Math.cos(Math.PI * this.fo.fr));
                            this.fo.rad = this.fo.rad + (0.5 * (1 - Math.cos(Math.PI * this.fo.rad)) - this.fo.rad) * 0.66;
                            this.tx = this.fo.rx;
                            this.ty = this.fo.ry;
                            if (this.tx >= this.fpx1 && this.ty >= this.fpy1 && this.tx <= this.fpx2 && this.ty <= this.fpy2)
                            {
                                this.ii = this.per_color_imgs[this.fo.cv].imgs[this.fo.cv2];
                                this.ii.x = this.tx;
                                this.ii.y = this.ty;
                                this.ii.alpha = this.fo.fr;
                                var _loc_26:* = this.fo.rad * 1.35 * (this.fo.sz / 16 + 0.2);
                                this.ii.scaleY = this.fo.rad * 1.35 * (this.fo.sz / 16 + 0.2);
                                this.ii.scaleX = _loc_26;
                                if (!this.has_moving_food)
                                {
                                    this.has_moving_food = true;
                                }
                                this.moving_food_batch.addImage(this.ii);
                            }
                        }
                        this.fo.lrrad = this.fo.rad;
                    }
                    this.fo.rx = this.fo.xx;
                    this.fo.ry = this.fo.yy;
                }
                var _loc_26:* = this;
                var _loc_27:* = this.i - 1;
                _loc_26.i = _loc_27;
            }
            this.vfr = 0;
            this.vfrb = 0;
            this.redraw();
            return;
        }// end function

        public function redraw()
        {
            var _loc_1:* = undefined;
            if (this.snake != null)
            {
                this.dgsc = 0.35 + 0.35 / Math.max(1, (this.snake.sct + 16) / 36);
                if (this.gsc != this.dgsc)
                {
                    if (this.gsc > 1)
                    {
                        this.gsc = this.dgsc;
                    }
                    else if (this.gsc < this.dgsc)
                    {
                        this.gsc = this.gsc + 0.0002;
                        if (this.gsc >= this.dgsc)
                        {
                            this.gsc = this.dgsc;
                        }
                    }
                    else
                    {
                        this.gsc = this.gsc - 0.0002;
                        if (this.gsc <= this.dgsc)
                        {
                            this.gsc = this.dgsc;
                        }
                    }
                    this.grsz();
                }
                if (this.fvtg > 0)
                {
                    var _loc_2:* = this;
                    var _loc_3:* = this.fvtg - 1;
                    _loc_2.fvtg = _loc_3;
                    this.fvx = this.fvxs[this.fvpos];
                    this.fvy = this.fvys[this.fvpos];
                    this.fvxs[this.fvpos] = 0;
                    this.fvys[this.fvpos] = 0;
                    var _loc_2:* = this;
                    var _loc_3:* = this.fvpos + 1;
                    _loc_2.fvpos = _loc_3;
                    if (this.fvpos >= this.vfc)
                    {
                        this.fvpos = 0;
                    }
                }
                this.lvx = this.view_xx;
                this.lvy = this.view_yy;
                this.view_xx = this.snake.xx + this.snake.fx + this.fvx;
                this.view_yy = this.snake.yy + this.snake.fy + this.fvy;
                if (this.choosing_skin)
                {
                    this.view_xx = this.view_xx - 104;
                    var _loc_2:* = 1;
                    this.dgsc = 1;
                    this.gsc = _loc_2;
                }
                this.game_layer.x = -this.view_xx;
                this.game_layer.y = -this.view_yy;
                this.bgx = this.bgx - (this.view_xx - this.lvx);
                this.bgy = this.bgy - (this.view_yy - this.lvy);
                if (this.bgx > this.bgw2)
                {
                    this.bgx = this.bgx - this.bgw;
                }
                else if (this.bgx < -this.bgw2)
                {
                    this.bgx = this.bgx + this.bgw;
                }
                if (this.bgy > this.bgh2)
                {
                    this.bgy = this.bgy - this.bgh;
                }
                else if (this.bgy < -this.bgh2)
                {
                    this.bgy = this.bgy + this.bgh;
                }
                this.bg_layer.x = this.bgx;
                this.bg_layer.y = this.bgy;
                this.view_ang = Math.atan2(this.view_yy - this.grd, this.view_xx - this.grd);
                this.view_dist = Math.sqrt((this.view_xx - this.grd) * (this.view_xx - this.grd) + (this.view_yy - this.grd) * (this.view_yy - this.grd));
                this.tx = this.mww2 / this.gsc;
                this.ty = this.mhh2 / this.gsc;
                this.bpx1 = this.view_xx - (this.tx + 84);
                this.bpy1 = this.view_yy - (this.ty + 84);
                this.bpx2 = this.view_xx + (this.tx + 84);
                this.bpy2 = this.view_yy + (this.ty + 84);
                this.fpx1 = this.view_xx - (this.tx + 24);
                this.fpy1 = this.view_yy - (this.ty + 24);
                this.fpx2 = this.view_xx + (this.tx + 24);
                this.fpy2 = this.view_yy + (this.ty + 24);
                this.apx1 = this.view_xx - (this.tx + 210);
                this.apy1 = this.view_yy - (this.ty + 210);
                this.apx2 = this.view_xx + (this.tx + 210);
                this.apy2 = this.view_yy + (this.ty + 210);
                this.spx1 = this.view_xx - (this.tx + 1500);
                this.spy1 = this.view_yy - (this.ty + 1500);
                this.spx2 = this.view_xx + (this.tx + 1500);
                this.spy2 = this.view_yy + (this.ty + 1500);
                this.i = this.food_batches.length - 1;
                while (this.i >= 0)
                {
                    
                    if (this.food_batches[this.i].used)
                    {
                        this.food_batch = this.food_batches[this.i];
                        if (this.food_batch.xx2 >= this.fpx1 && this.food_batch.yy2 >= this.fpy1 && this.food_batch.xx <= this.fpx2 && this.food_batch.yy <= this.fpy2)
                        {
                            if (!this.food_batch.shown)
                            {
                                this.food_batch.shown = true;
                                this.food_batch.batch.visible = true;
                            }
                        }
                        else if (this.food_batch.shown)
                        {
                            this.food_batch.shown = false;
                            this.food_batch.batch.visible = false;
                        }
                    }
                    var _loc_2:* = this;
                    var _loc_3:* = this.i - 1;
                    _loc_2.i = _loc_3;
                }
            }
            if (this.finger_count > 0)
            {
                if (this.snake != null)
                {
                    if (!this.snake.dead)
                    {
                        this.arrow_batch.reset();
                        this.arrow_add_batch.reset();
                        this.i = this.finger_count - 1;
                        while (this.i >= 0)
                        {
                            
                            this.fing = this.fingers[this.i];
                            if (this.fing.xx > this.fing.rx)
                            {
                                this.tx = this.fing.xx - this.fing.rx;
                            }
                            else
                            {
                                this.tx = this.fing.rx - this.fing.xx;
                            }
                            if (this.fing.yy > this.fing.ry)
                            {
                                this.ty = this.fing.yy - this.fing.ry;
                            }
                            else
                            {
                                this.ty = this.fing.ry - this.fing.yy;
                            }
                            if (this.tx + this.ty < 40)
                            {
                                this.fing.rx = this.fing.rx + (this.fing.xx - this.fing.rx) * 0.2;
                                this.fing.ry = this.fing.ry + (this.fing.yy - this.fing.ry) * 0.2;
                            }
                            else
                            {
                                this.fing.rx = this.fing.rx + (this.fing.xx - this.fing.rx) * 0.6;
                                this.fing.ry = this.fing.ry + (this.fing.yy - this.fing.ry) * 0.6;
                            }
                            if (this.fing.dead)
                            {
                                this.d = Math.pow(this.fing.dead_fr, 2.5);
                                this.tx = this.fing.rx + this.fing.avx * this.d * 260;
                                this.ty = this.fing.ry + this.fing.avy * this.d * 260;
                                this.arrow_ii.x = this.tx;
                                this.arrow_ii.y = this.ty;
                                this.arrow_ii.rotation = this.twang;
                            }
                            else
                            {
                                this.arrow_ii.x = this.fing.rx;
                                this.arrow_ii.y = this.fing.ry;
                                this.arrow_ii.rotation = Math.atan2(this.fing.ry, this.fing.rx);
                            }
                            var _loc_2:* = 0.5 + 0.25 * this.fing.accel_a;
                            this.arrow_ii.scaleY = 0.5 + 0.25 * this.fing.accel_a;
                            this.arrow_ii.scaleX = _loc_2;
                            this.arrow_ii.color = this.snake.arrow_color;
                            this.arrow_ii.alpha = this.fing.a;
                            this.arrow_batch.addImage(this.arrow_ii);
                            if (this.fing.accel_a > 0)
                            {
                                this.d = this.fing.a * this.fing.accel_a * (0.5 + 0.5 * Math.cos(this.fing.accel_fr));
                                this.arrow_add_ii.x = this.arrow_ii.x;
                                this.arrow_add_ii.y = this.arrow_ii.y;
                                var _loc_2:* = 0.5 + 0.25 * this.fing.accel_a;
                                this.arrow_add_ii.scaleY = 0.5 + 0.25 * this.fing.accel_a;
                                this.arrow_add_ii.scaleX = _loc_2;
                                this.arrow_add_ii.color = this.snake.arrow_color;
                                this.arrow_add_ii.rotation = this.arrow_ii.rotation;
                                this.arrow_add_ii.alpha = this.d;
                                this.arrow_add_batch.addImage(this.arrow_add_ii);
                            }
                            var _loc_2:* = this;
                            var _loc_3:* = this.i - 1;
                            _loc_2.i = _loc_3;
                        }
                    }
                    else
                    {
                        this.finger_count = 0;
                    }
                }
                else
                {
                    this.finger_count = 0;
                }
            }
            else if (this.had_fingers)
            {
                this.arrow_batch.reset();
                this.arrow_add_batch.reset();
                this.had_fingers = false;
            }
            this.i = this.food_batches.length - 1;
            while (this.i >= 0)
            {
                
                if (this.food_batches[this.i].regenerating)
                {
                    this.any_regenerating = true;
                    this.food_batches[this.i].batch.reset();
                    var _loc_2:* = this;
                    var _loc_3:* = this.fbrc + 1;
                    _loc_2.fbrc = _loc_3;
                }
                var _loc_2:* = this;
                var _loc_3:* = this.i - 1;
                _loc_2.i = _loc_3;
            }
            if (this.any_regenerating)
            {
                this.i = this.foods_cm1;
                while (this.i >= 0)
                {
                    
                    this.fo = this.foods[this.i];
                    if (this.fo.fr == 1 && !this.fo.eaten)
                    {
                        if (this.fo.food_batch.regenerating)
                        {
                            this.ii = this.per_color_imgs[this.fo.cv].imgs[this.fo.cv2];
                            this.ii.x = this.fo.rx - this.fo.food_batch.xx;
                            this.ii.y = this.fo.ry - this.fo.food_batch.yy;
                            this.ii.alpha = 1;
                            var _loc_2:* = 1.35 * (this.fo.sz / 16 + 0.2);
                            this.ii.scaleY = 1.35 * (this.fo.sz / 16 + 0.2);
                            this.ii.scaleX = _loc_2;
                            this.fo.food_batch.batch.addImage(this.ii);
                        }
                    }
                    var _loc_2:* = this;
                    var _loc_3:* = this.i - 1;
                    _loc_2.i = _loc_3;
                }
                this.i = this.food_batches.length - 1;
                while (this.i >= 0)
                {
                    
                    if (this.food_batches[this.i].regenerating)
                    {
                        this.food_batches[this.i].regenerating = false;
                    }
                    if (this.food_batches[this.i].used)
                    {
                        if (this.food_batches[this.i].count == 0)
                        {
                            this.food_batches[this.i].used = false;
                            this.food_batches[this.i].shown = false;
                            this.food_batches[this.i].batch.visible = false;
                        }
                    }
                    var _loc_2:* = this;
                    var _loc_3:* = this.i - 1;
                    _loc_2.i = _loc_3;
                }
                this.any_regenerating = false;
            }
            this.i = this.preys_cm1;
            while (this.i >= 0)
            {
                
                this.pr = this.preys[this.i];
                this.tx = this.pr.xx + this.pr.fx;
                this.ty = this.pr.yy + this.pr.fy;
                if (this.pr.eaten)
                {
                    this.sk = this.pr.eaten_by;
                    this.k = Math.pow(this.pr.eaten_fr, 2);
                    this.tx = this.tx + (this.sk.xx + this.sk.fx + Math.cos(this.sk.ang + this.sk.fa) * (43 - this.k * 24) * (1 - this.k) - this.tx) * this.k;
                    this.ty = this.ty + (this.sk.yy + this.sk.fy + Math.sin(this.sk.ang + this.sk.fa) * (43 - this.k * 24) * (1 - this.k) - this.ty) * this.k;
                }
                if (this.tx >= this.fpx1 && this.ty >= this.fpy1 && this.tx <= this.fpx2 && this.ty <= this.fpy2)
                {
                    this.ii = this.per_color_imgs[this.pr.cv].pr_imgs[this.pr.cv2];
                    this.ii.x = this.tx;
                    this.ii.y = this.ty;
                    this.ii.alpha = this.pr.fr;
                    var _loc_2:* = this.pr.rad;
                    this.ii.scaleY = this.pr.rad;
                    this.ii.scaleX = _loc_2;
                    if (!this.has_moving_food)
                    {
                        this.has_moving_food = true;
                    }
                    this.moving_food_batch.addImage(this.ii);
                }
                var _loc_2:* = this;
                var _loc_3:* = this.i - 1;
                _loc_2.i = _loc_3;
            }
            this.sbic = 0;
            this.snake_batch.reset();
            this.snake_add_batch.reset();
            this.i = this.snakes.length - 1;
            while (this.i >= 0)
            {
                
                this.sk = this.snakes[this.i];
                this.sk.iiv = false;
                this.j = this.sk.pts.length - 1;
                while (this.j >= 0)
                {
                    
                    this.po = this.sk.pts[this.j];
                    this.px = this.po.xx + this.po.fx;
                    this.py = this.po.yy + this.po.fy;
                    if (this.px >= this.bpx1 && this.py >= this.bpy1 && this.px <= this.bpx2 && this.py <= this.bpy2)
                    {
                        this.sk.iiv = true;
                        break;
                    }
                    var _loc_2:* = this;
                    var _loc_3:* = this.j - 1;
                    _loc_2.j = _loc_3;
                }
                this.tx = this.sk.xx + this.sk.fx;
                this.ty = this.sk.yy + this.sk.fy + 30 + 13 * this.sk.sc;
                if (this.sk.na > 0)
                {
                    if (this.tx >= this.bpx1 - 100 && this.ty >= this.bpy1 && this.tx <= this.bpx2 + 100 && this.ty <= this.bpy2)
                    {
                        this.drawText(this.sk.nick, this.snake_batch, this.tx, this.ty, 16, this.sk.cs, 0.8 * this.sk.na * (1 - this.sk.dead_amt), 1);
                    }
                }
                var _loc_2:* = this;
                var _loc_3:* = this.i - 1;
                _loc_2.i = _loc_3;
            }
            this.i = this.snakes.length - 1;
            while (this.i >= 0)
            {
                
                this.sk = this.snakes[this.i];
                if (this.sk.iiv)
                {
                    this.ssc = this.sk.sc;
                    this.lsz = 29 * this.ssc / 64;
                    this.hx = this.sk.xx + this.sk.fx;
                    this.hy = this.sk.yy + this.sk.fy;
                    this.px = this.hx;
                    this.py = this.hy;
                    this.ax2 = this.px;
                    this.ay2 = this.py;
                    this.po = this.sk.pts[(this.sk.pts.length - 1)];
                    this.sgp = 0;
                    if (this.sgp == this.sgc)
                    {
                        this.sgo = new Segment();
                        this.segs.push(this.sgo);
                        var _loc_2:* = this;
                        var _loc_3:* = this.sgc + 1;
                        _loc_2.sgc = _loc_3;
                    }
                    else
                    {
                        this.sgo = this.segs[this.sgp];
                    }
                    var _loc_2:* = this;
                    var _loc_3:* = this.sgp + 1;
                    _loc_2.sgp = _loc_3;
                    if (this.ax2 >= this.bpx1 && this.ay2 >= this.bpy1 && this.ax2 <= this.bpx2 && this.ay2 <= this.bpy2)
                    {
                        this.sgo.x = this.ax2;
                        this.sgo.y = this.ay2;
                        this.sgo.iiv = true;
                        this.sgo.ang = this.sk.ang + this.sk.fa;
                    }
                    else
                    {
                        this.sgo.iiv = false;
                    }
                    this.fang = this.sk.ehang;
                    this.km = 0.25;
                    this.n = (this.sk.chl + this.sk.fchl) % this.km;
                    if (this.n < 0)
                    {
                        this.n = this.n + this.km;
                    }
                    this.n = this.km - this.n;
                    this.rl = (this.sk.cfl + 1) - this.km * Math.ceil((this.sk.chl + this.sk.fchl) / this.km);
                    this.ax = this.px;
                    this.ay = this.py;
                    if (this.sk.sep != this.sk.wsep)
                    {
                        if (this.sk.sep < this.sk.wsep)
                        {
                            this.sk.sep = this.sk.sep + 0.003;
                            if (this.sk.sep >= this.sk.wsep)
                            {
                                this.sk.sep = this.sk.wsep;
                            }
                        }
                        else if (this.sk.sep > this.sk.wsep)
                        {
                            this.sk.sep = this.sk.sep - 0.003;
                            if (this.sk.sep < this.sk.wsep)
                            {
                                this.sk.sep = this.sk.wsep;
                            }
                        }
                    }
                    this.sep = this.sk.sep;
                    this.rmr = 0;
                    this.j = this.sk.pts.length - 1;
                    while (this.j >= 0)
                    {
                        
                        this.po = this.sk.pts[this.j];
                        this.lpx = this.px;
                        this.lpy = this.py;
                        this.px = this.po.xx + this.po.fx;
                        this.py = this.po.yy + this.po.fy;
                        if (this.rl > -this.km)
                        {
                            this.ax1 = this.ax2;
                            this.ay1 = this.ay2;
                            this.ax2 = (this.px + this.lpx) / 2;
                            this.ay2 = (this.py + this.lpy) / 2;
                            this.cx2 = this.lpx;
                            this.cy2 = this.lpy;
                            this.k = 0;
                            while (this.k < 1)
                            {
                                
                                this.m = this.n + this.k;
                                this.ix1 = this.ax1 + (this.cx2 - this.ax1) * this.m;
                                this.iy1 = this.ay1 + (this.cy2 - this.ay1) * this.m;
                                this.ix2 = this.cx2 + (this.ax2 - this.cx2) * this.m;
                                this.iy2 = this.cy2 + (this.ay2 - this.cy2) * this.m;
                                this.lax = this.ax;
                                this.lay = this.ay;
                                this.ax = this.ix1 + (this.ix2 - this.ix1) * this.m;
                                this.ay = this.iy1 + (this.iy2 - this.iy1) * this.m;
                                if (this.rl < 0)
                                {
                                    this.ax = this.ax + (-(this.lax - this.ax)) * this.rl / this.km;
                                    this.ay = this.ay + (-(this.lay - this.ay)) * this.rl / this.km;
                                }
                                if (this.ax > this.lax)
                                {
                                    this.tx = this.ax - this.lax;
                                }
                                else
                                {
                                    this.tx = this.lax - this.ax;
                                }
                                if (this.ay > this.lay)
                                {
                                    this.ty = this.ay - this.lay;
                                }
                                else
                                {
                                    this.ty = this.lay - this.ay;
                                }
                                if (this.tx < 15 && this.ty < 15)
                                {
                                    this.d = this.dist16t[this.ty * 16 << 8 | this.tx * 16];
                                }
                                else
                                {
                                    this.d = Math.sqrt(this.tx * this.tx + this.ty * this.ty);
                                }
                                if (this.rmr + this.d < this.sep)
                                {
                                    this.rmr = this.rmr + this.d;
                                }
                                else
                                {
                                    this.rmr = -this.rmr;
                                    this.m = (this.d - this.rmr) / this.sep;
                                    while (this.m >= 1)
                                    {
                                        
                                        this.rmr = this.rmr + this.sep;
                                        this.tx = this.lax + (this.ax - this.lax) * this.rmr / this.d;
                                        this.ty = this.lay + (this.ay - this.lay) * this.rmr / this.d;
                                        if (this.sgp == this.sgc)
                                        {
                                            this.sgo = new Segment();
                                            this.segs.push(this.sgo);
                                            var _loc_2:* = this;
                                            var _loc_3:* = this.sgc + 1;
                                            _loc_2.sgc = _loc_3;
                                        }
                                        else
                                        {
                                            this.sgo = this.segs[this.sgp];
                                        }
                                        var _loc_2:* = this;
                                        var _loc_3:* = this.sgp + 1;
                                        _loc_2.sgp = _loc_3;
                                        if (this.tx >= this.bpx1 && this.ty >= this.bpy1 && this.tx <= this.bpx2 && this.ty <= this.bpy2)
                                        {
                                            this.sgo.x = this.tx;
                                            this.sgo.y = this.ty;
                                            this.sgo.iiv = true;
                                            this.tx = this.ax - this.lax;
                                            this.ty = this.ay - this.lay;
                                            if (this.tx >= -15 && this.ty >= -15 && this.tx < 15 && this.ty < 15)
                                            {
                                                this.sgo.ang = this.at2lt[this.ty * 8 + 128 << 8 | this.tx * 8 + 128];
                                            }
                                            else if (this.tx >= -127 && this.ty >= -127 && this.tx < 127 && this.ty < 127)
                                            {
                                                this.sgo.ang = this.at2lt[this.ty + 128 << 8 | this.tx + 128];
                                            }
                                            else
                                            {
                                                this.sgo.ang = Math.atan2(this.ty, this.tx);
                                            }
                                        }
                                        else
                                        {
                                            this.sgo.iiv = false;
                                        }
                                        var _loc_2:* = this;
                                        var _loc_3:* = this.m - 1;
                                        _loc_2.m = _loc_3;
                                    }
                                    this.rmr = this.d - this.rmr;
                                }
                                if (this.rl < 1)
                                {
                                    this.rl = this.rl - this.km;
                                    if (this.rl <= -this.km)
                                    {
                                        break;
                                    }
                                }
                                this.k = this.k + this.km;
                            }
                            if (this.rl >= 1)
                            {
                                var _loc_2:* = this;
                                var _loc_3:* = this.rl - 1;
                                _loc_2.rl = _loc_3;
                            }
                        }
                        var _loc_2:* = this;
                        var _loc_3:* = this.j - 1;
                        _loc_2.j = _loc_3;
                    }
                    if (this.sgp == this.sgc)
                    {
                        this.sgo = new Segment();
                        this.segs.push(this.sgo);
                        var _loc_2:* = this;
                        var _loc_3:* = this.sgc + 1;
                        _loc_2.sgc = _loc_3;
                    }
                    else
                    {
                        this.sgo = this.segs[this.sgp];
                    }
                    var _loc_2:* = this;
                    var _loc_3:* = this.sgp + 1;
                    _loc_2.sgp = _loc_3;
                    if (this.ax >= this.bpx1 && this.ay >= this.bpy1 && this.ax <= this.bpx2 && this.ay <= this.bpy2)
                    {
                        this.sgo.x = this.ax;
                        this.sgo.y = this.ay;
                        this.tx = this.ax - this.lax;
                        this.ty = this.ay - this.lay;
                        if (this.tx >= -15 && this.ty >= -15 && this.tx < 15 && this.ty < 15)
                        {
                            this.sgo.ang = this.at2lt[this.ty * 8 + 128 << 8 | this.tx * 8 + 128];
                        }
                        else if (this.tx >= -127 && this.ty >= -127 && this.tx < 127 && this.ty < 127)
                        {
                            this.sgo.ang = this.at2lt[this.ty + 128 << 8 | this.tx + 128];
                        }
                        else
                        {
                            this.sgo.ang = Math.atan2(this.ty, this.tx);
                        }
                        this.sgo.iiv = true;
                    }
                    else
                    {
                        this.sgo.iiv = false;
                    }
                    this.aa = this.sk.alive_amt * (1 - this.sk.dead_amt);
                    this.aa = this.aa * this.aa;
                    this.m = 1;
                    if (this.sk.tsp > this.sk.fsp)
                    {
                        this.m = this.sk.alive_amt * (1 - this.sk.dead_amt) * Math.max(0, Math.min(1, (this.sk.tsp - this.sk.ssp) / (this.sk.msp - this.sk.ssp)));
                        this.om = this.m;
                        this.m = 1 - this.m;
                    }
                    this.am = this.aa * this.m;
                    this.j = Math.min(8, (this.sgp - 1));
                    while (this.j >= 0)
                    {
                        
                        this.sgo = this.segs[this.j];
                        if (this.sgo.iiv)
                        {
                            if (this.j < 9)
                            {
                                this.ii = this.ksmc_ii;
                                if (this.j < 4)
                                {
                                    var _loc_2:* = this.lsz * (1 + (4 - this.j) * this.sk.swell);
                                    this.ii.scaleY = this.lsz * (1 + (4 - this.j) * this.sk.swell);
                                    this.ii.scaleX = _loc_2;
                                }
                                else
                                {
                                    var _loc_2:* = this.lsz;
                                    this.ii.scaleY = this.lsz;
                                    this.ii.scaleX = _loc_2;
                                }
                                this.ii.x = this.sgo.x;
                                this.ii.y = this.sgo.y;
                                this.ii.alpha = this.am * 0.4 * (1 - this.j / 9);
                                this.snake_batch.addImage(this.ii);
                            }
                        }
                        var _loc_2:* = this;
                        var _loc_3:* = this.j - 1;
                        _loc_2.j = _loc_3;
                    }
                    this.j = this.sgp - 1;
                    while (this.j >= 0)
                    {
                        
                        if (this.j >= 2)
                        {
                            this.k = this.j - 2;
                            this.sgo = this.segs[this.k];
                            if (this.sgo.iiv)
                            {
                                this.ii = this.ksmc_ii;
                                if (this.k < 4)
                                {
                                    var _loc_2:* = this.lsz * (1 + (4 - this.k) * this.sk.swell);
                                    this.ii.scaleY = this.lsz * (1 + (4 - this.k) * this.sk.swell);
                                    this.ii.scaleX = _loc_2;
                                }
                                else
                                {
                                    var _loc_2:* = this.lsz;
                                    this.ii.scaleY = this.lsz;
                                    this.ii.scaleX = _loc_2;
                                }
                                this.ii.x = this.sgo.x;
                                this.ii.y = this.sgo.y;
                                if (this.k < 9)
                                {
                                    this.ii.alpha = this.am * 0.4 * (this.k / 9);
                                }
                                else
                                {
                                    this.ii.alpha = this.am * 0.4;
                                }
                                this.snake_batch.addImage(this.ii);
                            }
                        }
                        this.sgo = this.segs[this.j];
                        if (this.sgo.iiv)
                        {
                            this.k = this.j % (6 * 2);
                            if (this.k >= 6)
                            {
                                this.k = 6 * 2 - (this.k + 1);
                            }
                            this.ii = this.kmc_iis[this.sk.rbcs[this.j % this.sk.rbl]][this.k];
                            if (this.j < 4)
                            {
                                var _loc_2:* = this.lsz * (1 + (4 - this.j) * this.sk.swell);
                                this.ii.scaleY = this.lsz * (1 + (4 - this.j) * this.sk.swell);
                                this.ii.scaleX = _loc_2;
                            }
                            else
                            {
                                var _loc_2:* = this.lsz;
                                this.ii.scaleY = this.lsz;
                                this.ii.scaleX = _loc_2;
                            }
                            this.ii.x = this.sgo.x;
                            this.ii.y = this.sgo.y;
                            this.ii.rotation = this.sgo.ang;
                            this.ii.alpha = this.aa;
                            this.snake_batch.addImage(this.ii);
                        }
                        var _loc_2:* = this;
                        var _loc_3:* = this.j - 1;
                        _loc_2.j = _loc_3;
                    }
                    if (this.sk.antenna)
                    {
                        this.j = this.sk.ang * this.pm2 & 65535;
                        this.tx = this.angx[this.j];
                        this.ty = this.angy[this.j];
                        this.ax = this.hx - this.tx * 8 * this.sk.sc;
                        this.ay = this.hy - this.ty * 8 * this.sk.sc;
                        if (this.sgp >= 2 && (this.ax >= this.apx1 && this.ay >= this.apy1 && this.ax <= this.apx2 && this.ay <= this.apy2))
                        {
                            this.sk.atx[0] = this.ax;
                            this.sk.aty[0] = this.ay;
                            this.m = this.sk.sc * this.gsc;
                            this.fj = this.sk.atx.length - 1;
                            if (this.choosing_skin)
                            {
                                this.j = 1;
                                while (this.j <= this.fj)
                                {
                                    
                                    this.sk.atvx[this.j] = this.sk.atvx[this.j] - 0.3;
                                    this.sk.atvy[this.j] = this.sk.atvy[this.j] + Math.cos(this.fr / 23 - 7 * this.j / this.fj) * 0.14;
                                    var _loc_2:* = this;
                                    var _loc_3:* = this.j + 1;
                                    _loc_2.j = _loc_3;
                                }
                            }
                            else if (!this.sk.antenna_shown)
                            {
                                this.sk.antenna_shown = true;
                                this.j = 1;
                                while (this.j <= this.fj)
                                {
                                    
                                    this.sk.atx[this.j] = this.ax - this.tx * this.j * 4 * this.sk.sc;
                                    this.sk.aty[this.j] = this.ay - this.ty * this.j * 4 * this.sk.sc;
                                    var _loc_2:* = this;
                                    var _loc_3:* = this.j + 1;
                                    _loc_2.j = _loc_3;
                                }
                            }
                            this.j = 1;
                            while (this.j <= this.fj)
                            {
                                
                                this.xx = this.sk.atx[(this.j - 1)];
                                this.yy = this.sk.aty[(this.j - 1)];
                                this.xx = this.xx + (Math.random() * 2 - 1);
                                this.yy = this.yy + (Math.random() * 2 - 1);
                                this.tx = this.sk.atx[this.j] - this.xx;
                                this.ty = this.sk.aty[this.j] - this.yy;
                                if (this.tx >= -4 && this.ty >= -4 && this.tx < 4 && this.ty < 4)
                                {
                                    this.ang = this.at2lt[this.ty * 32 + 128 << 8 | this.tx * 32 + 128];
                                }
                                else if (this.tx >= -8 && this.ty >= -8 && this.tx < 8 && this.ty < 8)
                                {
                                    this.ang = this.at2lt[this.ty * 16 + 128 << 8 | this.tx * 16 + 128];
                                }
                                else if (this.tx >= -16 && this.ty >= -16 && this.tx < 16 && this.ty < 16)
                                {
                                    this.ang = this.at2lt[this.ty * 8 + 128 << 8 | this.tx * 8 + 128];
                                }
                                else if (this.tx >= -127 && this.ty >= -127 && this.tx < 127 && this.ty < 127)
                                {
                                    this.ang = this.at2lt[this.ty + 128 << 8 | this.tx + 128];
                                }
                                else
                                {
                                    this.ang = Math.atan2(this.ty, this.tx);
                                }
                                this.k = this.ang * this.pm2 & 65535;
                                this.xx = this.xx + this.angx4[this.k] * this.sk.sc;
                                this.yy = this.yy + this.angy4[this.k] * this.sk.sc;
                                this.sk.atvx[this.j] = this.sk.atvx[this.j] + (this.xx - this.sk.atx[this.j]) * 0.1;
                                this.sk.atvy[this.j] = this.sk.atvy[this.j] + (this.yy - this.sk.aty[this.j]) * 0.1;
                                this.sk.atx[this.j] = this.sk.atx[this.j] + this.sk.atvx[this.j];
                                this.sk.aty[this.j] = this.sk.aty[this.j] + this.sk.atvy[this.j];
                                this.sk.atvx[this.j] = this.sk.atvx[this.j] * 0.88;
                                this.sk.atvy[this.j] = this.sk.atvy[this.j] * 0.88;
                                this.tx = this.sk.atx[this.j] - this.sk.atx[(this.j - 1)];
                                this.ty = this.sk.aty[this.j] - this.sk.aty[(this.j - 1)];
                                this.d = Math.sqrt(this.tx * this.tx + this.ty * this.ty);
                                if (this.d > 4 * this.sk.sc)
                                {
                                    if (this.tx >= -4 && this.ty >= -4 && this.tx < 4 && this.ty < 4)
                                    {
                                        this.ang = this.at2lt[this.ty * 32 + 128 << 8 | this.tx * 32 + 128];
                                    }
                                    else if (this.tx >= -8 && this.ty >= -8 && this.tx < 8 && this.ty < 8)
                                    {
                                        this.ang = this.at2lt[this.ty * 16 + 128 << 8 | this.tx * 16 + 128];
                                    }
                                    else if (this.tx >= -16 && this.ty >= -16 && this.tx < 16 && this.ty < 16)
                                    {
                                        this.ang = this.at2lt[this.ty * 8 + 128 << 8 | this.tx * 8 + 128];
                                    }
                                    else if (this.tx >= -127 && this.ty >= -127 && this.tx < 127 && this.ty < 127)
                                    {
                                        this.ang = this.at2lt[this.ty + 128 << 8 | this.tx + 128];
                                    }
                                    else
                                    {
                                        this.ang = Math.atan2(this.ty, this.tx);
                                    }
                                    this.k = this.ang * this.pm2 & 65535;
                                    this.sk.atx[this.j] = this.sk.atx[(this.j - 1)] + this.angx4[this.k] * this.sk.sc;
                                    this.sk.aty[this.j] = this.sk.aty[(this.j - 1)] + this.angy4[this.k] * this.sk.sc;
                                }
                                var _loc_2:* = this;
                                var _loc_3:* = this.j + 1;
                                _loc_2.j = _loc_3;
                            }
                            this.antenna_segment_ii.alpha = this.aa * this.sk.blba;
                            this.tx = this.sk.atx[this.fj];
                            this.ty = this.sk.aty[this.fj];
                            this.j = this.fj - 1;
                            while (this.j >= 0)
                            {
                                
                                this.xx = this.sk.atx[this.j];
                                this.yy = this.sk.aty[this.j];
                                if (this.xx > this.tx)
                                {
                                    this.dx = this.xx - this.tx;
                                }
                                else
                                {
                                    this.dx = this.tx - this.xx;
                                }
                                if (this.yy > this.ty)
                                {
                                    this.dy = this.yy - this.ty;
                                }
                                else
                                {
                                    this.dy = this.ty - this.yy;
                                }
                                if (this.dx + this.dy >= 1)
                                {
                                    if (this.dx < 15 && this.dy < 15)
                                    {
                                        this.d = this.dist16t[this.dy * 16 << 8 | this.dx * 16];
                                    }
                                    else
                                    {
                                        this.d = Math.sqrt(this.dx * this.dx + this.dy * this.dy);
                                    }
                                    this.tx = this.tx - this.xx;
                                    this.ty = this.ty - this.yy;
                                    if (this.tx >= -4 && this.ty >= -4 && this.tx < 4 && this.ty < 4)
                                    {
                                        this.ang = this.at2lt[this.ty * 32 + 128 << 8 | this.tx * 32 + 128];
                                    }
                                    else if (this.tx >= -8 && this.ty >= -8 && this.tx < 8 && this.ty < 8)
                                    {
                                        this.ang = this.at2lt[this.ty * 16 + 128 << 8 | this.tx * 16 + 128];
                                    }
                                    else if (this.tx >= -16 && this.ty >= -16 && this.tx < 16 && this.ty < 16)
                                    {
                                        this.ang = this.at2lt[this.ty * 8 + 128 << 8 | this.tx * 8 + 128];
                                    }
                                    else if (this.tx >= -127 && this.ty >= -127 && this.tx < 127 && this.ty < 127)
                                    {
                                        this.ang = this.at2lt[this.ty + 128 << 8 | this.tx + 128];
                                    }
                                    else
                                    {
                                        this.ang = Math.atan2(this.ty, this.tx);
                                    }
                                    this.antenna_segment_ii.x = this.xx;
                                    this.antenna_segment_ii.y = this.yy;
                                    this.antenna_segment_ii.scaleX = this.d / this.antenna_width;
                                    this.antenna_segment_ii.scaleY = 0.3 * this.sk.sc;
                                    this.antenna_segment_ii.rotation = this.ang;
                                    this.antenna_segment_ii.color = this.sk.atc2;
                                    this.snake_batch.addImage(this.antenna_segment_ii);
                                    this.tx = this.xx;
                                    this.ty = this.yy;
                                }
                                var _loc_2:* = this;
                                var _loc_3:* = this.j - 1;
                                _loc_2.j = _loc_3;
                            }
                            this.sk.bulb.alpha = this.aa * this.sk.blba;
                            if (this.sk.abrot)
                            {
                                this.tx = this.sk.atx[this.fj] - this.sk.atx[(this.fj - 1)];
                                this.ty = this.sk.aty[this.fj] - this.sk.aty[(this.fj - 1)];
                                if (this.tx >= -4 && this.ty >= -4 && this.tx < 4 && this.ty < 4)
                                {
                                    this.ang = this.at2lt[this.ty * 32 + 128 << 8 | this.tx * 32 + 128];
                                }
                                else if (this.tx >= -8 && this.ty >= -8 && this.tx < 8 && this.ty < 8)
                                {
                                    this.ang = this.at2lt[this.ty * 16 + 128 << 8 | this.tx * 16 + 128];
                                }
                                else if (this.tx >= -16 && this.ty >= -16 && this.tx < 16 && this.ty < 16)
                                {
                                    this.ang = this.at2lt[this.ty * 8 + 128 << 8 | this.tx * 8 + 128];
                                }
                                else if (this.tx >= -127 && this.ty >= -127 && this.tx < 127 && this.ty < 127)
                                {
                                    this.ang = this.at2lt[this.ty + 128 << 8 | this.tx + 128];
                                }
                                else
                                {
                                    this.ang = Math.atan2(this.ty, this.tx);
                                }
                                this.vang = this.ang - this.sk.atba;
                                if (this.vang < 0 || this.vang >= this.pi2)
                                {
                                    this.vang = this.vang % this.pi2;
                                }
                                if (this.vang < -Math.PI)
                                {
                                    this.vang = this.vang + this.pi2;
                                }
                                else if (this.vang > Math.PI)
                                {
                                    this.vang = this.vang - this.pi2;
                                }
                                this.sk.atba = (this.sk.atba + this.vang * 0.15) % this.pi2;
                                this.sk.bulb.rotation = this.sk.atba;
                            }
                            this.sk.bulb.scaleX = this.sk.bsc * this.sk.sc;
                            this.sk.bulb.scaleY = this.sk.bsc * this.sk.sc;
                            this.sk.bulb.x = this.sk.atx[this.fj];
                            this.sk.bulb.y = this.sk.aty[this.fj];
                            this.snake_batch.addImage(this.sk.bulb);
                        }
                        else if (this.sk.antenna_shown)
                        {
                            this.sk.antenna_shown = false;
                        }
                    }
                    if (this.sk.tsp > this.sk.fsp)
                    {
                        this.j = this.sgp - 1;
                        while (this.j >= 0)
                        {
                            
                            this.sgo = this.segs[this.j];
                            if (this.sgo.iiv)
                            {
                                if (this.j % 3 == 0)
                                {
                                    this.ii = this.kmc_add_iis[this.sk.rbcs[this.j % this.sk.rbl]];
                                    if (this.j < 4)
                                    {
                                        var _loc_2:* = this.lsz * 1.5 * (1 + (4 - this.j) * this.sk.swell);
                                        this.ii.scaleY = this.lsz * 1.5 * (1 + (4 - this.j) * this.sk.swell);
                                        this.ii.scaleX = _loc_2;
                                    }
                                    else
                                    {
                                        var _loc_2:* = this.lsz * 1.5;
                                        this.ii.scaleY = this.lsz * 1.5;
                                        this.ii.scaleX = _loc_2;
                                    }
                                    this.ii.x = this.sgo.x;
                                    this.ii.y = this.sgo.y;
                                    this.ii.alpha = this.aa * this.om * (0.5 + 0.5 * this.angx[(this.j / 4 - this.sk.sfr) * this.pm2 & 65535]);
                                    this.snake_add_batch.addImage(this.ii);
                                }
                            }
                            var _loc_2:* = this;
                            var _loc_3:* = this.j - 1;
                            _loc_2.j = _loc_3;
                        }
                    }
                    if (this.sk.dead)
                    {
                        this.falf = (0.3 + 0.3 * Math.abs(Math.sin(5 * Math.PI * this.sk.dead_amt))) * Math.sin(Math.PI * this.sk.dead_amt);
                        this.j = this.sgp - 1;
                        while (this.j >= 0)
                        {
                            
                            this.sgo = this.segs[this.j];
                            if (this.sgo.iiv)
                            {
                                if (this.j % 3 == 0)
                                {
                                    this.ii = this.kmc_add_iis[this.sk.cv];
                                    if (this.j < 4)
                                    {
                                        var _loc_2:* = this.lsz * (1 + (4 - this.j) * this.sk.swell);
                                        this.ii.scaleY = this.lsz * (1 + (4 - this.j) * this.sk.swell);
                                        this.ii.scaleX = _loc_2;
                                    }
                                    else
                                    {
                                        var _loc_2:* = this.lsz;
                                        this.ii.scaleY = this.lsz;
                                        this.ii.scaleX = _loc_2;
                                    }
                                    this.ii.x = this.sgo.x;
                                    this.ii.y = this.sgo.y;
                                    this.ii.rotation = this.sgo.ang;
                                    this.ii.alpha = this.falf * (0.6 + 0.4 * Math.cos(this.j / 4 - 15 * this.sk.dead_amt));
                                    this.snake_add_batch.addImage(this.ii);
                                }
                            }
                            var _loc_2:* = this;
                            var _loc_3:* = this.j - 1;
                            _loc_2.j = _loc_3;
                        }
                    }
                    if (this.sk.one_eye)
                    {
                        this.ed = 3 * this.ssc;
                        this.j2 = this.fang * this.pm2 & 65535;
                        this.ex = this.angx[this.j2] * this.ed;
                        this.ey = this.angy[this.j2] * this.ed;
                        this.sk.ebi.x = this.ex + this.hx;
                        this.sk.ebi.y = this.ey + this.hy;
                        var _loc_2:* = this.ssc * this.sk.ebisz / 64;
                        this.sk.ebi.scaleY = this.ssc * this.sk.ebisz / 64;
                        this.sk.ebi.scaleX = _loc_2;
                        this.snake_batch.addImage(this.sk.ebi);
                        this.ex = this.angx[this.j2] * (this.ed + 0.15) + this.sk.rex * this.ssc;
                        this.ey = this.angy[this.j2] * (this.ed + 0.15) + this.sk.rey * this.ssc;
                        this.sk.epi.x = this.ex + this.hx;
                        this.sk.epi.y = this.ey + this.hy;
                        var _loc_2:* = this.ssc * this.sk.episz / 48;
                        this.sk.epi.scaleY = this.ssc * this.sk.episz / 48;
                        this.sk.epi.scaleX = _loc_2;
                        this.snake_batch.addImage(this.sk.epi);
                    }
                    else
                    {
                        var _loc_2:* = 12 * this.ssc;
                        this.eye_ii.height = 12 * this.ssc;
                        this.eye_ii.width = _loc_2;
                        this.eye_ii.color = this.sk.ec;
                        this.eye_ii.alpha = 0.75 * this.aa;
                        this.ed = 6 * this.ssc;
                        this.esp = 6 * this.ssc;
                        this.j2 = this.fang * this.pm2 & 65535;
                        this.j3 = (this.fang - this.pih) * this.pm2 & 65535;
                        this.j4 = (this.fang + this.pih) * this.pm2 & 65535;
                        this.ex = this.angx[this.j2] * this.ed + this.angx[this.j3] * (this.esp + 0.5);
                        this.ey = this.angy[this.j2] * this.ed + this.angy[this.j3] * (this.esp + 0.5);
                        this.eye_ii.x = this.ex + this.hx;
                        this.eye_ii.y = this.ey + this.hy;
                        var _loc_2:* = this;
                        var _loc_3:* = this.sbic + 1;
                        _loc_2.sbic = _loc_3;
                        this.snake_batch.addImage(this.eye_ii);
                        this.ex = this.angx[this.j2] * this.ed + this.angx[this.j4] * (this.esp + 0.5);
                        this.ey = this.angy[this.j2] * this.ed + this.angy[this.j4] * (this.esp + 0.5);
                        this.eye_ii.x = this.ex + this.hx;
                        this.eye_ii.y = this.ey + this.hy;
                        var _loc_2:* = this;
                        var _loc_3:* = this.sbic + 1;
                        _loc_2.sbic = _loc_3;
                        this.snake_batch.addImage(this.eye_ii);
                        var _loc_2:* = 7 * this.ssc;
                        this.eye_ii.height = 7 * this.ssc;
                        this.eye_ii.width = _loc_2;
                        this.eye_ii.color = this.sk.ppc;
                        this.eye_ii.alpha = this.sk.ppa * this.aa;
                        this.ex = this.angx[this.j2] * (this.ed + 0.5) + this.sk.rex * this.ssc + this.angx[this.j3] * this.esp;
                        this.ey = this.angy[this.j2] * (this.ed + 0.5) + this.sk.rey * this.ssc + this.angy[this.j3] * this.esp;
                        this.eye_ii.x = this.ex + this.hx;
                        this.eye_ii.y = this.ey + this.hy;
                        var _loc_2:* = this;
                        var _loc_3:* = this.sbic + 1;
                        _loc_2.sbic = _loc_3;
                        this.snake_batch.addImage(this.eye_ii);
                        this.ex = this.angx[this.j2] * (this.ed + 0.5) + this.sk.rex * this.ssc + this.angx[this.j4] * this.esp;
                        this.ey = this.angy[this.j2] * (this.ed + 0.5) + this.sk.rey * this.ssc + this.angy[this.j4] * this.esp;
                        this.eye_ii.x = this.ex + this.hx;
                        this.eye_ii.y = this.ey + this.hy;
                        var _loc_2:* = this;
                        var _loc_3:* = this.sbic + 1;
                        _loc_2.sbic = _loc_3;
                        this.snake_batch.addImage(this.eye_ii);
                    }
                }
                var _loc_2:* = this;
                var _loc_3:* = this.i - 1;
                _loc_2.i = _loc_3;
            }
            if (Math.abs(this.grd - this.view_dist) < 4000)
            {
                this.j = -2000;
                while (this.j <= 2000)
                {
                    
                    this.xx = this.grd + Math.cos(this.view_ang + this.j / this.grd) * this.grd98;
                    this.yy = this.grd + Math.sin(this.view_ang + this.j / this.grd) * this.grd98;
                    this.border_ii.rotation = this.view_ang + this.j / this.grd;
                    this.border_ii.x = this.xx;
                    this.border_ii.y = this.yy;
                    this.border_ii.scaleX = 20;
                    this.border_ii.scaleY = 20;
                    this.snake_batch.addImage(this.border_ii);
                    this.j = this.j + 100;
                }
            }
            if (this.wumsts)
            {
                if (this.rank > 0)
                {
                    if (this.snake_count > 0)
                    {
                        this.wumsts = false;
                        this.length_batch.reset();
                        _loc_1 = "Your length: " + int((this.fpsls[this.snake.sct] + this.snake.fam / this.fmlts[this.snake.sct] - 1) * 15 - 5) / 1;
                        this.drawText(_loc_1, this.length_batch, 4, -36, 14, 16777215, 1);
                        _loc_1 = "Your rank: " + this.rank + " of " + this.snake_count;
                        this.drawText(_loc_1, this.length_batch, 4, -18, 12, 16777215, 0.6);
                    }
                }
            }
            return;
        }// end function

        public function shakeGame()
        {
            var _loc_1:* = undefined;
            _loc_1 = Math.PI / 2 + Math.random() * 0.4 - 0.2;
            if (Math.random() < 0.5)
            {
                _loc_1 = _loc_1 + Math.PI;
            }
            this.glx = this.glx + Math.cos(_loc_1 + Math.PI / 2) * 5;
            this.gly = this.gly + Math.sin(_loc_1 + Math.PI / 2) * 5;
            this.gvx2 = this.gvx2 + Math.cos(_loc_1) * 23;
            this.gvy2 = this.gvy2 + Math.sin(_loc_1) * 23;
            this.glm = true;
            return;
        }// end function

        public function onStageActive(event:Event) : void
        {
            this.lmtm = new Date().time;
            this.rendering_paused = false;
            this._starling.start();
            return;
        }// end function

        public function onStageDeactivate(event:Event) : void
        {
            this.rendering_paused = true;
            this._starling.stop(true);
            return;
        }// end function

        public function touchesChanged(param1)
        {
            var _loc_2:* = undefined;
            var _loc_3:* = undefined;
            var _loc_4:* = undefined;
            var _loc_5:* = undefined;
            var _loc_6:* = undefined;
            var _loc_7:* = undefined;
            _loc_2 = 0;
            _loc_3 = 0;
            _loc_5 = 0;
            _loc_6 = this.current_touches.length - 1;
            while (_loc_6 >= 0)
            {
                
                _loc_4 = this.current_touches[_loc_6];
                _loc_2 = _loc_2 + _loc_4.xx;
                _loc_3 = _loc_3 + _loc_4.yy;
                _loc_5 = _loc_5 + 1;
                _loc_6 = _loc_6 - 1;
            }
            _loc_2 = _loc_2 / _loc_5;
            _loc_3 = _loc_3 / _loc_5;
            if (param1)
            {
                _loc_7 = {};
                _loc_7.xx = _loc_2;
                _loc_7.yy = _loc_3;
                _loc_7.touch_count = _loc_5;
                this.mu(_loc_7, true);
            }
            return;
        }// end function

        public function setTouchRegion(param1, param2)
        {
            var _loc_3:* = undefined;
            var _loc_4:* = undefined;
            _loc_3 = this.touch_regions.length - 1;
            while (_loc_3 >= 0)
            {
                
                if (this.touch_regions[_loc_3].tgo == param1)
                {
                    this.touch_regions[_loc_3].r = param2;
                    return true;
                }
                _loc_3 = _loc_3 - 1;
            }
            _loc_4 = {};
            _loc_4.tgo = param1;
            _loc_4.r = param2;
            this.touch_regions.push(_loc_4);
            return true;
        }// end function

        public function clearTouchRegion(param1)
        {
            var _loc_2:* = undefined;
            _loc_2 = this.touch_regions.length - 1;
            while (_loc_2 >= 0)
            {
                
                if (this.touch_regions[_loc_2].tgo == param1)
                {
                    this.touch_regions.splice(_loc_2, 1);
                }
                _loc_2 = _loc_2 - 1;
            }
            return;
        }// end function

        public function startTouch(event:TouchEvent)
        {
            var _loc_2:* = 0;
            var _loc_3:* = undefined;
            var _loc_4:* = undefined;
            var _loc_5:* = undefined;
            var _loc_6:* = null;
            var _loc_7:* = undefined;
            var _loc_8:* = undefined;
            var _loc_9:* = undefined;
            var _loc_10:* = undefined;
            var _loc_11:* = NaN;
            var _loc_12:* = NaN;
            var _loc_13:* = NaN;
            _loc_3 = event.stageX;
            _loc_4 = event.stageY;
            if (this.is_mac)
            {
                _loc_3 = _loc_3 * 2;
                _loc_4 = _loc_4 * 2;
            }
            _loc_3 = _loc_3 * this.force_game_scale;
            _loc_4 = _loc_4 * this.force_game_scale;
            if (this.ccfr < 8)
            {
                return;
            }
            if (!this.choosing_skin)
            {
                if (this.snake != null)
                {
                    if (!this.snake.dead)
                    {
                        if (this.control_mode == 2 || this.control_mode == 3)
                        {
                            _loc_12 = this.mww2 + this.bsx;
                            _loc_13 = this.mhh2 + this.bsy;
                            _loc_11 = Math.sqrt(Math.pow(_loc_3 - _loc_12, 2) + Math.pow(_loc_4 - _loc_13, 2));
                            if (_loc_11 < 170)
                            {
                                this.boosting = true;
                                this.double_tap_accel = false;
                                this.setAcceleration(true);
                                this.boost_touch_id = event.touchPointID;
                                return;
                            }
                            _loc_12 = this.mww2;
                            _loc_13 = 32;
                            _loc_11 = Math.sqrt(Math.pow(_loc_3 - _loc_12, 2) + Math.pow(_loc_4 - _loc_13, 2));
                            if (_loc_11 < 40)
                            {
                                if (!this.flipped_controls)
                                {
                                    this.flipped_controls = true;
                                    this.setSo("flipped_controls", "yes");
                                }
                                else
                                {
                                    this.flipped_controls = false;
                                    this.setSo("flipped_controls", "no");
                                }
                                this.repositionControls();
                                return;
                            }
                        }
                    }
                }
            }
            _loc_2 = this.finger_count - 1;
            while (_loc_2 >= 0)
            {
                
                if (!this.fingers[_loc_2].dead)
                {
                    return;
                }
                _loc_2 = _loc_2 - 1;
            }
            if (!this.choosing_skin)
            {
                if (this.snake != null)
                {
                    if (!this.snake.dead)
                    {
                        if (this.control_mode == 2)
                        {
                            this.fing = new Finger();
                            this.fing.touch_id = event.touchPointID;
                            this.fing.avx = Math.cos(this.twang);
                            this.fing.avy = Math.sin(this.twang);
                            this.fing.xx = this.fing.avx * this.snake.sc * this.gsc * 39;
                            this.fing.yy = this.fing.avy * this.snake.sc * this.gsc * 39;
                            this.fing.rx = this.fing.xx;
                            this.fing.ry = this.fing.yy;
                            this.fing.ofx = this.fing.xx;
                            this.fing.ofy = this.fing.yy;
                            this.fing.sx = _loc_3 - this.mww2;
                            this.fing.sy = _loc_4 - this.mhh2;
                            this.fing.a = 0;
                            this.fingers[this.finger_count] = this.fing;
                            var _loc_14:* = this;
                            var _loc_15:* = this.finger_count + 1;
                            _loc_14.finger_count = _loc_15;
                            this.cur_finger = this.fing;
                            this.had_fingers = true;
                            this.xm = Math.round(this.fing.xx / 3) * 3;
                            this.ym = Math.round(this.fing.yy / 3) * 3;
                            this.twang = Math.atan2(this.ym, this.xm);
                        }
                        else if (!this.control_touch_down)
                        {
                            this.xm = Math.round(_loc_3 / 3) * 3 - this.mww2;
                            this.ym = Math.round(_loc_4 / 3) * 3 - this.mhh2;
                            this.control_touch_down = true;
                            this.control_touch_id = event.touchPointID;
                        }
                    }
                }
            }
            _loc_2 = this.btns.length - 1;
            while (_loc_2 >= 0)
            {
                
                _loc_8 = this.btns[_loc_2];
                if (!_loc_8.disabled)
                {
                    if (_loc_8.ii)
                    {
                        _loc_6 = _loc_8.ii.getBounds(this.starfield);
                    }
                    else
                    {
                        _loc_6 = _loc_8.iis[0].getBounds(this.starfield);
                    }
                    if (_loc_8.touch_padding)
                    {
                        _loc_6.left = _loc_6.left - _loc_8.touch_padding;
                        _loc_6.top = _loc_6.top - _loc_8.touch_padding;
                        _loc_6.width = _loc_6.width + 2 * _loc_8.touch_padding;
                        _loc_6.height = _loc_6.height + 2 * _loc_8.touch_padding;
                    }
                    this.setTouchRegion(_loc_8, _loc_6);
                }
                _loc_2 = _loc_2 - 1;
            }
            _loc_9 = this.inputDown(_loc_3, _loc_4, event.stageX, event.stageY);
            if (_loc_9)
            {
                return;
            }
            _loc_10 = false;
            _loc_2 = this.current_touches.length - 1;
            while (_loc_2 >= 0)
            {
                
                _loc_8 = this.current_touches[_loc_2];
                if (_loc_8.id == event.touchPointID)
                {
                    _loc_8.xx = _loc_3;
                    _loc_8.yy = _loc_4;
                    _loc_10 = true;
                    break;
                }
                _loc_2 = _loc_2 - 1;
            }
            if (!_loc_10)
            {
                _loc_8 = {};
                _loc_8.id = event.touchPointID;
                _loc_8.xx = _loc_3;
                _loc_8.yy = _loc_4;
                this.current_touches.push(_loc_8);
            }
            this.touchesChanged(false);
            _loc_2 = this.touch_regions.length - 1;
            while (_loc_2 >= 0)
            {
                
                _loc_5 = this.touch_regions[_loc_2];
                _loc_6 = _loc_5.r;
                if (_loc_3 >= _loc_6.left && _loc_4 >= _loc_6.top && _loc_3 <= _loc_6.right && _loc_4 <= _loc_6.bottom)
                {
                    _loc_7 = _loc_5.tgo;
                    _loc_5.start_tm = new Date().time;
                    _loc_5.id = event.touchPointID;
                    var _loc_14:* = _loc_3;
                    _loc_5.lx = _loc_3;
                    _loc_5.xx = _loc_14;
                    var _loc_14:* = _loc_4;
                    _loc_5.ly = _loc_4;
                    _loc_5.yy = _loc_14;
                    _loc_5.vx = 0;
                    _loc_5.vy = 0;
                    _loc_5.inside = true;
                    _loc_7.touchDown(_loc_5);
                    return _loc_5;
                }
                _loc_2 = _loc_2 - 1;
            }
            _loc_9 = this.unhandledInputDown(_loc_3, _loc_4, event.stageX, event.stageY);
            if (_loc_9)
            {
                return;
            }
            return false;
        }// end function

        public function trackTouch(event:TouchEvent)
        {
            var _loc_2:* = undefined;
            var _loc_3:* = undefined;
            var _loc_4:* = NaN;
            var _loc_5:* = NaN;
            var _loc_6:* = undefined;
            var _loc_7:* = undefined;
            var _loc_8:* = undefined;
            var _loc_9:* = null;
            var _loc_10:* = undefined;
            var _loc_11:* = null;
            _loc_2 = event.stageX;
            _loc_3 = event.stageY;
            if (this.is_mac)
            {
                _loc_2 = _loc_2 * 2;
                _loc_3 = _loc_3 * 2;
            }
            _loc_2 = _loc_2 * this.force_game_scale;
            _loc_3 = _loc_3 * this.force_game_scale;
            if (Math.abs(_loc_2 - this.ltxx) > 40 || Math.abs(_loc_3 - this.ltyy) > 40)
            {
                this.ltxx = 2147483647;
                this.ltyy = 2147483647;
            }
            if (this.boosting)
            {
                if (event.touchPointID == this.boost_touch_id)
                {
                    return;
                }
            }
            if (this.control_mode == 2)
            {
                _loc_5 = this.finger_count - 1;
                while (_loc_5 >= 0)
                {
                    
                    _loc_11 = this.fingers[_loc_5];
                    if (!_loc_11.dead)
                    {
                        if (_loc_11.touch_id == event.touchPointID)
                        {
                            this.xm = _loc_2 - this.mww2;
                            this.ym = _loc_3 - this.mhh2;
                            _loc_11.xx = _loc_11.ofx + this.xm - _loc_11.sx;
                            _loc_11.yy = _loc_11.ofy + this.ym - _loc_11.sy;
                            this.xm = Math.round(_loc_11.xx / 3) * 3;
                            this.ym = Math.round(_loc_11.yy / 3) * 3;
                            if (_loc_11 == this.cur_finger)
                            {
                                this.twang = Math.atan2(this.ym, this.xm);
                            }
                        }
                    }
                    _loc_5 = _loc_5 - 1;
                }
            }
            else if (this.control_touch_down)
            {
                if (this.control_touch_id == event.touchPointID)
                {
                    this.xm = Math.round(_loc_2 / 3) * 3 - this.mww2;
                    this.ym = Math.round(_loc_3 / 3) * 3 - this.mhh2;
                    if (this.control_mode == 3)
                    {
                        _loc_4 = Math.atan2(this.ym - this.jsy, this.xm - this.jsx);
                        this.joystick_ii.x = this.jsx + Math.cos(_loc_4) * 24;
                        this.joystick_ii.y = this.jsy + Math.sin(_loc_4) * 24;
                    }
                }
            }
            _loc_7 = false;
            _loc_5 = this.current_touches.length - 1;
            while (_loc_5 >= 0)
            {
                
                _loc_6 = this.current_touches[_loc_5];
                if (_loc_6.id == event.touchPointID)
                {
                    _loc_6.xx = _loc_2;
                    _loc_6.yy = _loc_3;
                    _loc_7 = true;
                    break;
                }
                _loc_5 = _loc_5 - 1;
            }
            if (!_loc_7)
            {
                _loc_6 = {};
                _loc_6.id = event.touchPointID;
                _loc_6.xx = _loc_2;
                _loc_6.yy = _loc_3;
                this.current_touches.push(_loc_6);
            }
            this.touchesChanged(false);
            _loc_10 = this.touch_regions.length - 1;
            while (_loc_10 >= 0)
            {
                
                _loc_8 = this.touch_regions[_loc_10];
                if (_loc_8.id == event.touchPointID)
                {
                    _loc_8.vx = _loc_8.xx - _loc_8.lx;
                    _loc_8.vy = _loc_8.yy - _loc_8.ly;
                    _loc_8.lx = _loc_8.xx;
                    _loc_8.ly = _loc_8.yy;
                    _loc_8.xx = _loc_2;
                    _loc_8.yy = _loc_3;
                    _loc_9 = _loc_8.r;
                    if (_loc_2 >= _loc_9.left && _loc_3 >= _loc_9.top && _loc_2 <= _loc_9.right && _loc_3 <= _loc_9.bottom)
                    {
                        _loc_8.inside = true;
                    }
                    else
                    {
                        _loc_8.inside = false;
                    }
                    _loc_8.tgo.touchMove(_loc_8);
                }
                _loc_10 = _loc_10 - 1;
            }
            return false;
        }// end function

        function endTouch(event:TouchEvent)
        {
            var _loc_2:* = null;
            var _loc_3:* = undefined;
            var _loc_4:* = undefined;
            var _loc_5:* = NaN;
            var _loc_6:* = undefined;
            var _loc_7:* = undefined;
            _loc_3 = event.stageX;
            _loc_4 = event.stageY;
            if (this.is_mac)
            {
                _loc_3 = _loc_3 * 2;
                _loc_4 = _loc_4 * 2;
            }
            _loc_3 = _loc_3 * this.force_game_scale;
            _loc_4 = _loc_4 * this.force_game_scale;
            if (this.boosting)
            {
                if (event.touchPointID == this.boost_touch_id)
                {
                    this.boosting = false;
                    this.setAcceleration(false);
                    return;
                }
            }
            if (this.control_touch_down)
            {
                if (event.touchPointID == this.control_touch_id)
                {
                    this.control_touch_down = false;
                    if (this.double_tap_accel)
                    {
                        this.double_tap_accel = false;
                        this.setAcceleration(false);
                    }
                    return;
                }
            }
            _loc_5 = this.finger_count - 1;
            while (_loc_5 >= 0)
            {
                
                if (!this.fingers[_loc_5].dead)
                {
                    if (this.fingers[_loc_5].touch_id == event.touchPointID)
                    {
                        this.fingers[_loc_5].dead = true;
                        this.fingers[_loc_5].avx = Math.cos(this.twang);
                        this.fingers[_loc_5].avy = Math.sin(this.twang);
                    }
                }
                _loc_5 = _loc_5 - 1;
            }
            _loc_5 = this.current_touches.length - 1;
            while (_loc_5 >= 0)
            {
                
                _loc_6 = this.current_touches[_loc_5];
                if (_loc_6.id == event.touchPointID)
                {
                    _loc_6.xx = _loc_3;
                    _loc_6.yy = _loc_4;
                    if (this.current_touches.length == 1)
                    {
                        this.touchesChanged(true);
                    }
                    else
                    {
                        this.touchesChanged(false);
                    }
                    this.current_touches.splice(_loc_5, 1);
                    break;
                }
                _loc_5 = _loc_5 - 1;
            }
            _loc_5 = this.touch_regions.length - 1;
            while (_loc_5 >= 0)
            {
                
                _loc_7 = this.touch_regions[_loc_5];
                if (_loc_7.id == event.touchPointID)
                {
                    _loc_2 = _loc_7.r;
                    if (_loc_3 >= _loc_2.left && _loc_4 >= _loc_2.top && _loc_3 <= _loc_2.right && _loc_4 <= _loc_2.bottom)
                    {
                        _loc_7.inside = true;
                        _loc_7.tgo.touchUp(_loc_7);
                        _loc_7.inside = false;
                        return true;
                    }
                    _loc_7.inside = false;
                    _loc_7.tgo.touchUp(_loc_7);
                }
                _loc_5 = _loc_5 - 1;
            }
            this.unhandledInputUp(_loc_3, _loc_4, event.stageX, event.stageY);
            return false;
        }// end function

        public function startTextures()
        {
            this.textures = [];
            return;
        }// end function

        public function checkSheetExistence(param1)
        {
            var _loc_2:* = undefined;
            if (param1 > 9)
            {
                trace("uh oh. why is txs " + param1 + "?");
                return null;
            }
            _loc_2 = param1 + 1;
            while (this.texture_sheets.length < _loc_2)
            {
                
                this.texture_sheets.push(new BitmapData(2048, 2048, true, 0));
            }
            return;
        }// end function

        public function prepareTexture(param1, param2 = 0)
        {
            var _loc_3:* = undefined;
            _loc_3 = {};
            _loc_3.bm = param1;
            _loc_3.sheet = param2;
            this.checkSheetExistence(param2);
            this.textures.push(_loc_3);
            return _loc_3;
        }// end function

        public function prepareTextureFromClip(param1, param2 = 1, param3 = 0)
        {
            var _loc_4:* = null;
            var _loc_5:* = null;
            var _loc_6:* = null;
            var _loc_7:* = undefined;
            if (!param1.hasOwnProperty("getBounds"))
            {
                _loc_4 = new Rectangle(0, 0, param1.width, param1.height);
            }
            else
            {
                _loc_4 = param1.getBounds(this.stg);
            }
            _loc_5 = new Matrix();
            trace(_loc_4);
            _loc_5.translate(1 - Math.floor(_loc_4.x), 1 - Math.floor(_loc_4.y));
            if (param2 != 1)
            {
                _loc_5.scale(param2, param2);
            }
            _loc_6 = new BitmapData(Math.ceil(Math.ceil(_loc_4.width + 2) * param2), Math.ceil(Math.ceil(_loc_4.height + 2) * param2), true, 0);
            _loc_6.draw(param1, _loc_5, null, null, null, true);
            _loc_7 = this.prepareTexture(_loc_6);
            _loc_7.sheet = param3;
            this.checkSheetExistence(param3);
            return _loc_7;
        }// end function

        function finishTextures()
        {
            var _loc_1:* = undefined;
            var _loc_2:* = undefined;
            var _loc_3:* = null;
            var _loc_4:* = undefined;
            var _loc_5:* = undefined;
            var _loc_6:* = null;
            var _loc_7:* = null;
            var _loc_8:* = undefined;
            var _loc_9:* = undefined;
            var _loc_10:* = null;
            var _loc_11:* = null;
            if (this.had_textures_before)
            {
                _loc_1 = 0;
                while (_loc_1 < this.sprite_textures.length)
                {
                    
                    this.sprite_textures[_loc_1].dispose();
                    _loc_1 = _loc_1 + 1;
                }
                this.sprite_textures = [];
                _loc_1 = 0;
                while (_loc_1 < this.texture_sheets.length)
                {
                    
                    this.texture_sheets[_loc_1].fillRect(this.texture_sheets[_loc_1].rect, 0);
                    _loc_1 = _loc_1 + 1;
                }
            }
            this.had_textures_before = true;
            _loc_2 = 8;
            _loc_1 = 0;
            while (_loc_1 < this.texture_sheets.length)
            {
                
                _loc_3 = new RectanglePacker(this.texture_sheets[_loc_1].width, this.texture_sheets[_loc_1].height, _loc_2);
                _loc_5 = [];
                _loc_4 = this.textures.length - 1;
                while (_loc_4 >= 0)
                {
                    
                    _loc_8 = this.textures[_loc_4];
                    if (_loc_8.sheet == _loc_1)
                    {
                        _loc_5.push(_loc_8);
                    }
                    _loc_4 = _loc_4 - 1;
                }
                _loc_4 = _loc_5.length - 1;
                while (_loc_4 >= 0)
                {
                    
                    _loc_8 = _loc_5[_loc_4];
                    _loc_3.insertRectangle(_loc_8.bm.width, _loc_8.bm.height, _loc_4);
                    _loc_4 = _loc_4 - 1;
                }
                _loc_3.packRectangles();
                trace("packer.rectangleCount = " + _loc_3.rectangleCount);
                _loc_6 = new Rectangle();
                _loc_4 = _loc_5.length - 1;
                while (_loc_4 >= 0)
                {
                    
                    _loc_9 = _loc_3.getRectangleId(_loc_4);
                    _loc_6 = _loc_3.getRectangle(_loc_4, null);
                    _loc_8 = _loc_5[_loc_9];
                    _loc_8.r = _loc_6;
                    _loc_4 = _loc_4 - 1;
                }
                _loc_4 = _loc_5.length - 1;
                while (_loc_4 >= 0)
                {
                    
                    _loc_8 = _loc_5[_loc_4];
                    _loc_6 = _loc_8.r;
                    _loc_7 = new Matrix();
                    _loc_7.translate(_loc_6.x, _loc_6.y);
                    this.texture_sheets[_loc_1].draw(_loc_8.bm, _loc_7);
                    _loc_8.bm.dispose();
                    _loc_4 = _loc_4 - 1;
                }
                this.sprite_textures[_loc_1] = Texture.fromBitmapData(this.texture_sheets[_loc_1], true);
                _loc_4 = _loc_5.length - 1;
                while (_loc_4 >= 0)
                {
                    
                    _loc_8 = _loc_5[_loc_4];
                    _loc_6 = _loc_8.r;
                    if (_loc_8.inset != undefined)
                    {
                        _loc_6.x = _loc_6.x + _loc_8.inset;
                        _loc_6.y = _loc_6.y + _loc_8.inset;
                        _loc_6.width = _loc_6.width - _loc_8.inset * 2;
                        _loc_6.height = _loc_6.height - _loc_8.inset * 2;
                    }
                    _loc_8.texture = Texture.fromTexture(this.sprite_textures[_loc_1], _loc_6);
                    _loc_4 = _loc_4 - 1;
                }
                _loc_1 = _loc_1 + 1;
            }
            if (!this.final_build)
            {
                _loc_4 = 0;
                while (_loc_4 < this.texture_sheets.length)
                {
                    
                    _loc_10 = this.texture_sheets[_loc_4].clone();
                    _loc_10.fillRect(_loc_10.rect, 1090453504);
                    _loc_10.draw(this.texture_sheets[_loc_4]);
                    _loc_11 = new Bitmap(_loc_10, "never", true);
                    var _loc_12:* = 1 / 8;
                    _loc_11.scaleY = 1 / 8;
                    _loc_11.scaleX = _loc_12;
                    this.stg.addChild(_loc_11);
                    if (_loc_4 == 1)
                    {
                        _loc_11.x = 2078 / 8;
                    }
                    else if (_loc_4 == 2)
                    {
                        _loc_11.y = 2078 / 8;
                    }
                    else if (_loc_4 == 3)
                    {
                        _loc_11.x = 2078 / 8;
                        _loc_11.y = 2078 / 8;
                    }
                    _loc_4 = _loc_4 + 1;
                }
            }
            return;
        }// end function

        public function drawText(param1, param2:QuadBatch, param3, param4, param5 = 12, param6 = 0, param7 = 1, param8 = 0, param9 = 2147483647, param10 = false)
        {
            var _loc_11:* = 0;
            var _loc_12:* = 0;
            var _loc_13:* = 0;
            var _loc_14:* = NaN;
            var _loc_15:* = null;
            var _loc_16:* = NaN;
            var _loc_17:* = NaN;
            var _loc_18:* = NaN;
            var _loc_19:* = undefined;
            var _loc_20:* = undefined;
            var _loc_21:* = NaN;
            var _loc_22:* = 0;
            var _loc_23:* = NaN;
            var _loc_24:* = undefined;
            _loc_11 = param1.length;
            _loc_16 = param5 / this.chsz;
            _loc_17 = 0;
            _loc_18 = 0;
            if (param8 == 1)
            {
                _loc_12 = 0;
                while (_loc_12 < _loc_11)
                {
                    
                    _loc_13 = param1.charCodeAt(_loc_12);
                    if (_loc_13 >= 32 && _loc_13 <= 126)
                    {
                        _loc_15 = this.chars[_loc_13];
                        _loc_17 = _loc_17 - _loc_15.w * _loc_16 * 0.5;
                    }
                    _loc_12++;
                }
            }
            else if (param8 == 2)
            {
                _loc_12 = 0;
                while (_loc_12 < _loc_11)
                {
                    
                    _loc_13 = param1.charCodeAt(_loc_12);
                    if (_loc_13 >= 32 && _loc_13 <= 126)
                    {
                        _loc_15 = this.chars[_loc_13];
                        _loc_17 = _loc_17 - _loc_15.w * _loc_16;
                    }
                    _loc_12++;
                }
            }
            _loc_19 = 0;
            if (param10)
            {
                _loc_20 = [];
                _loc_21 = 0;
                _loc_22 = -1;
                _loc_23 = 0;
                _loc_12 = 0;
                while (_loc_12 < _loc_11)
                {
                    
                    _loc_13 = param1.charCodeAt(_loc_12);
                    _loc_15 = this.chars[_loc_13];
                    _loc_14 = _loc_15.w * _loc_16;
                    _loc_17 = _loc_17 + _loc_14;
                    _loc_21 = _loc_21 + _loc_14;
                    if (_loc_13 == 32)
                    {
                        if (_loc_17 - _loc_14 > param9)
                        {
                            if (_loc_21 > _loc_19)
                            {
                                _loc_19 = _loc_21;
                            }
                            if (_loc_22 != -1)
                            {
                                _loc_20.push(_loc_22);
                                _loc_22 = -1;
                                var _loc_25:* = _loc_17 - _loc_23;
                                _loc_21 = _loc_17 - _loc_23;
                                _loc_17 = _loc_25;
                            }
                            else
                            {
                                _loc_20.push((_loc_12 + 1));
                                var _loc_25:* = 0;
                                _loc_21 = 0;
                                _loc_17 = _loc_25;
                            }
                        }
                        else
                        {
                            _loc_22 = _loc_12 + 1;
                            _loc_23 = _loc_17;
                        }
                    }
                    else if (_loc_17 > param9)
                    {
                        if (_loc_21 > _loc_19)
                        {
                            _loc_19 = _loc_21;
                        }
                        if (_loc_22 != -1)
                        {
                            _loc_20.push(_loc_22);
                            _loc_22 = -1;
                            var _loc_25:* = _loc_17 - _loc_23;
                            _loc_21 = _loc_17 - _loc_23;
                            _loc_17 = _loc_25;
                        }
                        else
                        {
                            _loc_20.push(_loc_12);
                            var _loc_25:* = _loc_14;
                            _loc_21 = _loc_14;
                            _loc_17 = _loc_25;
                        }
                    }
                    _loc_12++;
                }
                if (_loc_21 > _loc_19)
                {
                    _loc_19 = _loc_21;
                }
                _loc_17 = 0;
                _loc_24 = 0;
                _loc_12 = 0;
                while (_loc_12 < _loc_11)
                {
                    
                    _loc_13 = param1.charCodeAt(_loc_12);
                    if (_loc_13 >= 32 && _loc_13 <= 126)
                    {
                        if (_loc_24 >= 0)
                        {
                            if (_loc_12 == _loc_20[_loc_24])
                            {
                                _loc_17 = 0;
                                _loc_18 = _loc_18 + this.chars_lh * _loc_16;
                                if (++_loc_24 >= _loc_20.length)
                                {
                                    ++_loc_24 = -1;
                                }
                            }
                        }
                        _loc_15 = this.chars[_loc_13];
                        _loc_15.ii.color = param6;
                        _loc_15.ii.x = param3 + _loc_17;
                        _loc_15.ii.y = param4 + _loc_18;
                        var _loc_25:* = _loc_16;
                        _loc_15.ii.scaleY = _loc_16;
                        _loc_15.ii.scaleX = _loc_25;
                        _loc_15.ii.alpha = param7;
                        _loc_14 = _loc_15.w * _loc_16;
                        _loc_17 = _loc_17 + _loc_14;
                        param2.addImage(_loc_15.ii);
                        param2.addImage(_loc_15.ii);
                    }
                    _loc_12++;
                }
            }
            else
            {
                _loc_12 = 0;
                while (_loc_12 < _loc_11)
                {
                    
                    _loc_13 = param1.charCodeAt(_loc_12);
                    if (_loc_13 >= 32 && _loc_13 <= 126)
                    {
                        _loc_15 = this.chars[_loc_13];
                        _loc_15.ii.color = param6;
                        _loc_15.ii.x = param3 + _loc_17;
                        _loc_15.ii.y = param4;
                        var _loc_25:* = _loc_16;
                        _loc_15.ii.scaleY = _loc_16;
                        _loc_15.ii.scaleX = _loc_25;
                        _loc_15.ii.alpha = param7;
                        _loc_14 = _loc_15.w * _loc_16;
                        _loc_17 = _loc_17 + _loc_14;
                        if (_loc_17 >= param9)
                        {
                            break;
                        }
                        _loc_19 = _loc_19 + _loc_14;
                        param2.addImage(_loc_15.ii);
                        param2.addImage(_loc_15.ii);
                    }
                    _loc_12++;
                }
            }
            return {w:_loc_19, h:_loc_18 + this.chars_lh * _loc_16};
        }// end function

        public function setMscps(param1)
        {
            var _loc_2:* = 0;
            var _loc_3:* = NaN;
            var _loc_4:* = NaN;
            if (this.mscps != param1)
            {
                this.mscps = param1;
                this.fmlts = new Vector.<Number>;
                this.fpsls = new Vector.<Number>;
                _loc_2 = 0;
                while (_loc_2 <= this.mscps)
                {
                    
                    if (_loc_2 >= this.mscps)
                    {
                        this.fmlts.push(this.fmlts[(_loc_2 - 1)]);
                    }
                    else
                    {
                        this.fmlts.push(Math.pow(1 - _loc_2 / this.mscps, 2.25));
                    }
                    if (_loc_2 == 0)
                    {
                        this.fpsls.push(0);
                    }
                    else
                    {
                        this.fpsls.push(this.fpsls[(_loc_2 - 1)] + 1 / this.fmlts[(_loc_2 - 1)]);
                    }
                    _loc_2++;
                }
                _loc_3 = this.fmlts[(this.fmlts.length - 1)];
                _loc_4 = this.fpsls[(this.fpsls.length - 1)];
                _loc_2 = 0;
                while (_loc_2 < 2048)
                {
                    
                    this.fmlts.push(_loc_3);
                    this.fpsls.push(_loc_4);
                    _loc_2++;
                }
            }
            return;
        }// end function

        public function setAcceleration(param1:Boolean)
        {
            if (this.choosing_skin)
            {
                return;
            }
            if (this.single_player)
            {
                if (this.snake != null)
                {
                    this.snake.accelerating = param1;
                }
            }
            this.snake_wmd = param1;
            return;
        }// end function

        public function newSnake(param1, param2, param3, param4, param5, param6) : Snake
        {
            var _loc_7:* = null;
            var _loc_8:* = NaN;
            var _loc_9:* = NaN;
            var _loc_10:* = NaN;
            var _loc_11:* = undefined;
            _loc_7 = new Snake();
            _loc_7.id = param1;
            _loc_7.xx = param2;
            _loc_7.yy = param3;
            if (param4 > this.max_skin_cv)
            {
                param4 = param4 % 8;
            }
            this.setSkin(_loc_7, param4);
            param4 = _loc_7.cv;
            _loc_7.fnfr = 0;
            _loc_7.na = 1;
            _loc_7.chl = 0;
            _loc_7.tsp = 0;
            _loc_7.sfr = 0;
            _loc_7.rr = Math.min(255, this.rrs[param4] + int(Math.random() * 20));
            _loc_7.gg = Math.min(255, this.ggs[param4] + int(Math.random() * 20));
            _loc_7.bb = Math.min(255, this.bbs[param4] + int(Math.random() * 20));
            _loc_7.cs = _loc_7.rr << 16 | _loc_7.gg << 8 | _loc_7.bb;
            _loc_8 = Math.max(0, Math.min(255, Math.round(_loc_7.rr + (255 - _loc_7.rr) * 0.5)));
            _loc_9 = Math.max(0, Math.min(255, Math.round(_loc_7.gg + (255 - _loc_7.gg) * 0.5)));
            _loc_10 = Math.max(0, Math.min(255, Math.round(_loc_7.bb + (255 - _loc_7.bb) * 0.5)));
            _loc_7.ac = _loc_8 << 16 | _loc_9 << 8 | _loc_10;
            _loc_11 = 0.5;
            _loc_7.cs05 = Math.min(255, Math.max(0, Math.round(_loc_7.rr * _loc_11))) << 16 | Math.min(255, Math.max(0, Math.round(_loc_7.gg * _loc_11))) << 8 | Math.min(255, Math.max(0, Math.round(_loc_7.bb * _loc_11)));
            _loc_11 = 1.5;
            _loc_7.csw = Math.min(255, Math.max(0, Math.round(_loc_7.rr * _loc_11))) << 16 | Math.min(255, Math.max(0, Math.round(_loc_7.gg * _loc_11))) << 8 | Math.min(255, Math.max(0, Math.round(_loc_7.bb * _loc_11)));
            _loc_7.sc = 1;
            _loc_7.sc13 = 1;
            _loc_7.lsz = 29;
            _loc_7.ssp = this.nsp1 + this.nsp2 * _loc_7.sc;
            _loc_7.fsp = _loc_7.ssp + 0.1;
            _loc_7.msp = this.nsp3;
            _loc_7.sep = this.bsep;
            _loc_7.wsep = this.bsep;
            _loc_7.fxs = new Vector.<Number>(this.rfc);
            _loc_7.fys = new Vector.<Number>(this.rfc);
            _loc_7.fchls = new Vector.<Number>(this.rfc);
            _loc_7.fpos = 0;
            _loc_7.ftg = 0;
            _loc_7.fx = 0;
            _loc_7.fy = 0;
            _loc_7.fchl = 0;
            _loc_7.fas = new Vector.<Number>(this.afc);
            _loc_7.fapos = 0;
            _loc_7.fatg = 0;
            _loc_7.fa = 0;
            _loc_7.ehang = param5;
            _loc_7.wehang = param5;
            _loc_7.ehl = 1;
            _loc_7.msl = 42;
            _loc_7.fam = 0;
            _loc_7.ang = param5;
            _loc_7.eang = param5;
            _loc_7.wang = param5;
            _loc_7.rex = 0;
            _loc_7.rey = 0;
            _loc_7.sp = 2;
            if (param6)
            {
                _loc_7.lnp = param6[(param6.length - 1)];
                _loc_7.pts = param6;
                _loc_7.sct = param6.length;
                if (param6[0].dying)
                {
                    var _loc_12:* = _loc_7;
                    var _loc_13:* = _loc_7.sct - 1;
                    _loc_12.sct = _loc_13;
                }
            }
            else
            {
                _loc_7.pts = new Vector.<SnakePoint>;
                _loc_7.sct = 0;
            }
            _loc_7.flpos = 0;
            _loc_7.fls = new Vector.<Number>(this.lfc);
            _loc_7.fl = 0;
            _loc_7.fltg = 0;
            _loc_7.tl = _loc_7.sct + _loc_7.fam;
            _loc_7.cfl = _loc_7.tl;
            _loc_7.lsz = 29;
            _loc_7.scang = 1;
            _loc_7.normal_speed = this.nsp1 + this.nsp2 * _loc_7.sc;
            _loc_7.dead_amt = 0;
            _loc_7.alive_amt = 0;
            this.snakes.splice(0, 0, _loc_7);
            this.os["s" + _loc_7.id] = _loc_7;
            return _loc_7;
        }// end function

        public function setSkin(param1:Snake, param2:Number)
        {
            var _loc_3:* = NaN;
            var _loc_4:* = NaN;
            param1.rcv = param2;
            param1.pma = 2.3;
            param1.er = 6;
            param1.ec = 16777215;
            param1.eca = 0.75;
            param1.ppa = 1;
            param1.ppc = 0;
            param1.antenna = false;
            param1.one_eye = false;
            param1.swell = 0;
            if (param2 == 24)
            {
                param1.antenna = true;
                param1.atba = 0;
                param1.atc1 = 26764;
                param1.atc2 = 6605031;
                param1.atwg = true;
                param1.atia = 0.35;
                param1.abrot = false;
                _loc_4 = 9;
                param1.atx = new Vector.<Number>(_loc_4);
                param1.aty = new Vector.<Number>(_loc_4);
                param1.atvx = new Vector.<Number>(_loc_4);
                param1.atvy = new Vector.<Number>(_loc_4);
                param1.atax = new Vector.<Number>(_loc_4);
                param1.atay = new Vector.<Number>(_loc_4);
                _loc_3 = _loc_4 - 1;
                while (_loc_3 >= 0)
                {
                    
                    param1.atx[_loc_3] = param1.xx;
                    param1.aty[_loc_3] = param1.yy;
                    _loc_3 = _loc_3 - 1;
                }
                param1.bulb = this.acbulb_ii;
                param1.bsc = 0.25;
                param1.blba = 0.75;
            }
            else if (param2 == 25)
            {
                param1.ec = 16733705;
                param1.eca = 1;
                param1.antenna = true;
                param1.atba = 0;
                param1.atc1 = 0;
                param1.atc2 = 5648599;
                param1.atia = 1;
                param1.abrot = true;
                _loc_4 = 9;
                param1.atx = new Vector.<Number>(_loc_4);
                param1.aty = new Vector.<Number>(_loc_4);
                param1.atvx = new Vector.<Number>(_loc_4);
                param1.atvy = new Vector.<Number>(_loc_4);
                param1.atax = new Vector.<Number>(_loc_4);
                param1.atay = new Vector.<Number>(_loc_4);
                _loc_3 = _loc_4 - 1;
                while (_loc_3 >= 0)
                {
                    
                    param1.atx[_loc_3] = param1.xx;
                    param1.aty[_loc_3] = param1.yy;
                    _loc_3 = _loc_3 - 1;
                }
                param1.bulb = this.cdbulb_ii;
                param1.bsc = 0.34;
                param1.blba = 1;
            }
            else if (param2 == 27)
            {
                param1.one_eye = true;
                param1.ebi = this.jsebi_ii;
                param1.ebiw = 64;
                param1.ebih = 64;
                param1.ebisz = 29;
                param1.epi = this.jsepi_ii;
                param1.epiw = 48;
                param1.epih = 48;
                param1.episz = 14;
                param1.pma = 4;
                param1.swell = 0.06;
            }
            param1.rbcs = this.rbcs_pre[param2];
            param1.rbl = param1.rbcs.length;
            param1.cv = param1.rbcs[0];
            param1.arrow_color = Math.max(0, Math.min(255, Math.round(0.25 * 256 + 0.75 * this.rrs[param1.cv]))) << 16 | Math.max(0, Math.min(255, Math.round(0.25 * 256 + 0.75 * this.ggs[param1.cv]))) << 8 | Math.max(0, Math.min(255, Math.round(0.25 * 256 + 0.75 * this.bbs[param1.cv])));
            return;
        }// end function

        public function snl(param1:Snake)
        {
            this.orl = param1.tl;
            param1.tl = param1.sct + Math.min(1, param1.fam);
            if (param1.iiv)
            {
                this.snld = param1.tl - this.orl;
                this.snlk = param1.flpos;
                this.snlj = 0;
                while (this.snlj < this.lfc)
                {
                    
                    param1.fls[this.snlk] = param1.fls[this.snlk] - this.snld * this.lfas[this.snlj];
                    var _loc_2:* = this;
                    var _loc_3:* = this.snlk + 1;
                    _loc_2.snlk = _loc_3;
                    if (this.snlk >= this.lfc)
                    {
                        this.snlk = 0;
                    }
                    var _loc_2:* = this;
                    var _loc_3:* = this.snlj + 1;
                    _loc_2.snlj = _loc_3;
                }
                param1.fl = param1.fls[param1.flpos];
                param1.fltg = this.lfc;
            }
            if (param1 == this.snake)
            {
                this.wumsts = true;
            }
            return;
        }// end function

        public function newFood(param1, param2, param3, param4, param5) : Food
        {
            var _loc_6:* = null;
            _loc_6 = new Food();
            _loc_6.xx = param1;
            _loc_6.yy = param2;
            _loc_6.ogrd = this.grd;
            _loc_6.rx = param1;
            _loc_6.ry = param2;
            _loc_6.a = 1;
            if (param4)
            {
                _loc_6.rsp = 2;
            }
            else
            {
                _loc_6.rsp = 1;
            }
            _loc_6.cv = param5 % this.per_color_imgs.length;
            param5 = _loc_6.cv;
            _loc_6.sz = param3;
            _loc_6.rad = 1e-006;
            _loc_6.lrrad = _loc_6.rad;
            this.pci = this.per_color_imgs[_loc_6.cv];
            _loc_6.cv2 = int(this.pci.imgs.length * _loc_6.sz / 16.5);
            if (_loc_6.cv2 < 0)
            {
                _loc_6.cv2 = 0;
            }
            if (_loc_6.cv2 >= this.pci.imgs.length)
            {
                _loc_6.cv2 = this.pci.imgs.length - 1;
            }
            _loc_6.fw = this.pci.fws[_loc_6.cv2];
            _loc_6.fh = this.pci.fhs[_loc_6.cv2];
            _loc_6.fw2 = this.pci.fw2s[_loc_6.cv2];
            _loc_6.fh2 = this.pci.fh2s[_loc_6.cv2];
            var _loc_7:* = this;
            var _loc_8:* = this.nfps + 1;
            _loc_7.nfps = _loc_8;
            _loc_6.fr = 0;
            _loc_6.gfr = Math.random() * 64;
            _loc_6.wsp = (2 * Math.random() - 1) * 0.02;
            _loc_6.eaten_fr = 0;
            var _loc_7:* = this;
            var _loc_8:* = this.foods_cm1 + 1;
            _loc_7.foods_cm1 = _loc_8;
            this.foods[this.foods_cm1] = _loc_6;
            return _loc_6;
        }// end function

        public function newPrey(param1, param2, param3, param4, param5, param6, param7, param8, param9) : Prey
        {
            var _loc_10:* = null;
            var _loc_11:* = undefined;
            var _loc_12:* = undefined;
            var _loc_13:* = undefined;
            _loc_10 = new Prey();
            _loc_10.id = param1;
            _loc_10.xx = param2;
            _loc_10.yy = param3;
            _loc_10.rad = 1e-005;
            _loc_10.sz = param4;
            _loc_10.cv = param5 % this.per_color_imgs.length;
            param5 = _loc_10.cv;
            _loc_10.dir = param6;
            _loc_10.wang = param7;
            _loc_10.ang = param8;
            _loc_10.sp = param9;
            _loc_10.fr = 0;
            _loc_10.gfr = Math.random() * 64;
            _loc_10.rr = Math.min(255, this.rrs[param5]);
            _loc_10.gg = Math.min(255, this.ggs[param5]);
            _loc_10.bb = Math.min(255, this.bbs[param5]);
            _loc_11 = "00" + Math.min(255, Math.max(0, Math.round(_loc_10.rr))).toString(16);
            _loc_12 = "00" + Math.min(255, Math.max(0, Math.round(_loc_10.gg))).toString(16);
            _loc_13 = "00" + Math.min(255, Math.max(0, Math.round(_loc_10.bb))).toString(16);
            _loc_11 = _loc_11.substr(_loc_11.length - 2);
            _loc_12 = _loc_12.substr(_loc_12.length - 2);
            _loc_13 = _loc_13.substr(_loc_13.length - 2);
            _loc_10.cs = _loc_10.rr << 16 | _loc_10.gg << 8 | _loc_10.bb;
            this.pci = this.per_color_imgs[_loc_10.cv];
            _loc_10.cv2 = int(this.pci.pr_imgs.length * this.gsc * _loc_10.sz / 9);
            if (_loc_10.cv2 < 0)
            {
                _loc_10.cv2 = 0;
            }
            if (_loc_10.cv2 >= this.pci.pr_imgs.length)
            {
                _loc_10.cv2 = this.pci.pr_imgs.length - 1;
            }
            _loc_10.fw = this.pci.pr_fws[_loc_10.cv2];
            _loc_10.fh = this.pci.pr_fhs[_loc_10.cv2];
            _loc_10.fw2 = this.pci.pr_fw2s[_loc_10.cv2];
            _loc_10.fh2 = this.pci.pr_fh2s[_loc_10.cv2];
            _loc_10.fxs = new Vector.<Number>(this.rfc);
            _loc_10.fys = new Vector.<Number>(this.rfc);
            _loc_10.fpos = 0;
            _loc_10.ftg = 0;
            _loc_10.fx = 0;
            _loc_10.fy = 0;
            _loc_10.eaten = false;
            _loc_10.eaten_fr = 0;
            var _loc_14:* = this;
            var _loc_15:* = this.preys_cm1 + 1;
            _loc_14.preys_cm1 = _loc_15;
            this.preys[this.preys_cm1] = _loc_10;
            return _loc_10;
        }// end function

        public function rootCreated()
        {
            var i:*;
            var j:*;
            var k:*;
            var l:*;
            var m:*;
            var n:*;
            var q:*;
            var sc:*;
            var ang:*;
            var rad:*;
            var c:*;
            var o:*;
            var xx:*;
            var yy:*;
            var mtx:Matrix;
            var ctf:ColorTransform;
            var sh:Shape;
            var g:Graphics;
            var sh2:Shape;
            var g2:Graphics;
            var fl:*;
            var r:Rectangle;
            var img:Image;
            var cbm:BitmapData;
            var cbm2:BitmapData;
            var cbm3:BitmapData;
            var cbm4:BitmapData;
            var cbm5:BitmapData;
            var cbm6:BitmapData;
            var ii:*;
            var fl2:*;
            var tw:*;
            var th:*;
            var sz:*;
            var sz2:*;
            var png:*;
            var png2:*;
            var over:*;
            var bgei:*;
            var tf:TextField;
            var tft:TextFormat;
            var achs:*;
            var ch:*;
            var cmode:*;
            var btn:*;
            var rr:*;
            var gg:*;
            var bb:*;
            this.ready();
            this.texture_sheets.push(new BitmapData(2048, 2048, true, 0));
            this.starfield = this._starling.root as Gaim;
            this.starfield.alpha = 0.999;
            this._starling.start();
            tw = this.stg.stageWidth;
            th = this.stg.stageHeight;
            this.force_game_scale = 480 / th;
            var _loc_2:* = 1 / this.force_game_scale;
            this.starfield.scaleY = 1 / this.force_game_scale;
            this.starfield.scaleX = _loc_2;
            trace(tw + ", " + th);
            trace("force_game_scale = " + this.force_game_scale);
            this.all_layer = this.newSprite();
            this.starfield.addChild(this.all_layer);
            this.gameholder_layer = this.newSprite();
            this.all_layer.addChild(this.gameholder_layer);
            this.bg_layer = this.newSprite();
            this.gameholder_layer.addChild(this.bg_layer);
            this.game_layer = this.newSprite();
            this.gameholder_layer.addChild(this.game_layer);
            this.food_layer = this.newSprite();
            this.game_layer.addChild(this.food_layer);
            this.moving_food_batch = new QuadBatch();
            this.moving_food_batch.touchable = false;
            this.game_layer.addChild(this.moving_food_batch);
            this.snake_batch = new QuadBatch();
            this.snake_batch.touchable = false;
            this.game_layer.addChild(this.snake_batch);
            this.snake_add_batch = new QuadBatch();
            this.snake_add_batch.touchable = false;
            this.game_layer.addChild(this.snake_add_batch);
            this.stats_layer = this.newSprite();
            this.all_layer.addChild(this.stats_layer);
            this.login_layer = this.newSprite();
            this.all_layer.addChild(this.login_layer);
            this.bgballs = new QuadBatch();
            this.bgballs.touchable = false;
            this.skin_layer = this.newSprite();
            this.all_layer.addChild(this.skin_layer);
            this.skin_layer.visible = false;
            this.settings_layer = this.newSprite();
            this.all_layer.addChild(this.settings_layer);
            this.settings_layer.visible = false;
            this.arrow_batch = new QuadBatch();
            this.arrow_batch.touchable = false;
            this.all_layer.addChild(this.arrow_batch);
            this.arrow_add_batch = new QuadBatch();
            this.arrow_add_batch.touchable = false;
            this.all_layer.addChild(this.arrow_add_batch);
            this.startTextures();
            rad;
            png = new lowgo();
            this.logo_t = this.prepareTextureFromClip(png, 0.5, 0);
            png = new chaynge();
            this.changeskin_t = this.prepareTextureFromClip(png, 1, 0);
            png = new playonline();
            this.playonline_t = this.prepareTextureFromClip(png, 0.4, 0);
            png = new playoffline();
            this.playoffline_t = this.prepareTextureFromClip(png, 0.35, 0);
            png = new remads();
            this.removeads_t = this.prepareTextureFromClip(png, 1, 0);
            png = new restorepurch();
            this.restorepurchases_t = this.prepareTextureFromClip(png, 1, 0);
            sz;
            cbm = new BitmapData(sz, sz, true, 4278190080);
            cbm2 = new BitmapData(sz, sz, true, 4288180479);
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(16777215, 1);
            i;
            while (i <= 400)
            {
                
                if (i % 50 < 25)
                {
                    k = sz * 0.42;
                }
                else
                {
                    k = sz * 0.34;
                }
                xx = sz / 2 + Math.cos(2 * Math.PI * i / 400) * k;
                yy = sz / 2 + Math.sin(2 * Math.PI * i / 400) * k;
                if (i == 0)
                {
                    g.moveTo(xx, yy);
                }
                else
                {
                    g.lineTo(xx, yy);
                }
                i = (i + 1);
            }
            g.endFill();
            cbm.draw(sh);
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(0, 1);
            g.drawCircle(sz / 2, sz / 2, sz * 0.18);
            g.endFill();
            cbm.draw(sh);
            cbm2.copyChannel(cbm, cbm.rect, new Point(), 1, 8);
            fl = new DropShadowFilter(3, 90, 0, 0.7, 10, 10, 1, 3, false, false, false);
            cbm2.applyFilter(cbm2, cbm2.rect, new Point(), fl);
            ctf = new ColorTransform(1, 1, 1, 0.7, 0, 0, 0, 0);
            cbm2.colorTransform(cbm2.rect, ctf);
            this.settings_t = this.prepareTexture(cbm2, 0);
            cbm = new BitmapData(32, 32, true, 4280293432);
            this.sbg_t = this.prepareTexture(cbm, 0);
            this.sbg_t.inset = 4;
            png = new snake_follows_arrow();
            this.sfa_t = this.prepareTextureFromClip(png, 0.75, 1);
            png = new snake_follows_finger();
            this.sff_t = this.prepareTextureFromClip(png, 0.75, 1);
            png = new snake_follows_joystick();
            this.sfj_t = this.prepareTextureFromClip(png, 0.75, 1);
            sz;
            cbm = new BitmapData(sz + 20, sz + 20, true, 0);
            i;
            while (i <= 2)
            {
                
                sh = new Shape();
                g = sh.graphics;
                if (i == 1)
                {
                    g.lineStyle(9, 0, 1, false, "normal", null, JointStyle.MITER, 16);
                }
                g.beginFill(16777215, 1);
                g.moveTo(6, sz * (0.5 - 0.17));
                g.lineTo(6, sz * (0.5 + 0.17));
                g.lineTo(sz * 0.5, sz * (0.5 + 0.12));
                g.lineTo(sz * 0.5, sz * (0.5 + 0.4));
                g.lineTo(sz - 6, sz * 0.5);
                g.lineTo(sz * 0.5, sz * (0.5 - 0.4));
                g.lineTo(sz * 0.5, sz * (0.5 - 0.12));
                g.lineTo(6, sz * (0.5 - 0.17));
                g.endFill();
                mtx = new Matrix();
                mtx.translate(10, 10);
                cbm.draw(sh, mtx);
                i = (i + 1);
            }
            fl = new DropShadowFilter(0, 90, 0, 1, 12, 12, 1, 3, false, false, false);
            cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
            this.arrow_t = this.prepareTexture(cbm, 0);
            sz;
            cbm = new BitmapData(sz, sz, true, 0);
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(4259680, 1);
            g.moveTo(6, sz * (0.5 - 0.17));
            g.lineTo(6, sz * (0.5 + 0.17));
            g.lineTo(sz * 0.5, sz * (0.5 + 0.17));
            g.lineTo(sz * 0.5, sz * (0.5 + 0.4));
            g.lineTo(sz - 6, sz * 0.5);
            g.lineTo(sz * 0.5, sz * (0.5 - 0.4));
            g.lineTo(sz * 0.5, sz * (0.5 - 0.17));
            g.lineTo(6, sz * (0.5 - 0.17));
            g.endFill();
            cbm.draw(sh);
            fl = new BevelFilter(4, 90, 16777215, 1, 0, 0.75, 20, 20, 1, 3, "inner", false);
            cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
            fl = new DropShadowFilter(0, 90, 0, 1, 12, 12, 1, 3, false, false, false);
            cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
            this.next_t = this.prepareTexture(cbm, 0);
            cbm = new BitmapData(84, 84, true, 0);
            mtx = new Matrix();
            mtx.createGradientBox(64, 64, 0, 0, 0);
            sh = new Shape();
            g = sh.graphics;
            g.beginGradientFill(GradientType.RADIAL, [16777215, 0], [1, 1], [0, 255], mtx);
            g.moveTo(0, 0);
            g.lineTo(64, 0);
            g.lineTo(64, 64);
            g.lineTo(0, 64);
            g.endFill();
            mtx = new Matrix();
            mtx.translate(10, 10);
            cbm.draw(sh, mtx);
            fl = new BlurFilter(8, 8, 3);
            cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
            this.bgb_t = this.prepareTexture(cbm, 0);
            cbm = new BitmapData(64, 64, true, 0);
            mtx = new Matrix();
            mtx.createGradientBox(64 + 20, 64 + 20, 0, -10, -10);
            sh = new Shape();
            g = sh.graphics;
            g.beginGradientFill(GradientType.RADIAL, [6324326, 265236], [1, 1], [0, 255], mtx);
            g.moveTo(0, 0);
            g.lineTo(64, 0);
            g.lineTo(64, 64);
            g.lineTo(0, 64);
            g.endFill();
            cbm.draw(sh);
            this.lbg_t = this.prepareTexture(cbm, 0);
            this.lbg_t.inset = 1;
            cbm = new BitmapData(64, 16, true, 0);
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(4456448, 1);
            g.moveTo(0, 0);
            g.lineTo(64, 0);
            g.lineTo(64, 16);
            g.lineTo(0, 16);
            g.lineTo(0, 0);
            g.endFill();
            cbm.draw(sh);
            this.border_t = this.prepareTexture(cbm, 0);
            this.border_t.inset = 2;
            sz;
            sz2 = sz / 2;
            cbm = new BitmapData(sz, sz, true, 0);
            xx;
            while (xx < sz)
            {
                
                yy;
                while (yy < sz)
                {
                    
                    k = Math.abs(sz2 - Math.sqrt(Math.pow(sz2 - xx, 2) + Math.pow(sz2 - yy, 2))) / sz2;
                    k = k * 1.06 - 0.06;
                    if (k < 0)
                    {
                        k;
                    }
                    else
                    {
                        k = Math.pow(k, 0.35);
                        k = k * 1.35;
                    }
                    k = k + (1 - k) * 0.25;
                    rr = Math.max(0, Math.min(255, Math.round(72 * k)));
                    gg = Math.max(0, Math.min(255, Math.round(255 * k)));
                    bb = Math.max(0, Math.min(255, Math.round(116 * k)));
                    k = sz2 - Math.sqrt(Math.pow(sz2 - xx, 2) + Math.pow(sz2 - yy, 2));
                    if (k <= 3)
                    {
                        this.aa = Math.max(0, Math.min(255, Math.round(k / 3 * 255)));
                    }
                    else
                    {
                        this.aa = 255;
                    }
                    c = this.aa << 24 | rr << 16 | gg << 8 | bb;
                    cbm.setPixel32(xx, yy, c);
                    yy = (yy + 1);
                }
                xx = (xx + 1);
            }
            this.jsebi_t = this.prepareTexture(cbm, 0);
            sz;
            sz2 = sz / 2;
            cbm = new BitmapData(sz, sz, true, 0);
            xx;
            while (xx < sz)
            {
                
                yy;
                while (yy < sz)
                {
                    
                    k = Math.abs(sz2 - Math.sqrt(Math.pow(sz2 - xx, 2) + Math.pow(sz2 - yy, 2))) / sz2;
                    if (k > 0.5)
                    {
                        k;
                    }
                    else
                    {
                        k = 1 - Math.pow(k / 0.5, 1);
                    }
                    k = k * 0.8;
                    if (k == 0)
                    {
                        rr;
                        gg;
                        bb;
                    }
                    else
                    {
                        rr = Math.max(0, Math.min(255, Math.round(28 + (87 - 28) * k)));
                        gg = Math.max(0, Math.min(255, Math.round(83 + (168 - 83) * k)));
                        bb = Math.max(0, Math.min(255, Math.round(128 + (238 - 128) * k)));
                    }
                    k = sz2 - Math.sqrt(Math.pow(sz2 - xx, 2) + Math.pow(sz2 - yy, 2));
                    if (k <= 1)
                    {
                        this.aa = Math.max(0, Math.min(255, Math.round(k / 1 * 255)));
                    }
                    else
                    {
                        this.aa = 255;
                    }
                    c = this.aa << 24 | rr << 16 | gg << 8 | bb;
                    cbm.setPixel32(xx, yy, c);
                    yy = (yy + 1);
                }
                xx = (xx + 1);
            }
            this.jsepi_t = this.prepareTexture(cbm, 0);
            sz;
            sz2 = sz / 2;
            cbm = new BitmapData(sz, sz, true, 0);
            xx;
            while (xx < sz)
            {
                
                yy;
                while (yy < sz)
                {
                    
                    k = Math.sqrt(Math.pow(sz2 - xx, 2) + Math.pow(sz2 + 5 - yy, 2)) - (rad - 3);
                    k = k * 0.05;
                    if (k < 0)
                    {
                        k = -k;
                    }
                    if (k > 1)
                    {
                        k;
                    }
                    k = 1 - k;
                    c = 255 * k << 24;
                    cbm.setPixel32(xx, yy, c);
                    yy = (yy + 1);
                }
                xx = (xx + 1);
            }
            this.ksmc_t = this.prepareTexture(cbm, 0);
            sz = rad * 2;
            sz2 = sz / 2;
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(0, 1);
            g.drawCircle(sz2, sz2, rad);
            g.endFill();
            i;
            while (i < this.rrs.length)
            {
                
                this.kmc_ts.push(new Vector.<Object>);
                this.kmc_iis.push(new Vector.<Image>);
                j;
                while (j < 7)
                {
                    
                    cbm = new BitmapData(sz, sz, true, 0);
                    cbm.draw(sh);
                    xx;
                    while (xx < sz)
                    {
                        
                        yy;
                        while (yy < sz)
                        {
                            
                            k = Math.pow(Math.max(0, Math.min(1, 1 - Math.abs(yy - rad) / rad)), 0.5);
                            this.k2 = Math.max(0, Math.min(1, 1 - Math.sqrt(Math.pow(xx - sz2, 2) + Math.pow(yy - sz2, 2)) / (rad * 2 + 2)));
                            k = k + (this.k2 - k) * 0.5;
                            k = k * (1.22 - 0.44 * j / (7 - 1));
                            rr = this.rrs[i];
                            gg = this.ggs[i];
                            bb = this.bbs[i];
                            if (i == 24)
                            {
                                this.k2 = Math.sqrt(Math.pow(0.5 * (xx - sz2), 2) + Math.pow(1 * (yy - sz2), 2)) / sz2;
                                this.k2 = Math.pow(this.k2 * 1.05, 4);
                                if (this.k2 > 1)
                                {
                                    this.k2 = 1;
                                }
                                rr = rr + (255 * 1.2 - rr) * this.k2;
                                gg = gg + (192 * 1.2 - gg) * this.k2;
                                bb = bb + (64 * 1.2 - bb) * this.k2;
                            }
                            rr = Math.max(0, Math.min(255, Math.floor(rr * k)));
                            gg = Math.max(0, Math.min(255, Math.floor(gg * k)));
                            bb = Math.max(0, Math.min(255, Math.floor(bb * k)));
                            c = rr << 16 | gg << 8 | bb;
                            cbm.setPixel(xx, yy, c);
                            yy = (yy + 1);
                        }
                        xx = (xx + 1);
                    }
                    if (i == 10)
                    {
                        k;
                        while (k <= 1)
                        {
                            
                            this.tx = sz2 + Math.cos(2 * Math.PI * k / 8) * (sz2 / 16) * 13;
                            this.ty = sz2 + Math.sin(2 * Math.PI * k / 8) * (sz2 / 16) * 13;
                            sh2 = new Shape();
                            g2 = sh2.graphics;
                            g2.beginFill(16777215, 1);
                            m;
                            while (m <= 5)
                            {
                                
                                xx = this.tx + Math.cos(2 * Math.PI * m / 5) * 24 * 0.05 * (sz / 32);
                                yy = this.ty + Math.sin(2 * Math.PI * m / 5) * 24 * 0.05 * (sz / 32);
                                if (m == 0)
                                {
                                    g2.moveTo(xx, yy);
                                }
                                else
                                {
                                    g2.lineTo(xx, yy);
                                }
                                xx = this.tx + Math.cos(2 * Math.PI * (m + 0.5) / 5) * 62 * 0.05 * (sz / 32);
                                yy = this.ty + Math.sin(2 * Math.PI * (m + 0.5) / 5) * 62 * 0.05 * (sz / 32);
                                g2.lineTo(xx, yy);
                                m = (m + 1);
                            }
                            g2.endFill();
                            cbm.draw(sh2);
                            k = (k + 1);
                        }
                    }
                    else if (i == 19)
                    {
                        k;
                        while (k <= 2)
                        {
                            
                            this.tx = sz2 + Math.cos(2 * Math.PI * k / 15) * (sz2 / 16) * 13;
                            this.ty = sz2 + Math.sin(2 * Math.PI * k / 15) * (sz2 / 16) * 13;
                            sh2 = new Shape();
                            g2 = sh2.graphics;
                            g2.beginFill(16777215, 0.7);
                            m;
                            while (m <= 5)
                            {
                                
                                xx = this.tx + Math.cos(2 * Math.PI * m / 5) * 12 * 0.05 * (sz / 32);
                                yy = this.ty + Math.sin(2 * Math.PI * m / 5) * 12 * 0.05 * (sz / 32);
                                if (m == 0)
                                {
                                    g2.moveTo(xx, yy);
                                }
                                else
                                {
                                    g2.lineTo(xx, yy);
                                }
                                xx = this.tx + Math.cos(2 * Math.PI * (m + 0.5) / 5) * 31 * 0.05 * (sz / 32);
                                yy = this.ty + Math.sin(2 * Math.PI * (m + 0.5) / 5) * 31 * 0.05 * (sz / 32);
                                g2.lineTo(xx, yy);
                                m = (m + 1);
                            }
                            g2.endFill();
                            cbm.draw(sh2);
                            k = (k + 1);
                        }
                    }
                    else if (i == 20)
                    {
                        k;
                        while (k <= 1.5)
                        {
                            
                            this.tx = sz2 + Math.cos(2 * Math.PI * k / 15) * (sz2 / 16) * 13;
                            this.ty = sz2 + Math.sin(2 * Math.PI * k / 15) * (sz2 / 16) * 13;
                            sh2 = new Shape();
                            g2 = sh2.graphics;
                            g2.beginFill(16777215, 0.7);
                            m;
                            while (m <= 5)
                            {
                                
                                xx = this.tx + Math.cos(2 * Math.PI * m / 5) * 14 * 0.05 * (sz2 / 16);
                                yy = this.ty + Math.sin(2 * Math.PI * m / 5) * 14 * 0.05 * (sz2 / 16);
                                if (m == 0)
                                {
                                    g2.moveTo(xx, yy);
                                }
                                else
                                {
                                    g2.lineTo(xx, yy);
                                }
                                xx = this.tx + Math.cos(2 * Math.PI * (m + 0.5) / 5) * 36 * 0.05 * (sz2 / 16);
                                yy = this.ty + Math.sin(2 * Math.PI * (m + 0.5) / 5) * 36 * 0.05 * (sz2 / 16);
                                g2.lineTo(xx, yy);
                                m = (m + 1);
                            }
                            g2.endFill();
                            cbm.draw(sh2);
                            k = (k + 1);
                        }
                    }
                    this.kmc_ts[i].push(this.prepareTexture(cbm, 0));
                    j = (j + 1);
                }
                fl = new BlurFilter(24, 24, 3);
                cbm2 = new BitmapData(cbm.width + 32, cbm.height + 32, true, 0);
                mtx = new Matrix();
                mtx.translate(16, 16);
                cbm2.draw(cbm, mtx);
                cbm2.applyFilter(cbm2, cbm2.rect, new Point(), fl);
                this.kmc_add_ts.push(this.prepareTexture(cbm2, 0));
                i = (i + 1);
            }
            cbm = new BitmapData(32, 32, true, 0);
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(16777215, 1);
            g.drawCircle(16, 16, 16);
            g.endFill();
            cbm.draw(sh);
            this.eye_t = this.prepareTexture(cbm, 0);
            cbm = new BitmapData(64, 64, true, 0);
            mtx = new Matrix();
            mtx.createGradientBox(64, 64, 0, 0, 0);
            sh = new Shape();
            g = sh.graphics;
            g.beginGradientFill(GradientType.RADIAL, [16744576, 13370115, 10489872, 0], [1, 1, 1, 0], [0, 128, 252, 255], mtx);
            g.moveTo(0, 0);
            g.lineTo(64, 0);
            g.lineTo(64, 64);
            g.lineTo(0, 64);
            g.endFill();
            cbm.draw(sh);
            this.acbulb_t = this.prepareTexture(cbm, 0);
            cbm = new BitmapData(84, 84, true, 0);
            cbm.fillRect(new Rectangle(13, 10, 58 / 2, 64), 4294923785);
            cbm.fillRect(new Rectangle(13, 10, 58, 22), 4294923785);
            cbm.fillRect(new Rectangle(13, 10 + 44, 58, 22), 4294923785);
            fl = new DropShadowFilter(0, 90, 0, 1, 20, 20, 1, 3, false, false, false);
            cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
            this.cdbulb_t = this.prepareTexture(cbm, 0);
            cbm = new BitmapData(54, 20, true, 0);
            mtx = new Matrix();
            mtx.createGradientBox(cbm.width, cbm.height, Math.PI / 2, 0, 0);
            sh = new Shape();
            g = sh.graphics;
            g.beginGradientFill(GradientType.LINEAR, [4210752, 16777215, 16777215, 4210752], [1, 1, 1, 1], [0, 107, 148, 255], mtx);
            g.moveTo(10, 0);
            g.lineTo(44, 0);
            g.curveTo(54, 20 / 2, 44, 20);
            g.lineTo(10, 20);
            g.curveTo(0, 20 / 2, 10, 0);
            g.endFill();
            cbm.draw(sh);
            this.antenna_segment_t = this.prepareTexture(cbm, 0);
            this.antenna_segment_t.inset = 1;
            this.bgw = 599;
            this.bgh = 519;
            this.bgw2 = int(this.bgw / 2);
            this.bgh2 = int(this.bgh / 2);
            over;
            cbm = new BitmapData(this.bgw + over, this.bgh + over, true, 4278716424);
            bgei = new bgee();
            cbm.draw(bgei);
            mtx = new Matrix();
            mtx.translate(this.bgw, 0);
            cbm.draw(bgei, mtx);
            mtx = new Matrix();
            mtx.translate(0, this.bgh);
            cbm.draw(bgei, mtx);
            mtx = new Matrix();
            mtx.translate(this.bgw, this.bgh);
            cbm.draw(bgei, mtx);
            ctf = new ColorTransform(0.6, 0.6, 0.6, 1, 4, 4, 4, 0);
            cbm.colorTransform(cbm.rect, ctf);
            this.bgp_t = this.prepareTexture(cbm, 0);
            this.bgp_t.inset = 1;
            i;
            while (i < this.rrs.length)
            {
                
                this.pci = new PerColor();
                this.per_color_imgs.push(this.pci);
                this.pci.cs = this.rrs[i] << 16 | this.ggs[i] << 8 | this.bbs[i];
                this.pci.textures = [];
                this.pci.imgs = new Vector.<Image>;
                this.pci.fws = new Vector.<Number>;
                this.pci.fhs = new Vector.<Number>;
                this.pci.fw2s = new Vector.<Number>;
                this.pci.fh2s = new Vector.<Number>;
                j;
                while (j <= 23)
                {
                    
                    sz = Math.ceil(j * 2 + 24);
                    cbm = new BitmapData(sz, sz, true, 0);
                    sh = new Shape();
                    g = sh.graphics;
                    g.beginFill(this.pci.cs, 1);
                    g.drawCircle(sz / 2, sz / 2, j / 2);
                    g.endFill();
                    cbm.draw(sh);
                    fl = new DropShadowFilter(0, 90, this.pci.cs, 1, 12, 12, 2, 3, false, false, false);
                    cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
                    this.pci.textures.push(this.prepareTexture(cbm, 0));
                    this.pci.fws.push(sz);
                    this.pci.fhs.push(sz);
                    this.pci.fw2s.push(sz / 2);
                    this.pci.fh2s.push(sz / 2);
                    j = j + 0.7;
                }
                this.pci.pr_textures = [];
                this.pci.pr_imgs = new Vector.<Image>;
                this.pci.pr_fws = new Vector.<Number>;
                this.pci.pr_fhs = new Vector.<Number>;
                this.pci.pr_fw2s = new Vector.<Number>;
                this.pci.pr_fh2s = new Vector.<Number>;
                j;
                while (j <= 28)
                {
                    
                    sz = Math.ceil(j * 2 + 24);
                    cbm = new BitmapData(sz, sz, true, 0);
                    sh = new Shape();
                    g = sh.graphics;
                    g.beginFill(this.pci.cs, 1);
                    g.drawCircle(sz / 2, sz / 2, j / 2);
                    g.endFill();
                    cbm.draw(sh);
                    fl = new DropShadowFilter(0, 90, this.pci.cs, 1, 12, 12, 2, 3, false, false, false);
                    cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
                    this.pci.pr_textures.push(this.prepareTexture(cbm, 0));
                    this.pci.pr_fws.push(sz);
                    this.pci.pr_fhs.push(sz);
                    this.pci.pr_fw2s.push(sz / 2);
                    this.pci.pr_fh2s.push(sz / 2);
                    j = (j + 1);
                }
                i = (i + 1);
            }
            cbm = new BitmapData(94, 94, true, 0);
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(3158584, 1);
            g.drawCircle(cbm.width / 2, cbm.height / 2, 37);
            g.endFill();
            cbm.draw(sh);
            cbm2 = cbm.clone();
            g.clear();
            g.beginFill(5264219);
            g.moveTo(cbm.width / 2, cbm.height / 2);
            g.lineTo(cbm.width / 2, -10);
            g.lineTo(cbm.width + 10, -10);
            g.lineTo(cbm.width + 10, cbm.height / 2);
            g.endFill();
            cbm.draw(sh);
            g.clear();
            g.beginFill(5264219);
            g.moveTo(cbm.width / 2, cbm.height / 2);
            g.lineTo(cbm.width / 2, cbm.height + 10);
            g.lineTo(-10, cbm.height + 10);
            g.lineTo(-10, cbm.height / 2);
            g.endFill();
            cbm.draw(sh);
            cbm.copyChannel(cbm2, cbm2.rect, new Point(), 8, 8);
            fl = new DropShadowFilter(4, 90, 0, 1, 4, 4, 1, 3, false, false, false);
            cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
            this.minimap_t = this.prepareTexture(cbm, 0);
            png = new boostie();
            cbm = new BitmapData(png.width, png.height, true, 0);
            cbm.draw(png);
            this.boost_t = this.prepareTexture(cbm, 0);
            cbm = new BitmapData(168, 168, true, 0);
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(8421504, 1);
            g.drawCircle(84, 84, 64);
            g.endFill();
            cbm.draw(sh);
            fl = new DropShadowFilter(0, 90, 0, 1, 14, 14, 1, 3, false, false, false);
            cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
            this.joystick_bg_t = this.prepareTexture(cbm, 0);
            cbm = new BitmapData(128, 128, true, 0);
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(16777215, 1);
            g.drawCircle(64, 64, 48);
            g.endFill();
            cbm.draw(sh);
            fl = new DropShadowFilter(0, 90, 0, 1, 14, 14, 1, 3, false, false, false);
            cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
            this.joystick_t = this.prepareTexture(cbm, 0);
            png = new flippa();
            this.flippa_t = this.prepareTextureFromClip(png, 1, 0);
            cbm = new BitmapData(84, 84, true, 0);
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(16724016, 1);
            g.drawCircle(42, 42, 30);
            g.endFill();
            cbm.draw(sh);
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(16777215, 1);
            g.moveTo(-11, -26);
            g.lineTo(11, -26);
            g.lineTo(6, 9);
            g.lineTo(-6, 9);
            g.endFill();
            mtx = new Matrix();
            mtx.scale(0.8, 0.8);
            mtx.translate(42, 42);
            cbm.draw(sh, mtx);
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(16777215, 1);
            g.drawCircle(0, 21, 8);
            g.endFill();
            mtx = new Matrix();
            mtx.scale(0.8, 0.8);
            mtx.translate(42, 42);
            cbm.draw(sh, mtx);
            fl = new DropShadowFilter(0, 90, 0, 1, 14, 14, 1, 3, false, false, false);
            cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
            this.alert_t = this.prepareTexture(cbm, 0);
            cbm = new BitmapData(10, 10, true, 0);
            sh = new Shape();
            g = sh.graphics;
            g.beginFill(16777215, 1);
            g.drawCircle(cbm.width / 2, cbm.height / 2, 3);
            g.endFill();
            cbm.draw(sh);
            this.myloc_t = this.prepareTexture(cbm, 0);
            cbm5 = new BitmapData(128, 52, true, 0);
            sh = new Shape();
            g = sh.graphics;
            j;
            mtx = new Matrix();
            mtx.createGradientBox(cbm5.width, cbm5.height, Math.PI / 2, 0, 0);
            g.beginGradientFill(GradientType.LINEAR, [5680257, 3699029], [1, 1], [0, 255], mtx);
            g.moveTo(j, 0);
            g.lineTo(cbm5.width - j, 0);
            k;
            while (k <= 32)
            {
                
                g.lineTo(cbm5.width - j + Math.cos(0.5 * Math.PI * k / 32 - Math.PI / 2) * j, j + Math.sin(0.5 * Math.PI * k / 32 - Math.PI / 2) * j);
                k = (k + 1);
            }
            g.lineTo(cbm5.width, cbm5.height - j);
            k;
            while (k <= 32)
            {
                
                g.lineTo(cbm5.width - j + Math.cos(0.5 * Math.PI * k / 32) * j, cbm5.height - j + Math.sin(0.5 * Math.PI * k / 32) * j);
                k = (k + 1);
            }
            g.lineTo(j, cbm5.height);
            k;
            while (k <= 32)
            {
                
                g.lineTo(j + Math.cos(0.5 * Math.PI * k / 32 + Math.PI / 2) * j, cbm5.height - j + Math.sin(0.5 * Math.PI * k / 32 + Math.PI / 2) * j);
                k = (k + 1);
            }
            g.lineTo(0, j);
            k;
            while (k <= 32)
            {
                
                g.lineTo(j + Math.cos(0.5 * Math.PI * k / 32 + Math.PI) * j, j + Math.sin(0.5 * Math.PI * k / 32 + Math.PI) * j);
                k = (k + 1);
            }
            g.endFill();
            cbm5.draw(sh);
            cbm = new BitmapData(j + 2, cbm5.height + 4, true, 0);
            mtx = new Matrix();
            mtx.translate(1, 2);
            cbm.draw(cbm5, mtx);
            this.btnleftup_t = this.prepareTexture(cbm, 0);
            this.btnleftup_t.inset = 1;
            cbm = new BitmapData(6, cbm5.height + 4, true, 0);
            mtx = new Matrix();
            mtx.translate(-(j + 7), 2);
            cbm.draw(cbm5, mtx);
            this.btnmidup_t = this.prepareTexture(cbm, 0);
            this.btnmidup_t.inset = 1;
            cbm = new BitmapData(170, 170, true, 0);
            sh = new Shape();
            g = sh.graphics;
            rad;
            m;
            g.beginFill(16777215);
            ang;
            j;
            q;
            k;
            while (k <= 200)
            {
                
                ang = Math.PI * 0.8 * k / 200;
                if (k == 0)
                {
                    g.moveTo(Math.cos(ang) * (rad - m / 2), Math.sin(ang) * (rad - m / 2));
                }
                n = rad + k / 200 * m / 2;
                if (k >= q)
                {
                    n = rad + 17 * Math.pow((200 - k) / (200 - q), 1);
                }
                g.lineTo(Math.cos(ang) * n, Math.sin(ang) * n);
                k = (k + 1);
            }
            k;
            while (k >= 0)
            {
                
                ang = Math.PI * 0.8 * k / 200;
                n = rad - k / 200 * m / 2;
                if (k >= q)
                {
                    n = rad - 17 * Math.pow((200 - k) / (200 - q), 1);
                }
                g.lineTo(Math.cos(ang) * n, Math.sin(ang) * n);
                k = (k - 1);
            }
            g.endFill();
            mtx = new Matrix();
            mtx.translate(cbm.width / 2, cbm.height / 2);
            cbm.draw(sh, mtx);
            mtx = new Matrix();
            mtx.rotate(Math.PI);
            mtx.translate(cbm.width, cbm.height);
            cbm.draw(cbm, mtx);
            fl = new DropShadowFilter(0, 90, 0, 1, 4, 4, 1, 3, false, false, false);
            cbm.applyFilter(cbm, cbm.rect, new Point(), fl);
            this.connect_spinner_t = this.prepareTexture(cbm, 0);
            this.chsz = 52;
            tf = new TextField();
            tft = new TextFormat("Arial", this.chsz, 16777215, false);
            tf.setTextFormat(tft);
            tf.defaultTextFormat = tft;
            tf.width = 4000;
            tf.height = 300;
            tf.multiline = false;
            tf.wordWrap = false;
            tf.embedFonts = true;
            achs;
            i;
            while (i <= 126)
            {
                
                achs = achs + String.fromCharCode(i);
                i = (i + 1);
            }
            tf.text = achs;
            k = tf.textHeight;
            this.chars_lh = k;
            tf.width = 400;
            fl = new DropShadowFilter(0, 90, 0, 1, 4, 4, 12, 3, false, false, false);
            i;
            while (i <= 126)
            {
                
                ch = String.fromCharCode(i);
                tf.text = "|" + ch + "|";
                j = tf.textWidth;
                tf.text = "||";
                j = j - tf.textWidth;
                this.bm = new BitmapData(Math.ceil(j + 12), Math.ceil(k + 12), true, 0);
                tf.text = ch;
                mtx = new Matrix();
                mtx.translate(6, 6);
                this.bm.draw(tf, mtx);
                this.cha = new Char();
                this.cha.bm = this.bm;
                this.cha.sz = this.chsz;
                this.cha.t = this.prepareTexture(this.bm, 0);
                if (i == 32)
                {
                    this.cha.w = this.bm.width - 11;
                }
                else
                {
                    this.cha.w = this.bm.width - 12;
                }
                this.chars[i] = this.cha;
                i = (i + 1);
            }
            this.finishTextures();
            cmode = this.getSo("control_mode");
            if (cmode == "" + Number(cmode))
            {
                cmode = Number(cmode);
                if (cmode >= 1 && cmode <= 3)
                {
                    this.control_mode = cmode;
                }
            }
            this.flipped_controls = this.getSo("flipped_controls") == "yes";
            this.sbg_ii = new Image(this.sbg_t.texture);
            this.settings_layer.addChild(this.sbg_ii);
            this.sfa_ii = new Image(this.sfa_t.texture);
            this.sfa_ii.pivotX = this.sfa_ii.width / 2;
            this.sfa_ii.pivotY = this.sfa_ii.height / 2;
            var _loc_2:* = 0.4;
            this.sfa_ii.scaleY = 0.4;
            this.sfa_ii.scaleX = _loc_2;
            this.sfa_ii.y = -50;
            this.sfa_ii.x = -180;
            if (this.control_mode == 2)
            {
                this.sfa_ii.alpha = 1;
            }
            else
            {
                this.sfa_ii.alpha = 0.3;
            }
            this.settings_layer.addChild(this.sfa_ii);
            this.sff_ii = new Image(this.sff_t.texture);
            this.sff_ii.pivotX = this.sff_ii.width / 2;
            this.sff_ii.pivotY = this.sff_ii.height / 2;
            var _loc_2:* = 0.4;
            this.sff_ii.scaleY = 0.4;
            this.sff_ii.scaleX = _loc_2;
            this.sff_ii.y = -50;
            this.sff_ii.x = 0;
            if (this.control_mode >= 2)
            {
                this.sff_ii.alpha = 0.3;
            }
            else
            {
                this.sff_ii.alpha = 1;
            }
            this.settings_layer.addChild(this.sff_ii);
            this.sfj_ii = new Image(this.sfj_t.texture);
            this.sfj_ii.pivotX = this.sfj_ii.width / 2;
            this.sfj_ii.pivotY = this.sfj_ii.height / 2;
            var _loc_2:* = 0.34;
            this.sfj_ii.scaleY = 0.34;
            this.sfj_ii.scaleX = _loc_2;
            this.sfj_ii.y = -50;
            this.sfj_ii.x = 180;
            if (this.control_mode == 3)
            {
                this.sfj_ii.alpha = 1;
            }
            else
            {
                this.sfj_ii.alpha = 0.3;
            }
            this.settings_layer.addChild(this.sfj_ii);
            var _loc_2:* = {};
            btn;
            this.sfabtn = _loc_2;
            btn.ii = this.sfa_ii;
            btn.layer = this.settings_layer;
            btn.layer.addChild(btn.ii);
            this.makeBtn(btn);
            btn.killed = function ()
            {
                if (this.layer)
                {
                    this.layer.removeChild(this.ii);
                    this.ii.dispose();
                    this.layer = null;
                }
                return;
            }// end function
            ;
            btn.clicked = function ()
            {
                if (!settings_shown)
                {
                    return;
                }
                if (hiding_settings)
                {
                    return;
                }
                control_mode = 2;
                sfa_ii.alpha = 1;
                sff_ii.alpha = 0.3;
                sfj_ii.alpha = 0.3;
                setSo("control_mode", "" + control_mode);
                return;
            }// end function
            ;
            btn.disable();
            var _loc_2:* = {};
            btn;
            this.sffbtn = _loc_2;
            btn.ii = this.sff_ii;
            btn.layer = this.settings_layer;
            btn.layer.addChild(btn.ii);
            this.makeBtn(btn);
            btn.killed = function ()
            {
                if (this.layer)
                {
                    this.layer.removeChild(this.ii);
                    this.ii.dispose();
                    this.layer = null;
                }
                return;
            }// end function
            ;
            btn.clicked = function ()
            {
                if (!settings_shown)
                {
                    return;
                }
                if (hiding_settings)
                {
                    return;
                }
                control_mode = 1;
                sfa_ii.alpha = 0.3;
                sff_ii.alpha = 1;
                sfj_ii.alpha = 0.3;
                setSo("control_mode", "" + control_mode);
                return;
            }// end function
            ;
            btn.disable();
            var _loc_2:* = {};
            btn;
            this.sfjbtn = _loc_2;
            btn.ii = this.sfj_ii;
            btn.layer = this.settings_layer;
            btn.layer.addChild(btn.ii);
            this.makeBtn(btn);
            btn.killed = function ()
            {
                if (this.layer)
                {
                    this.layer.removeChild(this.ii);
                    this.ii.dispose();
                    this.layer = null;
                }
                return;
            }// end function
            ;
            btn.clicked = function ()
            {
                if (!settings_shown)
                {
                    return;
                }
                if (hiding_settings)
                {
                    return;
                }
                control_mode = 3;
                sfa_ii.alpha = 0.3;
                sff_ii.alpha = 0.3;
                sfj_ii.alpha = 1;
                setSo("control_mode", "" + control_mode);
                return;
            }// end function
            ;
            btn.disable();
            this.arrow_ii = new Image(this.arrow_t.texture);
            this.arrow_ii.pivotX = 1;
            this.arrow_ii.pivotY = this.arrow_ii.height / 2;
            this.arrow_add_ii = new Image(this.arrow_t.texture);
            this.arrow_add_ii.blendMode = BlendMode.ADD;
            this.arrow_add_ii.pivotX = 1;
            this.arrow_add_ii.pivotY = this.arrow_add_ii.height / 2;
            this.btnleftup_ii = new Image(this.btnleftup_t.texture);
            this.btnleftup_ii.pivotX = this.btnleftup_ii.width - 2;
            this.btnleftup_ii.pivotY = this.btnleftup_ii.height / 2;
            this.btnmidup_ii = new Image(this.btnmidup_t.texture);
            this.btnmidup_ii.pivotY = this.btnmidup_ii.height / 2;
            i;
            while (i < this.chars.length)
            {
                
                this.cha = this.chars[i];
                if (this.cha)
                {
                    this.cha.ii = new Image(this.cha.t.texture);
                    this.cha.ii.pivotX = 6;
                    this.cha.ii.pivotY = 6;
                }
                i = (i + 1);
            }
            i;
            while (i < this.per_color_imgs.length)
            {
                
                this.pci = this.per_color_imgs[i];
                j;
                while (j < this.pci.textures.length)
                {
                    
                    ii = new Image(this.pci.textures[j].texture);
                    ii.pivotX = this.pci.fw2s[j];
                    ii.pivotY = this.pci.fh2s[j];
                    ii.blendMode = BlendMode.ADD;
                    this.pci.imgs.push(ii);
                    j = (j + 1);
                }
                j;
                while (j < this.pci.pr_textures.length)
                {
                    
                    ii = new Image(this.pci.pr_textures[j].texture);
                    ii.pivotX = this.pci.pr_fw2s[j];
                    ii.pivotY = this.pci.pr_fh2s[j];
                    ii.blendMode = BlendMode.ADD;
                    this.pci.pr_imgs.push(ii);
                    j = (j + 1);
                }
                i = (i + 1);
            }
            this.lbg_ii = new Image(this.lbg_t.texture);
            this.bgb_ii = new Image(this.bgb_t.texture);
            this.bgb_ii.pivotX = this.bgb_ii.width / 2;
            this.bgb_ii.pivotY = this.bgb_ii.height / 2;
            var _loc_2:* = 12;
            this.bgb_ii.scaleY = 12;
            this.bgb_ii.scaleX = _loc_2;
            this.bgb_ii.blendMode = BlendMode.ADD;
            i;
            while (i < 60)
            {
                
                o;
                o.xx = Math.random() * tw * 16;
                o.yy = Math.random() * th * 16;
                o.ang = 2 * Math.PI * Math.random();
                o.vang = 0.01 * (Math.random() - 0.5);
                o.vx = Math.random() * 16 - 8;
                o.vy = Math.random() * 16 - 8;
                rr;
                gg;
                bb;
                if (i % 3 == 0)
                {
                    rr;
                    gg;
                }
                else if (i % 3 == 1)
                {
                    gg;
                    bb;
                }
                else
                {
                    bb;
                    rr;
                }
                o.c = rr << 16 | gg << 8 | bb;
                this.bgbs.push(o);
                i = (i + 1);
            }
            this.border_ii = new Image(this.border_t.texture);
            this.border_ii.pivotY = this.border_ii.height / 2;
            this.at2lt = new Vector.<Number>(65536);
            yy;
            while (yy < 256)
            {
                
                xx;
                while (xx < 256)
                {
                    
                    this.at2lt[yy << 8 | xx] = Math.atan2(yy - 128, xx - 128);
                    xx = (xx + 1);
                }
                yy = (yy + 1);
            }
            this.dist16t = new Vector.<Number>(65536);
            yy;
            while (yy < 256)
            {
                
                xx;
                while (xx < 256)
                {
                    
                    this.dist16t[yy << 8 | xx] = Math.sqrt((Math.pow(xx + 0.5, 2) + Math.pow(yy + 0.5, 2)) / 256);
                    xx = (xx + 1);
                }
                yy = (yy + 1);
            }
            this.eye_ii = new Image(this.eye_t.texture);
            this.eye_ii.pivotX = this.eye_ii.width / 2;
            this.eye_ii.pivotY = this.eye_ii.height / 2;
            this.cdbulb_ii = new Image(this.cdbulb_t.texture);
            this.cdbulb_ii.pivotX = this.cdbulb_ii.width * 0.25;
            this.cdbulb_ii.pivotY = this.cdbulb_ii.height * 0.5;
            this.acbulb_ii = new Image(this.acbulb_t.texture);
            this.acbulb_ii.pivotX = this.acbulb_ii.width / 2;
            this.acbulb_ii.pivotY = this.acbulb_ii.height / 2;
            this.antenna_segment_ii = new Image(this.antenna_segment_t.texture);
            this.antenna_segment_ii.pivotX = 10.5;
            this.antenna_segment_ii.pivotY = this.antenna_segment_ii.height / 2;
            this.antenna_width = this.antenna_segment_ii.width - 21;
            this.ksmc_ii = new Image(this.ksmc_t.texture);
            this.ksmc_ii.pivotX = this.ksmc_ii.width / 2;
            this.ksmc_ii.pivotY = this.ksmc_ii.height / 2;
            i;
            while (i < this.rrs.length)
            {
                
                j;
                while (j < this.kmc_ts[i].length)
                {
                    
                    ii = new Image(this.kmc_ts[i][j].texture);
                    ii.pivotX = ii.width / 2;
                    ii.pivotY = ii.height / 2;
                    this.kmc_iis[i].push(ii);
                    j = (j + 1);
                }
                ii = new Image(this.kmc_add_ts[i].texture);
                ii.pivotX = ii.width / 2;
                ii.pivotY = ii.height / 2;
                ii.blendMode = BlendMode.ADD;
                this.kmc_add_iis.push(ii);
                i = (i + 1);
            }
            this.jsebi_ii = new Image(this.jsebi_t.texture);
            this.jsebi_ii.pivotX = this.jsebi_ii.width / 2;
            this.jsebi_ii.pivotY = this.jsebi_ii.height / 2;
            this.jsepi_ii = new Image(this.jsepi_t.texture);
            this.jsepi_ii.pivotX = this.jsepi_ii.width / 2;
            this.jsepi_ii.pivotY = this.jsepi_ii.height / 2;
            this.minimap_ii = new Image(this.minimap_t.texture);
            this.minimap_ii.alpha = 0.7;
            this.minimap_ii.visible = false;
            this.stats_layer.addChild(this.minimap_ii);
            this.myloc_ii = new Image(this.myloc_t.texture);
            this.myloc_ii.pivotX = this.myloc_ii.width / 2;
            this.myloc_ii.pivotY = this.myloc_ii.height / 2;
            this.myloc_ii.alpha = 0.5;
            var _loc_2:* = 31337357;
            this.myloc_ii.y = 31337357;
            this.myloc_ii.x = _loc_2;
            this.myloc_ii.visible = false;
            this.stats_layer.addChild(this.myloc_ii);
            this.highscore_batch = new QuadBatch();
            this.highscore_batch.touchable = false;
            this.stats_layer.addChild(this.highscore_batch);
            this.victor_batch = new QuadBatch();
            this.victor_batch.touchable = false;
            this.stats_layer.addChild(this.victor_batch);
            this.length_batch = new QuadBatch();
            this.length_batch.touchable = false;
            this.stats_layer.addChild(this.length_batch);
            this.boost_ii = new Image(this.boost_t.texture);
            this.boost_ii.pivotX = this.boost_ii.width / 2;
            this.boost_ii.pivotY = this.boost_ii.height / 2;
            var _loc_2:* = 0.4;
            this.boost_ii.scaleY = 0.4;
            this.boost_ii.scaleX = _loc_2;
            this.boost_ii.alpha = 0.3;
            this.stats_layer.addChild(this.boost_ii);
            this.joystick_bg_ii = new Image(this.joystick_bg_t.texture);
            this.joystick_bg_ii.pivotX = this.joystick_bg_ii.width / 2;
            this.joystick_bg_ii.pivotY = this.joystick_bg_ii.height / 2;
            var _loc_2:* = 0.7;
            this.joystick_bg_ii.scaleY = 0.7;
            this.joystick_bg_ii.scaleX = _loc_2;
            this.joystick_bg_ii.alpha = 0.35;
            this.stats_layer.addChild(this.joystick_bg_ii);
            this.joystick_ii = new Image(this.joystick_t.texture);
            this.joystick_ii.pivotX = this.joystick_ii.width / 2;
            this.joystick_ii.pivotY = this.joystick_ii.height / 2;
            var _loc_2:* = 0.375;
            this.joystick_ii.scaleY = 0.375;
            this.joystick_ii.scaleX = _loc_2;
            this.joystick_ii.alpha = 0.35;
            this.stats_layer.addChild(this.joystick_ii);
            this.flippa_ii = new Image(this.flippa_t.texture);
            this.flippa_ii.pivotX = this.flippa_ii.width / 2;
            this.flippa_ii.pivotY = this.flippa_ii.height / 2;
            var _loc_2:* = 0.4;
            this.flippa_ii.scaleY = 0.4;
            this.flippa_ii.scaleX = _loc_2;
            this.flippa_ii.alpha = 0.25;
            this.stats_layer.addChild(this.flippa_ii);
            this.login_layer.addChild(this.lbg_ii);
            this.login_layer.addChild(this.bgballs);
            this.logo_ii = new Image(this.logo_t.texture);
            this.logo_ii.pivotX = this.logo_ii.width * 0.5;
            this.logo_ii.pivotY = this.logo_ii.height;
            var _loc_2:* = 0.65;
            this.logo_ii.scaleY = 0.65;
            this.logo_ii.scaleX = _loc_2;
            this.logo_ii.y = -70;
            this.login_layer.addChild(this.logo_ii);
            this.final_text_batch = new QuadBatch();
            this.login_layer.addChild(this.final_text_batch);
            var _loc_2:* = {};
            btn;
            this.playbtn = _loc_2;
            btn.ii = new Image(this.playonline_t.texture);
            btn.ii.scaleX = 0.5;
            btn.ii.scaleY = 0.5;
            btn.layer = this.login_layer;
            btn.layer.addChild(btn.ii);
            this.makeBtn(btn);
            btn.clicked = function ()
            {
                stg.focus = null;
                if (settings_shown)
                {
                    return;
                }
                if (!playing)
                {
                    if (dead_mtm == -1)
                    {
                        if (!this.disabled)
                        {
                            playbtn.disable();
                            offlinebtn.disable();
                            skinbtn.disable();
                            if (extrabtn1 != null)
                            {
                                extrabtn1.disable();
                            }
                            settingsbtn.disable();
                            removeadsbtn.disable();
                            if (is_ios)
                            {
                                restorepurchasesbtn.disable();
                            }
                            sharebtn.disable();
                            var _loc_1:* = 0.6;
                            connect_spinner_ii.scaleY = 0.6;
                            connect_spinner_ii.scaleX = _loc_1;
                            connect_spinner_ii.visible = true;
                            trace("dead_mtm on click time = " + dead_mtm);
                            trace("connecting on click time = " + connecting);
                            trace("connected on click time = " + connected);
                            connect();
                        }
                    }
                }
                return;
            }// end function
            ;
            var _loc_2:* = {};
            btn;
            this.offlinebtn = _loc_2;
            btn.ii = new Image(this.playoffline_t.texture);
            btn.ii.scaleX = 0.5;
            btn.ii.scaleY = 0.5;
            btn.layer = this.login_layer;
            btn.layer.addChild(btn.ii);
            this.makeBtn(btn);
            btn.clicked = function ()
            {
                var _loc_1:* = undefined;
                var _loc_2:* = undefined;
                var _loc_3:* = undefined;
                var _loc_4:* = undefined;
                var _loc_5:* = undefined;
                var _loc_6:* = undefined;
                var _loc_7:* = undefined;
                var _loc_8:* = NaN;
                var _loc_9:* = undefined;
                var _loc_10:* = undefined;
                var _loc_11:* = undefined;
                var _loc_12:* = undefined;
                var _loc_13:* = undefined;
                var _loc_14:* = undefined;
                var _loc_15:* = null;
                stg.focus = null;
                if (settings_shown)
                {
                    return;
                }
                if (!playing)
                {
                    if (dead_mtm == -1)
                    {
                        if (!this.disabled)
                        {
                            playbtn.disable();
                            offlinebtn.disable();
                            skinbtn.disable();
                            if (extrabtn1 != null)
                            {
                                extrabtn1.disable();
                            }
                            settingsbtn.disable();
                            removeadsbtn.disable();
                            if (is_ios)
                            {
                                restorepurchasesbtn.disable();
                            }
                            sharebtn.disable();
                            var _loc_16:* = 0.6;
                            connect_spinner_ii.scaleY = 0.6;
                            connect_spinner_ii.scaleX = _loc_16;
                            connect_spinner_ii.visible = true;
                            trace("dead_mtm on click time = " + dead_mtm);
                            trace("connecting on click time = " + connecting);
                            trace("connected on click time = " + connected);
                            resetGame();
                            grd = 21600;
                            grd98 = grd * 0.98;
                            _loc_1 = 411;
                            sector_size = 450;
                            spangdv = 4.8;
                            nsp1 = 5.39;
                            nsp2 = 0.4;
                            nsp3 = 14;
                            mamu = 0.033;
                            mamu2 = 0.028;
                            cst = 0.43;
                            setMscps(_loc_1);
                            lb_fr = -1;
                            playing = true;
                            single_player = true;
                            joystick_ii.visible = control_mode == 3;
                            joystick_bg_ii.visible = control_mode == 3;
                            joystick_ii.x = jsx;
                            joystick_ii.y = jsy;
                            boost_ii.visible = control_mode >= 2;
                            flippa_ii.visible = control_mode >= 2;
                            rank = 500;
                            snake_count = 500 + Math.floor(Math.random() * 32 - 16);
                            _loc_2 = 1;
                            _loc_3 = 2 * Math.random() * Math.PI;
                            _loc_4 = 0;
                            _loc_5 = _loc_3;
                            _loc_6 = nsp1;
                            _loc_7 = 0;
                            _loc_8 = int(Math.random() * 9);
                            _loc_9 = getSo("snakercv");
                            if (_loc_9 == "" + Number(_loc_9))
                            {
                                _loc_8 = Number(_loc_9);
                            }
                            _loc_10 = "";
                            xx = grd;
                            yy = grd;
                            _loc_11 = 0;
                            _loc_12 = 0;
                            _loc_13 = false;
                            pid = 0;
                            _loc_14 = 2;
                            _loc_15 = new Vector.<SnakePoint>(_loc_14);
                            j2 = 0;
                            while (j2 < _loc_14)
                            {
                                
                                _loc_11 = xx;
                                _loc_12 = yy;
                                xx = xx - Math.cos(_loc_3) * msl;
                                yy = yy - Math.sin(_loc_3) * msl;
                                po = points_dp.get();
                                if (!po)
                                {
                                    po = new SnakePoint();
                                }
                                po.eiu = 0;
                                po.xx = xx;
                                po.yy = yy;
                                po.fx = 0;
                                po.fy = 0;
                                po.da = 0;
                                po.ebx = xx - _loc_11;
                                po.eby = yy - _loc_12;
                                po.pid = pid;
                                var _loc_17:* = pid + 1;
                                pid = _loc_17;
                                _loc_15[j2] = po;
                                var _loc_17:* = j2 + 1;
                                j2 = _loc_17;
                            }
                            sk = newSnake(_loc_2, xx, yy, _loc_8, _loc_3, _loc_15);
                            sk.cpid = pid;
                            if (snake == null)
                            {
                                view_xx = xx;
                                view_yy = yy;
                                lvx = view_xx;
                                lvy = view_yy;
                                snake = sk;
                                twang = _loc_3;
                                sk.nick = my_nick;
                            }
                            else
                            {
                                trace("wait what");
                            }
                            var _loc_16:* = _loc_5;
                            sk.wang = _loc_5;
                            sk.eang = _loc_16;
                            sk.sp = _loc_6;
                            sk.spang = sk.sp / spangdv;
                            if (sk.spang > 1)
                            {
                                sk.spang = 1;
                            }
                            sk.fam = _loc_7;
                            sk.sc = Math.min(6, 1 + (sk.sct - 2) / 106);
                            sk.sc13 = Math.pow(sk.sc, 1.3);
                            sk.lsz = 29 * sk.sc;
                            sk.scang = 0.13 + 0.87 * Math.pow((7 - sk.sc) / 6, 2);
                            sk.normal_speed = nsp1 + nsp2 * sk.sc;
                            sk.ssp = nsp1 + nsp2 * sk.sc;
                            sk.fsp = sk.ssp + 0.1;
                            sk.wsep = bsep * sk.sc;
                            mwsep = 4.5 / gsc;
                            if (sk.wsep < mwsep)
                            {
                                sk.wsep = mwsep;
                            }
                            sk.sep = sk.wsep;
                            snl(sk);
                            j = 0;
                            while (j < 100)
                            {
                                
                                _loc_8 = Math.floor(Math.random() * 9);
                                _loc_3 = Math.random() * pi2;
                                rad = 300 + Math.pow(Math.random(), 0.3) * 950;
                                xx = int(snake.xx + 1600 * (Math.random() - 0.5));
                                yy = int(snake.yy + 1600 * (Math.random() - 0.5));
                                d = Math.sqrt(Math.pow(xx - grd, 2) + Math.pow(yy - grd, 2));
                                if (d < grd98)
                                {
                                    rad = 2 + Math.pow(Math.random(), 2.5) * 14.5;
                                    fo = newFood(xx, yy, rad, false, _loc_8);
                                    sx = int(xx / sector_size);
                                    sy = int(yy / sector_size);
                                    fo.sx = sx;
                                    fo.sy = sy;
                                }
                                var _loc_17:* = j + 1;
                                j = _loc_17;
                            }
                            fake_me.n = my_nick;
                            fake_me.cv = _loc_8 % 9;
                            showGame();
                        }
                    }
                }
                return;
            }// end function
            ;
            var _loc_2:* = {};
            btn;
            this.skinbtn = _loc_2;
            btn.ii = new Image(this.changeskin_t.texture);
            btn.ii.scaleX = 0.5;
            btn.ii.scaleY = 0.5;
            btn.layer = this.login_layer;
            btn.layer.addChild(btn.ii);
            this.makeBtn(btn);
            btn.killed = function ()
            {
                if (this.layer)
                {
                    this.layer.removeChild(this.ii);
                    this.ii.dispose();
                    this.layer = null;
                }
                return;
            }// end function
            ;
            btn.clicked = function ()
            {
                var _loc_1:* = undefined;
                var _loc_2:* = undefined;
                var _loc_3:* = undefined;
                var _loc_4:* = undefined;
                var _loc_5:* = null;
                var _loc_6:* = undefined;
                var _loc_7:* = undefined;
                var _loc_8:* = undefined;
                var _loc_9:* = undefined;
                if (want_hide_victory != 0)
                {
                    return;
                }
                if (settings_shown)
                {
                    return;
                }
                if (!playing)
                {
                    if (dead_mtm == -1)
                    {
                        resetGame();
                        choosing_skin = true;
                        stats_layer.visible = false;
                        if (mscps == 0)
                        {
                            setMscps(300);
                        }
                        _loc_1 = new Vector.<SnakePoint>;
                        _loc_2 = 22;
                        while (_loc_2 >= 1)
                        {
                            
                            _loc_7 = grd / 2 - _loc_2 * 10;
                            _loc_8 = grd / 2;
                            _loc_9 = new SnakePoint();
                            _loc_9.xx = _loc_7;
                            _loc_9.yy = _loc_8;
                            _loc_9.fx = 0;
                            _loc_9.fy = 0;
                            _loc_9.eiu = 0;
                            _loc_9.da = 0;
                            _loc_9.ebx = 10;
                            _loc_9.eby = 0;
                            _loc_1.push(_loc_9);
                            _loc_2 = _loc_2 - 1;
                        }
                        _loc_3 = 0;
                        _loc_4 = getSo("snakercv");
                        if (_loc_4 == "" + Number(_loc_4))
                        {
                            _loc_3 = Number(_loc_4);
                        }
                        _loc_5 = newSnake(1, grd / 2, grd / 2, _loc_3, 0, _loc_1);
                        view_xx = grd / 2 - (22 / 2 - 0.5) * 10;
                        view_yy = grd / 2;
                        snake = _loc_5;
                        _loc_5.nick = "";
                        var _loc_10:* = _loc_5.ang;
                        _loc_5.wang = _loc_5.ang;
                        _loc_5.eang = _loc_10;
                        _loc_5.sp = 4.8;
                        _loc_5.spang = _loc_5.sp / spangdv;
                        if (_loc_5.spang > 1)
                        {
                            _loc_5.spang = 1;
                        }
                        _loc_5.sc = 1;
                        _loc_5.sc13 = 1;
                        _loc_5.scang = 1;
                        _loc_5.normal_speed = nsp1 + nsp2 * _loc_5.sc;
                        _loc_5.lsz = 29;
                        _loc_5.ssp = nsp1 + nsp2 * _loc_5.sc;
                        _loc_5.fsp = _loc_5.ssp + 0.1;
                        _loc_5.wsep = bsep * _loc_5.sc;
                        _loc_6 = 4.5 / gsc;
                        if (_loc_5.wsep < _loc_6)
                        {
                            _loc_5.wsep = _loc_6;
                        }
                        _loc_5.sep = _loc_5.wsep;
                        snl(_loc_5);
                        _loc_5.alive_amt = 1;
                        _loc_5.rex = 1.66;
                        ws = null;
                        connected = true;
                        playing = true;
                        joystick_ii.visible = false;
                        joystick_bg_ii.visible = false;
                        boost_ii.visible = false;
                        flippa_ii.visible = false;
                        showGame();
                        minimap_ii.visible = false;
                        myloc_ii.visible = false;
                    }
                }
                return;
            }// end function
            ;
            var _loc_2:* = {};
            btn;
            this.removeadsbtn = _loc_2;
            btn.ii = new Image(this.removeads_t.texture);
            btn.ii.scaleX = 0.5;
            btn.ii.scaleY = 0.5;
            btn.touch_padding = 8;
            btn.ii.alpha = 0;
            btn.layer = this.login_layer;
            btn.layer.addChild(btn.ii);
            this.makeBtn(btn);
            btn.killed = function ()
            {
                if (this.layer)
                {
                    this.layer.removeChild(this.ii);
                    this.ii.dispose();
                    this.layer = null;
                }
                return;
            }// end function
            ;
            btn.clicked = function ()
            {
                if (want_hide_victory != 0)
                {
                    return;
                }
                if (!iaps_enabled)
                {
                    return;
                }
                if (ads_removed)
                {
                    return;
                }
                if (!playing)
                {
                    if (dead_mtm == -1)
                    {
                        if (csrab)
                        {
                            purchase("RemoveAds");
                        }
                    }
                }
                return;
            }// end function
            ;
            var _loc_2:* = {};
            btn;
            this.restorepurchasesbtn = _loc_2;
            btn.ii = new Image(this.restorepurchases_t.texture);
            btn.ii.scaleX = 0.5;
            btn.ii.scaleY = 0.5;
            btn.touch_padding = 8;
            btn.ii.alpha = 0.75;
            btn.layer = this.login_layer;
            btn.layer.addChild(btn.ii);
            this.makeBtn(btn);
            btn.killed = function ()
            {
                if (this.layer)
                {
                    this.layer.removeChild(this.ii);
                    this.ii.dispose();
                    this.layer = null;
                }
                return;
            }// end function
            ;
            btn.clicked = function ()
            {
                restorePurchases();
                return;
            }// end function
            ;
            if (!this.is_ios)
            {
                btn.ii.visible = false;
                btn.disable();
            }
            var _loc_2:* = {};
            btn;
            this.settingsbtn = _loc_2;
            btn.ii = new Image(this.settings_t.texture);
            btn.ii.scaleX = 0.5;
            btn.ii.scaleY = 0.5;
            btn.touch_padding = 16;
            btn.layer = this.login_layer;
            btn.layer.addChild(btn.ii);
            this.makeBtn(btn);
            btn.killed = function ()
            {
                if (this.layer)
                {
                    this.layer.removeChild(this.ii);
                    this.ii.dispose();
                    this.layer = null;
                }
                return;
            }// end function
            ;
            btn.clicked = function ()
            {
                if (want_hide_victory != 0)
                {
                    return;
                }
                alert_ii.visible = false;
                alert_v = false;
                if (!playing)
                {
                    if (dead_mtm == -1)
                    {
                        if (!settings_shown)
                        {
                            settings_shown = true;
                            sffbtn.enable();
                            sfabtn.enable();
                            sfjbtn.enable();
                        }
                    }
                }
                return;
            }// end function
            ;
            var _loc_2:* = {};
            btn;
            this.settingsokbtn = _loc_2;
            this.makeTextBtn(btn, this.settings_layer, " OK ", 16777215);
            btn.clicked = function ()
            {
                if (settings_shown)
                {
                    if (!hiding_settings)
                    {
                        hiding_settings = true;
                        sffbtn.disable();
                        sfabtn.disable();
                        sfjbtn.disable();
                    }
                }
                return;
            }// end function
            ;
            btn.disable();
            var _loc_2:* = {};
            btn;
            this.prevskinbtn = _loc_2;
            btn.ii = new Image(this.next_t.texture);
            btn.ii.scaleX = -1;
            btn.layer = this.skin_layer;
            btn.layer.addChild(btn.ii);
            this.makeBtn(btn);
            btn.killed = function ()
            {
                if (this.layer)
                {
                    this.layer.removeChild(this.ii);
                    this.ii.dispose();
                    this.layer = null;
                }
                return;
            }// end function
            ;
            btn.clicked = function ()
            {
                var _loc_1:* = undefined;
                if (!choosing_skin)
                {
                    return;
                }
                if (playing)
                {
                    if (snake != null)
                    {
                        _loc_1 = snake.rcv;
                        _loc_1 = _loc_1 - 1;
                        if (_loc_1 < 0)
                        {
                            _loc_1 = max_skin_cv;
                        }
                        setSkin(snake, _loc_1);
                    }
                }
                return;
            }// end function
            ;
            btn.disable();
            var _loc_2:* = {};
            btn;
            this.nextskinbtn = _loc_2;
            btn.ii = new Image(this.next_t.texture);
            btn.layer = this.skin_layer;
            btn.layer.addChild(btn.ii);
            this.makeBtn(btn);
            btn.killed = function ()
            {
                if (this.layer)
                {
                    this.layer.removeChild(this.ii);
                    this.ii.dispose();
                    this.layer = null;
                }
                return;
            }// end function
            ;
            btn.clicked = function ()
            {
                var _loc_1:* = undefined;
                if (!choosing_skin)
                {
                    return;
                }
                if (playing)
                {
                    if (snake != null)
                    {
                        _loc_1 = snake.rcv;
                        _loc_1 = _loc_1 + 1;
                        if (_loc_1 > max_skin_cv)
                        {
                            _loc_1 = 0;
                        }
                        setSkin(snake, _loc_1);
                    }
                }
                return;
            }// end function
            ;
            btn.disable();
            var _loc_2:* = {};
            btn;
            this.skinokbtn = _loc_2;
            this.makeTextBtn(btn, this.skin_layer, " OK ", 16777215);
            btn.clicked = function ()
            {
                if (!choosing_skin)
                {
                    return;
                }
                if (ending_skin)
                {
                    return;
                }
                ending_skin = true;
                if (playing)
                {
                    setSo("snakercv", "" + snake.rcv);
                    connected = false;
                    playing = false;
                    dead_mtm = new Date().time - 5000;
                    if (dead_mtm == -1)
                    {
                        dead_mtm = -2;
                    }
                }
                if (jcfr == 1)
                {
                    connect_spinner_ii.visible = false;
                    login_layer.alpha = 0;
                    login_layer.visible = true;
                    nick_input_mc.alpha = 0;
                    nick_input_mc.visible = false;
                    victory_input_mc.alpha = 0;
                    victory_input_mc.visible = false;
                    nick_input_mc.visible = true;
                    _starling.nativeOverlay.addChild(nick_input_mc);
                    playbtn.ii.visible = true;
                    offlinebtn.ii.visible = true;
                    skinbtn.ii.visible = true;
                    if (extrabtn1 != null)
                    {
                        extrabtn1.ii.visible = true;
                    }
                    settingsbtn.ii.visible = true;
                    removeadsbtn.ii.visible = true;
                    if (is_ios)
                    {
                        restorepurchasesbtn.ii.visible = true;
                    }
                    savemsgbtn.holder.visible = false;
                    playbtn.enable();
                    offlinebtn.enable();
                    skinbtn.enable();
                    if (extrabtn1 != null)
                    {
                        extrabtn1.enable();
                    }
                    settingsbtn.enable();
                    removeadsbtn.enable();
                    if (is_ios)
                    {
                        restorepurchasesbtn.enable();
                    }
                    sharebtn.enable();
                }
                return;
            }// end function
            ;
            btn.disable();
            var _loc_2:* = {};
            btn;
            this.sharebtn = _loc_2;
            this.makeTextBtn(btn, this.login_layer, "Share Score!", 16777215, 18, 8476332, 5585009, 44, 27, -0.5);
            btn.holder.y = 205;
            btn.holder.visible = false;
            btn.clicked = function ()
            {
                var _loc_1:* = undefined;
                var _loc_2:* = undefined;
                if (!playing)
                {
                    if (!this.disabled)
                    {
                        if (has_generic_share)
                        {
                            _loc_1 = "I just played slither.io";
                            _loc_2 = "I just played slither.io and got a length of " + final_score + "! Can you beat that? http://slither.io";
                            share(_loc_1, _loc_2);
                        }
                    }
                }
                return;
            }// end function
            ;
            btn.disable();
            var _loc_2:* = {};
            btn;
            this.savemsgbtn = _loc_2;
            this.makeTextBtn(btn, this.login_layer, "Save Message", 16777215, 21, 7774688, 4744593);
            btn.holder.y = 150;
            btn.holder.visible = false;
            btn.clicked = function ()
            {
                var _loc_1:* = undefined;
                var _loc_2:* = null;
                var _loc_3:* = undefined;
                if (!this.disabled)
                {
                    this.disable();
                    _loc_1 = victory_tf.text;
                    if (_loc_1.length > 140)
                    {
                        _loc_1 = _loc_1.substr(0, 140);
                    }
                    _loc_2 = new ByteArray();
                    if (protocol_version >= 5)
                    {
                        _loc_2.length = 2 + _loc_1.length;
                        _loc_2[0] = 255;
                        _loc_2[1] = 118;
                        _loc_3 = 0;
                        while (_loc_3 < _loc_1.length)
                        {
                            
                            _loc_2[_loc_3 + 2] = _loc_1.charCodeAt(_loc_3);
                            _loc_3 = _loc_3 + 1;
                        }
                    }
                    else
                    {
                        _loc_2.length = 1 + _loc_1.length;
                        _loc_2[0] = 118;
                        _loc_3 = 0;
                        while (_loc_3 < _loc_1.length)
                        {
                            
                            _loc_2[(_loc_3 + 1)] = _loc_1.charCodeAt(_loc_3);
                            _loc_3 = _loc_3 + 1;
                        }
                    }
                    if (ws != null)
                    {
                        ws.sendBytes(_loc_2);
                    }
                }
                return;
            }// end function
            ;
            btn.disable();
            this.connect_spinner_ii = new Image(this.connect_spinner_t.texture);
            this.connect_spinner_ii.pivotX = this.connect_spinner_ii.width / 2;
            this.connect_spinner_ii.pivotY = this.connect_spinner_ii.height / 2;
            this.connect_spinner_ii.y = 66;
            this.connect_spinner_ii.color = 12288255;
            var _loc_2:* = 0.75;
            this.connect_spinner_ii.scaleY = 0.75;
            this.connect_spinner_ii.scaleX = _loc_2;
            this.connect_spinner_ii.visible = false;
            this.login_layer.addChild(this.connect_spinner_ii);
            this.alert_ii = new Image(this.alert_t.texture);
            this.alert_ii.pivotX = this.alert_ii.width / 2;
            this.alert_ii.pivotY = this.alert_ii.height / 2;
            var _loc_2:* = 0.35;
            this.alert_ii.scaleY = 0.35;
            this.alert_ii.scaleX = _loc_2;
            this.login_layer.addChild(this.alert_ii);
            this.alert_v = true;
            if (this.getSo("stgalert") == "0")
            {
                this.alert_ii.visible = false;
                this.alert_v = false;
            }
            this.setSo("stgalert", "0");
            this._starling.nativeOverlay.addChild(this.nick_input_mc);
            this.resize();
            this.starfield.addEventListener("enterFrame", this.oef);
            this.built_game = true;
            this.resize();
            return;
        }// end function

        public function endSinglePlayer()
        {
            var _loc_1:* = undefined;
            var _loc_2:* = undefined;
            var _loc_3:* = 0.5;
            this.logo_ii.scaleY = 0.5;
            this.logo_ii.scaleX = _loc_3;
            this.logo_ii.y = -120;
            this.final_text_batch.reset();
            this.final_score = Math.floor((this.fpsls[this.snake.sct] + this.snake.fam / this.fmlts[this.snake.sct] - 1) * 15 - 5) / 1;
            this.drawText("Your final length was " + this.final_score + "!", this.final_text_batch, 0, -111, 18, 16777215, 1, 1);
            _loc_1 = "That is your best score so far!";
            _loc_2 = this.getSo("best_score");
            trace("best_score: \"" + _loc_2 + "\"");
            if (_loc_2 == "" + Number(_loc_2))
            {
                _loc_2 = Number(_loc_2);
                if (this.final_score > _loc_2)
                {
                    this.setSo("best_score", "" + this.final_score);
                }
                else
                {
                    _loc_1 = "Your best length ever was " + _loc_2;
                }
            }
            else
            {
                this.setSo("best_score", "" + this.final_score);
            }
            this.drawText(_loc_1, this.final_text_batch, 0, -84, 13, 16777215, 0.5, 1);
            this.dead_mtm = new Date().time;
            this.want_ad = true;
            this.connect_spinner_ii.visible = false;
            this.login_layer.alpha = 0;
            this.login_layer.visible = true;
            this.nick_input_mc.alpha = 0;
            this.nick_input_mc.visible = false;
            this.victory_input_mc.alpha = 0;
            this.victory_input_mc.visible = false;
            this.nick_input_mc.visible = true;
            this._starling.nativeOverlay.addChild(this.nick_input_mc);
            this.playbtn.ii.visible = true;
            this.offlinebtn.ii.visible = true;
            this.skinbtn.ii.visible = true;
            if (this.extrabtn1 != null)
            {
                this.extrabtn1.ii.visible = true;
            }
            this.settingsbtn.ii.visible = true;
            this.removeadsbtn.ii.visible = true;
            if (this.is_ios)
            {
                this.restorepurchasesbtn.ii.visible = true;
            }
            if (this.has_generic_share)
            {
                this.sharebtn.holder.visible = true;
            }
            this.savemsgbtn.holder.visible = false;
            this.playbtn.enable();
            this.offlinebtn.enable();
            this.skinbtn.enable();
            if (this.extrabtn1 != null)
            {
                this.extrabtn1.enable();
            }
            this.settingsbtn.enable();
            this.removeadsbtn.enable();
            if (this.is_ios)
            {
                this.restorepurchasesbtn.enable();
            }
            this.sharebtn.enable();
            return;
        }// end function

        public function resetGame()
        {
            if (this.ws)
            {
                this.ws.close();
                this.ws = null;
            }
            this.want_close_socket = false;
            this.moving_food_batch.reset();
            this.has_moving_food = false;
            this.j = this.food_batches.length - 1;
            while (this.j >= 0)
            {
                
                this.food_batches[this.j].batch.reset();
                this.food_batches[this.j].count = 0;
                this.food_batches[this.j].used = false;
                this.food_batches[this.j].shown = false;
                this.food_batches[this.j].batch.visible = false;
                var _loc_1:* = this;
                var _loc_2:* = this.j - 1;
                _loc_1.j = _loc_2;
            }
            this.snake_batch.reset();
            this.snake_add_batch.reset();
            this.highscore_batch.reset();
            this.length_batch.reset();
            this.boosting = false;
            this.boost_a = 0;
            this.control_touch_down = false;
            this.double_tap_accel = false;
            this.snake = null;
            this.snakes = new Vector.<Snake>;
            this.foods = new Vector.<Food>;
            this.foods_cm1 = -1;
            this.preys = new Vector.<Prey>;
            this.preys_cm1 = -1;
            this.sectors = [];
            this.os = {};
            this.rank = 0;
            this.snake_count = 0;
            this.connected = false;
            this.wfpr = false;
            this.lagging = false;
            this.playing = false;
            this.single_player = false;
            this.snake_wmd = false;
            this.snake_md = false;
            this.fingers = [];
            this.finger_count = 0;
            this.fing = null;
            this.cur_finger = null;
            this.j = this.vfc - 1;
            while (this.j >= 0)
            {
                
                this.fvxs[this.j] = 0;
                this.fvys[this.j] = 0;
                var _loc_1:* = this;
                var _loc_2:* = this.j - 1;
                _loc_1.j = _loc_2;
            }
            this.fvtg = 0;
            this.fvx = 0;
            this.fvy = 0;
            this.lag_mult = 1;
            this.cptm = 0;
            this.gsc = 1.01;
            this.sgsc = 0.7;
            return;
        }// end function

        public function connect()
        {
            var i:*;
            var cluo:*;
            var bcptm:*;
            var bcluo:*;
            var k:Number;
            var m:Number;
            var v:Number;
            var o:*;
            var fbso:*;
            var use_test_server:*;
            var ptm:*;
            var smptm:*;
            var j:*;
            if (this.sos.length == 0)
            {
                if (!this.waiting_for_sos)
                {
                    this.waiting_for_sos = true;
                    this.sos_ready_after_mtm = -1;
                }
                return;
            }
            this.waiting_for_sos = false;
            this.sos_ready_after_mtm = -1;
            this.resetGame();
            this.connecting = true;
            this.start_connect_mtm = new Date().time;
            if (this.ws != null)
            {
                this.ws.close();
                this.ws = null;
            }
            this.ws = new Mode4Socket();
            this.ws.receive = function (param1:ByteArray)
            {
                var _loc_2:* = undefined;
                var _loc_3:* = undefined;
                var _loc_4:* = undefined;
                var _loc_5:* = 0;
                var _loc_6:* = 0;
                var _loc_7:* = 0;
                var _loc_8:* = 0;
                var _loc_9:* = undefined;
                var _loc_10:* = undefined;
                var _loc_11:* = undefined;
                var _loc_12:* = null;
                var _loc_13:* = 0;
                var _loc_14:* = undefined;
                var _loc_15:* = undefined;
                var _loc_16:* = null;
                var _loc_17:* = undefined;
                var _loc_18:* = null;
                var _loc_19:* = NaN;
                var _loc_20:* = NaN;
                var _loc_21:* = undefined;
                var _loc_22:* = undefined;
                var _loc_23:* = undefined;
                var _loc_24:* = undefined;
                var _loc_25:* = undefined;
                var _loc_26:* = undefined;
                var _loc_27:* = undefined;
                var _loc_28:* = undefined;
                var _loc_29:* = undefined;
                var _loc_30:* = undefined;
                var _loc_31:* = undefined;
                var _loc_32:* = undefined;
                var _loc_33:* = undefined;
                var _loc_34:* = undefined;
                var _loc_35:* = undefined;
                var _loc_36:* = undefined;
                var _loc_37:* = undefined;
                var _loc_38:* = undefined;
                var _loc_39:* = NaN;
                var _loc_40:* = NaN;
                var _loc_41:* = undefined;
                var _loc_42:* = undefined;
                var _loc_43:* = undefined;
                var _loc_44:* = undefined;
                var _loc_45:* = undefined;
                var _loc_46:* = undefined;
                var _loc_47:* = undefined;
                var _loc_48:* = undefined;
                var _loc_49:* = undefined;
                var _loc_50:* = undefined;
                var _loc_51:* = null;
                var _loc_52:* = undefined;
                var _loc_53:* = undefined;
                var _loc_54:* = undefined;
                var _loc_55:* = 0;
                var _loc_56:* = 0;
                var _loc_57:* = false;
                if (param1.length >= 2)
                {
                    lptm = cptm;
                    cptm = new Date().time;
                    _loc_2 = param1[0] << 8 | param1[1];
                    _loc_3 = cptm - lptm;
                    if (lptm == 0)
                    {
                        _loc_3 = 0;
                    }
                    etm = etm + Math.max(-90, Math.min(90, _loc_3 - _loc_2));
                    _loc_4 = String.fromCharCode(param1[2]);
                    _loc_5 = 3;
                    _loc_6 = param1.length;
                    _loc_7 = param1.length - 2;
                    _loc_8 = param1.length - 3;
                    if (_loc_4 == "a")
                    {
                        connecting = false;
                        connected = true;
                        playing = true;
                        joystick_ii.visible = control_mode == 3;
                        joystick_bg_ii.visible = control_mode == 3;
                        joystick_ii.x = jsx;
                        joystick_ii.y = jsy;
                        boost_ii.visible = control_mode >= 2;
                        flippa_ii.visible = control_mode >= 2;
                        grd = param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2];
                        grd98 = grd * 0.98;
                        _loc_5 = _loc_5 + 3;
                        _loc_9 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        sector_size = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        _loc_5 = _loc_5 + 2;
                        spangdv = param1[_loc_5] / 10;
                        _loc_5++;
                        nsp1 = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 100;
                        _loc_5 = _loc_5 + 2;
                        nsp2 = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 100;
                        _loc_5 = _loc_5 + 2;
                        nsp3 = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 100;
                        _loc_5 = _loc_5 + 2;
                        mamu = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 1000;
                        _loc_5 = _loc_5 + 2;
                        mamu2 = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 1000;
                        _loc_5 = _loc_5 + 2;
                        cst = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 1000;
                        _loc_5 = _loc_5 + 2;
                        if (_loc_5 < _loc_6)
                        {
                            protocol_version = param1[_loc_5];
                            trace("protocol_version = " + protocol_version);
                            if (protocol_version >= 7)
                            {
                                ws.hbc = 2;
                            }
                            _loc_5++;
                        }
                        trace("cst = " + cst);
                        trace("game radius = " + grd);
                        setMscps(_loc_9);
                        lb_fr = -1;
                    }
                    else if (_loc_4 == "e" || _loc_4 == "E" || _loc_4 == "3" || _loc_4 == "4" || _loc_4 == "5")
                    {
                        _loc_10 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        _loc_43 = -1;
                        _loc_42 = -1;
                        _loc_44 = -1;
                        _loc_45 = -1;
                        if (protocol_version >= 6)
                        {
                            if (_loc_7 == 6)
                            {
                                if (_loc_4 == "e")
                                {
                                    _loc_43 = 1;
                                }
                                else
                                {
                                    _loc_43 = 2;
                                }
                                _loc_42 = param1[_loc_5] * 2 * Math.PI / 256;
                                _loc_5++;
                                _loc_44 = param1[_loc_5] * 2 * Math.PI / 256;
                                _loc_5++;
                                _loc_45 = param1[_loc_5] / 18;
                                _loc_5++;
                            }
                            else if (_loc_7 == 5)
                            {
                                if (_loc_4 == "e")
                                {
                                    _loc_42 = param1[_loc_5] * 2 * Math.PI / 256;
                                    _loc_5++;
                                    _loc_45 = param1[_loc_5] / 18;
                                    _loc_5++;
                                }
                                else if (_loc_4 == "E")
                                {
                                    _loc_43 = 1;
                                    _loc_44 = param1[_loc_5] * 2 * Math.PI / 256;
                                    _loc_5++;
                                    _loc_45 = param1[_loc_5] / 18;
                                    _loc_5++;
                                }
                                else if (_loc_4 == "4")
                                {
                                    _loc_43 = 2;
                                    _loc_44 = param1[_loc_5] * 2 * Math.PI / 256;
                                    _loc_5++;
                                    _loc_45 = param1[_loc_5] / 18;
                                    _loc_5++;
                                }
                                else if (_loc_4 == "3")
                                {
                                    _loc_43 = 1;
                                    _loc_42 = param1[_loc_5] * 2 * Math.PI / 256;
                                    _loc_5++;
                                    _loc_44 = param1[_loc_5] * 2 * Math.PI / 256;
                                    _loc_5++;
                                }
                                else if (_loc_4 == "5")
                                {
                                    _loc_43 = 2;
                                    _loc_42 = param1[_loc_5] * 2 * Math.PI / 256;
                                    _loc_5++;
                                    _loc_44 = param1[_loc_5] * 2 * Math.PI / 256;
                                    _loc_5++;
                                }
                            }
                            else if (_loc_7 == 4)
                            {
                                if (_loc_4 == "e")
                                {
                                    _loc_42 = param1[_loc_5] * 2 * Math.PI / 256;
                                    _loc_5++;
                                }
                                else if (_loc_4 == "E")
                                {
                                    _loc_43 = 1;
                                    _loc_44 = param1[_loc_5] * 2 * Math.PI / 256;
                                    _loc_5++;
                                }
                                else if (_loc_4 == "4")
                                {
                                    _loc_43 = 2;
                                    _loc_44 = param1[_loc_5] * 2 * Math.PI / 256;
                                    _loc_5++;
                                }
                                else if (_loc_4 == "3")
                                {
                                    _loc_45 = param1[_loc_5] / 18;
                                    _loc_5++;
                                }
                            }
                        }
                        else if (protocol_version >= 3)
                        {
                            if (_loc_4 != "3")
                            {
                                if (_loc_7 == 8 || _loc_7 == 7 || _loc_7 == 6 && _loc_4 != "3" || _loc_7 == 5 && _loc_4 != "3")
                                {
                                    if (_loc_4 == "e")
                                    {
                                        _loc_43 = 1;
                                    }
                                    else
                                    {
                                        _loc_43 = 2;
                                    }
                                }
                            }
                            if (_loc_7 == 8 || _loc_7 == 7 || _loc_7 == 5 && _loc_4 == "3" || _loc_7 == 6 && _loc_4 == "3")
                            {
                                _loc_42 = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) * 2 * Math.PI / 65535;
                                _loc_5 = _loc_5 + 2;
                            }
                            if (_loc_7 == 8 || _loc_7 == 7 || _loc_7 == 5 && _loc_4 != "3" || _loc_7 == 6 && _loc_4 != "3")
                            {
                                _loc_44 = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) * 2 * Math.PI / 65535;
                                _loc_5 = _loc_5 + 2;
                            }
                            if (_loc_7 == 8 || _loc_7 == 6 || _loc_7 == 4)
                            {
                                _loc_45 = param1[_loc_5] / 18;
                                _loc_5++;
                            }
                        }
                        else
                        {
                            if (_loc_8 == 11 || _loc_8 == 8 || _loc_8 == 9 || _loc_8 == 6)
                            {
                                _loc_43 = param1[_loc_5] - 48;
                                _loc_5++;
                            }
                            if (_loc_8 == 11 || _loc_8 == 7 || _loc_8 == 9 || _loc_8 == 5)
                            {
                                _loc_42 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                                _loc_5 = _loc_5 + 3;
                            }
                            if (_loc_8 == 11 || _loc_8 == 8 || _loc_8 == 9 || _loc_8 == 6)
                            {
                                _loc_44 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                                _loc_5 = _loc_5 + 3;
                            }
                            if (_loc_8 == 11 || _loc_8 == 7 || _loc_8 == 8 || _loc_8 == 4)
                            {
                                _loc_45 = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 1000;
                                _loc_5 = _loc_5 + 2;
                            }
                        }
                        sk = os["s" + _loc_10];
                        if (sk)
                        {
                            if (_loc_43 != -1)
                            {
                                sk.dir = _loc_43;
                            }
                            if (_loc_42 != -1)
                            {
                                if (sk.iiv)
                                {
                                    da = (_loc_42 - sk.ang) % pi2;
                                    if (da < 0)
                                    {
                                        da = da + pi2;
                                    }
                                    if (da > Math.PI)
                                    {
                                        da = da - pi2;
                                    }
                                    ki = sk.fapos;
                                    _loc_13 = 0;
                                    while (_loc_13 < afc)
                                    {
                                        
                                        sk.fas[ki] = sk.fas[ki] - da * afas[_loc_13];
                                        var _loc_59:* = ki + 1;
                                        ki = _loc_59;
                                        if (ki >= afc)
                                        {
                                            ki = 0;
                                        }
                                        _loc_13++;
                                    }
                                    sk.fatg = afc;
                                }
                                sk.ang = _loc_42;
                            }
                            if (_loc_44 != -1)
                            {
                                sk.wang = _loc_44;
                                if (sk != snake)
                                {
                                    sk.eang = _loc_44;
                                }
                            }
                            if (_loc_45 != -1)
                            {
                                sk.sp = _loc_45;
                                sk.spang = sk.sp / spangdv;
                                if (sk.spang > 1)
                                {
                                    sk.spang = 1;
                                }
                            }
                        }
                    }
                    else if (_loc_4 == "h")
                    {
                        _loc_10 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        _loc_11 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 16777215;
                        _loc_5 = _loc_5 + 3;
                        _loc_12 = os["s" + _loc_10];
                        if (_loc_12)
                        {
                            _loc_12.fam = _loc_11;
                            snl(_loc_12);
                        }
                    }
                    else if (_loc_4 == "r")
                    {
                        _loc_10 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        _loc_12 = os["s" + _loc_10];
                        if (_loc_12)
                        {
                            if (_loc_8 >= 4)
                            {
                                _loc_12.fam = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 16777215;
                                _loc_5 = _loc_5 + 3;
                            }
                            _loc_13 = 0;
                            while (_loc_13 < _loc_12.pts.length)
                            {
                                
                                if (!_loc_12.pts[_loc_13].dying)
                                {
                                    _loc_12.pts[_loc_13].dying = true;
                                    var _loc_58:* = _loc_12;
                                    var _loc_59:* = _loc_12.sct - 1;
                                    _loc_58.sct = _loc_59;
                                    _loc_12.sc = Math.min(6, 1 + (_loc_12.sct - 2) / 106);
                                    _loc_12.sc13 = Math.pow(_loc_12.sc, 1.3);
                                    _loc_12.lsz = 29 * _loc_12.sc;
                                    _loc_12.scang = 0.13 + 0.87 * Math.pow((7 - _loc_12.sc) / 6, 2);
                                    _loc_12.normal_speed = nsp1 + nsp2 * _loc_12.sc;
                                    _loc_12.ssp = nsp1 + nsp2 * _loc_12.sc;
                                    _loc_12.fsp = _loc_12.ssp + 0.1;
                                    _loc_12.wsep = bsep * _loc_12.sc;
                                    mwsep = 4.5 / gsc;
                                    if (_loc_12.wsep < mwsep)
                                    {
                                        _loc_12.wsep = mwsep;
                                    }
                                    break;
                                }
                                _loc_13++;
                            }
                            snl(_loc_12);
                        }
                    }
                    else if (_loc_4 == "g" || _loc_4 == "n" || _loc_4 == "G" || _loc_4 == "N")
                    {
                        if (!playing)
                        {
                            return;
                        }
                        _loc_14 = _loc_4 == "n" || _loc_4 == "N";
                        _loc_10 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        _loc_12 = os["s" + _loc_10];
                        if (_loc_12)
                        {
                            if (_loc_14)
                            {
                                var _loc_58:* = _loc_12;
                                var _loc_59:* = _loc_12.sct + 1;
                                _loc_58.sct = _loc_59;
                            }
                            else
                            {
                                _loc_13 = 0;
                                while (_loc_13 < _loc_12.pts.length)
                                {
                                    
                                    if (!_loc_12.pts[_loc_13].dying)
                                    {
                                        _loc_12.pts[_loc_13].dying = true;
                                        break;
                                    }
                                    _loc_13++;
                                }
                            }
                            po = _loc_12.pts[(_loc_12.pts.length - 1)];
                            lpo = po;
                            _loc_15 = false;
                            if (protocol_version >= 3)
                            {
                                if (_loc_4 == "g" || _loc_4 == "n")
                                {
                                    _loc_23 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                                    _loc_5 = _loc_5 + 2;
                                    _loc_24 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                                    _loc_5 = _loc_5 + 2;
                                }
                                else
                                {
                                    _loc_23 = lpo.xx + param1[_loc_5] - 128;
                                    _loc_5++;
                                    _loc_24 = lpo.yy + param1[_loc_5] - 128;
                                    _loc_5++;
                                }
                            }
                            else
                            {
                                _loc_23 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 5;
                                _loc_5 = _loc_5 + 3;
                                _loc_24 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 5;
                                _loc_5 = _loc_5 + 3;
                            }
                            if (_loc_14)
                            {
                                _loc_12.fam = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 16777215;
                                _loc_5 = _loc_5 + 3;
                            }
                            po = points_dp.get();
                            if (!po)
                            {
                                po = new SnakePoint();
                            }
                            po.eiu = 0;
                            po.xx = _loc_23;
                            po.yy = _loc_24;
                            po.fx = 0;
                            po.fy = 0;
                            po.da = 0;
                            po.ebx = po.xx - lpo.xx;
                            po.eby = po.yy - lpo.yy;
                            lpo = po;
                            po.pid = _loc_12.cpid;
                            var _loc_58:* = _loc_12;
                            var _loc_59:* = _loc_12.cpid + 1;
                            _loc_58.cpid = _loc_59;
                            _loc_12.pts.push(po);
                            _loc_15 = true;
                            if (_loc_12.iiv)
                            {
                                _loc_19 = _loc_12.xx + _loc_12.fx - po.xx;
                                _loc_20 = _loc_12.yy + _loc_12.fy - po.yy;
                                po.fx = po.fx + _loc_19;
                                po.fy = po.fy + _loc_20;
                                po.exs[po.eiu] = _loc_19;
                                po.eys[po.eiu] = _loc_20;
                                po.efs[po.eiu] = 0;
                                po.ems[po.eiu] = 1;
                                var _loc_58:* = po;
                                var _loc_59:* = _loc_58.eiu + 1;
                                _loc_58.eiu = _loc_59;
                            }
                            _loc_21 = _loc_12.pts.length - 3;
                            if (_loc_21 >= 1)
                            {
                                _loc_18 = _loc_12.pts[_loc_21];
                                n = 0;
                                _loc_17 = 0;
                                _loc_13 = _loc_21 - 1;
                                while (_loc_13 >= 0)
                                {
                                    
                                    _loc_16 = _loc_12.pts[_loc_13];
                                    var _loc_59:* = n + 1;
                                    n = _loc_59;
                                    _loc_19 = _loc_16.xx;
                                    _loc_20 = _loc_16.yy;
                                    if (n <= 4)
                                    {
                                        _loc_17 = cst * n / 4;
                                    }
                                    _loc_16.xx = _loc_16.xx + (_loc_18.xx - _loc_16.xx) * _loc_17;
                                    _loc_16.yy = _loc_16.yy + (_loc_18.yy - _loc_16.yy) * _loc_17;
                                    if (_loc_12.iiv)
                                    {
                                        _loc_19 = _loc_19 - _loc_16.xx;
                                        _loc_20 = _loc_20 - _loc_16.yy;
                                        _loc_16.fx = _loc_16.fx + _loc_19;
                                        _loc_16.fy = _loc_16.fy + _loc_20;
                                        _loc_16.exs[_loc_16.eiu] = _loc_19;
                                        _loc_16.eys[_loc_16.eiu] = _loc_20;
                                        _loc_16.efs[_loc_16.eiu] = 0;
                                        _loc_16.ems[_loc_16.eiu] = 2;
                                        var _loc_58:* = _loc_16;
                                        var _loc_59:* = _loc_16.eiu + 1;
                                        _loc_58.eiu = _loc_59;
                                    }
                                    _loc_18 = _loc_16;
                                    _loc_13 = _loc_13 - 1;
                                }
                            }
                            _loc_12.sc = Math.min(6, 1 + (_loc_12.sct - 2) / 106);
                            _loc_12.sc13 = Math.pow(_loc_12.sc, 1.3);
                            _loc_12.lsz = 29 * _loc_12.sc;
                            _loc_12.scang = 0.13 + 0.87 * Math.pow((7 - _loc_12.sc) / 6, 2);
                            _loc_12.normal_speed = nsp1 + nsp2 * _loc_12.sc;
                            _loc_12.ssp = nsp1 + nsp2 * _loc_12.sc;
                            _loc_12.fsp = _loc_12.ssp + 0.1;
                            _loc_12.wsep = bsep * _loc_12.sc;
                            mwsep = 4.5 / gsc;
                            if (_loc_12.wsep < mwsep)
                            {
                                _loc_12.wsep = mwsep;
                            }
                            if (_loc_14)
                            {
                                snl(_loc_12);
                            }
                            _loc_12.lnp = po;
                            if (_loc_12 == snake)
                            {
                                ovxx = snake.xx + snake.fx;
                                ovyy = snake.yy + snake.fy;
                            }
                            csp = _loc_12.sp * (etm / 8) / 4;
                            csp = csp * lag_mult;
                            ochl = _loc_12.chl - 1;
                            _loc_12.chl = csp / _loc_12.msl;
                            ox = _loc_12.xx;
                            oy = _loc_12.yy;
                            _loc_12.xx = _loc_23;
                            _loc_12.yy = _loc_24;
                            _loc_12.xx = _loc_12.xx + Math.cos(_loc_12.ang) * csp;
                            _loc_12.yy = _loc_12.yy + Math.sin(_loc_12.ang) * csp;
                            if (_loc_12.iiv)
                            {
                                _loc_19 = _loc_12.xx - ox;
                                _loc_20 = _loc_12.yy - oy;
                                _loc_22 = _loc_12.chl - ochl;
                                _loc_21 = _loc_12.fpos;
                                _loc_13 = 0;
                                while (_loc_13 < rfc)
                                {
                                    
                                    _loc_12.fxs[_loc_21] = _loc_12.fxs[_loc_21] - _loc_19 * rfas[_loc_13];
                                    _loc_12.fys[_loc_21] = _loc_12.fys[_loc_21] - _loc_20 * rfas[_loc_13];
                                    _loc_12.fchls[_loc_21] = _loc_12.fchls[_loc_21] - _loc_22 * rfas[_loc_13];
                                    if (++_loc_21 >= rfc)
                                    {
                                        ++_loc_21 = 0;
                                    }
                                    _loc_13++;
                                }
                                _loc_12.fx = _loc_12.fxs[_loc_12.fpos];
                                _loc_12.fy = _loc_12.fys[_loc_12.fpos];
                                _loc_12.fchl = _loc_12.fchls[_loc_12.fpos];
                                _loc_12.ftg = rfc;
                            }
                            if (_loc_15)
                            {
                                _loc_12.ehl = 0;
                            }
                            if (_loc_12 == snake)
                            {
                                lvx = view_xx;
                                lvy = view_yy;
                                view_xx = snake.xx + snake.fx;
                                view_yy = snake.yy + snake.fy;
                                bgx = bgx - (view_xx - lvx);
                                bgy = bgy - (view_yy - lvy);
                                _loc_19 = view_xx - ovxx;
                                _loc_20 = view_yy - ovyy;
                                ++_loc_21 = fvpos;
                                _loc_13 = 0;
                                while (_loc_13 < vfc)
                                {
                                    
                                    fvxs[++_loc_21] = fvxs[++_loc_21] - _loc_19 * vfas[_loc_13];
                                    fvys[_loc_21] = fvys[_loc_21] - _loc_20 * vfas[_loc_13];
                                    if (++_loc_21 >= vfc)
                                    {
                                        ++_loc_21 = 0;
                                    }
                                    _loc_13++;
                                }
                                fvtg = vfc;
                            }
                        }
                    }
                    else if (_loc_4 == "l")
                    {
                        highscore_batch.reset();
                        _loc_23 = 0;
                        _loc_24 = 5;
                        wumsts = true;
                        _loc_25 = 0;
                        _loc_26 = 0;
                        if (lb_fr == -1)
                        {
                            if (dead_mtm == -1)
                            {
                                lb_fr = 0;
                            }
                        }
                        _loc_28 = param1[_loc_5];
                        _loc_5++;
                        rank = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        snake_count = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        while (_loc_5 < _loc_6)
                        {
                            
                            _loc_29 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                            _loc_5 = _loc_5 + 2;
                            _loc_11 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 16777215;
                            _loc_5 = _loc_5 + 3;
                            _loc_30 = param1[_loc_5];
                            _loc_5++;
                            _loc_31 = param1[_loc_5];
                            _loc_5++;
                            _loc_32 = "";
                            _loc_13 = 0;
                            while (_loc_13 < _loc_31)
                            {
                                
                                _loc_32 = _loc_32 + String.fromCharCode(param1[_loc_5]);
                                _loc_5++;
                                _loc_13++;
                            }
                            _loc_26 = _loc_26 + 1;
                            _loc_25 = _loc_25 + 1;
                            _loc_33 = int((fpsls[_loc_29] + _loc_11 / fmlts[_loc_29] - 1) * 15 - 5) / 1;
                            if (_loc_26 == _loc_28)
                            {
                                ++_loc_21 = 1;
                                _loc_32 = my_nick;
                            }
                            else
                            {
                                ++_loc_21 = 0.9 * (0.2 + 0.8 * Math.pow(1 - _loc_25 / 10, 2));
                                if (!gdnm(_loc_32))
                                {
                                    trace("filtered " + _loc_32);
                                    _loc_32 = "";
                                }
                            }
                            drawText("#" + _loc_25, highscore_batch, _loc_23 - 28, _loc_24, 11, per_color_imgs[_loc_30].cs, ++_loc_21);
                            drawText(_loc_32, highscore_batch, _loc_23, _loc_24, 11, per_color_imgs[_loc_30].cs, _loc_21, 0, 125);
                            drawText("" + _loc_33, highscore_batch, _loc_23 + 173, _loc_24, 11, per_color_imgs[_loc_30].cs, _loc_21, 2);
                            _loc_24 = _loc_24 + 14;
                        }
                    }
                    else if (_loc_4 == "m")
                    {
                        _loc_29 = param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2];
                        _loc_5 = _loc_5 + 3;
                        _loc_11 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 16777215;
                        _loc_5 = _loc_5 + 3;
                        _loc_34 = Math.floor((fpsls[_loc_29] + _loc_11 / fmlts[_loc_29] - 1) * 15 - 5) / 1;
                        _loc_31 = param1[_loc_5];
                        _loc_5++;
                        _loc_35 = "";
                        _loc_36 = 0;
                        while (_loc_36 < _loc_31)
                        {
                            
                            _loc_35 = _loc_35 + String.fromCharCode(param1[_loc_5]);
                            _loc_5++;
                            _loc_36 = _loc_36 + 1;
                        }
                        if (!gdnm(_loc_35))
                        {
                            _loc_35 = "";
                        }
                        _loc_37 = "";
                        while (_loc_5 < _loc_6)
                        {
                            
                            _loc_37 = _loc_37 + String.fromCharCode(param1[_loc_5]);
                            _loc_5++;
                        }
                        if (!gdnm(_loc_37))
                        {
                            _loc_37 = "";
                        }
                        victor_batch.reset();
                        if (_loc_34 > 0)
                        {
                            _loc_39 = 10;
                            if (_loc_37.length > 0)
                            {
                                _loc_38 = drawText("\"" + _loc_37 + "\"", victor_batch, 10, _loc_39, 12, 16777215, 0.75, 0, 230, true);
                                _loc_39 = _loc_39 + (_loc_38.h + 8);
                            }
                            _loc_40 = 13;
                            if (_loc_35.length > 0)
                            {
                                if (_loc_37.length > 0)
                                {
                                    _loc_38 = drawText("- " + _loc_35 + ", today\'s longest", victor_batch, _loc_40, _loc_39, 11, 16777215, 0.35, 0, 240, true);
                                    _loc_39 = _loc_39 + _loc_38.h;
                                }
                                else
                                {
                                    _loc_38 = drawText("Today\'s longest was " + _loc_35, victor_batch, _loc_40, _loc_39, 11, 16777215, 0.35, 0, 240, true);
                                    _loc_39 = _loc_39 + _loc_38.h;
                                }
                                _loc_38 = drawText("with a length of " + _loc_34, victor_batch, _loc_40, _loc_39, 11, 16777215, 0.35, 0, 240, true);
                                _loc_39 = _loc_39 + _loc_38.h;
                            }
                            else if (_loc_37.length > 0)
                            {
                                _loc_38 = drawText("- today\'s longest", victor_batch, _loc_40, _loc_39, 11, 16777215, 0.35, 0, 200, true);
                                _loc_39 = _loc_39 + _loc_38.h;
                                _loc_38 = drawText("with a length of " + _loc_34, victor_batch, _loc_40, _loc_39, 11, 16777215, 0.35, 0, 240, true);
                                _loc_39 = _loc_39 + _loc_38.h;
                            }
                            else
                            {
                                _loc_38 = drawText("Today\'s longest: " + _loc_34, victor_batch, _loc_40, _loc_39, 11, 16777215, 0.35, 0, 240, true);
                                _loc_39 = _loc_39 + _loc_38.h;
                            }
                        }
                    }
                    else if (_loc_4 == "W")
                    {
                    }
                    else if (_loc_4 == "w")
                    {
                        if (protocol_version >= 8)
                        {
                            _loc_41 = 2;
                            _loc_23 = param1[_loc_5];
                            _loc_5++;
                            _loc_24 = param1[_loc_5];
                            _loc_5++;
                        }
                        else
                        {
                            _loc_41 = param1[_loc_5];
                            _loc_5++;
                            _loc_23 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                            _loc_5 = _loc_5 + 2;
                            _loc_24 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                            _loc_5 = _loc_5 + 2;
                        }
                        if (_loc_41 == 1)
                        {
                        }
                        else
                        {
                            _loc_36 = foods_cm1;
                            while (_loc_36 >= 0)
                            {
                                
                                fo = foods[_loc_36];
                                if (fo.sx == _loc_23)
                                {
                                    if (fo.sy == _loc_24)
                                    {
                                        if (fo.food_batch != null)
                                        {
                                            fo.food_batch.regenerating = true;
                                            var _loc_58:* = fo.food_batch;
                                            var _loc_59:* = _loc_58.count - 1;
                                            _loc_58.count = _loc_59;
                                            fo.food_batch = null;
                                        }
                                        foods[_loc_36] = foods[foods_cm1];
                                        foods[foods_cm1] = null;
                                        var _loc_59:* = foods_cm1 - 1;
                                        foods_cm1 = _loc_59;
                                    }
                                }
                                _loc_36 = _loc_36 - 1;
                            }
                        }
                    }
                    else if (_loc_4 == "p")
                    {
                        wfpr = false;
                        if (lagging)
                        {
                            etm = etm * lag_mult;
                            lagging = false;
                        }
                    }
                    else if (_loc_4 == "s")
                    {
                        _loc_10 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        if (_loc_8 > 6)
                        {
                            _loc_42 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                            _loc_5 = _loc_5 + 3;
                            _loc_43 = param1[_loc_5] - 48;
                            _loc_5++;
                            _loc_44 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                            _loc_5 = _loc_5 + 3;
                            _loc_45 = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 1000;
                            _loc_5 = _loc_5 + 2;
                            _loc_11 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 16777215;
                            _loc_5 = _loc_5 + 3;
                            _loc_30 = param1[_loc_5];
                            _loc_5++;
                            _loc_46 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 5;
                            _loc_5 = _loc_5 + 3;
                            _loc_47 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 5;
                            _loc_5 = _loc_5 + 3;
                            _loc_31 = param1[_loc_5];
                            _loc_5++;
                            _loc_32 = "";
                            _loc_13 = 0;
                            while (_loc_13 < _loc_31)
                            {
                                
                                _loc_32 = _loc_32 + String.fromCharCode(param1[_loc_5]);
                                _loc_5++;
                                _loc_13++;
                            }
                            _loc_23 = 0;
                            _loc_24 = 0;
                            _loc_48 = 0;
                            _loc_49 = 0;
                            _loc_50 = false;
                            pid = 0;
                            _loc_29 = 1 + (_loc_6 - 6 - _loc_5) / 2;
                            _loc_51 = new Vector.<SnakePoint>(_loc_29);
                            j2 = 0;
                            while (_loc_5 < _loc_6)
                            {
                                
                                _loc_48 = _loc_23;
                                _loc_49 = _loc_24;
                                if (!_loc_50)
                                {
                                    _loc_23 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 5;
                                    _loc_5 = _loc_5 + 3;
                                    _loc_24 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 5;
                                    _loc_5 = _loc_5 + 3;
                                    _loc_48 = _loc_23;
                                    _loc_49 = _loc_24;
                                    _loc_50 = true;
                                }
                                else
                                {
                                    _loc_23 = _loc_23 + (param1[_loc_5] - 127) / 2;
                                    _loc_5++;
                                    _loc_24 = _loc_24 + (param1[_loc_5] - 127) / 2;
                                    _loc_5++;
                                }
                                po = points_dp.get();
                                if (!po)
                                {
                                    po = new SnakePoint();
                                }
                                po.eiu = 0;
                                po.xx = _loc_23;
                                po.yy = _loc_24;
                                po.fx = 0;
                                po.fy = 0;
                                po.da = 0;
                                po.ebx = _loc_23 - _loc_48;
                                po.eby = _loc_24 - _loc_49;
                                po.pid = pid;
                                var _loc_59:* = pid + 1;
                                pid = _loc_59;
                                _loc_51[j2] = po;
                                var _loc_59:* = j2 + 1;
                                j2 = _loc_59;
                            }
                            sk = newSnake(_loc_10, _loc_46, _loc_47, _loc_30, _loc_42, _loc_51);
                            sk.cpid = pid;
                            if (snake == null)
                            {
                                view_xx = _loc_23;
                                view_yy = _loc_24;
                                lvx = view_xx;
                                lvy = view_yy;
                                snake = sk;
                                twang = _loc_42;
                                sk.nick = my_nick;
                            }
                            else
                            {
                                sk.nick = _loc_32;
                                if (!gdnm(_loc_32))
                                {
                                    sk.nick = "";
                                }
                            }
                            var _loc_58:* = _loc_44;
                            sk.wang = _loc_44;
                            sk.eang = _loc_58;
                            sk.sp = _loc_45;
                            sk.spang = sk.sp / spangdv;
                            if (sk.spang > 1)
                            {
                                sk.spang = 1;
                            }
                            sk.fam = _loc_11;
                            sk.sc = Math.min(6, 1 + (sk.sct - 2) / 106);
                            sk.sc13 = Math.pow(sk.sc, 1.3);
                            sk.lsz = 29 * sk.sc;
                            sk.scang = 0.13 + 0.87 * Math.pow((7 - sk.sc) / 6, 2);
                            sk.normal_speed = nsp1 + nsp2 * sk.sc;
                            sk.ssp = nsp1 + nsp2 * sk.sc;
                            sk.fsp = sk.ssp + 0.1;
                            sk.wsep = bsep * sk.sc;
                            mwsep = 4.5 / gsc;
                            if (sk.wsep < mwsep)
                            {
                                sk.wsep = mwsep;
                            }
                            sk.sep = sk.wsep;
                            snl(sk);
                        }
                        else
                        {
                            _loc_52 = param1[_loc_5] == 1;
                            _loc_5++;
                            _loc_36 = snakes.length - 1;
                            while (_loc_36 >= 0)
                            {
                                
                                sk = snakes[_loc_36];
                                if (sk.id == _loc_10)
                                {
                                    sk.id = -1234;
                                    if (_loc_52)
                                    {
                                        sk.dead = true;
                                        sk.dead_amt = 0;
                                        sk.edir = 0;
                                    }
                                    else
                                    {
                                        snakes.splice(_loc_36, 1);
                                    }
                                    delete os["s" + _loc_10];
                                    break;
                                }
                                _loc_36 = _loc_36 - 1;
                            }
                        }
                    }
                    else if (_loc_4 == "v")
                    {
                        if (param1[_loc_5] == 2)
                        {
                            want_close_socket = true;
                            want_victory_message = false;
                            want_hide_victory = 1;
                            hvfr = 0;
                            savemsgbtn.disable();
                        }
                        else
                        {
                            var _loc_58:* = 0.5;
                            logo_ii.scaleY = 0.5;
                            logo_ii.scaleX = _loc_58;
                            logo_ii.y = -120;
                            final_text_batch.reset();
                            final_score = Math.floor((fpsls[snake.sct] + snake.fam / fmlts[snake.sct] - 1) * 15 - 5) / 1;
                            drawText("Your final length was " + final_score + "!", final_text_batch, 0, -111, 18, 16777215, 1, 1);
                            _loc_53 = "That is your best score so far!";
                            _loc_54 = getSo("best_score");
                            trace("best_score: \"" + _loc_54 + "\"");
                            if (_loc_54 == "" + Number(_loc_54))
                            {
                                _loc_54 = Number(_loc_54);
                                if (final_score > _loc_54)
                                {
                                    setSo("best_score", "" + final_score);
                                }
                                else
                                {
                                    _loc_53 = "Your best length ever was " + _loc_54;
                                }
                            }
                            else
                            {
                                setSo("best_score", "" + final_score);
                            }
                            drawText(_loc_53, final_text_batch, 0, -84, 13, 16777215, 0.5, 1);
                            dead_mtm = new Date().time;
                            want_ad = true;
                            connect_spinner_ii.visible = false;
                            login_layer.alpha = 0;
                            login_layer.visible = true;
                            nick_input_mc.alpha = 0;
                            nick_input_mc.visible = false;
                            victory_input_mc.alpha = 0;
                            victory_input_mc.visible = false;
                            if (param1[_loc_5] == 1)
                            {
                                victory_input_mc.visible = true;
                                _starling.nativeOverlay.addChild(victory_input_mc);
                                playbtn.ii.visible = false;
                                offlinebtn.ii.visible = false;
                                skinbtn.ii.visible = false;
                                if (extrabtn1 != null)
                                {
                                    extrabtn1.ii.visible = true;
                                }
                                settingsbtn.ii.visible = false;
                                removeadsbtn.ii.visible = false;
                                restorepurchasesbtn.ii.visible = false;
                                sharebtn.holder.visible = false;
                                savemsgbtn.holder.alpha = 1;
                                savemsgbtn.holder.visible = true;
                                savemsgbtn.enable();
                                want_victory_message = true;
                            }
                            else
                            {
                                nick_input_mc.visible = true;
                                _starling.nativeOverlay.addChild(nick_input_mc);
                                playbtn.ii.visible = true;
                                offlinebtn.ii.visible = true;
                                skinbtn.ii.visible = true;
                                if (extrabtn1 != null)
                                {
                                    extrabtn1.ii.visible = true;
                                }
                                settingsbtn.ii.visible = true;
                                removeadsbtn.ii.visible = true;
                                if (is_ios)
                                {
                                    restorepurchasesbtn.ii.visible = true;
                                }
                                if (has_generic_share)
                                {
                                    sharebtn.holder.visible = true;
                                }
                                savemsgbtn.holder.visible = false;
                                playbtn.enable();
                                offlinebtn.enable();
                                skinbtn.enable();
                                if (extrabtn1 != null)
                                {
                                    extrabtn1.enable();
                                }
                                settingsbtn.enable();
                                removeadsbtn.enable();
                                if (is_ios)
                                {
                                    restorepurchasesbtn.enable();
                                }
                                sharebtn.enable();
                                want_close_socket = true;
                            }
                        }
                    }
                    else if (_loc_4 == "F")
                    {
                        _loc_57 = false;
                        while (_loc_5 < _loc_6)
                        {
                            
                            _loc_30 = param1[_loc_5];
                            _loc_5++;
                            _loc_23 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                            _loc_5 = _loc_5 + 2;
                            _loc_24 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                            _loc_5 = _loc_5 + 2;
                            rad = param1[_loc_5] / 5;
                            _loc_5++;
                            fo = newFood(_loc_23, _loc_24, rad, true, _loc_30);
                            if (!_loc_57)
                            {
                                _loc_57 = true;
                                _loc_55 = int(_loc_23 / sector_size);
                                _loc_56 = int(_loc_24 / sector_size);
                            }
                            fo.sx = _loc_55;
                            fo.sy = _loc_56;
                        }
                    }
                    else if (_loc_4 == "b" || _loc_4 == "f")
                    {
                        _loc_30 = param1[_loc_5];
                        _loc_5++;
                        if (_loc_8 > 4)
                        {
                            _loc_23 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                            _loc_5 = _loc_5 + 2;
                            _loc_24 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                            _loc_5 = _loc_5 + 2;
                            rad = param1[_loc_5] / 5;
                            _loc_5++;
                            fo = newFood(_loc_23, _loc_24, rad, _loc_4 == "b", _loc_30);
                            _loc_55 = int(_loc_23 / sector_size);
                            _loc_56 = int(_loc_24 / sector_size);
                            fo.sx = _loc_55;
                            fo.sy = _loc_56;
                        }
                    }
                    else if (_loc_4 == "c")
                    {
                        _loc_23 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        _loc_24 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        _loc_36 = foods_cm1;
                        while (_loc_36 >= 0)
                        {
                            
                            fo = foods[_loc_36];
                            if (fo.xx == _loc_23 && fo.yy == _loc_24)
                            {
                                fo.eaten = true;
                                if (fo.food_batch != null)
                                {
                                    fo.food_batch.regenerating = true;
                                    var _loc_58:* = fo.food_batch;
                                    var _loc_59:* = _loc_58.count - 1;
                                    _loc_58.count = _loc_59;
                                    fo.food_batch = null;
                                }
                                if (_loc_8 > 4)
                                {
                                    snake_id = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                                    _loc_5 = _loc_5 + 2;
                                    fo.eaten_by = os["s" + snake_id];
                                    fo.eaten_fr = 0;
                                }
                                else
                                {
                                    foods[_loc_36] = foods[foods_cm1];
                                    foods[foods_cm1] = null;
                                    var _loc_59:* = foods_cm1 - 1;
                                    foods_cm1 = _loc_59;
                                }
                                break;
                            }
                            _loc_36 = _loc_36 - 1;
                        }
                    }
                    else if (_loc_4 == "j")
                    {
                        _loc_10 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        _loc_23 = 1 + (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) * 3;
                        _loc_5 = _loc_5 + 2;
                        _loc_24 = 1 + (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) * 3;
                        _loc_5 = _loc_5 + 2;
                        pr = null;
                        _loc_36 = preys_cm1;
                        while (_loc_36 >= 0)
                        {
                            
                            if (preys[_loc_36].id == _loc_10)
                            {
                                pr = preys[_loc_36];
                                break;
                            }
                            _loc_36 = _loc_36 - 1;
                        }
                        if (pr)
                        {
                            csp = pr.sp * (etm / 8) / 4;
                            csp = csp * lag_mult;
                            ox = pr.xx;
                            oy = pr.yy;
                            if (_loc_8 == 15)
                            {
                                pr.dir = param1[_loc_5] - 48;
                                _loc_5++;
                                pr.ang = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                                _loc_5 = _loc_5 + 3;
                                pr.wang = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                                _loc_5 = _loc_5 + 3;
                                pr.sp = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 1000;
                                _loc_5 = _loc_5 + 2;
                            }
                            else if (_loc_8 == 11)
                            {
                                pr.ang = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                                _loc_5 = _loc_5 + 3;
                                pr.sp = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 1000;
                                _loc_5 = _loc_5 + 2;
                            }
                            else if (_loc_8 == 12)
                            {
                                pr.dir = param1[_loc_5] - 48;
                                _loc_5++;
                                pr.wang = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                                _loc_5 = _loc_5 + 3;
                                pr.sp = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 1000;
                                _loc_5 = _loc_5 + 2;
                            }
                            else if (_loc_8 == 13)
                            {
                                pr.dir = param1[_loc_5] - 48;
                                _loc_5++;
                                pr.ang = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                                _loc_5 = _loc_5 + 3;
                                pr.wang = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                                _loc_5 = _loc_5 + 3;
                            }
                            else if (_loc_8 == 9)
                            {
                                pr.ang = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                                _loc_5 = _loc_5 + 3;
                            }
                            else if (_loc_8 == 10)
                            {
                                pr.dir = param1[_loc_5] - 48;
                                _loc_5++;
                                pr.wang = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                                _loc_5 = _loc_5 + 3;
                            }
                            else if (_loc_8 == 8)
                            {
                                pr.sp = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 1000;
                                _loc_5 = _loc_5 + 2;
                            }
                            pr.xx = _loc_23 + Math.cos(pr.ang) * csp;
                            pr.yy = _loc_24 + Math.sin(pr.ang) * csp;
                            _loc_19 = pr.xx - ox;
                            _loc_20 = pr.yy - oy;
                            _loc_21 = pr.fpos;
                            _loc_13 = 0;
                            while (_loc_13 < rfc)
                            {
                                
                                pr.fxs[_loc_21] = pr.fxs[_loc_21] - _loc_19 * rfas[_loc_13];
                                pr.fys[_loc_21] = pr.fys[_loc_21] - _loc_20 * rfas[_loc_13];
                                if (++_loc_21 >= rfc)
                                {
                                    ++_loc_21 = 0;
                                }
                                _loc_13++;
                            }
                            pr.fx = pr.fxs[pr.fpos];
                            pr.fy = pr.fys[pr.fpos];
                            pr.ftg = rfc;
                        }
                    }
                    else if (_loc_4 == "y")
                    {
                        _loc_10 = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                        _loc_5 = _loc_5 + 2;
                        if (_loc_8 == 2)
                        {
                            _loc_36 = preys_cm1;
                            while (_loc_36 >= 0)
                            {
                                
                                pr = preys[_loc_36];
                                if (pr.id == _loc_10)
                                {
                                    preys[_loc_36] = preys[preys_cm1];
                                    preys[preys_cm1] = null;
                                    var _loc_59:* = preys_cm1 - 1;
                                    preys_cm1 = _loc_59;
                                    break;
                                }
                                _loc_36 = _loc_36 - 1;
                            }
                        }
                        else if (_loc_8 == 4)
                        {
                            snake_id = param1[_loc_5] << 8 | param1[(_loc_5 + 1)];
                            _loc_5 = _loc_5 + 2;
                            _loc_36 = preys_cm1;
                            while (_loc_36 >= 0)
                            {
                                
                                pr = preys[_loc_36];
                                if (pr.id == _loc_10)
                                {
                                    pr.eaten = true;
                                    pr.eaten_by = os["s" + snake_id];
                                    if (pr.eaten_by)
                                    {
                                        pr.eaten_fr = 0;
                                    }
                                    else
                                    {
                                        preys[_loc_36] = preys[preys_cm1];
                                        preys[preys_cm1] = null;
                                        var _loc_59:* = preys_cm1 - 1;
                                        preys_cm1 = _loc_59;
                                    }
                                    break;
                                }
                                _loc_36 = _loc_36 - 1;
                            }
                        }
                        else
                        {
                            _loc_30 = param1[_loc_5];
                            _loc_5++;
                            _loc_23 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 5;
                            _loc_5 = _loc_5 + 3;
                            _loc_24 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) / 5;
                            _loc_5 = _loc_5 + 3;
                            rad = param1[_loc_5] / 5;
                            _loc_5++;
                            _loc_43 = param1[_loc_5] - 48;
                            _loc_5++;
                            _loc_44 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                            _loc_5 = _loc_5 + 3;
                            _loc_42 = (param1[_loc_5] << 16 | param1[(_loc_5 + 1)] << 8 | param1[_loc_5 + 2]) * 2 * Math.PI / 16777215;
                            _loc_5 = _loc_5 + 3;
                            _loc_45 = (param1[_loc_5] << 8 | param1[(_loc_5 + 1)]) / 1000;
                            _loc_5 = _loc_5 + 2;
                            newPrey(_loc_10, _loc_23, _loc_24, rad, _loc_30, _loc_43, _loc_44, _loc_42, _loc_45);
                        }
                    }
                }
                return;
            }// end function
            ;
            this.ws.onError = function (param1)
            {
                trace("what? " + param1);
                return;
            }// end function
            ;
            this.ws.onClose = function (param1)
            {
                if (ws == this)
                {
                    if (connected)
                    {
                        connected = false;
                        resetGame();
                    }
                }
                return;
            }// end function
            ;
            this.ws.onConnect = function (param1)
            {
                var _loc_2:* = undefined;
                var _loc_3:* = NaN;
                var _loc_4:* = undefined;
                var _loc_5:* = null;
                var _loc_6:* = undefined;
                var _loc_7:* = undefined;
                if (ws != this)
                {
                    return;
                }
                _loc_2 = "Mobile_App_Test";
                _loc_2 = nick_tf.text;
                if (_loc_2 == "Nickname")
                {
                    _loc_2 = "";
                }
                if (_loc_2.length > 24)
                {
                    _loc_2 = _loc_2.substr(0, 24);
                }
                my_nick = _loc_2;
                if (!gdnm(_loc_2))
                {
                    _loc_2 = "";
                }
                _loc_3 = int(Math.random() * 9);
                _loc_4 = getSo("snakercv");
                if (_loc_4 == "" + Number(_loc_4))
                {
                    _loc_3 = Number(_loc_4);
                }
                _loc_5 = new ByteArray();
                _loc_5.length = 3 + _loc_2.length;
                _loc_6 = 8;
                _loc_5[0] = 115;
                _loc_5[1] = _loc_6 - 1;
                _loc_5[2] = _loc_3;
                _loc_7 = 0;
                while (_loc_7 < _loc_2.length)
                {
                    
                    _loc_5[_loc_7 + 3] = _loc_2.charCodeAt(_loc_7);
                    _loc_7 = _loc_7 + 1;
                }
                ws.sendBytes(_loc_5);
                showGame();
                return;
            }// end function
            ;
            i;
            while (i < this.sos.length)
            {
                
                this.sos[i].ptm = 9999999;
                i = (i + 1);
            }
            bcptm;
            bcluo;
            k = (this.clus.length - 1);
            while (k >= 0)
            {
                
                cluo = this.clus[k];
                if (cluo)
                {
                    if (cluo.ptms.length > 0)
                    {
                        ptm;
                        smptm;
                        j = (cluo.ptms.length - 1);
                        while (j >= 0)
                        {
                            
                            ptm = ptm + cluo.ptms[j];
                            if (cluo.ptms[j] < smptm)
                            {
                                smptm = cluo.ptms[j];
                            }
                            j = (j - 1);
                        }
                        ptm = (ptm + smptm) / (cluo.ptms.length + 1);
                        trace("cluster " + k + " ping time: " + ptm);
                        if (ptm < bcptm)
                        {
                            bcptm = ptm;
                            bcluo = cluo;
                        }
                        j = (this.sos.length - 1);
                        while (j >= 0)
                        {
                            
                            if (this.sos[j].clu == k)
                            {
                                this.sos[j].ptm = ptm;
                            }
                            j = (j - 1);
                        }
                    }
                }
                k = (k - 1);
            }
            fbso;
            cluo = bcluo;
            if (cluo)
            {
                j;
                while (j < 50)
                {
                    
                    if (fbso != null)
                    {
                        break;
                    }
                    if (cluo.sos.length > 0)
                    {
                        m;
                        k;
                        while (k < cluo.sos.length)
                        {
                            
                            o = cluo.sos[k];
                            m = m + o.wg / cluo.swg;
                            o.ptv = m;
                            k = (k + 1);
                        }
                        o.ptv = 1;
                        v = Math.random();
                        fbso = cluo.sos[0];
                        k;
                        while (k < cluo.sos.length)
                        {
                            
                            o = cluo.sos[k];
                            if (!o.tainted)
                            {
                                if (o.ptv < v)
                                {
                                    fbso = o;
                                }
                            }
                            k = (k + 1);
                        }
                        if (fbso.tainted)
                        {
                            fbso;
                        }
                    }
                    j = (j + 1);
                }
            }
            if (fbso != null)
            {
                this.bso = fbso;
                trace("using fbso");
            }
            else
            {
                this.sos.sortOn("po", Array.NUMERIC);
                this.bso = this.sos[int(Math.random() * this.sos.length)];
                i = (this.sos.length - 1);
                while (i >= 0)
                {
                    
                    if (!this.sos[i].tainted)
                    {
                        if (this.sos[i].ptm <= this.bso.ptm)
                        {
                            if (this.sos[i].ac > 20)
                            {
                                this.bso = this.sos[i];
                            }
                        }
                    }
                    i = (i - 1);
                }
            }
            trace(this.bso);
            use_test_server;
            if (this.final_build)
            {
                use_test_server;
            }
            if (use_test_server)
            {
                trace("connecting to test server");
                this.ws.connect("149.56.20.138", 453);
            }
            else
            {
                trace("connection to " + this.bso.ip + " on port " + this.bso.po + " (cluster " + this.bso.clu + ")");
                this.ws.connect(this.bso.ip, this.bso.po);
            }
            return;
        }// end function

        public function showGame()
        {
            this.minimap_ii.visible = true;
            this.myloc_ii.visible = true;
            this.jcfr = 0;
            return;
        }// end function

        public function gotIPfile(param1)
        {
            var li:*;
            var s:*;
            var j:*;
            var cluo:*;
            var o:*;
            var k:*;
            var m:*;
            var n:*;
            var v:*;
            var cv:*;
            var cav:*;
            var ia:*;
            var pa:*;
            var aa:*;
            var clu:*;
            var po:*;
            var ac:*;
            var ip:*;
            var ps:*;
            var e:* = param1;
            li = e.target;
            s = li.data + "";
            if (s.length > 0)
            {
                this.sos = [];
                this.clus = [];
                this.allow_ads = s.charAt(0) == "a";
                trace("allow_ads: " + this.allow_ads);
                j;
                o;
                k;
                m;
                n;
                cv;
                cav;
                ia;
                pa;
                aa;
                clu;
                while (j < s.length)
                {
                    
                    j = (j + 1);
                    v = (s.charCodeAt(j) - 97 - cav) % 26;
                    if (v < 0)
                    {
                        v = v + 26;
                    }
                    cv = cv * 16;
                    cv = cv + v;
                    cav = cav + 7;
                    if (n == 1)
                    {
                        if (m == 0)
                        {
                            ia.push(cv);
                            if (ia.length == 4)
                            {
                                m = (m + 1);
                            }
                        }
                        else if (m == 1)
                        {
                            pa.push(cv);
                            if (pa.length == 3)
                            {
                                m = (m + 1);
                            }
                        }
                        else if (m == 2)
                        {
                            aa.push(cv);
                            if (aa.length == 3)
                            {
                                m = (m + 1);
                            }
                        }
                        else if (m == 3)
                        {
                            clu.push(cv);
                            if (clu.length == 1)
                            {
                                o;
                                po;
                                k;
                                while (k < pa.length)
                                {
                                    
                                    po = po * 256;
                                    po = po + pa[k];
                                    k = (k + 1);
                                }
                                ac;
                                k;
                                while (k < aa.length)
                                {
                                    
                                    ac = ac * 256;
                                    ac = ac + aa[k];
                                    k = (k + 1);
                                }
                                o.ip = ia.join(".");
                                o.po = po + 10;
                                o.ac = ac;
                                o.wg = ac + 5;
                                o.clu = clu[0];
                                if (!this.clus[o.clu])
                                {
                                    cluo;
                                    this.clus[o.clu] = cluo;
                                    cluo.sis = [];
                                    cluo.ptms = [];
                                    cluo.swg = 0;
                                    cluo.tac = 0;
                                    cluo.sos = [];
                                }
                                else
                                {
                                    cluo = this.clus[o.clu];
                                }
                                o.cluo = cluo;
                                cluo.swg = cluo.swg + o.wg;
                                cluo.sos.push(o);
                                cluo.tac = cluo.tac + ac;
                                this.sos.push(o);
                                ia;
                                pa;
                                aa;
                                clu;
                                m;
                            }
                        }
                        cv;
                        n;
                        continue;
                    }
                    n = (n + 1);
                }
                j = (this.sos.length - 1);
                while (j >= 0)
                {
                    
                    n;
                    cluo = this.sos[j].cluo;
                    if (cluo)
                    {
                        k = (cluo.sis.length - 1);
                        while (k >= 0)
                        {
                            
                            if (cluo.sis[k].ip == this.sos[j].ip)
                            {
                                n;
                                break;
                            }
                            k = (k - 1);
                        }
                        if (n == 1)
                        {
                            cluo.sis.push({ip:this.sos[j].ip});
                        }
                    }
                    j = (j - 1);
                }
                j = (this.clus.length - 1);
                while (j >= 0)
                {
                    
                    cluo = this.clus[j];
                    if (cluo)
                    {
                        if (cluo.sis.length > 0)
                        {
                            k = int(Math.random() * cluo.sis.length);
                            ip = cluo.sis[k].ip;
                            ps = new Mode4Socket();
                            ps.receive = function (param1:ByteArray)
            {
                var _loc_2:* = undefined;
                var _loc_3:* = undefined;
                var _loc_4:* = undefined;
                var _loc_5:* = null;
                if (param1.length >= 1 && param1[0] == 112)
                {
                    _loc_2 = clus.length - 1;
                    while (_loc_2 >= 0)
                    {
                        
                        _loc_3 = clus[_loc_2];
                        if (_loc_3)
                        {
                            if (_loc_3.ps == this)
                            {
                                _loc_4 = new Date().time - _loc_3.stm;
                                trace(" ping time for cluster " + _loc_2 + ": " + _loc_4);
                                _loc_3.ptms.push(_loc_4);
                                if (_loc_3.ptms.length < 3)
                                {
                                    _loc_3.stm = new Date().time;
                                    _loc_5 = new ByteArray();
                                    _loc_5.length = 1;
                                    _loc_5[0] = 112;
                                    this.sendBytes(_loc_5);
                                }
                                else
                                {
                                    if (waiting_for_sos)
                                    {
                                        if (sos_ready_after_mtm == -1)
                                        {
                                            sos_ready_after_mtm = new Date().time + 1300;
                                        }
                                    }
                                    this.close();
                                    _loc_3.ps = null;
                                }
                                break;
                            }
                        }
                        _loc_2 = _loc_2 - 1;
                    }
                }
                return;
            }// end function
            ;
                            ps.onConnect = function (param1)
            {
                var _loc_2:* = undefined;
                var _loc_3:* = undefined;
                var _loc_4:* = undefined;
                var _loc_5:* = null;
                _loc_2 = false;
                _loc_3 = clus.length - 1;
                while (_loc_3 >= 0)
                {
                    
                    _loc_4 = clus[_loc_3];
                    if (_loc_4)
                    {
                        if (_loc_4.ps == this)
                        {
                            _loc_4.stm = new Date().time;
                            _loc_5 = new ByteArray();
                            _loc_5.length = 1;
                            _loc_5[0] = 112;
                            this.sendBytes(_loc_5);
                            _loc_2 = true;
                            break;
                        }
                    }
                    _loc_3 = _loc_3 - 1;
                }
                if (!_loc_2)
                {
                    this.close();
                }
                return;
            }// end function
            ;
                            cluo.ps = ps;
                            ps.connect(ip, 81);
                        }
                    }
                    j = (j - 1);
                }
            }
            return;
        }// end function

        public function gotFilters(param1)
        {
            var _loc_2:* = undefined;
            var _loc_3:* = undefined;
            var _loc_4:* = undefined;
            var _loc_5:* = undefined;
            var _loc_6:* = undefined;
            _loc_2 = param1.target;
            _loc_3 = _loc_2.data + "";
            if (_loc_3.length > 0)
            {
                _loc_3 = _loc_3.split(String.fromCharCode(13)).join(String.fromCharCode(10));
                _loc_3 = _loc_3.split(String.fromCharCode(10));
                _loc_5 = "a";
                _loc_6 = 0;
                while (_loc_6 < _loc_3.length)
                {
                    
                    _loc_4 = _loc_3[_loc_6];
                    if (_loc_4.length > 0)
                    {
                        if (_loc_4.indexOf("flt_a:") >= 0)
                        {
                            _loc_5 = "a";
                        }
                        else if (_loc_4.indexOf("flt_g:") >= 0)
                        {
                            _loc_5 = "g";
                        }
                        else if (_loc_4.indexOf("flt_w:") >= 0)
                        {
                            _loc_5 = "w";
                        }
                        else if (_loc_5 == "a")
                        {
                            this.flt_a.push(_loc_4);
                        }
                        else if (_loc_5 == "g")
                        {
                            this.flt_g.push(_loc_4);
                        }
                        else if (_loc_5 == "w")
                        {
                            this.flt_w.push(_loc_4);
                        }
                    }
                    _loc_6 = _loc_6 + 1;
                }
            }
            return;
        }// end function

        public function ipe(param1)
        {
            var _loc_2:* = undefined;
            trace(param1);
            for (_loc_2 in param1)
            {
                
                trace("  " + _loc_2 + ": " + _loc_4[_loc_2]);
            }
            return;
        }// end function

        public function loadIPfile()
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            _loc_1 = new URLLoader();
            _loc_1.addEventListener(Event.COMPLETE, this.gotIPfile);
            _loc_1.addEventListener(Event.OPEN, this.ipe);
            _loc_1.addEventListener(ProgressEvent.PROGRESS, this.ipe);
            _loc_1.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.ipe);
            _loc_1.addEventListener(HTTPStatusEvent.HTTP_STATUS, this.ipe);
            _loc_1.addEventListener(IOErrorEvent.IO_ERROR, this.ipe);
            _loc_2 = new URLRequest("http://slither.io/i33628.txt");
            _loc_1.load(_loc_2);
            return;
        }// end function

        public function loadWordFilters()
        {
            var _loc_1:* = null;
            var _loc_2:* = null;
            _loc_1 = new URLLoader();
            _loc_1.addEventListener(Event.COMPLETE, this.gotFilters);
            _loc_1.addEventListener(Event.OPEN, this.ipe);
            _loc_1.addEventListener(ProgressEvent.PROGRESS, this.ipe);
            _loc_1.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.ipe);
            _loc_1.addEventListener(HTTPStatusEvent.HTTP_STATUS, this.ipe);
            _loc_1.addEventListener(IOErrorEvent.IO_ERROR, this.ipe);
            _loc_2 = new URLRequest("http://slither.io/filters.txt");
            _loc_1.load(_loc_2);
            return;
        }// end function

        public function isPhone() : Boolean
        {
            var _loc_1:* = NaN;
            if (this.is_mac)
            {
                return false;
            }
            _loc_1 = 7;
            return Math.max(this.stg.fullScreenWidth, this.stg.fullScreenHeight) / Capabilities.screenDPI < _loc_1;
        }// end function

        public function loadedExtraButton(param1)
        {
            var target_mc:Loader;
            var btn:*;
            var cbm:BitmapData;
            var t:*;
            var e:* = param1;
            target_mc = e.currentTarget.loader as Loader;
            try
            {
                target_mc.content["smoothing"] = true;
            }
            catch (qe)
            {
                trace("uh ohh,");
                trace(qe);
            }
            if (this.extrabtn1 == null)
            {
                if (target_mc.width > 16)
                {
                    if (target_mc.height > 16)
                    {
                        trace("making extra button");
                        btn;
                        this.extrabtn1 = btn;
                        cbm = new BitmapData(target_mc.width, target_mc.height, true, 0);
                        cbm.draw(target_mc);
                        t = Texture.fromBitmapData(cbm);
                        btn.txr = t;
                        btn.ii = new Image(t);
                        btn.ii.scaleX = 0.5;
                        btn.ii.scaleY = 0.5;
                        btn.layer = this.login_layer;
                        btn.layer.addChild(btn.ii);
                        this.makeBtn(btn);
                        btn.killed = function ()
            {
                if (this.layer)
                {
                    this.layer.removeChild(this.ii);
                    this.ii.dispose();
                    this.layer = null;
                    this.txr.dispose();
                }
                return;
            }// end function
            ;
                        btn.clicked = function ()
            {
                if (want_hide_victory != 0)
                {
                    return;
                }
                if (settings_shown)
                {
                    return;
                }
                if (!playing)
                {
                    if (dead_mtm == -1)
                    {
                        navigateToURL(new URLRequest(extrabtn_click_url));
                    }
                }
                return;
            }// end function
            ;
                        btn.ii.alpha = 0;
                        btn.ii.visible = this.skinbtn.ii.visible;
                        if (this.skinbtn.disabled)
                        {
                            btn.disable();
                        }
                        this.resize();
                    }
                }
            }
            return;
        }// end function

        public function gotExtraButtonData(param1)
        {
            var _loc_2:* = undefined;
            var _loc_3:* = undefined;
            var _loc_4:* = undefined;
            var _loc_5:* = undefined;
            var _loc_6:* = undefined;
            var _loc_7:* = undefined;
            var _loc_8:* = undefined;
            var _loc_9:* = null;
            var _loc_10:* = null;
            _loc_2 = param1.target;
            _loc_3 = _loc_2.data;
            _loc_4 = _loc_3.split("$");
            _loc_7 = 0;
            _loc_8 = 0;
            while (_loc_8 < _loc_4.length)
            {
                
                if (++_loc_7 > 2)
                {
                    ++_loc_7 = 1;
                }
                if (++_loc_7 == 1)
                {
                    _loc_5 = _loc_4[_loc_8];
                }
                else
                {
                    _loc_6 = _loc_4[_loc_8];
                    this.extrabtn_click_url = _loc_6;
                    _loc_9 = new Loader();
                    _loc_10 = new URLRequest(_loc_5);
                    _loc_9.contentLoaderInfo.addEventListener(Event.COMPLETE, this.loadedExtraButton);
                    _loc_9.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, this.cae);
                    _loc_9.load(_loc_10);
                }
                _loc_8 = _loc_8 + 1;
            }
            return;
        }// end function

        public function loadExtraButtons()
        {
            var _loc_1:* = null;
            var _loc_2:* = undefined;
            var _loc_3:* = null;
            _loc_1 = new URLLoader();
            _loc_1.addEventListener(Event.COMPLETE, this.gotExtraButtonData);
            _loc_1.addEventListener(Event.OPEN, this.cae);
            _loc_1.addEventListener(ProgressEvent.PROGRESS, this.cae);
            _loc_1.addEventListener(SecurityErrorEvent.SECURITY_ERROR, this.cae);
            _loc_1.addEventListener(HTTPStatusEvent.HTTP_STATUS, this.cae);
            _loc_1.addEventListener(IOErrorEvent.IO_ERROR, this.cae);
            _loc_2 = "";
            if (this.is_kindle)
            {
                _loc_2 = _loc_2 + "&o=k";
            }
            else if (this.is_android)
            {
                _loc_2 = _loc_2 + "&o=a";
            }
            else
            {
                _loc_2 = _loc_2 + "&o=i";
            }
            _loc_3 = new URLRequest("http://slither.io/getbuttons.php?v=2" + _loc_2);
            _loc_1.load(_loc_3);
            return;
        }// end function

        public function iapsEnabled()
        {
            if (!this.iaps_enabled)
            {
                this.iaps_enabled = true;
                this.csrab = true;
            }
            return;
        }// end function

        public function disableAdsNow()
        {
            if (!this.ads_removed)
            {
                this.ads_removed = true;
                this.has_ads = false;
                this.csrab = false;
            }
            return;
        }// end function

    }
}
