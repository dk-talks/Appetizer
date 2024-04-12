//
//  Appetizer.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 07/02/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable, Hashable {
    
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    let price: Double
    let calories: Int
    let carbs: Int
    let protein: Int
    
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sample = Appetizer(id: 001, name: "Appetizer Test", description: "This is a test appetizer", imageURL: "google.com", price: 69.000, calories: 23, carbs: 23, protein: 23)
    
    static let order2 = Appetizer(id: 002, name: "Appetizer Test 2", description: "This is a test appetizer", imageURL: "google.com", price: 69.000, calories: 23, carbs: 23, protein: 23)
    
    static let order3 = Appetizer(id: 003, name: "Appetizer Test 3", description: "This is a test appetizer", imageURL: "google.com", price: 69.000, calories: 23, carbs: 23, protein: 23)
    
    static let order1 = Appetizer(id: 001, name: "Appetizer Test 1", description: "This is a test appetizer", imageURL: "google.com", price: 69.000, calories: 23, carbs: 23, protein: 23)
    
    static var ordersArr = [order1, order2, order3]
    
    static var sampleArr = [sample, sample, sample, sample, sample]
}
