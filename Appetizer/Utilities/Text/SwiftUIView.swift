//
//  SwiftUIView.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 17/02/24.
//

import SwiftUI

struct HeadingText: View {
    var textName: String
    var body: some View {
        Text(textName)
            .font(.title2)
            .fontWeight(.medium)
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingText(textName: "dummy text")
    }
}
