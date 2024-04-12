//
//  AppetizerDetailView.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 17/02/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    var appetizer: Appetizer
    @Binding var isShowingDetailView: Bool
    @EnvironmentObject var order: Order
    
    var body: some View {
            VStack() {
                AppetizerRemoteImage(urlString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
                HeadingText(textName: appetizer.name)
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding(.all)
                    
                HStack(spacing: 40) {
                    NutiritionInfoView(name: "Calories", amount: appetizer.calories)
                    NutiritionInfoView(name: "Proteins", amount: appetizer.protein)
                    NutiritionInfoView(name: "Carbs", amount: appetizer.carbs)
                }
                
                Spacer()
                
                Button {
                    order.add(appetizer)
                    isShowingDetailView = false
                } label: {
                    HeadingText(textName: "$\(appetizer.price) - Add to Order")
                        .frame(width: 260, height: 50)
                        .background(Color.brandColor)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.bottom, 30)
                }
                    
                    
            }
            .frame(width: 300, height: 525)
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(radius: 40)
            .overlay(alignment: .topTrailing) {
                Button {
                    isShowingDetailView = false
                } label: {
                    ZStack {
                        Circle()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .frame(width: 40, height: 40)
                        
                    }
                }
            }
            
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sample, isShowingDetailView: .constant(true))
    }
}

struct NutiritionInfoView: View {
    var name: String
    var amount: Int
    var body: some View {
        VStack {
            Text(name)
                .font(.subheadline)
                .fontWeight(.medium)
            Text("\(amount)")
                .font(.system(size: 16))
                .foregroundColor(.secondary)
                .italic()
        }
    }
}
