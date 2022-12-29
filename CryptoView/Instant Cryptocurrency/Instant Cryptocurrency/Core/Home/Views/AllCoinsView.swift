//
//  AllCoinsView.swift
//  Instant Cryptocurrency
//
//  Created by Dev Salvi on 29/12/22.
//

import SwiftUI

struct AllCoinsView: View {
    @StateObject var viewModel : HomeViewModel
    var body: some View {
        VStack(alignment:.leading) {
            Text("All Coins")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
                
                
            HStack{
                Text("Coins")
                
                Spacer()
                
                Text("Prices")
            }
            .padding(.horizontal)
            .foregroundColor(.gray)
            .font(.caption)
            
            ScrollView{
                VStack {
                    ForEach(viewModel.coins) { coin in
                        CoinCell(coin: coin) //coin: coin
                    }
                }
            }
        }
        
    }
}

struct AllCoinsView_Previews: PreviewProvider {
    @StateObject var viewModel : HomeViewModel
    static var previews: some View {
        AllCoinsView(viewModel: HomeViewModel())
    }
}

