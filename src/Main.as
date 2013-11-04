package {
 import flash.display.Loader;
 import flash.display.MovieClip;
 import flash.display.Sprite;
 import flash.display.StageScaleMode;
 import flash.events.Event;
 import flash.events.MouseEvent;
 import flash.events.ProgressEvent;
 import flash.net.URLRequest;
 import flash.system.ApplicationDomain;
 import flash.system.fscommand;
 import flash.system.LoaderContext;
 import flash.text.TextField;
 import flash.text.TextFormat;
 import flash.utils.Timer;
 import flash.events.TimerEvent;
 import flash.events.TextEvent;
 import flash.net.SharedObject;
 import flash.media.Sound;
 /**
  * ...
  * @author Kerim Birlik
  */
 public class Main extends MovieClip
 {
  //aanmaken van de game
  public var theme:Sound = new Bloodlines(); 
  public var shootingsound:Sound = new Bulletbill();
 public var random:Number;
 public var tempArray:Array = new Array();
 public var shared:SharedObject = SharedObject.getLocal("sharedStorage");
 private   var start :Sprite = new StartKnop();
 private   var highscore:Sprite = new highschoreKnop();
 private   var fullscreen:Sprite = new FullScreenKnop();
 public  var scoretext:TextField = new TextField;
 public var endgame:int = new int;
 public var losescreen:MovieClip = new LoseScreenMC;
 public static var _allMeteooren:Array = [];
 public static var _allBullets:Array = [];
 public var spawnTimer:Timer;
 public var spawnTimer2:Timer;
 public var spawnTimer3:Timer;
 public var spawnTimer4:Timer;
 public var spawnTimer5:Timer;
 public var score = new int;
 public var scoretimer:Timer;
 public var tower1:Tower = new Tower();
 public var tower2:Tower = new Tower();
 public var tower3:Tower = new Tower();
 public var canMove:Boolean = new Boolean();
 public var shootingTowerX:Number;
 public var shootingTowerY:Number;
 private var textfont:TextFormat = new TextFormat();
 

 public function Main():void
 {
	 addEventListener(Event.ADDED_TO_STAGE, initgame);
	 

		
 }
 
 private function initgame(e:Event):void 
 {
	 	 if (shared.data.score) {
 //if this SO already set, get the value
 tempArray = shared.data.score;
}
 
//get your current highScore and store in a array
tempArray.push(score);
 
//assign back to the SO
shared.data.score = tempArray;
 
trace(tempArray);
 

	 addChild(losescreen);
	 addChild(scoretext);
		start = new StartKnop();
		highscore = new highschoreKnop();
		fullscreen = new FullScreenKnop();
		highscore.x = 400;
		highscore.y = 200;
		fullscreen.x = 920;
		fullscreen.y = 0;
		start.x = 400;
		start.y = 300;
		addChild(start);
		addChild(highscore);
		addChild(fullscreen);
		fullscreen.addEventListener(MouseEvent.CLICK, GoFull);
		start.addEventListener(MouseEvent.CLICK, CloseMenu);
		highscore.addEventListener(MouseEvent.CLICK, HighScoreMenu);
	 
 }
 		private function HighScoreMenu(e:MouseEvent):void {
		//addChild();
		removeChild(start);
		removeChild(highscore);
		trace(shared.data.score1);
		addChild(scoretext);
			 scoretext.defaultTextFormat = textfont;
			 	  scoretext.text = score;
		}
		
		private function endfunction():void {

		addChild(highscore)
		}
		
		private function CloseMenu(e:MouseEvent):void {
		game();
		removeChild(start);
		removeChild(highscore);
		removeChild(fullscreen);
		}
		
		private function GoFull(event:MouseEvent):void {
		 setFullScreen();
		 }
		 //laad het full screen event in.
		 function setFullScreen():void {
		 if (stage.displayState== "normal") {
		 stage.displayState="fullScreen";
		 stage.scaleMode = StageScaleMode.NO_SCALE;
		 } else {
		  stage.displayState="normal";
		  }
		 }
 
 private function game():void {
shared.data.score1 = score;
shared.flush();
theme.play();

			 
	var position	:	PositionComponent	=	new PositionComponent();
	position.x								=	100;
	position.y								=	stage.stageHeight - 100;
	
	
 canMove = true;
  
 addChild(tower1);
 addChild(tower2);
 addChild(tower3);

 tower1.x = position.x;
 tower2.x = 500;
 tower3.x = 900;

 tower1.y = position.y;
 tower2.y = stage.stageHeight - 100;
 tower3.y = stage.stageHeight - 100;
 
 
 //eventlistereners
 stage.addEventListener(Event.ENTER_FRAME, loop);
 stage.addEventListener(MouseEvent.CLICK, mouseClick);
 
 //spawntimer word gemaakt =------------------------------------------------------------------------
 spawnTimer = new Timer((Math.random() * 1000) + 1000, 0);
 spawnTimer.addEventListener(TimerEvent.TIMER, spawnMeteoor);
 spawnTimer.start();
 

  spawnTimer2 = new Timer( 1000 , 0);
 spawnTimer2.addEventListener(TimerEvent.TIMER, spawnMeteoor2);

 
 
   spawnTimer3 = new Timer( 500 , 0);
 spawnTimer3.addEventListener(TimerEvent.TIMER, spawnMeteoor3);
 
    spawnTimer4 = new Timer( 400 , 0);
 spawnTimer4.addEventListener(TimerEvent.TIMER, spawnMeteoor4);
		
     spawnTimer5 = new Timer( 1000 , 0);
 spawnTimer5.addEventListener(TimerEvent.TIMER, spawnMeteoor5);
		
  
   scoretimer = new Timer( 200 , 0);
 scoretimer.addEventListener(TimerEvent.TIMER, TellScore);
 scoretimer.start();
			 

}
  //spawntimer word gemaakt end =------------------------------------------------------------------------
 
 
 

 //Kogel spawning
 private function mouseClick(e:MouseEvent):void 
 {
shootingsound.play();
	 
 var newBullet : Bullet = new Bullet();
 _allBullets.push(newBullet);
 addChild(newBullet);

 //kiest welke tower schiet
 random = Math.random();
 if (random > 0.7)
 {
 shootingTowerX = tower1.x;
 shootingTowerY = tower1.y;
 newBullet.rotation = tower1.cannonloop.rotation;
 newBullet.x = tower1.x;
 newBullet.y = tower1.y;
 }else if (random > 0.4 && random < 0.7)
 {
 shootingTowerX = tower2.x;
 shootingTowerY = tower2.y;
 newBullet.rotation = tower2.cannonloop.rotation;
 newBullet.x = tower2.x;
 newBullet.y = tower2.y;
 }else if (random < 0.4)
 {
 shootingTowerX = tower3.x;
 shootingTowerY = tower3.y;
 newBullet.rotation = tower3.cannonloop.rotation;
 newBullet.x = tower3.x;
 newBullet.y = tower3.y;
 }
 // Kogels die  spawnen op de towers en gaan de goede richting in
 var gx:Number =  shootingTowerX - mouseX ;
 var gy:Number =  shootingTowerY - mouseY;
 var RadiansB:Number = Math.atan2(gy, gx);
 var DegreesB:Number = RadiansB * 180 / Math.PI;
 newBullet.movex = Math.cos(RadiansB) * 5;
 newBullet.movey = Math.sin(RadiansB) * 5;
 }
 
 

 
 
 
 //  timer
 private function spawnMeteoor(e:Event) :void
 {
	 var peoplefactory : PeopleFactory = new PeopleFactory();
	var randomNumber : int = Math.random() * 20;
	var human : Human = peoplefactory.MakePeople(randomNumber);
	addChild(human);
	 
  var newMeteoor : Missle = new Missle();
  _allMeteooren.push(newMeteoor);
  newMeteoor.x = Math.random() * 1000;
  newMeteoor.y =  20;
  addChild(newMeteoor);
 }
 
 
  private function TellScore(e:Event) :void
 {
   score ++;
   endgame ++;
	 scoretext.defaultTextFormat = textfont;
textfont.size = 50;
 }
 
 private function spawnMeteoor2(e:Event) :void
 {
  var newMeteoor : Missle = new Missle();
  _allMeteooren.push(newMeteoor);
  newMeteoor.x = Math.random() * 1000;
  newMeteoor.y =  20;
  addChild(newMeteoor);
 }
 
  
 private function spawnMeteoor3(e:Event) :void
 {

  var newMeteoor : Missle = new Missle();
  _allMeteooren.push(newMeteoor);
  newMeteoor.x = Math.random() * 1000;
  newMeteoor.y =  20;
  addChild(newMeteoor);
 }
 
  private function spawnMeteoor4(e:Event) :void
 {

  var newMeteoor : Missle = new Missle();
  _allMeteooren.push(newMeteoor);
  newMeteoor.x = Math.random() * 1000;
  newMeteoor.y =  20;
  addChild(newMeteoor);
 }
 
   private function spawnMeteoor5(e:Event) :void
 {

  var newMeteoor : Missle = new Missle();
  _allMeteooren.push(newMeteoor);
  newMeteoor.x = Math.random() * 1000;
  newMeteoor.y =  20;
  addChild(newMeteoor);
 }
 
 
 
 
 
private function loop(e:Event):void
  {
	  if (score > 20) {
	 spawnTimer2.start();
	 textfont.color = 0x00FF00;
	}
	
	if (score > 50) {
	 spawnTimer3.start();
	 textfont.color = 0xFFFF00;
	}
		if (score > 100) {
	 spawnTimer4.start();
	 textfont.color = 0xFF8000;
	}
	
			if (score > 200) {
	 spawnTimer5.start();
	 textfont.color = 0xFF0000;
	}
	
	if (endgame > 500) {
		//save
		shared.flush();
		fscommand("quit");
	}
	  
	  scoretext.text = score;
  var stenen : Missle;
  var item : Bullet;
  var k : int = _allMeteooren.length;
  var l : int = _allBullets.length;
  
  for (var i:int = l-1; i >=0; i--) 
  {
   _allBullets[i].update();
   if (_allBullets[i].x < 0 || _allBullets[i].x > stage.stageWidth || _allBullets[i].y < 0 || _allBullets[i].y > stage.stageHeight)
   {
    removeChild(_allBullets[i]);
    _allBullets.splice(i, 1);
    
   }
  }
  
  for (var j:int = k -1 ; j >= 0; j--) 
  {
   l = _allBullets.length;
   _allMeteooren[j].x += Math.floor(Math.random() *  5 || -10);
   _allMeteooren[j].y +=Math.floor(Math.random() * 10);
   if ( _allMeteooren[j].y  > stage.stageHeight)
   {
	score -= 20;
    removeChild(_allMeteooren[j])
    _allMeteooren.splice(j, 1);
   } 
   

   for (var i:int = l - 1; i >= 0; i--) {
    //_allBullets[i].update();
   
    if (_allBullets[i].hitTestObject(_allMeteooren[j]))
    {
     removeChild(_allMeteooren[j])
     _allMeteooren.splice(j, 1);
     removeChild(_allBullets[i]);
     _allBullets.splice(i, 1);
     break;
    }

   }
  }
  
  }
 
 }

}