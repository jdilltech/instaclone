//
//  PhotoView.swift
//  igclone
//
//  Created by John Dill on 10/3/18.
//  Copyright © 2018 John Dill. All rights reserved.
//

import UIKit

class PhotoViewCell: UITableViewCell {
    
     var photoUserName: UILabel? = {
        var label = UILabel()
        return label
    }()
    
    var numLikes: UILabel? = {
        var label = UILabel()
        return label
    }()
    
    var comment: UILabel? = {
        let label = UILabel()
        let attrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 17)]
        let commenter = ""
        let attributedString = NSMutableAttributedString(string: "\(commenter) ", attributes:attrs)
        let normalString = NSMutableAttributedString(string: "This is the single greatest pickle situation I have ever seen.  We can never have enough pickles!  Bring on all the pickles!  Did I mention this comment would be loaded with pickles?  Because, pickles!")
        attributedString.append(normalString)
        label.attributedText = attributedString
        label.numberOfLines = 3
        return label
    }()
    
    let likeButton: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "likeicon"))
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    let commentButton: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "commenticon"))
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    var photo: UIImageView? = {
        var imageView = UIImageView(image: UIImage(named: "img1"))
        imageView.clipsToBounds = true
        imageView.backgroundColor = .white
        return imageView
    }()
    
    var imagePost: ImagePost! {
        didSet {
            photo!.image = UIImage(named: imagePost.photoName)
            photoUserName?.text = imagePost.userName
            numLikes?.text = "\(imagePost.numLikes)"
            comment?.text = imagePost.lastComment
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(photo!)
        addSubview(photoUserName!)
        addSubview(likeButton)
        addSubview(commentButton)
        addSubview(numLikes!)
        addSubview(comment!)
        
        installConstraints()
    }
    
    //This is required for a custom init
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func installConstraints() {
        photo!.translatesAutoresizingMaskIntoConstraints = false
        photo!.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        photo!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        photo!.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        photo!.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -200).isActive = true
        
        photoUserName!.translatesAutoresizingMaskIntoConstraints = false
        photoUserName!.leadingAnchor.constraint(equalTo: photo!.leadingAnchor, constant: 10).isActive = true
        photoUserName!.bottomAnchor.constraint(equalTo: photo!.topAnchor, constant: -10).isActive = true
        
        likeButton.translatesAutoresizingMaskIntoConstraints = false
        likeButton.leadingAnchor.constraint(equalTo: photo!.leadingAnchor, constant: 10).isActive = true
        likeButton.topAnchor.constraint(equalTo: photo!.bottomAnchor, constant: 15).isActive = true
        
        commentButton.translatesAutoresizingMaskIntoConstraints = false
        commentButton.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 15).isActive = true
        commentButton.topAnchor.constraint(equalTo: photo!.bottomAnchor, constant: 15).isActive = true
        
        numLikes!.translatesAutoresizingMaskIntoConstraints = false
        numLikes!.leadingAnchor.constraint(equalTo: photo!.leadingAnchor, constant: 10).isActive = true
        numLikes!.topAnchor.constraint(equalTo: likeButton.bottomAnchor, constant: 15).isActive = true
        
        comment!.translatesAutoresizingMaskIntoConstraints = false
        comment!.leadingAnchor.constraint(equalTo: photo!.leadingAnchor, constant: 10).isActive = true
        comment!.topAnchor.constraint(equalTo: numLikes!.bottomAnchor, constant: 10).isActive = true
        comment!.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        
    }
}
