//
//  Appetizer.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 06/02/24.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var viewModel = AppetizerListViewModel()
    @State var alert: AlertItem?
    @State var isShowingDetailView: Bool = false
    @State var selectedAppetizer: Appetizer?
    @State var hasLoaded: Bool = false
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List(viewModel.appetizers) { appetizer in
                        AppetizerListCell(appetizer: appetizer)
                            .onTapGesture {
                                isShowingDetailView = true
                                selectedAppetizer = appetizer
                            }
                        
                    }
                    
                    Button {
                        viewModel.getAppetizers()
                    } label: {
                        Text("Fetch More")
                            .frame(width: 260, height: 50)
                            .background(Color.brandColor)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.bottom, 30)
                    }
                    .disabled(viewModel.isDataFinished)
                    
                }
                
                .navigationTitle("🍟 Apetizer")
                .disabled(isShowingDetailView)
            }
            .blur(radius: isShowingDetailView ? 15 : 0)
            
            
            if(isShowingDetailView) {
                AppetizerDetailView(appetizer: selectedAppetizer!, isShowingDetailView: $isShowingDetailView)
            }
            if viewModel.isLoading {
                LoadingView()
            }
        }
        
        
        .onAppear {
            if(!hasLoaded) {
                viewModel.getAppetizers()
                hasLoaded = true
            }
            
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.alertButton)
        }
        
    }
    
}

struct Appetizer_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}


