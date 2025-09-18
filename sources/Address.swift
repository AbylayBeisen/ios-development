//
//  Address.swift
//  
//
//  Created by Abylai  on 02.10.2025.
//

import Cocoa

struct Address{
    let street: String
    let city: String
    let zipCode: String
    let country: String
    
    var formattedAddress: String {
        return """
            \(street)
            \(city), \(zipCode)
            \(country)
            """
    }
    init(street: String, city: String, zipCode: String, country: String) {
            self.street = street
            self.city = city
            self.zipCode = zipCode
            self.country = country
        }
}
