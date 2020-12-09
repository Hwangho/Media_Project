//
//  DetailVC.swift
//  Media_Project
//
//  Created by 송황호 on 2020/12/09.
//

import UIKit

class DetailVC: UIViewController {

    static let identifier = "DetailVC"
    
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var termView: UIView!
    @IBOutlet weak var targetView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setImage()
    }
    
    @IBAction func backPressButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    func setImage(){
        submitButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        submitButton.layer.cornerRadius = 15
        submitButton.layer.shadowOpacity = 0.1
        submitButton.layer.shadowRadius = 5// 퍼지는 정도
        
        termView.backgroundColor = UIColor.whiteBlue
        targetView.backgroundColor = UIColor.whiteBlue
    }

    @IBAction func submitPressButton(_ sender: Any) {
        guard let VC = self.storyboard?.instantiateViewController(identifier: "DetailSubmitVC") as? DetailSubmitVC else {return }
        
        VC.modalPresentationStyle = .fullScreen
        
        present(VC, animated: true, completion: nil)
        
    }
    
    
}
