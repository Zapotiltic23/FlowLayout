//
//  PageCell.swift
//  WalkThroughDesign
//
//  Created by Zapotiltic23 on 4/5/18.
//  Copyright © 2018 Zapotiltic23. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var page: Page? {
        didSet {
            
            guard let unwrappedPage = page else {return}
            bearImageView.image = UIImage(named: unwrappedPage.imageName)
            let attributedText = NSMutableAttributedString(string: unwrappedPage.geaderText, attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
            
            attributedText.append(NSMutableAttributedString(string: "\n\n\n \(unwrappedPage.bodyText)", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor : UIColor.gray]))
            
            descriptionTextView.attributedText = attributedText
            descriptionTextView.textAlignment = .center
            
            
        }
    }
    
    private let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    private let descriptionTextView: UITextView = {
        
        let view = UITextView()
        let attributedText = NSMutableAttributedString(string: "Hi this a test for attributed string", attributes: [NSAttributedStringKey.font : UIFont.boldSystemFont(ofSize: 18)])
        
        attributedText.append(NSMutableAttributedString(string: "\n\n\nThis is a longer test. I need more words to see characters and letter.", attributes: [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 13), NSAttributedStringKey.foregroundColor : UIColor.gray]))
        
        view.attributedText = attributedText
        view.translatesAutoresizingMaskIntoConstraints = false
        view.textAlignment = .center
        view.isEditable = false
        view.isScrollEnabled = false
        
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.purple
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
    fileprivate func setupLayout() {
        
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = UIColor.white
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        addSubview(descriptionTextView)
        addSubview(topImageContainerView)
        topImageContainerView.addSubview(bearImageView)
        
        
        // Use 'leading' and 'trailing' anchors as a replacement for 'right' and 'left' anchors!
        topImageContainerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 50).isActive = true
    }
}
