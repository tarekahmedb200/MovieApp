//
//  Int.swift
//  MovieApp
//
//  Created by tarek ahmed on 01/08/2024.
//

import Foundation

extension Int {
    func convertMinutesToHours() -> (hours: Int, remainingMinutes: Int) {
        let hours = self / 60
        let remainingMinutes = self % 60
        return (hours, remainingMinutes)
    }
}
