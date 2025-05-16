//
//  MyThoughtfulDiaryApp.swift
//  MyThoughtfulDiary
//
//  Created by David Kaplansky on 5/12/25.
//

import SwiftUI
import Firebase

@main
struct DiaryApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            OnboardingView()
        }
    }
}
