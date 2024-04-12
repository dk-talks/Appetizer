//
//  LoadingVie.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 16/02/24.
//

import SwiftUI

struct ActivityIndicatorView: UIViewRepresentable {
    func updateUIView(_ uiView: UIViewType, context: Context) {
    }
    
    
    func makeUIView(context: Context) -> some UIView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = UIColor.brandColor
        activityIndicator.startAnimating()
        return activityIndicator
    }
}

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .ignoresSafeArea(.all)
            ActivityIndicatorView()
        }
        
    }
}
