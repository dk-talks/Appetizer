//
//  Appetizer.swift
//  Appetizer
//
//  Created by Dinesh Sharma on 07/02/24.
//

import Foundation

struct Appetizer: Decodable, Identifiable, Hashable {
    
    let id: Int
    let menuItem: String
    let price: Double
    let image: String
    let perServeSize: String
    let energy: Double
    let protein: Double
    let totalFat: Double
    let saturatedFat: Double
    let transFat: Double
    let cholesterols: Double
    let totalCarbohydrate: Double
    let totalSugars: Double
    let addedSugars: Double
    let sodium: Double
    
}

struct AppetizerResponse: Decodable {
    let request: [Appetizer]
}

struct MockData {
    
    static let sample = Appetizer(id: 1, menuItem: "Chowmeen", price: 2, image: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", perServeSize: "100 gm", energy: 1, protein: 1, totalFat: 1, saturatedFat: 1, transFat: 1, cholesterols: 1, totalCarbohydrate: 1, totalSugars: 1, addedSugars: 1, sodium: 1)
    
    static let order1 = Appetizer(id: 1, menuItem: "Chowmeen", price: 2, image: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", perServeSize: "100 gm", energy: 1, protein: 1, totalFat: 1, saturatedFat: 1, transFat: 1, cholesterols: 1, totalCarbohydrate: 1, totalSugars: 1, addedSugars: 1, sodium: 1)
    
    static let order2 = Appetizer(id: 1, menuItem: "Chowmeen", price: 2, image: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", perServeSize: "100 gm", energy: 1, protein: 1, totalFat: 1, saturatedFat: 1, transFat: 1, cholesterols: 1, totalCarbohydrate: 1, totalSugars: 1, addedSugars: 1, sodium: 1)
    
    static let order3 = Appetizer(id: 1, menuItem: "Chowwmeen", price: 2, image: "https://seanallen-course-backend.herokuapp.com/images/appetizers/asian-flank-steak.jpg", perServeSize: "100 gm", energy: 1, protein: 1, totalFat: 1, saturatedFat: 1, transFat: 1, cholesterols: 1, totalCarbohydrate: 1, totalSugars: 1, addedSugars: 1, sodium: 1)
    
    
    static var ordersArr = [order1, order2, order3]
    
    static var sampleArr = [sample, sample, sample, sample, sample]
}
