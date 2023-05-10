//
//  Extensions.swift
//  SwiftUICharts
//
//  Created by Md. Yamin on 10.05.23.
//

import Foundation

extension String {
    func toDate() -> Date {
        var date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        date = dateFormatter.date(from: self) ?? Date()
        return date
    }
}

extension Date {
    func shortDay() -> String {
        return self.formatted(.dateTime.weekday(.abbreviated))
    }
}
