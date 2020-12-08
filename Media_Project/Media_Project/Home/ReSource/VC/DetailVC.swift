//
//  DetailVC.swift
//  Media_Project
//
//  Created by 송황호 on 2020/12/09.
//

import UIKit

class DetailVC: UIViewController {

    static let identifier = "DetailVC"
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    @IBAction func backPressButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
