//
//  AppDelegate.swift
//  Motivetica
//
//  Created by Sasha Prokhorenko on 9/21/17.
//  Copyright © 2017 Sasha Prokhorenko. All rights reserved.
//

import UIKit
import CoreData
import Fabric
import Crashlytics
import AlamofireNetworkActivityIndicator

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  var coreDataStack = CoreDataStack(modelName: CoreDataHelper.motiveticaModel)
  
  class func sharedInstance() -> AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
  }
  
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    Fabric.with([Crashlytics.self])
    Theme.current.apply()
    NetworkActivityIndicatorManager.shared.isEnabled = true
    return true
  }
  
  func applicationDidEnterBackground(_ application: UIApplication) {
    CoreDataStack.moc.saveContext()
  }
  
  func applicationWillTerminate(_ application: UIApplication) {
    CoreDataStack.moc.saveContext()
  }
}
