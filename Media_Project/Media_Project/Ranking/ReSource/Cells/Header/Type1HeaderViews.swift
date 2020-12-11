//
//  Type1HeaderViews.swift
//  Media_Project
//
//  Created by 송황호 on 2020/12/10.
//

import UIKit

class Type1HeaderViews: UIView {
    @IBOutlet weak var topContainerView: UIView!
    @IBOutlet weak var playerImageView: UIImageView!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var topContainerHeight: NSLayoutConstraint!
    @IBOutlet weak var textWidth: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        textWidth.constant = UIScreen.main.bounds.width - 32.0
    }
}
