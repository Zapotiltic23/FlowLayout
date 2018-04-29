//
//  SwippingControllerExtensions.swift
//  WalkThroughDesign
//
//  Created by Zapotiltic23 on 4/28/18.
//  Copyright © 2018 Zapotiltic23. All rights reserved.
//

import UIKit

extension SwipeController{
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        // This function allows me to correctly resize each display in landscape mode
        coordinator.animate(alongsideTransition: { (_) in
            self.collectionViewLayout.invalidateLayout()
            
            if self.pageControl.currentPage == 0{
                self.collectionView?.contentOffset = .zero
            }else{
                let indePath = IndexPath(item: self.pageControl.currentPage, section: 0)
                self.collectionView?.scrollToItem(at: indePath, at: .centeredHorizontally, animated: true)
            }
            
        }) { (_) in
            
        }
    }
}
