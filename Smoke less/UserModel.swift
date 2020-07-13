//
//  UserModel.swift
//  Smoke less
//
//  Created by Александр Кондрашин on 30.06.2020.
//  Copyright © 2020 Alexander Kondrashin. All rights reserved.
//

import Foundation


class UserSettings : ObservableObject {
    
    @Published var username: String = ""
    @Published var dateOfQuitting: Date = Date() {
        didSet {
            saveDataToUserDefaults(data: dateOfQuitting.timeIntervalSince1970, key: "dateOfQuitting")
        }
    }
    @Published  var cigarettePerDay:Int = 0 {
        didSet {
            saveDataToUserDefaults(data: cigarettePerDay, key: "cigarettePerDay")
        }
    }
    @Published  var packOfCigaretteCost: Int = 1 {
        didSet {
            saveDataToUserDefaults(data: packOfCigaretteCost, key: "packOfCigaretteCost")
        }
    }
    @Published var cigarettesInAPack: Int = 20 {
        didSet {
            saveDataToUserDefaults(data: cigarettesInAPack, key: "cigarettesInAPack")
        }
    }
    @Published  var moneySaved: Int = 0 {
        didSet {
            saveDataToUserDefaults(data: moneySaved, key: "moneySaved")
        }
    }
    @Published var selectedCurrency: Int = 1 {
        didSet {
            saveDataToUserDefaults(data: selectedCurrency, key: "selectedCurrency")
        }
    }
    @Published var alertsOn: Bool = false {
        didSet {
            saveDataToUserDefaults(data: alertsOn, key: "alertsOn")
            
        }
    }
    
    
    
    init() {
        loadData()
    }
    
    func saveDataToUserDefaults(data: Any, key: String) {
        let defaults = UserDefaults.standard
        defaults.set(data, forKey: key)
    }
    func currency() -> String {
        switch selectedCurrency {
        case 1:
            return "₽"
        case 2:
            return "$"
        case 3:
            return "€"
        default:
            return ""
        }
    }
    
    
    
    func loadData() {
        let defaults = UserDefaults.standard
        
        dateOfQuitting = Date(timeIntervalSince1970: defaults.double(forKey: "dateOfQuitting"))
        cigarettePerDay = defaults.integer(forKey: "cigarettePerDay")
        packOfCigaretteCost = defaults.integer(forKey: "packOfCigaretteCost")
        cigarettesInAPack = defaults.integer(forKey: "cigarettesInAPack")
        moneySaved = defaults.integer(forKey: "moneySaved")
        selectedCurrency = defaults.integer(forKey: "selectedCurrency")
        alertsOn = defaults.bool(forKey: "alertsOn")
    }
}

extension UserDefaults {
    // check for is first launch - only true on first invocation after app install, false on all further invocations
    // Note: Store this value in AppDelegate if you have multiple places where you are checking for this flag
    static func isFirstLaunch() -> Bool {
        let hasBeenLaunchedBeforeFlag = "hasBeenLaunchedBeforeFlag"
        let isFirstLaunch = !UserDefaults.standard.bool(forKey: hasBeenLaunchedBeforeFlag)
        if (isFirstLaunch) {
            UserDefaults.standard.set(true, forKey: hasBeenLaunchedBeforeFlag)
            UserDefaults.standard.synchronize()
        }
        return isFirstLaunch
    }
}


