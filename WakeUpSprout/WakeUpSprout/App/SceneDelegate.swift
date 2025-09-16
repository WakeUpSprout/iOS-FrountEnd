//
//  SceneDelegate.swift
//  WakeUpSprout
//
//  Created by 이부용 on 8/7/25.
//

import UIKit
import SwiftUI

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        // TODO: 테스트를 위해 LoginV를 RootV로 사용
        let loginView = LoginV()
        let hostingController = UIHostingController(rootView: loginView)
        
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = hostingController
        window.makeKeyAndVisible()
        self.window = window
    }
    
    func sceneDidDisconnect(_ scene: UIScene) { }
    func sceneDidBecomeActive(_ scene: UIScene) { }
    func sceneWillResignActive(_ scene: UIScene) { }
    func sceneWillEnterForeground(_ scene: UIScene) { }
    // 사용자가 앱을 사용 중 → 홈 버튼 누르거나 다른 앱으로 이동하는 코드
    // 현재 미사용이나 추후 데이터 저장용으로 쓸 수 있어 주석 처리함
//    func sceneDidEnterBackground(_ scene: UIScene) {
//        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
//    }
}

