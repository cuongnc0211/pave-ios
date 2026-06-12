//
//  SceneDelegate.swift
//  Pave
//
//  Created by Cuong Nguyen on 10/6/26.
//

import HotwireNative
import UIKit

#if DEBUG
let baseURL = URL(string: "http://localhost:3000")!
#else
let baseURL = URL(string: "https://pave-ai.cc")!
#endif

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    private let tabBarController = HotwireTabBarController()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        tabBarController.load(HotwireTab.all)
    }
}
