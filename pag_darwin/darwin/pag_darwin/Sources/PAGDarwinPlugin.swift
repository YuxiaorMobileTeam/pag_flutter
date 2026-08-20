import Flutter

public class PAGDarwinPlugin: NSObject, FlutterPlugin {
    var impl: PAGImpl?

    init(messenger: FlutterBinaryMessenger) {
        self.impl = PAGImpl(messenger: messenger)
        self.impl!.setUp()
    }

    public static func register(with registrar: FlutterPluginRegistrar) {
        let messenger = registrar.messenger()
        let instance = PAGDarwinPlugin(messenger: messenger)
        let viewFactory = PAGViewFactory(instanceManager: instance.impl!.instanceManager)
        registrar.register(viewFactory, withId: "hebei.dev/PAGView")
        registrar.publish(instance)
    }

    public func detachFromEngine(for registrar: FlutterPluginRegistrar) {
        self.impl!.ignoreCallsToDart = true
        self.impl!.tearDown()
        self.impl = nil
    }
}
