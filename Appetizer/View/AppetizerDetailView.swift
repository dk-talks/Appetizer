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
                AppetizerRemoteImage(urlString: appetizer.image)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 225)
                HeadingText(textName: appetizer.menuItem)
                    .padding(.bottom, 10)
                
                VStack {
                    HStack(spacing: 20) {
                        ServingSizeInfoView(name: "Serve Size", amount: appetizer.perServeSize)
                        NutiritionInfoView(name: "Energy (kCal)", amount: appetizer.energy)
                        NutiritionInfoView(name: "Protein (g)", amount: appetizer.protein)
                        
                    }
                    .padding(.bottom, 20)
                    
                    HStack(spacing: 20) {
                        NutiritionInfoView(name: "Total fat (g)", amount: appetizer.totalFat)
                        NutiritionInfoView(name: "Sat Fat (g)", amount: appetizer.saturatedFat)
                        NutiritionInfoView(name: "Trans fat (g)", amount: appetizer.transFat)
                    }
                    .padding(.bottom, 20)
                    
                    HStack(spacing: 20) {
                        NutiritionInfoView(name: "Chol (mg)", amount: appetizer.cholesterols)
                        NutiritionInfoView(name: "Carbs (g)", amount: appetizer.totalCarbohydrate)
                        NutiritionInfoView(name: "Sugars (g)", amount: appetizer.totalSugars)
                    }
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
            .frame(width: 330, height: 525)
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
    var amount: Double
    var body: some View {
        VStack {
            Text(name)
                .font(.subheadline)
                .fontWeight(.medium)
            Text("\(amount, specifier: "%.2f")")
                .font(.system(size: 16))
                .foregroundColor(.secondary)
                .italic()
        }
    }
}

struct ServingSizeInfoView: View {
    var name: String
    var amount: String
    
    var body: some View {
        VStack {
            Text(name)
                .font(.subheadline)
                .fontWeight(.medium)
            Text(amount)
                .font(.system(size: 16))
                .foregroundColor(.secondary)
                .italic()
        }
    }
}
