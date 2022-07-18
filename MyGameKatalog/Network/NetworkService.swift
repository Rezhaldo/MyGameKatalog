//
//  NetworkService.swift
//  MyGameKatalog
//
//  Created by Kevin Chilmi Rezhaldo on 12/07/22.
//

import Foundation
import Alamofire

var gameData: GamesResponse?
var detailData: DetailResponse?

final class NetworkService {
    static let shared = NetworkService()
    
    private init() { }
    
    func callingGamesAPI(completion: @escaping(Bool) -> Void) {
        let apiKey = "b77a0f797e7c4757b100ee319ffc97a3"
        var components = URLComponents(string: "https://api.rawg.io/api/games?key=")!
        
        components.queryItems = [
            URLQueryItem(name: "api_key", value: apiKey)
        ]
        
//        let request = URLRequest(url: components.url!)
//        let request2 = URL(string: "\(components.url!)")
        
        let gameUrl = URL(string: "https://api.rawg.io/api/games?key=b77a0f797e7c4757b100ee319ffc97a3")
        

        
        AF.request(gameUrl!, method: .get).response (completionHandler: { response in
            guard let data = response.data else { return }
            
            do {
                let decoder = JSONDecoder()
                let gameResponse = try? decoder.decode(GamesResponse.self, from: data)
                print("Get DATA: \(gameResponse!)")
                gameData = gameResponse
                
                print("GAMEIDDDD: \(dede!)")
                if response.response?.statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        })
        
        
    }
    
    func callingDetailAPI(completion: @escaping(Bool) -> Void) {
//        let detailGame = UserDefaults.standard.string(forKey: "detail_id")
        let listDetail = UserDefaults.standard.string(forKey: "list_detail")
        let detailUrl = URL(string: "https://api.rawg.io/api/games/\(saveById)?key=b77a0f797e7c4757b100ee319ffc97a3")
        
        AF.request(detailUrl!, method: .get).response(completionHandler: { response in
            guard let data = response.data else { return }
            
            do {
                let decoder = JSONDecoder()
                let detailResponse = try? decoder.decode(DetailResponse.self, from: data)
                detailData = detailResponse
                print("dededede: \(listDetail) \(detailResponse)")
                if response.response?.statusCode == 200 {
                    completion(true)
                } else {
                    completion(false)
                }
            }
        })
    }
    
}
