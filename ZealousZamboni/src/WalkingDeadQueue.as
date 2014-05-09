package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Dana Van Aken
	 */
	public class WalkingDeadQueue implements SpriteQueue
	{
		private var zombies:Array;
		
		public function WalkingDeadQueue() 
		{
			zombies = new Array();
		}
		
		public function addSpriteData(sd:SpriteData):void {
			zombies.push(sd);
		}
		
		public function startTimer():void {
			this.zombies.sortOn("startTime", Array.NUMERIC | Array.DESCENDING);
			for each (var zombie:SpriteData in zombies) {
				var timer:FlxTimer = new FlxTimer();
				timer.start(zombie.startTime, 1, startSprite);
			}
		}
		
		private function startSprite(timer:FlxTimer):void {
			var next:SpriteData = zombies.pop();
			var zombie:WalkingDead = new WalkingDead(next.x, next.y);
			PlayState(FlxG.state).addUnit(zombie);
		}
		
	}

}