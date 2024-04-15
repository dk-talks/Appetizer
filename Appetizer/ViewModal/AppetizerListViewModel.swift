//
//  ViewModal.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 07/02/24.
//

import Foundation

class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers = [Appetizer]()
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var page = 1
    
    func getAppetizers() {
        isLoading = true
        NetworkManager.shared.getAppetizer(page: page) { [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                self.page += 1
                switch(result) {
                case .success(let appetizers):
                    
                    self.appetizers.append(contentsOf: appetizers)
                    
                case .failure(let error):
                    switch error {
                    case .invalidData:
                        self.alertItem = AlertContext.invalidData
                        
                    case .invalidURL:
                        self.alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        self.alertItem = AlertContext.invalidResponse
                        
                    case .unknownError:
                        self.alertItem = AlertContext.unknownError
                    }
                }
            }
        }
    }
}
