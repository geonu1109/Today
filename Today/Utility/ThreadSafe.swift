//
//  ThreadSafe.swift
//  Today
//
//  Created by Geonu Jeon on 2021/06/09.
//

import Foundation

@propertyWrapper
struct ThreadSafe<Value> {
    private let dispatchQueue: DispatchQueue = .global()
    
    private var _wrappedValue: Value
    var wrappedValue: Value {
        get {
            return self.dispatchQueue.sync {
                return self._wrappedValue
            }
        }
        set {
            self.dispatchQueue.sync {
                self._wrappedValue = newValue
            }
        }
    }
    
    init(wrappedValue: Value) {
        self._wrappedValue = wrappedValue
    }
}
