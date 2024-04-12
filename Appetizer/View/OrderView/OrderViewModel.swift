//
//  OrderViewModel.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 06/04/24.
//

import Foundation
import FirebaseDatabase

class OrderViewModel: ObservableObject {
    
    func orderNow(order: Order) {
        if(Global.user.firstName != "") {
            var allOrder: [String] = []
            for item in order.items {
                allOrder.append(item.name)
            }
            
            FirebaseManager.shared.addOrderToFirebase(name: Global.user.firstName, totalBill: order.totalPrice, orderNames: allOrder)
        } else {
            print("user is not logged in yet")
        }
    }
}
