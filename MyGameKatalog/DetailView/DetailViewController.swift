//
//  DetailViewController.swift
//  MyGameKatalog
//
//  Created by Kevin Chilmi Rezhaldo on 13/07/22.
//

import UIKit
import Kingfisher

var saveById = Int()

class DetailViewController: UIViewController {
    
    var viewModel = DetailViewModel()
    var game: Games? = nil
    var detail: DetailResponse? = nil

    @IBOutlet weak var imageViewGame: UIImageView!
    @IBOutlet weak var labelReleasedDate: UILabel!
    @IBOutlet weak var labelCurrentRating: UILabel!
    @IBOutlet weak var labelTopRating: UILabel!
    @IBOutlet weak var labelDescription: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = game?.name
        navigationItem.largeTitleDisplayMode = .never
        
        setupBinders()
        viewModel.getData()
        
        if let data = game {
            labelReleasedDate.text = data.released
            labelCurrentRating.text = "\(data.rating)/"
            labelTopRating.text = "\(data.ratingTop)"
            
            let img = data.backgroundImage
            let url = URL(string: "\(img)")
            imageViewGame.kf.setImage(with: url)
        }
    }
    
    private func setupBinders() {
        viewModel.error.bind{ [ weak self ] error in
            if let error = error {
                print(error)
            } else {
//                self?.viewModel.getData()
                let data = detailData?.descriptionRaw
                self?.labelDescription.text = data
            }
        }
    }
    
    func setData(data: Games) {
        
    }

}
