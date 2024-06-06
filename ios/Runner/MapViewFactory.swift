//
//  MapViewFactory.swift
//  Runner
//
//  Created by 阿喜 on 2024/5/20.
//

import Foundation
import MAMapKit

class MapViewFactory: NSObject, FlutterPlatformViewFactory {
  private var messenger: FlutterBinaryMessenger

  init(messenger: FlutterBinaryMessenger) {
    self.messenger = messenger
    super.init()
  }

  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {
    return MapView(frame: frame, viewId: viewId, args: args)
  }

  func createArgsCodec() -> FlutterMessageCodec & NSObjectProtocol {
    return FlutterStandardMessageCodec.sharedInstance()
  }
}

class MapView: NSObject, FlutterPlatformView, MAMapViewDelegate {
  private var _view: UIView

  init(frame: CGRect, viewId: Int64, args: Any?) {
    _view = UIView()
    super.init()
    // 初始化 MAMapView 并添加到 _view 上
    let mapView = MAMapView(frame: frame)
    mapView.delegate = self // 确保 MapView 实现 MAMapViewDelegate 协议
    _view.addSubview(mapView)
    print("MapView initialized with frame: \(frame), viewId: \(viewId)")
  }

  func view() -> UIView {
    return _view
  }

  // 实现 MAMapViewDelegate 协议的方法（根据需要）
  func mapView(_ mapView: MAMapView!, didSelect view: MAAnnotationView!) {
    print("Annotation selected: \(view.annotation)")
  }
}



