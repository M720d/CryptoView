//
//  TopMoversItemView.swift
//  Instant Cryptocurrency
//
//  Created by Dev Salvi on 29/12/22.
//

import SwiftUI
import Kingfisher

struct TopMoversItemView: View {
    let coin : Coin
    var body: some View {
        VStack(alignment: .leading){
            // image
            KFImage(URL(string: coin.image))
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
                .padding(.bottom,8)
            
            // coin info
            
            HStack(spacing : 2) {
                Text(coin.symbol.uppercased())
                    .font(.caption)
                    .fontWeight(.bold)
                Text("\(coin.currentPrice.toCurrencyString())")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            // coin change%
            Text("\(coin.priceChangePercentage24H.toPercentageString())")
                .font(.title)
                .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
        }
        .frame(width: 145, height: 140)
        .background(Color("backgroundColor"))
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color(.systemGray2),lineWidth: 2)
        )
    }
}

//struct TopMoversItemView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMoversItemView(coin:)
//    }
//}
