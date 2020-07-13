//
//  SettingsView.swift
//  Smoke less
//
//  Created by Александр Кондрашин on 01.07.2020.
//  Copyright © 2020 Alexander Kondrashin. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var settings : UserSettings
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Основное")) {
                    DatePicker(selection: $settings.dateOfQuitting, in: ...Date(), displayedComponents: [.date]) {
                        HStack {
                            Image(systemName: "calendar").foregroundColor(.red)
                            Text("Не курю с")
                        }
                    }
                }
                Section {
                    Stepper(value: $settings.cigarettePerDay, in: 1...50) {
                        HStack {
                            Text("Сигарет в день")
                            Spacer()
                            Text("\(settings.cigarettePerDay)").bold()
                        }
                    }
                    
                    Stepper(value: $settings.cigarettesInAPack, in: 1...100) {
                        HStack {
                            Text("Сигарет в пачке")
                            Spacer()
                            Text("\(settings.cigarettesInAPack)").bold()
                        }
                    }
                }
                Section {
                    Stepper(value: $settings.packOfCigaretteCost, in: 1...500) {
                        HStack {
                            Image(systemName: "dollarsign.circle.fill").foregroundColor(.yellow)
                            Text("Пачка стоит")
                            Spacer()
                            Text("\(settings.packOfCigaretteCost)").bold()
                        }
                    }
                    VStack {
                        HStack {
                            Image(systemName: "coloncurrencysign.square").foregroundColor(.green)
                            Text("Валюта")
                            Spacer()
                        }
                        Picker(selection: $settings.selectedCurrency, label: Text("Валюта")) {
                                Text("₽").tag(1)
                                Text("$").tag(2)
                                Text("€").tag(3)
                            } .pickerStyle(SegmentedPickerStyle())
                        }
                }
                
                Section {
                    Toggle(isOn: $settings.alertsOn) {
                        HStack {
                            Image(systemName: "bell.circle.fill")
                                .foregroundColor(.red)
                            Text("Допуск уведомлений")
                        }
                    }
                }
            }.navigationBarTitle("Настройки",displayMode: .large)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
//
//struct DateOfQuittingPicker: View {
//    @Binding var date:Date
//    var body: some View {
//        DatePicker(selection: $date, in: ...Date(), displayedComponents: [.date,.hourAndMinute]) {
//            Text("Не курю с")
//        }
//
//    }
//}
