//
//  HomeViewModel.swift
//  Instant Cryptocurrency
//
//  Created by Dev Salvi on 29/12/22.
//

import Foundation

class HomeViewModel :ObservableObject {
    @Published var coins = [Coin]()
    @Published var topMovingCoins = [Coin]()
    var timer = Timer()
    
    init(){
        fetchCoinData()
//        scheduledTimerWithTimeInterval()
    }
    
    func scheduledTimerWithTimeInterval(){
        // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: Selector(("fetchCoinData")), userInfo: nil, repeats: true)
    }
    
    func fetchCoinData(){
        
        let urlString = "https://api.coingecko.com/api/v3/coins/markets?vs_currency=inr&order=market_cap_desc&per_page=100&page=1&sparkline=false"
        
        guard let url = URL(string: urlString)
        else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            // if we get an error then we print the error and stop the function
            if let error = error {
                print("Debug : \(error.localizedDescription)")
                return
            }
            
            // checking the response
            if let response = response as? HTTPURLResponse{
                print("Response Code : \(response.statusCode)")
            }
            
            // if we do not get the data stop the function
            guard let data = data else {
                return
            }
            
            do{
                let coins = try JSONDecoder().decode([Coin].self, from: data)
                
                //                print("DEBUG : \(coins)")
                DispatchQueue.main.async { // you need to update it in main thread!
                    self.coins=coins
                    self.configureTopMovingCoins()
                }
            }catch let error{
                print("Falied to Decode with error : \(error.localizedDescription)")
            }
            //             let dataAsString = String(data: data, encoding: .utf8)
            //             print("Debug data : \(dataAsString)")
            //             print("Debug data : \(data)")
            
            
            
            
        }.resume()
    }
    
    func configureTopMovingCoins(){
        let topMovers = coins.sorted(by:{ $0.priceChangePercentage24H>$1.priceChangePercentage24H})
        self.topMovingCoins = Array(topMovers.prefix(5))
        
    }
}
