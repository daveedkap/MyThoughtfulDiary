//
//  OnboardingView.swift
//  MyThoughtfulDiary
//
//  Created by David Kaplansky on 5/16/25.
//

import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @State private var goToHome = false

    var body: some View {
        NavigationStack {
            ZStack {
                // 🔽 Cozy textured background
                Image("onboardingBackground")
                    .resizable()
                    .ignoresSafeArea()

                // 🔽 Use GeometryReader to constrain layout
                GeometryReader { geo in
                    TabView(selection: $currentPage) {
                        OnboardingPage(
                            title: "You have received today’s question!",
                            description: "Answer the daily question to increase your streak and keep a record of your growth.",
                            imageName: "envelope"
                        )
                        .tag(0)

                        OnboardingPage(
                            title: "Meet Penny ✍️",
                            description: "Penny is your personal reflection buddy. Ask them to remind you of good days, tough lessons, or growth you’ve made.",
                            imageName: "brain.head.profile"
                        )
                        .tag(1)

                        LoginView {
                            goToHome = true
                        }
                        .tag(2)
                    }
                    .frame(width: geo.size.width, height: geo.size.height) // 🔑 prevent layout overflow
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .interactive)) // 🔥 transparent dot background
                }
            }
            .navigationDestination(isPresented: $goToHome) {
                HomeView()
            }
        }
    }
}
