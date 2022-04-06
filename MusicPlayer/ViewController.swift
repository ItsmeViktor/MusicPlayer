//
//  ViewController.swift
//  MusicPlayer
//
//  Created by viktor on 06.04.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSongs()
        table.delegate = self
        table.dataSource = self
    }
    func  configureSongs() {
        songs.append(Song(name: "Background Music",
                          AlbumName: "2TRACKS",
                          artistName: "SuicideBoys",
                          imageName: "case1",
                          trackName: "song1"))
        songs.append(Song(name: "Russian Music",
                          AlbumName: "2TRACKS",
                          artistName: "Виктор Цой",
                          imageName: "case2",
                          trackName: "song2"))
    }
//Table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        //configure
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.AlbumName
        cell.textLabel?.font = UIFont(name: "Holvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Holvetica", size: 17)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        // present the player
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }

}
struct Song {
    let name: String
    let AlbumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}

