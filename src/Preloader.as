package 
{
 import flash.display.Sprite;
 import flash.events.Event;
 import flash.net.URLRequest;
 import flash.display.Loader;
 import flash.events.ProgressEvent;
 import flash.system.LoaderContext;
 import flash.system.ApplicationDomain;
 /**
  * ...
  * @author Fabian Verkuijlen
  */
 public class Preloader extends Sprite 
 {
  
  public function Preloader():void 
  {
   function startLoad()
    {
     trace('startLoad');
       var mLoader:Loader = new Loader();//Or use ProLoader
       var ldrContext:LoaderContext = new LoaderContext(false, new ApplicationDomain()); 
       var mRequest:URLRequest = new URLRequest("MissleCommand.swf");
       mLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, onCompleteHandler);
       mLoader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgressHandler);
       mLoader.load(mRequest, ldrContext);
    }

   function onCompleteHandler(loadEvent:Event)
   {
    trace('loaded');
      addChild(loadEvent.currentTarget.content);
   }
   function onProgressHandler(mProgress:ProgressEvent)
   {
      var percent:Number = mProgress.bytesLoaded/mProgress.bytesTotal;
      trace(percent);
   }
   startLoad();
  }
  
  private function init(e:Event = null):void 
  {
   removeEventListener(Event.ADDED_TO_STAGE, init);
   // entry point
  }
  
 }
 
}