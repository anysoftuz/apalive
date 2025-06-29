import UIKit
import Flutter
import JitsiMeetSDK

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // JitsiMeetFlutterSdkPlugin.register(with: self.registrar(forPlugin: "JitsiMeetFlutterSdkPlugin")!)
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
