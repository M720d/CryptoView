//
//  TopMoversView.swift
//  Instant Cryptocurrency
//
//  Created by Dev Salvi on 29/12/22.
//

import SwiftUI

struct TopMoversView: View {
    @StateObject var viewModel : HomeViewModel
    
    var body: some View {
        VStack(alignment: .leading){
            Text("Top Movers")
                .font(.headline)
                .fontWeight(.heavy)
            
            ScrollView(.horizontal){
                HStack(spacing: 15){
                    ForEach(viewModel.topMovingCoins) { coin in
                        TopMoversItemView(coin: coin)
                    }
                }
            }
            
        }.padding()
    }
}

struct TopMoversView_Previews: PreviewProvider {
    static var previews: some View {
        TopMoversView(viewModel: HomeViewModel())
    }
}
