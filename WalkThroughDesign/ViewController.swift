//
//  ViewController.swift
//  WalkThroughDesign
//
//  Created by Zapotiltic23 on 4/5/18.
//  Copyright © 2018 Zapotiltic23. All rights reserved.
//

import UIKit

extension UIColor {
    
    static var mainPink = UIColor(red: 232/255, green: 68/255, blue: 133/255, alpha: 1)
}

class ViewController: UIViewController {
    
    let bearImageView: UIImageView = {
        let imageView = UIImageView(image: #imageLiteral(resourceName: "bear_first"))
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        return imageView
        
    }()
    
    let descriptionTextView: UITextView = {
        
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
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Previous", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
    
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = 4
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        setupBottomControls()
        
    }
    
    fileprivate func setupBottomControls(){
        
        
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlStackView)
        
        NSLayoutConstraint.activate([
            
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), bottomControlStackView.heightAnchor.constraint(equalToConstant: 50), bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
            ])
    }

    fileprivate func setupLayout() {
        
        let topImageContainerView = UIView()
        topImageContainerView.backgroundColor = UIColor.white
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        
       
        view.addSubview(descriptionTextView)
        view.addSubview(topImageContainerView)
        topImageContainerView.addSubview(bearImageView)
        
        
        // Use 'leading' and 'trailing' anchors as a replacement for 'right' and 'left' anchors!
        topImageContainerView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topImageContainerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        topImageContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true
        
        bearImageView.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        bearImageView.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        bearImageView.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
    
        
        descriptionTextView.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        descriptionTextView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        descriptionTextView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        descriptionTextView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 50).isActive = true
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
    }


}

