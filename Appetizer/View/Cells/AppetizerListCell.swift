//
//  AppetizerListCell.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 26/02/24.
//

import SwiftUI

struct AppetizerListCell: View {
    var appetizer: Appetizer
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 80)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 5) {
                HeadingText(textName: appetizer.name)
                Text("$ \(appetizer.price, specifier: "%.2f")")
                    .font(.body)
                    .foregroundColor(Color(.darkGray))
            }
        }
    }
}

struct AppetizerListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListCell(appetizer: MockData.sample)
    }
}
