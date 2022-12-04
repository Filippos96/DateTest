//
//  ContentView.swift
//  DateTest
//
//  Created by Harry Karl Filip Karlsson on 2022-12-04.
//

import SwiftUI

struct ContentView: View {
    @State var dayDetails: String = "Hello World"
    @State var appDeligate = AppDelegate()
    @State var text: String = "what?"
    
        var body: some View {
            Text(dayDetails)
                .padding()
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.significantTimeChangeNotification), perform: { _ in
                    dayDetails = "Day has changed"
                })
            
            Text(text)
                    .onReceive(NotificationCenter.default.publisher(for: Notification.Name.NSCalendarDayChanged)) { _ in
                        text = "Day has changed2"
                    }
                }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {
    @objc func timeChanged() {
            print("App Time Changed")
        }
    
    func application(_ application: UIApplication, significantTimeChangeNotification launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Your code here")
        
        
        
        return true
    }
    func tajm(){
        NotificationCenter.default.addObserver(self, selector: #selector(timeChanged), name: UIApplication.significantTimeChangeNotification , object: nil)
        
    }
}
