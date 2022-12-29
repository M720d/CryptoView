//
//  HomeView.swift
//  Instant Cryptocurrency
//
//  Created by Dev Salvi on 29/12/22.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    var body: some View {
        
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                // top movers
                TopMoversView(viewModel: viewModel)
                
                Divider()
                // all coins
                AllCoinsView(viewModel: viewModel) // viewModel: viewModel
            }
            .navigationTitle("Live Prices")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
