//
//  DetailViewModel.swift
//  MyGameKatalog
//
//  Created by Kevin Chilmi Rezhaldo on 14/07/22.
//

import Foundation

final class DetailViewModel {
    var error: ObservableObject<String?> = ObservableObject(nil)
    
    func getData() {
        NetworkService.shared.callingDetailAPI{ [weak self] success in
            self?.error.value = success ? nil : "Invalid Data"
            
        }
    }
    
}
