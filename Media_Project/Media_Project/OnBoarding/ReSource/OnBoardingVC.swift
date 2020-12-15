//
//  OnBoardingVC.swift
//  Media_Project
//
//  Created by 송황호 on 2020/12/14.
//

import UIKit

class OnBoardingVC: UIViewController {

    @IBOutlet weak var underLineView: UIView!
    @IBOutlet weak var okButton: UIButton!
    @IBOutlet weak var checkBox1: UIButton!
    @IBOutlet weak var checkBox2: UIButton!
    @IBOutlet weak var checkBox3: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setColor()

    }
    
    func setColor(){
        underLineView.backgroundColor = .whiteBlue
        okButton.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        okButton.layer.cornerRadius = 15
        okButton.layer.shadowOpacity = 0.1
        okButton.layer.shadowRadius = 5// 퍼지는 정도
    }
    
    @IBAction func checkBox1PressButton(_ sender: Any) {
        checkBox1.isSelected = !checkBox1.isSelected
    }
    
    @IBAction func checkBox2PressButton(_ sender: Any) {
        checkBox2.isSelected = !checkBox2.isSelected
    }
    
    @IBAction func checkBox3PressButton(_ sender: Any) {
        checkBox3.isSelected = !checkBox3.isSelected
    }
    
    @IBAction func okPressButton(_ sender: Any) {
         let storyBoard = UIStoryboard.init(name: "Tabbar", bundle: nil)
        
        guard let vc = storyBoard.instantiateViewController(withIdentifier: "TabBarVC") as? TabBarVC else { return }
        
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
}
