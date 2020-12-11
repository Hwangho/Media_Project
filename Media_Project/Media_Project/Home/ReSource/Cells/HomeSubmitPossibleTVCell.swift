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
    @IBOutlet weak var organizeText: UILabel!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var dateText: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setButtonColor()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

    func setButtonColor(){
        cellView.layer.cornerRadius = 10
        cellView.backgroundColor = UIColor.skyBlue
        businessImage.layer.cornerRadius = 10
    }
    
    func setinfo(image: String, organize: String, name: String, date: String){
        self.businessImage.image = UIImage(named: image)
        self.organizeText.text = organize
        self.nameText.text = name
        self.dateText.text = date
    }
}
