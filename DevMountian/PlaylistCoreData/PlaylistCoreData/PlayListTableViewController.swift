//
//  PlayListTableViewController.swift
//  PlaylistCoreData
//
//  Created by Taylor Phillips on 2/8/17.
//  Copyright © 2017 Taylor Phillips. All rights reserved.
//

import UIKit

class PlayListTableViewController: UITableViewController {
    
    @IBOutlet weak var playlistNameTextField: UITextField!
    
    @IBAction func playlistButtonTapped(_ sender: Any) {
        
        guard let playlistName = playlistNameTextField.text, !playlistName.isEmpty  else { return }
        PlaylistController.shared.create(playlistWithName: playlistName)
        playlistNameTextField.text = nil
        tableView.reloadData()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PlaylistController.shared.playlistsArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "playlistCell", for: indexPath)
        
        let playlist = PlaylistController.shared.playlistsArray[indexPath.row]
        guard let song = playlist.songs else { return UITableViewCell() }
        
        cell.textLabel?.text = playlist.name
        let detailedText = song.count == 1 ? "1 Song" : "\(song.count) songs"
        cell.detailTextLabel?.text = detailedText
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Playlists"
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let playlist = PlaylistController.shared.playlistsArray[indexPath.row]
            PlaylistController.shared.delete(playlist: playlist)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toPlaylistDetailSegue",
            let indexPath = tableView.indexPathForSelectedRow{
            let playlist = PlaylistController.shared.playlistsArray[indexPath.row]
            let detailVC = segue.destination as? SongListTableViewController
            detailVC?.playlist = playlist
        }
        
        
    }
}
        
























