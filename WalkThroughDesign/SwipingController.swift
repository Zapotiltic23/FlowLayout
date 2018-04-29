//
//  SwipingController.swift
//  WalkThroughDesign
//
//  Created by Zapotiltic23 on 4/5/18.
//  Copyright © 2018 Zapotiltic23. All rights reserved.
//

import UIKit



class SwipeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    
    
    
    let previousButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Previous", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor.white
        button.addTarget(self, action: #selector(handlePrevious), for: .touchUpInside)
        
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        
        button.setTitle("Next", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.setTitleColor(.mainPink, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        
        return button
    }()
    
     lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = pages.count
        pc.currentPageIndicatorTintColor = .mainPink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    
    let cellId = "cellId"
    let pages = [
        Page(imageName: "bear_first", geaderText: "Joing us today inhis second Day", bodyText: "This is some text for the first page haha."), Page(imageName: "heart_second", geaderText: "Subscribe and get a discount", bodyText: "We noticed how to compute things normalily and economically."), Page(imageName: "leaf_third", geaderText: "Special services for 00 agents", bodyText: "Wee need the feedback as soon as possible. Things are moving fast!")
    ]
    
    fileprivate func setupBottomControls(){
        
        
        let bottomControlStackView = UIStackView(arrangedSubviews: [previousButton,pageControl,nextButton])
        bottomControlStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomControlStackView.distribution = .fillEqually
        
        view.addSubview(bottomControlStackView)
        
        NSLayoutConstraint.activate([
            
            bottomControlStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor), bottomControlStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor), bottomControlStackView.heightAnchor.constraint(equalToConstant: 50), bottomControlStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            
            ])
    }
    
    
    @objc private func handlePrevious(){
        
        let nextIndex = max(pageControl.currentPage - 1, 0)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        
    }
    
    
    @objc private func handleNext(){
        
        let nextIndex = min(pageControl.currentPage + 1, pages.count - 1)
        
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView?.isPagingEnabled = true
        setupBottomControls()
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        //This function allows the page control dots change as we swipe trhough the screen
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x / view.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
        
        let page = pages[indexPath.item]
        cell.page = page
//        cell.bearImageView.image = UIImage(named: page.imageName)
//        cell.descriptionTextView.text = page.geaderText
        
   
        cell.backgroundColor = indexPath.item % 2 == 0 ? .white : .white
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
    
}
