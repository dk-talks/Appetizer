//
//  AccoutViewModel.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 25/02/24.
//

import SwiftUI

class AccountViewModel: ObservableObject {
    
    @Published var user = User()
    @AppStorage("user") private var userData: Data?
    @Published var alertItem: AlertItem?
    
    
    func saveChanges() {
        if(isFormValid()) {
            let encoder = JSONEncoder()
            do {
                Global.user = user
                let data = try encoder.encode(user)
                userData = data
                alertItem = AlertContext.savedSuccessfully
            } catch {
                alertItem = AlertContext.internalFormError
            }
        }
    }
    
    func retrieveUser() {
        guard userData != nil else {
            print("no data found")
            return
        }
        let decoder = JSONDecoder()
        do {
            user = try decoder.decode(User.self, from: userData!)
            Global.user = user
        } catch {
            print("cannot decode data form app strage")
            debugPrint("cannot decode data form app strage")
        }
    }
    
    func isFormValid() -> Bool {
        guard !user.firstName.isEmpty && !user.secondName.isEmpty else {
            alertItem = AlertContext.invalidForm
            return false
        }
        
        guard user.email.isValidEmail() else {
            alertItem = AlertContext.invalidEmail
            return false
        }
        
        return true
        
    }
    
    
    
    
}
