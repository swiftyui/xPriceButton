//
//  Odds.swift
//
//  Created by LW on 14/6/20.
//

import Foundation

protocol PMock {
    associatedtype DemoReturnType
    static func generateRandom() -> DemoReturnType
}


struct MOdds: Codable, PMock {
    var decimal: Float

    static func generateRandom() -> MOdds {
        let random = UInt.random(in: 0 ... 100)
        let odds = MOdds(decimal: 1 + Float(random))
        return odds
    }
}

struct MPrice: Codable, PMock, Equatable {
    static func == (lhs: MPrice, rhs: MPrice) -> Bool {
        lhs.odds.decimal == rhs.odds.decimal
    }
    
    var odds: MOdds
    var key: String?

    static func generateRandom() -> MPrice {
        let key = "testId"
        return MPrice(odds: MOdds.generateRandom(), key: key)
    }
}
