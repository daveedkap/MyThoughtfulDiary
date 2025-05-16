//
//  FirebaseService.swift
//  MyThoughtfulDiary
//
//  Created by David Kaplansky on 5/12/25.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth

class FirebaseService {
    private let db = Firestore.firestore()

    func saveJournalEntry(text: String, completion: @escaping (Error?) -> Void) {
        guard let user = Auth.auth().currentUser else {
            completion(NSError(domain: "No user signed in", code: 401))
            return
        }

        let entryData: [String: Any] = [
            "userId": user.uid,
            "date": Timestamp(date: Date()),
            "text": text
        ]

        db.collection("users")
            .document(user.uid)
            .collection("entries")
            .addDocument(data: entryData) { error in
                completion(error)
            }
    }
}
