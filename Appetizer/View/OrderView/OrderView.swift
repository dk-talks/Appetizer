//
//  OrderView.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 06/02/24.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var order: Order
    @ObservedObject var viewModel = OrderViewModel()
    
    var body: some View {
        
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(order.items) {appetizer in
                            AppetizerListCell(appetizer: appetizer)
                        }
                        .onDelete { indexSet in
                            
                            order.items.remove(atOffsets: indexSet)
                        }
                    }
                    .listStyle(.plain)
                    Button {
                        print("ordered")
                        viewModel.orderNow(order: order)
                    } label: {
                        Text("$ \(order.totalPrice, specifier: "%.2f") - Add To Order")
                            .frame(width: 260, height: 50)
                            .background(Color.brandColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.bottom, 30)
                    }
                    
                    
                }
                if(order.items.isEmpty) {
                    EmptyStateOrders()
                }
            }
            .navigationTitle("📝 Orders")
            
            
            
        }
        
        
        
        
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
    }
}
