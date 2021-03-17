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
    static func convertUTCTime(utcTimeFormat : String?) -> String {
        if utcTimeFormat == nil {
            return ""
        }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        let date = dateFormatter.date(from: utcTimeFormat!)// create   date from string

        // change to a readable time format and change to local time zone
        dateFormatter.dateFormat = "HH:mm:ss yyyy-MM-dd"
        dateFormatter.timeZone = NSTimeZone(name: "us") as TimeZone?
        return dateFormatter.string(from: date!)
    }
}
