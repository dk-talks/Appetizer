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
    @Published var offset = 0
    @Published var limit = 10
    @Published var page = 0;
    @Published var isDataFinished = false
    
    func getAppetizers() {
        /*
        if page > 10 {
            self.alertItem = AlertContext.allDataFetched
            self.isDataFinished = true
            return
        }
         */
        
        isLoading = true
        NetworkManager.shared.getAppetizer(for: Appetizer.self, offset: offset, limit: limit) { [self] result in
            DispatchQueue.main.async {
                self.isLoading = false
                self.page += 1
                self.offset += 1
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
