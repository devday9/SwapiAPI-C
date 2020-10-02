//
//  DLDFilmTableViewCell.swift
//  OBJCSwapiAPI
//
//  Created by Deven Day on 10/1/20.
//

import UIKit

class DLDFilmTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var movieTitleLabel: UILabel!
    @IBOutlet weak var episodeLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    
    
    //MARK: - Properties
    var films: DLDFilms? {
        didSet {
            updateViews()
        }
    }
    
    //MARK: - Helpers
    func updateViews() {
        guard let film = films else {return}
        movieTitleLabel.text = "Movie Title: \(film.title)"
        episodeLabel.text = "Episode: \(film.episodeId)"
        directorLabel.text = "Directed by: \(film.director)"
        releaseDateLabel.text = "Released: \(film.releaseDate)"
    }
}//END OF CLASS
