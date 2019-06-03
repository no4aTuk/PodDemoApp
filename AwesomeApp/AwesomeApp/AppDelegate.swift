//
//  AppDelegate.swift
//  AwesomeApp
//
//  Created by Vonny on 18/05/2019.
//  Copyright © 2019 Vonny. All rights reserved.
//

import UIKit
import AFNetworkLayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    public var shared: AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let homeService = PostsService()
        let homeVM = PostsViewModel(postsService: homeService)
        let homeVC = ViewController(viewModel: homeVM)
        let navCtrl = UINavigationController(rootViewController: homeVC)
        navCtrl.navigationBar.isTranslucent = false
        window?.rootViewController = navCtrl
        window?.makeKeyAndVisible()
        
        return true
    }
}

