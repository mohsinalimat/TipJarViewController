//
//  AppDelegate.swift
//  TipJarViewController
//
//  Created by Dan Loewenherz on 05/06/2018.
//  Copyright (c) 2018 Dan Loewenherz. All rights reserved.
//

import UIKit
import LionheartExtensions
import TipJarViewController
import QuickTableView

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegateWithWindow {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        rootViewController = TipJarViewController<ExampleTipJarOptions>()
        return true
    }
}

struct ExampleTipJarOptions: TipJarConfiguration {
    static var topHeader = "Hi There"
    
    static var topDescription = """
If you've been enjoying Pushpin for a while, and would like to show your support, please consider a tip. They go such a long way, and every little bit helps. Thanks! :)
"""
    
    static func subscriptionProductIdentifier(for subscription: TipJarViewController<ExampleTipJarOptions>.SubscriptionRow) -> String {
        switch subscription {
        case .monthly: return "com.lionheartsw.Pushpin.TipJarSubscription.Monthly"
        case .yearly: return "com.lionheartsw.Pushpin.TipJarSubscription.Yearly"
        }
    }
    
    static func oneTimeProductIdentifier(for subscription: TipJarViewController<ExampleTipJarOptions>.OneTimeRow) -> String {
        switch subscription {
        case .small: return "com.lionheartsw.Pushpin.Tip.Small"
        case .medium: return "com.lionheartsw.Pushpin.Tip.Medium"
        case .large: return "com.lionheartsw.Pushpin.Tip.Large"
        case .huge: return "com.lionheartsw.Pushpin.Tip.Huge"
        case .massive: return "com.lionheartsw.Pushpin.Tip.Massive"
        }
    }
    
    static var termsOfUseURLString = "https://lionheartsw.com/software/pushpin/terms.html"
    static var privacyPolicyURLString = "https://lionheartsw.com/software/pushpin/privacy.html"
}

extension ExampleTipJarOptions: TipJarOptionalConfiguration {
    static var title = "Tip Jar"
    static var oneTimeTipsTitle = "One-Time Tips"
    static var subscriptionTipsTitle = "Ongoing Tips ❤️"
    static var receiptVerifierURLString = "https://iap-receipt-verifier.herokuapp.com/verify"
}
