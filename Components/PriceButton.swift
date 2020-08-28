//
//  PriceButton.swift
//
//  Created by LW on 14/6/20.
//

import SwiftUI
import SwiftUIX

enum ButtonSource {
    case `default`
    case racing
    case horsing
}

enum ButtonTransitionStatus {
    case `default`
    case upTransient
    case downTransient
}

// MARK: - UI logic

struct PriceButton: View {
    @Binding var price: MPrice
    var source: ButtonSource = .default
    
    @Binding var selected: Bool
    @Binding var disabled: Bool

    @State private var transientStatus: ButtonTransitionStatus = .default
    
    @State private var dispatchWorkItem: DispatchWorkItem? //TODo

    var body: some View {
         ZStack {
            if self.transientStatus == .downTransient {
                Image(systemName: "arrowtriangle.down.fill").offset(x: 0, y: -11).font(.system(size: 11)).foregroundColor(Color.red)
            }

            Button(action: {
                self.didPriceButtonClicked()
            }) {
                FormattedPriceLabel(price: price).font(.system(size: 12))
                    .frame(width: 40, height: 20, alignment: .center)
            }
            .allowsHitTesting(!disabled)
            .buttonStyle(PriceButtonStyle(selected: selected, buttonStatus: transientStatus, disabled: disabled))

            if self.transientStatus == .upTransient {
                Image(systemName: "arrowtriangle.up.fill").offset(x: 0, y: 11).font(.system(size: 11)).foregroundColor(Color.green)
            }
         }.onChange(of: price) { (oldValue, newValue) in
            if let oldValue = oldValue {
                if newValue.odds.decimal > oldValue.odds.decimal {
                    withAnimation {
                        self.transientStatus = .upTransient
                    }
                } else if newValue.odds.decimal < oldValue.odds.decimal {
                    withAnimation {
                        self.transientStatus = .downTransient
                    }
                }
                
                if let dispatchWorkItem = self.dispatchWorkItem {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: dispatchWorkItem)
                }
                
            }
         }.onAppear {
            self.transientStatus = .default
            self.dispatchWorkItem = DispatchWorkItem(block: {
                transientStatus = .default
            })
         }
    }
}

extension PriceButton {
    func didPriceButtonClicked() {
        
        if disabled {
            return;
        }
        
        selected = !selected

        switch source {
        case .racing:
            racingSideEffect()
        default:
            horsingSideEffect()
        }
    }

    func racingSideEffect() {
    }

    func horsingSideEffect() {}
}

