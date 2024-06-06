import UIKit
import Flutter
import AMapFoundationKit
import AMapLocationKit
import MAMapKit

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate, AMapLocationManagerDelegate {
  var locationManager: AMapLocationManager?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // 注册生成的插件
    GeneratedPluginRegistrant.register(with: self)

    // 初始化高德地图 SDK
    AMapServices.shared().apiKey = "95eece70c77ea3990c85d9b39a9dda67"
    AMapServices.shared().enableHTTPS = true

    // 设置隐私信息同意状态
    AMapLocationManager.updatePrivacyShow(.didShow, privacyInfo: .didContain)
    AMapLocationManager.updatePrivacyAgree(.didAgree)

    // 初始化定位服务
    locationManager = AMapLocationManager()
    locationManager?.delegate = self

    // 注册视图工厂
    if let registrar = self.registrar(forPlugin: "com.example.speaks") {
      let factory = MapViewFactory(messenger: registrar.messenger())
      registrar.register(factory, withId: "AMapView")
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  // 实现定位回调方法
  func amapLocationManager(_ manager: AMapLocationManager!, didUpdate location: CLLocation!) {
    print("location: \(location)")
  }

  func amapLocationManager(_ manager: AMapLocationManager!, didFailWithError error: Error!) {
    print("error: \(error)")
  }
}


//class MapViewFactory: NSObject, FlutterPlatformViewFactory {
//  private var messenger: FlutterBinaryMessenger
//
//  init(messenger: FlutterBinaryMessenger) {
//    self.messenger = messenger
//    super.init()
//  }
//
//  func create(
//    withFrame frame: CGRect,
//    viewIdentifier viewId: Int64,
//    arguments args: Any?
//  ) -> FlutterPlatformView {
//    return MapView(frame: frame, viewId: viewId, args: args)
//  }
//
//  func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
//    return FlutterStandardMessageCodec.sharedInstance()
//  }
//}
//
//class MapView: NSObject, FlutterPlatformView, MAMapViewDelegate {
//  private var _view: UIView
//
//  init(frame: CGRect, viewId: Int64, args: Any?) {
//    _view = UIView()
//    super.init()
//    // 初始化 MAMapView 并添加到 _view 上
//    let mapView = MAMapView(frame: frame)
//    mapView.delegate = self // 确保 MapView 实现 MAMapViewDelegate 协议
//    _view.addSubview(mapView)
//    print("MapView initialized with frame: \(frame), viewId: \(viewId)")
//  }
//
//  func view() -> UIView {
//    return _view
//  }
//
//  // 实现 MAMapViewDelegate 协议的方法（根据需要）
//  func mapView(_ mapView: MAMapView!, didSelect view: MAAnnotationView!) {
//    print("Annotation selected: \(view.annotation)")
//  }
//}
//


