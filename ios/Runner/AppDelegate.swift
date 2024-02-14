import UIKit
import Flutter
import SwiftUI
import SafariServices

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

 private var safariView:SFSafariViewController!
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
       let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(name: "open_safari_for_iOS", binaryMessenger: controller.binaryMessenger)

 
        channel.setMethodCallHandler { (call: FlutterMethodCall, result: @escaping FlutterResult) in
            if call.method == "openSafari" {
              let data = call.arguments as? [String: String]
              if let urlValue = data?["url"] as? String {              
                // Open Safari WebView here
                if let url = URL(string: urlValue) {    
                  let safariViewController = SFSafariViewController(url: url)
                  UIApplication.shared.keyWindow?.rootViewController?.present(safariViewController, animated: true)
      
                }

              }

              
            }
        }
        
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }

  override func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
  // Check if the url matches your custom scheme
  let vc = UIApplication.shared.keyWindow?.rootViewController   
    vc?.dismiss(animated: true, completion: nil)
    return true  
    }
}