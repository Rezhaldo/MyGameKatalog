//
//  DetailNetwork.swift
//  MyGameKatalog
//
//  Created by Kevin Chilmi Rezhaldo on 14/07/22.
//

import Foundation

class DetailService: DetailServiceProtocol {
    
    private var urlSession: URLSession
    private var detailUrlString: String
    let credential = Credential()
    
    init(detailUrlString: String, urlSession: URLSession = .shared) {
        self.detailUrlString = detailUrlString
        self.urlSession = urlSession
    }
    
    func detail(completion: @escaping (DetailResponse?) -> Void) {
        guard let url = URL(string: detailUrlString) else {
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue(credential.gettingGameId(), forHTTPHeaderField: "Authorization")
        
    }
    
}
