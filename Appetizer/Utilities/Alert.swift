//
//  Alert.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 07/02/24.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let alertButton: Alert.Button
}

struct AlertContext {
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("Data recieved is not correct, Please contact support"),
                                       alertButton: .default(Text("OK")))
    
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                       message: Text("Issue from our side, Please contact support."),
                                       alertButton: .default(Text("OK")))
    
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                       message: Text("Response is not correct, Please try after some time."),
                                       alertButton: .default(Text("OK")))
    
    static let unknownError = AlertItem(title: Text("Connection Error"),
                                       message: Text("Please check your internet connection"),
                                       alertButton: .default(Text("OK")))
    
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                       message: Text("Please fill all details in form required"),
                                       alertButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Email is invalid"),
                                       message: Text("Please check your email Address"),
                                       alertButton: .default(Text("OK")))
    
    static let savedSuccessfully = AlertItem(title: Text("Saved Successfully"),
                                       message: Text("Hurray! Your Account Details are Saved Successfully."),
                                       alertButton: .default(Text("OK")))
    
    static let internalFormError = AlertItem(title: Text("Internal Error!"),
                                           message: Text("Please try after some time. This is on us!"),
                                           alertButton: .default(Text("OK")))
    
    static let allDataFetched = AlertItem(title: Text("End of List!"),
                                           message: Text("No more Appetizers are available!"),
                                           alertButton: .default(Text("OK")))
    
}
