//
//  Tools.swift
//  Homeworkr IV
//
//  Created by Nicolas Legros on 2021-02-20.
//

import Foundation

// So optional strings can be in Textfields
extension Optional where Wrapped == String { var _bound: String? {
        get {
            return self
        }
        set {
            self = newValue
        }
    }
    public var bound: String {
        get {
            return _bound ?? ""
        }
        set {
            _bound = newValue.isEmpty ? nil : newValue
        }
    }
}

//func ??<T>(lhs: Binding<Optional<T>>, rhs: T) -> Binding<T> {
//    Binding(
//        get: { lhs.wrappedValue ?? rhs },
//        set: { lhs.wrappedValue = $0 }
//    )
//}
