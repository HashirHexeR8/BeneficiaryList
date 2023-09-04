//
//  Utilities.swift
//  BeneficiaryList
//
//  Created by Muhammad Hashir on 9/4/23.
//

import Foundation

struct Utilities {
    /// Format date from given format to MMM d, yyyy
    static func formatDate(from dateStr: String) -> String {
        let fromFormatter = DateFormatter()
        fromFormatter.dateFormat = "MMddyyyy"

        let toFormatter = DateFormatter()
        toFormatter.dateFormat = "MMM d, yyyy"

        guard let date = fromFormatter.date(from: dateStr) else { return dateStr }

        return toFormatter.string(from: date)
    }
}
