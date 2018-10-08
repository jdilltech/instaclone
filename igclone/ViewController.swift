//
//  ViewController.swift
//  igclone
//
//  Created by John Dill on 9/26/18.
//  Copyright © 2018 John Dill. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView(frame: .zero, style: .plain)
    let tableData = [
        ImagePost(photoName: "img1", userName: "jimbojones", numLikes: 25, lastComment: "Well why not?"),
        ImagePost(photoName: "img2", userName: "dillybilly", numLikes: 37, lastComment: "That's one spicy pickle?"),
        ImagePost(photoName: "img3", userName: "isthisthingon", numLikes: 225, lastComment: "I don't think it is?"),
        ImagePost(photoName: "img4", userName: "winnerwinner", numLikes: 57, lastComment: "This is the single greatest pickle situation I have ever seen.  We can never have enough pickles!  Bring on all the pickles!  Did I mention this comment would be loaded with pickles?  Because, pickles!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.backgroundColor = .white
        tableView.register(PhotoViewCell.self, forCellReuseIdentifier: "item")
        
        view.addSubview(tableView)
        installConstraints()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "item", for: indexPath) as? PhotoViewCell
        cell?.imagePost = tableData[indexPath.row]
        return cell!
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tableData.count
        
    }
    
    func installConstraints(){
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.rowHeight = 600
    }

    
}

