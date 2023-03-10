//
//  ViewController.swift
//  MyMusic
//
//  Created by Gaurav Chauhan on 07/01/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
        
        
    }

    func configureSongs() {
        songs.append(Song(name: "Desire",
                          albumName: "Crown Records",
                          artistName: "Akash Aujla",
                          imageName: "cover1",
                          trackName: "song1"))
        
        songs.append(Song(name: "Image",
                          albumName: "Kalamkaar",
                          artistName: "Raftaar",
                          imageName: "cover2",
                          trackName: "song2"))
        
        songs.append(Song(name: "Manike",
                          albumName: "T-Series",
                          artistName: "Yohani",
                          imageName: "cover3",
                          trackName: "song3"))
        
        songs.append(Song(name: "Desire",
                          albumName: "Crown Records",
                          artistName: "Akash Aujla",
                          imageName: "cover1",
                          trackName: "song1"))
        
        songs.append(Song(name: "Image",
                          albumName: "Kalamkaar",
                          artistName: "Raftaar",
                          imageName: "cover2",
                          trackName: "song2"))
        
        songs.append(Song(name: "Manike",
                          albumName: "T-Series",
                          artistName: "Yohani",
                          imageName: "cover3",
                          trackName: "song3"))
        
        songs.append(Song(name: "Desire",
                          albumName: "Crown Records",
                          artistName: "Akash Aujla",
                          imageName: "cover1",
                          trackName: "song1"))
        
        songs.append(Song(name: "Image",
                          albumName: "Kalamkaar",
                          artistName: "Raftaar",
                          imageName: "cover2",
                          trackName: "song2"))
        
        songs.append(Song(name: "Manike",
                          albumName: "T-Series",
                          artistName: "Yohani",
                          imageName: "cover3",
                          trackName: "song3"))
    }
    //TableView
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
    
        // Configure
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.imageView?.image = UIImage(named: song.imageName)
        
        cell.textLabel?.font = UIFont(name: "Helvetiva-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetiva", size: 17)
        
        cell.accessoryType = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //present the player
        let position = indexPath.row
        
        //songs
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        
        present(vc, animated: true )
                
        
    }
    
    
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}
