package {
 import flash.display.Sprite;
 import flash.events.Event;
 import flash.events.MouseEvent;
 import flash.utils.Timer;
 import flash.events.TimerEvent;
 
 /**
  * ...
  * @author Kerim Birlik
  */
 public class Main extends Sprite
 {
  //aanmaken van de game
 public var random:Number;
 
 public static var _allMeteooren:Array = [];
 public static var _allBullets:Array = [];
 public var spawnTimer:Timer;
 public var tower1:Tower = new Tower();
 public var tower2:Tower = new Tower();
 public var tower3:Tower = new Tower();
 public var canMove:Boolean = new Boolean();
 public var shootingTowerX:Number;
 public var shootingTowerY:Number;
 public function Main():void
 {
	 
	
	
	
 canMove = true;
  
 addChild(tower1);
 addChild(tower2);
 addChild(tower3);

 tower1.x = 100;
 tower2.x = 500;
 tower3.x = 900;

 tower1.y = stage.stageHeight - 100;
 tower2.y = stage.stageHeight - 100;
 tower3.y = stage.stageHeight - 100;
 
 
 //eventlistereners
 stage.addEventListener(Event.ENTER_FRAME, loop);
 stage.addEventListener(MouseEvent.CLICK, mouseClick);
 
 //spawntimer word gemaakt
 spawnTimer = new Timer((Math.random() * 1000) + 1000, 0);
 spawnTimer.addEventListener(TimerEvent.TIMER, spawnMeteoor);
 spawnTimer.start();
 }
 
 
 
 
 
 

 //Kogel spawning
 private function mouseClick(e:MouseEvent):void 
 {
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
 
 
 
 
 
 
 private function loop(e:Event):void
  {
  var missles : Missle;
  var item : Bullet; 
  var m : int = _allMeteooren.length;
  var b : int = _allBullets.length;
  
  for (var i:int = b-1; i >=0; i--) 
  {
	
   _allBullets[i].update();
   if ( _allBullets[i].x < 0 || 
		_allBullets[i].x > stage.stageWidth || 
		_allBullets[i].y < 0 || 
		_allBullets[i].y > stage.stageHeight)
   {
    removeChild(_allBullets[i]);
    _allBullets.splice(i, 1);
    
   }
  }
  b = _allBullets.length;
  for (var j:int = m -1 ; j >= 0; j--) 
  {
	   b = _allBullets.length;
		//_allMeteooren.update();
				if (canMove = true) {
		_allMeteooren[j].y += 10;
		_allMeteooren[j].x += Math.random() * 20;
		
	}
	
   if ( _allMeteooren[j].x < 0 ||
		_allMeteooren[j].x > stage.stageWidth ||
		_allMeteooren[j].y  > stage.stageHeight)
   {
	   canMove = false;
    removeChild(_allMeteooren[j])
    _allMeteooren.splice(j, 1);
	
   }
   else {
	   canMove = true;
   }
   for (var p:int = b - 1; p >= 0; p--) {
	   b = _allBullets.length;
    //_allBullets[i].update();
    
    if (_allBullets[p].hitTestObject(_allMeteooren[j]))
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