//
//  Date+Format.swift
//  RepoBrowser
//
//  Created by Tomasz Studziński on 17/06/2019.
//

import Foundation
extension Date {
    func dateAndTimetoString(format: String = "dd.MM.yyyy HH:mm") -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
