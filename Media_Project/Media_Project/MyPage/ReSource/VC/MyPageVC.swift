//
//  MyPageVC.swift
//  Media_Project
//
//  Created by 송황호 on 2020/12/09.
//

import UIKit

class MyPageVC: UIViewController {

    @IBOutlet weak var myPageTableView: UITableView!
    
    @IBOutlet weak var myPageButton: UIButton!
    @IBOutlet weak var settingButton: UIButton!
    
    var informations: [HomeInfo] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myPageTableView.delegate = self
        myPageTableView.dataSource = self
        
        self.myPageTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        setInformation()
        setColor()
    }
    
    func setColor(){
        myPageButton.layer.cornerRadius = 15
        myPageButton.layer.shadowColor = UIColor.black.cgColor
        myPageButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        myPageButton.layer.shadowRadius = 5
        myPageButton.layer.shadowOpacity = 0.3 // alpha값
        
        settingButton.layer.cornerRadius = 15
        settingButton.layer.shadowColor = UIColor.black.cgColor
        settingButton.layer.shadowOffset = CGSize(width: 0, height: 4)
        settingButton.layer.shadowRadius = 5
        settingButton.layer.shadowOpacity = 0.3 // alpha값
    }
    
    func setInformation(){

        let data1 = HomeInfo(image: "18", organize: "워크넷", name: "우리학교 취업지원실", date: "상시 지원 가능")
        let data2 = HomeInfo(image: "19", organize: "경기도청", name: "지역주도형 청년일자리사업 통합채용", date: "2020-01-01(수) ~ 2020-12-31(목)")
        let data3 = HomeInfo(image: "20", organize: "주택도시기금", name: "청년전용 보증부월세대출", date: "상시 지원 가능")
//        let data4 = HomeInfo(image: "21", organize: "경기도경제과학진흥원", name: "2020년 판교테크노밸리 임대보증금...", date: "2020-04-08(수) ~ 모집완료시")
//        let data5 = HomeInfo(image: "22", organize: "소상공인시장진흥공단", name: "폐업점포 재도전 장려금", date: "2020-09-24(목) ~ 모집완료시")
        
        informations = [data1,data2,data3]
    }
}

extension MyPageVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return informations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = myPageTableView.dequeueReusableCell(withIdentifier: MyPageTVCell.identifier, for: indexPath) as? MyPageTVCell else { return UITableViewCell() }
        
        cell.setinfo(image: informations[indexPath.row].image, organize: informations[indexPath.row].organize, name: informations[indexPath.row].name, date: informations[indexPath.row].date)
        
        return cell
    }
}

extension MyPageVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
}

// MARK: TableView Cell 관련 코드

class MyPageTVCell: UITableViewCell {

    
    static let identifier = "MyPageTVCell"

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
