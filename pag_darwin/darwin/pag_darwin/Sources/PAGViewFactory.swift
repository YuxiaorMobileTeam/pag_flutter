//
//  PAGViewFactory.swift
//
//  Created by 闫守旺 on 2025/4/9.
//

import Flutter
import UIKit

class PAGViewFactory: NSObject, FlutterPlatformViewFactory {
    unowned let instanceManager: PAGApiPigeonInstanceManager

    init(instanceManager: PAGApiPigeonInstanceManager) {
        self.instanceManager = instanceManager
    }

    class PAGViewImpl: NSObject, FlutterPlatformView {
        let obj: UIView

        init(view obj: UIView, frame: CGRect) {
            obj.frame = frame
            self.obj = obj
        }

        func view() -> UIView {
            return obj
        }
    }

    func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> any FlutterPlatformView {
        let identifier = args is Int64 ? args as! Int64 : Int64(args as! Int32)
        let instance = instanceManager.instance(forIdentifier: identifier) as AnyObject?
        if let impl = instance as? PAGViewImpl {
            return impl
        } else {
            let view = instance as! UIView
            return PAGViewImpl(view: view, frame: frame)
        }
    }

    func createArgsCodec() -> any FlutterMessageCodec & NSObjectProtocol {
        return FlutterStandardMessageCodec.sharedInstance()
    }
}
