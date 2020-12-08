//
//  HomeSubmitPossibleTVCell.swift
//  Media_Project
//
//  Created by 송황호 on 2020/12/08.
//

import UIKit

class HomeSubmitPossibleTVCell: UITableViewCell {
    
    static let identifier = "HomeSubmitPossibleTVCell"

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var businessImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButtonColor()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setButtonColor(){
//        detailButton.layer.cornerRadius = 10
//        detailButton.backgroundColor = UIColor.blueGray
//        detailButton.setTitle("자세히 보기", for: .normal)
//
//        submitButton.layer.cornerRadius = 10
//        submitButton.backgroundColor = UIColor.thickBlue
//        submitButton.setTitle("제출하기", for: .normal)
//
        cellView.layer.cornerRadius = 10
        cellView.backgroundColor = UIColor.skyBlue
        businessImage.layer.cornerRadius = 10
    }
}
