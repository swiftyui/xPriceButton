//
//  ContentView.swift
//  xPriceButton
//
//  Created by liang wang on 27/8/20.
//

import SwiftUI

struct ContentView: View {
    @State private var  normalPrice: MPrice = MPrice.generateRandom()
    @State private var  selectedPrice: MPrice = MPrice.generateRandom()
    @State private var  transientPrice: MPrice = MPrice.generateRandom()
    
    @State private var  selected: Bool = false
    
    var body: some View {

        VStack(alignment: .leading) {
            Text("Unselected (Disabled)")
            PriceButton(price: $normalPrice, selected: .constant(false), disabled: .constant(true))

            
            Text("Always Selected").padding(.top, 20)
            PriceButton(price: $selectedPrice, selected: .constant(true),disabled: .constant(false))
            
            Text("From Unselected to Selected After 2 Seconds").padding(.top, 20)
            PriceButton(price: $selectedPrice, selected: $selected,disabled: .constant(false))
            
            Text("Price Up/Down Auto Infinite Loop").padding(.top, 20)
            PriceButton(price: $transientPrice, selected: $selected,disabled: .constant(false))
        }.onAppear(perform: {

            Timer.scheduledTimer(withTimeInterval: 4, repeats: true) {_ in
                transientPrice = MPrice.generateRandom()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                selected = !selected
            }


        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
