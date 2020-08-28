//
//  Base.swift
//
//  Created by LW on 14/6/20.
//

import Foundation

protocol PMock {
    associatedtype DemoReturnType
    static func getMock() -> DemoReturnType
}

enum ZIndex: Double {
    case navigationBar = 1000
}
