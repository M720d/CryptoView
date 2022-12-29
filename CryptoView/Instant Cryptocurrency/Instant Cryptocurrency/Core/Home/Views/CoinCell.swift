//
//  CoinCell.swift
//  Instant Cryptocurrency
//
//  Created by Dev Salvi on 29/12/22.
//

import SwiftUI
import Kingfisher

struct CoinCell: View {
    let coin : Coin
    var body: some View {
        
        HStack {
            
            // market cap rank
            Text("\(coin.marketCapRank ?? 1)") //\(coin.marketCapRank ?? 1)
                .font(.caption)
                .foregroundColor(.gray)
            
            //image
            KFImage(URL(string: coin.image))
                .resizable()
                .scaledToFit()
                .frame(width: 32, height: 32)
                .foregroundColor(.orange)
            
            // left side info
            VStack(alignment: .leading,spacing: 4) {
                
                Text(coin.name) //coin.name
                    .font(.subheadline)
                    .fontWeight(.bold)
                    .padding(.leading,4)
                
                Text(coin.symbol.uppercased())//coin.symbol.uppercased()
                    .font(.caption)
                    .padding(.leading,6)
            }.padding(.leading,2)

            Spacer()
            
            // right side info
            VStack(alignment: .trailing,spacing: 4){
                Text("\(coin.currentPrice.toCurrencyString())")//\(coin.currentPrice)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding(.leading,4)
                
                Text("\(coin.priceChangePercentage24H.toPercentageString())") //\(coin.priceChangePercentage24H)
                    .font(.caption)
                    .foregroundColor(coin.priceChangePercentage24H > 0 ? .green : .red)
                    .padding(.leading,6)
                
            }

        }
        .padding(.horizontal)
        .padding(.vertical,4)
        //        .frame(width: 430, height: 45)

    }
}

//struct CoinCell_Previews: PreviewProvider {
//    static var previews: some View {
//        CoinCell(coin: Coin())
//    }
//}
