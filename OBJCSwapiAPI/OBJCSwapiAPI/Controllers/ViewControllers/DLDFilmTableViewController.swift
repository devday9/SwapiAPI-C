//
//  DLDFilmTableViewController.swift
//  OBJCSwapiAPI
//
//  Created by Deven Day on 10/1/20.
//

import UIKit

class DLDFilmTableViewController: UITableViewController {
    
    //MARK: - Properties
    var fetchedFilms: [DLDFilms] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchFilms()
    }
    
    //MARK: - Helper
    
    func fetchFilms() {
        DLDFilmsController.fetchFilms { (films) in
            guard let films = films else {return}
            self.fetchedFilms = films
            DispatchQueue.main.async {
                
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return fetchedFilms.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "filmCell", for: indexPath) as? DLDFilmTableViewCell else {return UITableViewCell()}
        
        let film = fetchedFilms[indexPath.row]
        cell.titleLabel.text = film.title
        
        return cell
    }
}//END OF CLASS
