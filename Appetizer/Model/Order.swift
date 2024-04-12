//
//  Order.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 26/02/24.
//

import SwiftUI

final class Order: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    var totalPrice: Double {
        var price : Double = 0
        for item in items {
            price += item.price
        }
        return price
    }
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    func remove(at indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }

    
}

