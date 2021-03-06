//
//  Binding.swift
//  xPriceButton
//
//  Created by liang wang on 27/8/20.
//

import Foundation
import Combine
import SwiftUI

// Modified from https://stackoverflow.com/questions/58363563/swiftui-get-notified-when-binding-value-changes

struct ChangeObserver<Base: View, Value: Equatable>: View {
    let base: Base
    let value: Value
    @State private var oldValue: Value?
    let action: (Value?,Value)->Void

    @State var model = Model()

    var body: some View {
        if model.update(value: value) {
            DispatchQueue.main.async {
                if (oldValue == nil || oldValue! == value) {
                    oldValue = value
                }
                self.action(self.oldValue,self.value)
            }
        }
        return base
    }

    class Model {
        private var savedValue: Value?
        func update(value: Value) -> Bool {
            guard value != savedValue else {
                return false
            }
            savedValue = value
            return true
        }
    }
}

extension View {
    func onChange<Value: Equatable>(of value: Value, perform action: @escaping (_ oldValue: Value?,_ newValue: Value)->Void) -> ChangeObserver<Self, Value> {
        ChangeObserver(base: self, value: value, action: action)
    }
}
