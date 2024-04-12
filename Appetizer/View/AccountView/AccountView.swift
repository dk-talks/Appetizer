//
//  AccountView.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 06/02/24.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var viewModel = AccountViewModel() 
    
    var body: some View {
        NavigationView {
            
            Form {
                Section {
                    TextField("First Name", text: $viewModel.user.firstName)
                    TextField("Last Name", text: $viewModel.user.secondName)
                    TextField("Email", text: $viewModel.user.email)
                        .keyboardType(.emailAddress)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(.never)
                    DatePicker("Date Of Birth", selection: $viewModel.user.dob, displayedComponents: .date)
                    Button {
                        viewModel.saveChanges()
                    } label: {
                        Text("Save Changes")
                    }
                } header: {
                    Text("Personal")
                }
                
                Section {
                    Toggle(isOn: $viewModel.user.extraNapkins) {
                        Text("Extra Napkins")
                    }
                    Toggle(isOn: $viewModel.user.frequetRefills) {
                        Text("Frequently Refills")
                    }
                } header: {
                    Text("Requests")
                }
            }
            .alert(item: $viewModel.alertItem, content: { alertItem in
                Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.alertButton)
            })
            .tint(.brandColor)
            .navigationTitle("Account")
        }
        .onAppear {
            viewModel.retrieveUser()
        }
        
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
