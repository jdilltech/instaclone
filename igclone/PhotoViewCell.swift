//
//  PhotoView.swift
//  igclone
//
//  Created by John Dill on 10/3/18.
//  Copyright © 2018 John Dill. All rights reserved.
//

import UIKit

class PhotoViewCell: UITableViewCell {
    
    //Owner of uploaded photo
     var photoUserName: UILabel = {
        var label = UILabel()
        return label
    }()
    
    //Current total number of likes
    var numLikes: UILabel = {
        var label = UILabel()
        return label
    }()
    
    //Comment on image.  Eventually want this to be an array of 3 most recent comments! (Max 3-5 lines displayed in post), and a 'view all' link to go to a 'Comments View' that shows a scrollable list of all comments on this post
    lazy var comment: UILabel = {
        let label = UILabel()
        label.attributedText = self.configureCommentLabel(commenter: "jdill", text: "My Comment")
        label.numberOfLines = 3
        return label
    }()
    
    //Like button, will want two statuses: Selected/Not-Selected
    let likeButton: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "likeicon"))
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    //Comment button, should display small input box to add comments.
    let commentButton: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "commenticon"))
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    //Uploaded image for this post
    var photo: UIImageView = {
        var imageView = UIImageView(image: UIImage(named: "img1"))
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    //Creates and sets params for all items in the imagePost within this cell
    var imagePost: ImagePost?
    {
        didSet {
            guard let imagePost = imagePost else { return }
            photo.image = UIImage(named: imagePost.photoName)
            photoUserName.text = imagePost.userName
            numLikes.text = "\(imagePost.numLikes)"
            comment.attributedText = configureCommentLabel(commenter: imagePost.commenter, text: imagePost.lastComment)
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(photo)
        addSubview(photoUserName)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(numLikes)
        addSubview(comment)
        
        installConstraints()
    }
    
    //This is required for a custom init
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //Appends 'commenter' in bold font to beginning of their comment.  Eventually pass in comment object to handle this
    func configureCommentLabel(commenter: String, text: String) -> NSAttributedString {
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]
        let attributedString = NSMutableAttributedString(string: "\(commenter) ", attributes:attrs)
        let normalString = NSMutableAttributedString(string: text)
        attributedString.append(normalString)
        return attributedString
    }
    
    func installConstraints() {
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        photo.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        photo.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        photo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -200).isActive = true
        
        photoUserName.translatesAutoresizingMaskIntoConstraints = false
        photoUserName.leadingAnchor.constraint(equalTo: photo.leadingAnchor, constant: 10).isActive = true
        photoUserName.bottomAnchor.constraint(equalTo: photo.topAnchor, constant: -10).isActive = true
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.leadingAnchor.constraint(equalTo: photo.leadingAnchor, constant: 10).isActive = true
        likeButton.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 15).isActive = true
        
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 15).isActive = true
        commentButton.topAnchor.constraint(equalTo: photo.bottomAnchor, constant: 15).isActive = true
        
        numLikes.translatesAutoresizingMaskIntoConstraints = false
        numLikes.leadingAnchor.constraint(equalTo: photo.leadingAnchor, constant: 10).isActive = true
        numLikes.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 15).isActive = true
        
        comment.translatesAutoresizingMaskIntoConstraints = false
        comment.leadingAnchor.constraint(equalTo: photo.leadingAnchor, constant: 10).isActive = true
        comment.topAnchor.constraint(equalTo: numLikes.bottomAnchor, constant: 10).isActive = true
        comment.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
    }
}
