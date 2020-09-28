//
//  AppDelegate.swift
//  MovieApp
//
//  Created by M_Sugawara on 2020/08/16.
//  Copyright © 2020 M_Sugawara. All rights reserved.
//

import UIKit
import Firebase

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    let tmdbAPI = TMDBAPI()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        tmdbAPI.sendRequest(.moviePopular) { (result: Result<MoviePopular, TMDBError>) in
            switch result {
            case .success(let item):
                print("success: \(item)")
            case .failure(let error):
                switch error {
                case .clientError:
                    print("Client Error")
                case .serverError(let info):
                    print("Server Error: \(info.statusMessage)")
                case .unexpectedError(let body):
                    print("Unexpected Error: \(body)")
                }
                break
            }
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

