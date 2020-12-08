//
//  HomeVC.swift
//  Media_Project
//
//  Created by 송황호 on 2020/12/08.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var viewRadious: UIView!
    @IBOutlet weak var nameText: UILabel!
    @IBOutlet weak var submitBusiness: UILabel!
    @IBOutlet weak var reciveBussiness: UILabel!
    
    @IBOutlet weak var homeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeTableView.dataSource = self
        homeTableView.delegate = self
        viewradious()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let vc = segue.destination as? DetailVC
            vc?.modalPresentationStyle = .fullScreen
            if let index = sender as? Int {
                
            }
        }
    }
    
    func viewradious() {
        viewRadious.layer.cornerRadius = 23
    }
    
    // 버튼 눌렀을 때 view가 올라오도록
    @IBAction func reciveBussinessPressBtn(_ sender: Any) {
        
    }
}

// MARK: DataSource 관련 코드

extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeSubmitPossibleTVCell.identifier, for: indexPath) as? HomeSubmitPossibleTVCell else {return UITableViewCell() }
        
        return cell
    }
    
    
}

// MARK: Delegate 관련 코드

extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("----> 이 테이블의 위치는?? \(indexPath.row)")
        
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}
