//
//  AppDelegate.swift
//  kata-roman-numeral
//
//  Created by Ondrej Fabian on 08/10/2015.
//  Copyright © 2015 Ondrej Fabian. All rights reserved.
//

import UIKit
import Swinject
import presentation
import domain

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    let container = Container() { container in
        
        container.register(Executor.self) { _ in
            BackgroundExecutor()
        }
        
        container.register(Logger.self)  { _ in
            ConsoleLogger()
        }
        
        container.register(Invoker.self) { r in
            LoggingInvoker(executor: r.resolve(Executor.self)!, logger: r.resolve(Logger.self)!)
        }.inObjectScope(.Container)
        
        container.register(ConvertToRomanFacade.self) { r in
            ConvertToRomanFacade(invoker: r.resolve(Invoker.self)!)
        }
        
        container.register(ConvertToRomanPresenter.self) { r in
            ConvertToRomanPresenter(romanConverter: r.resolve(ConvertToRomanFacade.self)!)
            }
            .initCompleted { r, presenter in
                presenter.view = r.resolve(RomanConverterViewController.self)
        }
        
        container.register(RomanConverterViewController.self) { resolvable in
            let controller = (UIStoryboard.init(name: "Main", bundle: nil).instantiateInitialViewController() as! RomanConverterViewController)
            controller.presenter = resolvable.resolve(ConvertToRomanPresenter.self)
            return controller
        }
    }
    

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        // Instantiate a window.
        let window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window.backgroundColor = UIColor.whiteColor()
        window.makeKeyAndVisible()
        self.window = window

        // Instantiate the root view controller with dependencies injected by the container.
        window.rootViewController = container.resolve(RomanConverterViewController.self)
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

