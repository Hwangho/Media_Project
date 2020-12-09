//
//  DetailSubmitVC.swift
//  Media_Project
//
//  Created by 송황호 on 2020/12/09.
//

import UIKit

class DetailSubmitVC: UIViewController {

    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var detailButton: UIButton!
    @IBOutlet weak var upDownButton: UIButton!
    @IBOutlet weak var detailLabelView: UIView!
    
    @IBOutlet weak var detailViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        detailLabelView.isHidden = true
        detailViewHeight.constant = 0
        // Do any additional setup after loading the view.
    }

    @IBAction func checkBoxPressButton(_ sender: Any) {
        checkBoxButton.isSelected = !checkBoxButton.isSelected
    }
    
    @IBAction func detailPressButton(_ sender: Any) {
        upDownButton.isSelected = !upDownButton.isSelected
    
        if upDownButton.isSelected == true{
            detailLabelView.isHidden = false
            detailViewHeight.constant = 40
        }else{
            detailLabelView.isHidden = true
            detailViewHeight.constant = 0
        }
    }
    
    @IBAction func submitPRessButton(_ sender: Any) {
       
        if checkBoxButton.isSelected == false{
           
            let alert = UIAlertController(title: "", message: "'MyData' 제공 동의를 체크해 주시기 바랍니다.", preferredStyle: UIAlertController.Style.alert)
            
            let okAct = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: nil)
            
            alert.addAction(okAct)
                        
            present(alert, animated: true, completion: nil)
                        // alert을 보여주겠다!
        }else{
            let alert = UIAlertController(title: "", message: "지원이 완료 되었습니다.", preferredStyle: UIAlertController.Style.alert)
            
            let ok = UIAlertAction(title: "확인", style: UIAlertAction.Style.default, handler:  { (action) in
                self.dismiss(animated: true, completion: nil)
            })
            alert.addAction(ok)
            
            present(alert, animated: true, completion: {})
        }
    }
    
    @IBAction func backPressButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
