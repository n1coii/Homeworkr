//
//  FoundationExtension.swift
//  Homeworkr IV
//
//  Created by Nicolas Legros on 2021-02-20.
//

import Foundation

extension NSPredicate {
    static var all = NSPredicate(format: "TRUEPREDICATE")
    static var none = NSPredicate(format: "FALSEPREDICATE")
    static var open = NSPredicate(format: "isCompleted == %@", NSNumber(value: false))
}
