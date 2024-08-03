//
//  DateExtension.swift
//  SwiftTypesExtensions
//
//  Created by tarek ahmed on 30/07/2024.
//

import Foundation

extension Date {
    
    public func toString() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        return dateFormatter.string(from: self)
    }
    
    public func convertToUTC3() -> Date? {
        let calendar = Calendar.current
        let twoHours = DateComponents(hour: 3)
        return calendar.date(byAdding: twoHours, to: self)
    }
    
}
