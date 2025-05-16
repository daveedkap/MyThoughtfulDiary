//
//  UserEntry.swift
//  MyThoughtfulDiary
//
//  Created by David Kaplansky on 5/12/25.
//

import Foundation
import FirebaseFirestore

struct UserEntry {
    var id: String?
    var userId: String
    var date: Date
    var text: String

    func toDictionary() -> [String: Any] {
        return [
            "userId": userId,
            "date": Timestamp(date: date),
            "text": text
        ]
    }
}
