//
//  FirebaseManager.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 06/04/24.
//

import Foundation
import Firebase

final class FirebaseManager {
    static let shared = FirebaseManager()
    let databaseRef = Database.database().reference()

    func addOrderToFirebase(name: String, totalBill: Double, orderNames: [String]) {
        let orderData: [String: Any] = [
            "name": name,
            "totalBill": totalBill,
            "orderNames": orderNames
        ]

        databaseRef.child("orders").childByAutoId().setValue(orderData) { error, _ in
            if let error = error {
                print("Error adding order to Firebase: \(error.localizedDescription)")
            } else {
                print("Order added successfully to Firebase")
            }
        }
    }
}
