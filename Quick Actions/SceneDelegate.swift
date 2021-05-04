//
//  SceneDelegate.swift
//  Quick Actions
//
//  Created by Cooper on 2021/5/3.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    enum ShortcutItemType: String {
        case colorChange = "ColorAction"
        case share = "ShareAction"
        case table = "TableAction"
        case fourth = "FourthAction"
    }
    
    var window: UIWindow?
    var savedShortCutItem: UIApplicationShortcutItem!
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        if let shortcutItem = connectionOptions.shortcutItem {
            savedShortCutItem = shortcutItem
        }
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    
    func handleShortCutItem(shortcutItem: UIApplicationShortcutItem) -> Bool {
        if let itemType = ShortcutItemType(rawValue: shortcutItem.type) {
            switch itemType {
            case .colorChange:
                if let navController = window?.rootViewController as? UINavigationController {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let secondHomeViewController =
                        storyboard.instantiateViewController(identifier: "second") as? SecondHomeViewController {
                        navController.pushViewController(secondHomeViewController, animated: false)
                    }
                }
                break
            case .share:
                
                break
                
            case .table:
                if let navController = window?.rootViewController as? UINavigationController {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let secondHomeViewController =
                        storyboard.instantiateViewController(identifier: "form") as? FormTableViewController {
                        navController.pushViewController(secondHomeViewController, animated: false)
                    }
                }
                break
            case .fourth:
                if let navController = window?.rootViewController as? UINavigationController {
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    if let secondHomeViewController =
                        storyboard.instantiateViewController(identifier: "form") as? FormTableViewController {
                        navController.pushViewController(secondHomeViewController, animated: false)
                    }
                }
                break
            }
        }
        return true
    }
    
    func windowScene(_ windowScene: UIWindowScene, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        let handled = handleShortCutItem(shortcutItem: shortcutItem)
        completionHandler(handled)
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
        
        if savedShortCutItem != nil {
            _ = handleShortCutItem(shortcutItem: savedShortCutItem)
        }
        //這邊要讓它變回nil，不然會強制開啟原本的 quick action 頁面
        savedShortCutItem = nil
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        var shortcutItems = UIApplication.shared.shortcutItems ?? []
        
        shortcutItems += [
            UIApplicationShortcutItem(type: "TableAction", localizedTitle: "Dynamic 1", localizedSubtitle: "", icon: UIApplicationShortcutIcon(type: .alarm)),
            UIApplicationShortcutItem(type: "FourthAction", localizedTitle: "客製的 Quick Action 2", localizedSubtitle: "", icon: UIApplicationShortcutIcon(templateImageName: "android"))
        ]
        
        UIApplication.shared.shortcutItems = shortcutItems
    }
    
    
    
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

