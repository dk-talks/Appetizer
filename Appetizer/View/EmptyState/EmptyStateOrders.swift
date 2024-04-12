//
//  EmptyStateOrders.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 26/02/24.
//

import SwiftUI

struct EmptyStateOrders: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            
            VStack {
                Image("empty-order")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200)
                Text("You have no item in Orders. \nPlease add an Appetizer!")
                    .multilineTextAlignment(.center)
                    .font(.title3)
                    .foregroundColor(.secondary)
                    .fontWeight(.bold)
            }
            .offset(CGSize(width: 0, height: -50))
        }
    }
}

struct EmptyStateOrders_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateOrders()
    }
}
