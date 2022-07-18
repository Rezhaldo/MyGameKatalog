//
//  DashboardNetwork.swift
//  MyGameKatalog
//
//  Created by Kevin Chilmi Rezhaldo on 07/07/22.
//

import Foundation

//let apiKey = "b77a0f797e7c4757b100ee319ffc97a3"
//
//
//
//func CallingGamesAPI(completion: ((Games) -> Void)?) {
//    var components = URLComponents(string: "https://api.rawg.io/api/games?key=")!
//
//    components.queryItems = [
//        URLQueryItem(name: "api_key", value: apiKey)
//    ]
//
//    let request = URLRequest(url: components.url!)
//
//    let task = URLSession.shared.dataTask(with: request) { data, response, error in
//        guard let response = response as? HTTPURLResponse, let data = data else { return }
//
//        if response.statusCode == 200 {
//            let decoder = JSONDecoder()
//            let response = try? decoder.decode(Games.self, from: data)
//            print(response as Any)
//            print("YOOOO: \(response)")
//
//
//        } else {
//            print("ERROR: \(data), Http Status: \(response.statusCode)")
//        }
//    }
//
//    task.resume()
//}

struct Const {
    static let apiKey = "b77a0f797e7c4757b100ee319ffc97a3"
    static let baseUrl = "https://api.rawg.io/api/games?key="
    static let gameList = "https://api.rawg.io/api/games?key=\(apiKey)"
    
    struct GameCredential {
        static let gameID = "gameID"
    }
    
}

protocol CredentialProtocol {
    func saveCredential(response: Games)
    func gettingGameId() -> String
}

protocol DetailServiceProtocol {
    func detail(completion: @escaping (DetailResponse?) -> Void)
}

class Credential: CredentialProtocol {
    
    let defaults = UserDefaults.standard
    
    func saveCredential(response: Games) {
        defaults.set(response.id, forKey: Const.GameCredential.gameID)
    }
    
    func gettingGameId() -> String {
        guard let detailGameById = defaults.string(forKey: Const.GameCredential.gameID) else { return ""}
        
        return detailGameById
    }
    
    
}

