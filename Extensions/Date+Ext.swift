//
//  Date+Ext.swift
//  GithubApp
//
//  Created by Enes Sancar on 16.08.2023.
//

import UIKit

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM yyyy"
        return dateFormatter.string(from: self)
    }
}
