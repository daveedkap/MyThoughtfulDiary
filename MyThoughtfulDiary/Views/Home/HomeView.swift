//
//  HomeView.swift
//  MyThoughtfulDiary
//
//  Created by David Kaplansky on 5/12/25.
//

import SwiftUI

struct HomeView: View {
    @State private var journalText = ""
    @State private var saveStatus = ""
    private let firebaseService = FirebaseService()

    var body: some View {
        VStack(spacing: 20) {
            Text("Today's Prompt:")
                .font(.title2)
                .bold()

            Text("What are you grateful for today?")
                .padding()
                .background(Color.yellow.opacity(0.2))
                .cornerRadius(10)

            TextEditor(text: $journalText)  // ✅ Use the @State binding
                .frame(height: 200)
                .border(Color.gray, width: 1)
                .padding()

            Button("Save Entry") {
                firebaseService.saveJournalEntry(text: journalText) { error in
                    if let error = error {
                        saveStatus = "❌ Error: \(error.localizedDescription)"
                    } else {
                        saveStatus = "✅ Entry saved!"
                        journalText = ""  // Clear after save
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(10)
            
            if !saveStatus.isEmpty {
                Text(saveStatus)
                    .font(.caption)
                    .foregroundColor(saveStatus.contains("Error") ? .red : .green)
            }
        }
        .padding()
    }
}
