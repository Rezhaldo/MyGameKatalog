//
//  ViewController.swift
//  MyGameKatalog
//
//  Created by Kevin Chilmi Rezhaldo on 07/07/22.
//

import UIKit
import Alamofire
import Kingfisher

class ViewController: UIViewController {
    
    private let viewModel = GamesViewModel()
    
    

    @IBOutlet weak var tableViewGame: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewGame.dataSource = self
        tableViewGame.delegate = self
        
        tableViewGame.register(UINib(nibName: "GameTableViewCell", bundle: nil), forCellReuseIdentifier: "GamesCell")
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        setupBinders()
        viewModel.getData()
        

    }
    
    private func setupBinders() {
        viewModel.error.bind { [ weak self ] error in
            if let error = error {
                print(error)
            } else {
                self?.tableViewGame.reloadData()
//                self?.viewModel.getData()
            
            }
        }
    }


}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return gameData?.results.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "GamesCell", for: indexPath) as? GameTableViewCell {
            
            
            
            let data = gameData?.results[indexPath.row]
            let dataID = gameData?.results[indexPath.row]?.id
            
            UserDefaults.standard.set(dataID, forKey: "list_detail")
            
            let img = data?.backgroundImage
            let url = URL(string: "\(img!)")
            cell.labelTitleGame.text = data?.name
            cell.labelRating.text = "\(data?.rating ?? 0)"
            cell.labelReleaseDate.text = data?.released
            
            cell.imageViewGame.kf.setImage(with: url)
            
            
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "moveToDetail", sender: gameData?.results[indexPath.row])
        saveById = (gameData?.results[indexPath.row]?.id)!
        
        print("aasdasdasd",saveById)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToDetail" {
            if let detailVc = segue.destination as? DetailViewController {
                detailVc.game = sender as? Games
                
            }
            
        }
    }
}
