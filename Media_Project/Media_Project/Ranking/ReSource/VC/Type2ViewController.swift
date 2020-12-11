//
//  Type2ViewController.swift
//  AppStoreTransitionAnimation
//
//  Created by Razvan Chelemen on 15/05/2019.
//  Copyright © 2019 appssemble. All rights reserved.
//

import UIKit
import AppstoreTransition

class Type2ViewController: UIViewController {
    @IBOutlet weak var contentScrollView: UIScrollView!
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    @IBOutlet weak var shareButton: UIButton!
    
    
    var background: UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setImage()

        view.clipsToBounds = true
        contentScrollView.delegate = self
        
        scrollView.contentInsetAdjustmentBehavior = .never
        
        let _ = dismissHandler
        if let background = background {
            backgroundImage.image = background
        }
        
        heightConstraint.constant = 232
    }
    
    func setImage(){
        shareButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        shareButton.layer.cornerRadius = 15
        shareButton.layer.shadowOpacity = 0.1
        shareButton.layer.shadowRadius = 5// 퍼지는 정도
    }
}

extension Type2ViewController: UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // prevent bouncing when swiping down to close
        scrollView.bounces = scrollView.contentOffset.y > 100
        
        dismissHandler.scrollViewDidScroll(scrollView)
    }
    
}

extension Type2ViewController: CardDetailViewController {
    
    var scrollView: UIScrollView {
        return contentScrollView
    }
    
    
    var cardContentView: UIView {
        return headerView
    }

}
