import Flutter
import UIKit
import AppTrackingTransparency

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  override func applicationDidBecomeActive(_ application: UIApplication) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
      if #available(iOS 14.0, *) {
        ATTrackingManager.requestTrackingAuthorization { status in
        }
      }
    }
  }
}
