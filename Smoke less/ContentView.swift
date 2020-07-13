//
//  ContentView.swift
//  Smoke less
//
//  Created by Александр Кондрашин on 30.06.2020.
//  Copyright © 2020 Alexander Kondrashin. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
    
            TabView {
                MainView().tabItem {
                    Image(systemName: "person.fill")
                    Text("Статистика")
                }
                SettingsView().tabItem {
                    Image(systemName: "gear")
                    Text("Настройки")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
