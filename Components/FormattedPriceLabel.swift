//
//  FormattedPriceLabel.swift
//
//  Created by LW on 14/6/20.
//

import SwiftUI

struct FormattedPriceLabel: View {
    var price: MPrice?
    var isSuspended = false
    var isResulted = false

    var body: some View {
        Text(self.isSuspended ? "SUS" : self.formattedPrice)
    }
}

extension FormattedPriceLabel {
    var odds: MOdds? {
        price?.odds
    }

    var noPriceText: String {
        // TODO: check frontend
        "TODO"
    }

    var formattedPrice: String {
        guard let odds = self.odds, self.isSuspended == false else { return self.noPriceText }
        return Format.ODDS(odds: odds)
    }
}

struct FormattedPriceLabel_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            FormattedPriceLabel(price: MPrice.generateRandom())
        }.previewLayout(.fixed(width: 400, height: 100))
    }
}
