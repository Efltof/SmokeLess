//
//  MainView.swift
//  Smoke less
//
//  Created by Александр Кондрашин on 30.06.2020.
//  Copyright © 2020 Alexander Kondrashin. All rights reserved.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject var settings: UserSettings
//    private var bindableIsVisibleError: Binding<Bool> { Binding (
//        get: { self.model.usernameResult.isVisibleError },
//        set: { if !$0 { self.model.dismissUsernameResultError() } }
//        )
//    }
    
    var body: some View {
        NavigationView {
               
                    //Color(hue: 0.607, saturation: 0.439, brightness: 0.586)
                    VStack {
                        
                        LabelledDivider(label: "Не курю",color: Color.gray)
                        
                        Group {
                            Text(days()).font(.system(size: 45))
                            
                        }
                        
                        LabelledDivider(label: "Сэкономлено",color: Color.gray)
                        
                        Group {
                            Text(countOfCigarettes()).font(.system(size: 45))
                        }
                        
                        LabelledDivider(label: "Не выкурено",color: Color.gray)
                        
                        Group {
                        Text(noSmoked()).font(.system(size: 45))
                        }
                    }
                
                    .navigationBarTitle("Статистика", displayMode: .large)
        }
    }
    
    func days() -> String {
        let result = String(Int(secondHavePassed() / 86400))
        
        switch result.last {
        case "1":
            return "\(result) день"
        case "2","3","4":
            return "\(result) дня"
        case "0","5","6","7","8","9":
            return "\(result) дней"
        default: return ""
        }
    }
    func countOfCigarettes() -> String {
        return String(settings.packOfCigaretteCost * ((settings.cigarettePerDay * Int(secondHavePassed() / 86400) / settings.cigarettesInAPack))) + " \(settings.currency())"
    }
    func noSmoked() -> String {
        return String(settings.cigarettePerDay * Int(secondHavePassed() / 86400))
    }
    func secondHavePassed() -> Double {
        return Date().timeIntervalSince1970 - settings.dateOfQuitting.timeIntervalSince1970
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
