//
//  OnboardingPage.swift
//  MyThoughtfulDiary
//
//  Created by David Kaplansky on 5/16/25.
//

import SwiftUI

struct OnboardingPage: View {
    var title: String
    var description: String
    var imageName: String

    var body: some View {
        VStack(spacing: 20) {
            Text(title)
                .font(.custom("IndieFlower", size: 28))
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding()

            Text(description)
                .font(.custom("IndieFlower", size: 17))
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
        .frame(maxWidth: 500) // ✅ Prevents stretching on large screens
        .padding()
        .frame(maxHeight: .infinity, alignment: .center) // ✅ Centers content vertically
    }
}
