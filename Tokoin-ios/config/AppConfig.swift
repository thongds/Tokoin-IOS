//
//  AppConfig.swift
//  Tokoin-ios
//
//  Created by thongds on 17/03/2021.
//

import Foundation

class AppConfig {
    static let baseUrl = "https://newsapi.org"
    static let apiKey = "7392f4421fb24a7dbfe8e09a79c272e4"
    static let key = "userName"
    
    static func saveUserName(_ value: String) {
            UserDefaults.standard.set(value, forKey: key)
    }
    static func getUserName() -> String? {
        return UserDefaults.standard.value(forKey: key) as? String
    }
}
