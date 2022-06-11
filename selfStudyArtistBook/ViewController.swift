//
//  ViewController.swift
//  selfStudyArtistBook
//
//  Created by Ömer Faruk Kılıçaslan on 11.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var artistImage = [UIImage]()
    var artistName = [String]()
    var selectedArtistName = ""
    var selectedArtistImage = UIImage()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Artist BOOK"
        
        tableView.delegate = self
        tableView.dataSource = self
        
        artistName.append("Drake")
        artistName.append("Travis Scott")
        artistName.append("XXXTentacion")
        
        artistImage.append(UIImage(named: "drake")!)
        artistImage.append(UIImage(named: "traviss")!)
        artistImage.append(UIImage(named: "xxxTent")!)
        
        
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetailVC" {
            let detailVC = segue.destination as! DetailViewController
            detailVC.targetArtistImage = selectedArtistImage
            detailVC.targetArtistName = selectedArtistName
        }
    }


}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return artistName.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        cell.textLabel?.text = artistName[indexPath.row]
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedArtistName = artistName[indexPath.row]
        selectedArtistImage = artistImage[indexPath.row]
        
        performSegue(withIdentifier: "toDetailVC", sender: nil)
        
    }
}
