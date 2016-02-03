package Alien3D
{
	import Alien3D.core.ICoreInstance;
	import Alien3D.core.SingletonT;
	import Alien3D.core.debug.DebugPrint;
	import Alien3D.render.RenderLayer3DManager;
	import Alien3D.render.wrapper.Stage3DWrapperManager;

	//
	public class Application extends ICoreInstance
	{
		private static var ms_Singleton:SingletonT;
		public  static function get Singleton() : SingletonT { return ms_Singleton; }
		
		//
		private var _wrapperManager:Stage3DWrapperManager;
		private var _layerManager:RenderLayer3DManager;
		
		//
		public function Application()
		{
			super(ms_Singleton = new SingletonT(this));
			
			//
		}
		
		public override function release() : void
		{
			//
			
			//
			DebugPrint.output_application("finalize released.");
			
			super.release();
		}
		
		public override function initialize() : Boolean
		{			
			if(!super.initialize())
			{ return false; }
			
			//
			this._wrapperManager = new Stage3DWrapperManager();
			if(!this._wrapperManager.initialize())
			{
				DebugPrint.output_application("[Stage3DWrapperManager] initialize fail.");
				return false;
			}
			
			//
			this._layerManager = new RenderLayer3DManager();
			if(!this._layerManager.initialize())
			{
				DebugPrint.output_application("[RenderLayer3DManager] initialize fail.");
				return false;
			}
			
			//
			DebugPrint.output_application("finalize initialized.");
			return true;
		}
	}
}