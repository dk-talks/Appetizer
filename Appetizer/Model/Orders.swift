//
//  Orders.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 06/04/24.
//

import Foundation

struct Orders {
    let orderId: UUID
    let name: String
    let contact: String
    let addresh: String
    let items: [Appetizer]
    let total: Int
    
}
