//
//  UserSettings.swift
//  Ams Tel
//
//  Created by makrowave on 28/03/2025.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published public var defaultUserLocation: ListItem?
    @Published public var serverURL: String = ""
    
    private init() {}
    private static var _instance: UserSettings?
    public static func GetUserSettings() -> UserSettings {
        if(_instance == nil) {
            _instance = UserSettings()
        }
        return _instance!
    }
    
}
