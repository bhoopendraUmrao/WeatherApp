//
//  UITestingHelper.swift
//  WeatherApp
//
//  Created by Bhoopendra Umrao on 02/04/23.
//

#if DEBUG
import Foundation

struct UITestingHelper {
    static var isUITesting: Bool {
        ProcessInfo.processInfo.arguments.contains("-ui-testing")
    }

    static var isNetworkingSuccessFul: Bool {
        ProcessInfo.processInfo.environment["-networking-success"] == "1"
    }
}

#endif
