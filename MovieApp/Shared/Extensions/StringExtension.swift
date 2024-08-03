//
//  StringExtension.swift
//  SwiftTypesExtensions
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation

extension String {
    
    public func toDate() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        
        return dateFormatter.date(from: self)
    }
    
}
