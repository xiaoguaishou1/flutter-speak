package com.example.speaks

import android.content.Context
import android.view.View
import com.amap.api.maps.MapsInitializer
import com.amap.api.maps.MapView
import com.amap.api.maps.AMap
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class MainActivity : FlutterActivity() {

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("amap_view", AMapViewFactory())
    }

    private class AMapViewFactory : PlatformViewFactory(StandardMessageCodec.INSTANCE) {
        override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
            return AMapView(context)
        }
    }




    private class AMapView(context: Context) : PlatformView {
        private val mapView: MapView = MapView(context)
        init {
            //30695119733bd7ec10f2a960bccc4028
            MapsInitializer.setApiKey("30695119733bd7ec10f2a960bccc4028")
            mapView.onCreate(null)
            val aMap: AMap = mapView.map
            // 在这里进行地图的初始化设置
        }

        override fun getView(): View {
            return mapView
        }

        override fun dispose() {
            mapView.onDestroy()
        }
    }


    
}
