//
//  WeatherApp.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 3/31/23.
//

import SwiftUI

@main
struct WeatherApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    private let appConfigurator = AppConfigurationContainer()

    var body: some Scene {
        WindowGroup {
            #if DEBUG // For UI Testing
            if UITestingHelper.isUITesting {
                AppConfigurationContainerMock.makeCurrentWeatherScene()
            } else {
                appConfigurator.makeCurrentWeatherScene()
            }
            #else
            appConfigurator.makeCurrentWeatherScene()
            #endif
        }
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        #if DEBUG
        print("Is UI test running: \(UITestingHelper.isUITesting)")
        #endif
        return true
    }
}
