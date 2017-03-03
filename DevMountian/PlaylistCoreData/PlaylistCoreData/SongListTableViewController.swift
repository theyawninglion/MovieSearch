//
//  SongListTableViewController.swift
//  PlaylistCoreData
//
//  Created by Taylor Phillips on 2/8/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class SongListTableViewController: UITableViewController {
    @IBOutlet weak var songTitleTextField: UITextField!
    @IBOutlet weak var artistNameTextField: UITextField!
    
    @IBAction func songAddButtonTapped(_ sender: Any) {
        guard let playlist = playlist,
        let title = songTitleTextField.text,
        let artist = artistNameTextField.text,
        !title.isEmpty && !artist.isEmpty else { return }
        SongController.create(songWithTitle: title, andArtist: artist, inPlaylist: playlist)
        songTitleTextField.text = nil
        artistNameTextField.text = nil
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = playlist?.name
        
    }
    
    var playlist: Playlist?{
        didSet {
            if !isViewLoaded{
                loadView()
            }
            tableView.reloadData()
        }
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playlist?.songs?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songlistCell", for: indexPath)
        
        if let playlist = playlist,
            let song = playlist.songs?.object(at: indexPath.row) as? Song {
            cell.textLabel?.text = song.title
            cell.detailTextLabel?.text = song.artist
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Songs"
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            guard let playlist = playlist,
            let song = playlist.songs?.object(at: indexPath.row) as? Song else {return}
            SongController.delete(song: song)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
}
