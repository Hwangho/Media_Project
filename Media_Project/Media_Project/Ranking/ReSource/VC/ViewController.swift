//
//  ViewController.swift
//  AppStoreTransitionAnimation
//
//  Created by Razvan Chelemen on 15/05/2019.
//  Copyright © 2019 appssemble. All rights reserved.
//

import UIKit
import AppstoreTransition

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var transition: CardTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "Type1CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "Type1CollectionViewCell")
        collectionView.register(UINib(nibName: "Type2CollectionViewCell", bundle: Bundle.main), forCellWithReuseIdentifier: "Type2CollectionViewCell")
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: UICollectionViewCell
        
        switch indexPath.row {
        case 0:
            let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Type2CollectionViewCell", for: indexPath) as! Type2CollectionViewCell
            customCell.backgroundImage.image = UIImage(named: "4224")
            cell = customCell
        case 1:
            let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Type1CollectionViewCell", for: indexPath) as! Type1CollectionViewCell
            customCell.backgroundImage.image = UIImage(named: "4232")
            customCell.containerView.backgroundColor = .white
            cell = customCell
        case 2:
            let customCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Type2CollectionViewCell", for: indexPath) as! Type2CollectionViewCell
            customCell.backgroundImage.image = UIImage(named: "4227")
            cell = customCell
        default:
            fatalError("Invalid cell")
        }
        
        return cell
    }
    
}

extension ViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if (indexPath.row)%2 == 0 {
            let width = UIScreen.main.bounds.width
            let cellSize = CGSize(width: width, height: 235)

            return cellSize
        }
        else {
            let width = UIScreen.main.bounds.width
            let cellSize = CGSize(width: width, height: 331)

            return cellSize
        }
    }
    
}
extension ViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            showType2(indexPath: indexPath)
            print(indexPath.item)
        case 1:
            showType3(indexPath: indexPath, bottomDismiss: true)
            print(indexPath.item)
        case 2:
            showType4(indexPath: indexPath, bottomDismiss: true)
            print(indexPath.item)
        default:
            fatalError("Invalid cell")
        }
    }
    
    
    private func showType1(indexPath: IndexPath, bottomDismiss: Bool = false) {
        let storyboard = UIStoryboard(name: "Ranking", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "type1") as! Type1ViewController
        
        if let cell = collectionView.cellForItem(at: indexPath) as? Type1CollectionViewCell {
            cell.bottomContainer.alpha = 0
            
            viewController.dismissAnimationFinishedAction = {
                UIView.animate(withDuration: 0.3, animations: {
                    cell.bottomContainer.alpha = 1.0
                })
            }
        }
        
        // Get tapped cell location
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        cell.settings.isEnabledBottomClose = bottomDismiss
        cell.settings.cardContainerInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 0, right: 16.0)
        
        transition = CardTransition(cell: cell, settings: cell.settings)
        viewController.settings = cell.settings
        viewController.transitioningDelegate = transition
        
        // If `modalPresentationStyle` is not `.fullScreen`, this should be set to true to make status bar depends on presented vc.
        //viewController.modalPresentationCapturesStatusBarAppearance = true
        viewController.modalPresentationStyle = .custom
        
        presentExpansion(viewController, cell: cell, animated: true)
    }
    
    private func showType2(indexPath: IndexPath, bottomDismiss: Bool = false) {
        let storyboard = UIStoryboard(name: "Ranking", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "type2") as! Type2ViewController
        
        // Get tapped cell location
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        cell.settings.cardContainerInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
        cell.settings.isEnabledBottomClose = bottomDismiss
        
        transition = CardTransition(cell: cell, settings: cell.settings)
        viewController.settings = cell.settings
        viewController.transitioningDelegate = transition
        viewController.background = UIImage(named: "4224")
        
        // If `modalPresentationStyle` is not `.fullScreen`, this should be set to true to make status bar depends on presented vc.
//     viewController.modalPresentationCapturesStatusBarAppearance = true
        viewController.modalPresentationStyle = .custom
        
        presentExpansion(viewController, cell: cell, animated: true)
    }
    
    private func showType3(indexPath: IndexPath, bottomDismiss: Bool = false) {
        let storyboard = UIStoryboard(name: "Ranking", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "type1") as! Type1ViewController
        
        // Get tapped cell location
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        
        cell.settings.cardContainerInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 0, right: 16.0)
        cell.settings.isEnabledBottomClose = bottomDismiss
        
        transition = CardTransition(cell: cell, settings: cell.settings)
        viewController.settings = cell.settings
        viewController.transitioningDelegate = transition
        viewController.subtitle = "You can dismiss from bottom this one"
        viewController.backgroundImage = UIImage(named: "type1-bg-bottom")
        viewController.backgroundColor = .white
        
        // If `modalPresentationStyle` is not `.fullScreen`, this should be set to true to make status bar depends on presented vc.
        //viewController.modalPresentationCapturesStatusBarAppearance = true
        viewController.modalPresentationStyle = .custom
        
        presentExpansion(viewController, cell: cell, animated: true)
    }
    
    private func showType4(indexPath: IndexPath, bottomDismiss: Bool = false) {
        let storyboard = UIStoryboard(name: "Ranking", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "type2") as! Type2ViewController
        
        // Get tapped cell location
        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        cell.settings.cardContainerInsets = UIEdgeInsets(top: 8.0, left: 16.0, bottom: 8.0, right: 16.0)
        cell.settings.isEnabledBottomClose = bottomDismiss
        
        transition = CardTransition(cell: cell, settings: cell.settings)
        viewController.settings = cell.settings
        viewController.transitioningDelegate = transition
        viewController.background = UIImage(named: "4227")
        
        // If `modalPresentationStyle` is not `.fullScreen`, this should be set to true to make status bar depends on presented vc.
        //viewController.modalPresentationCapturesStatusBarAppearance = true
        viewController.modalPresentationStyle = .custom
        
        presentExpansion(viewController, cell: cell, animated: true)
    }
    
}

extension ViewController: CardsViewController {
    
}
