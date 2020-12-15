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
    @IBOutlet weak var underLineView: UIView!
    
    @IBOutlet weak var alearySubmitView: UIView!
    @IBOutlet weak var alreadyUnderLineView: UIView!
    @IBOutlet weak var alreadyTableView: UITableView!
    
    var informations: [HomeInfo] = []
    
    var aleradyClickNum = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        homeTableView.dataSource = self
        homeTableView.delegate = self
        
        alreadyTableView.dataSource = self
        alreadyTableView.delegate = self
        
        self.homeTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
        initPosition()
        alearySubmitView.isUserInteractionEnabled = true
        alearySubmitView.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture)))
        setInformation()
        viewradious()
    }
    
    func initPosition() {
        
        self.alearySubmitView.transform = CGAffineTransform(translationX: 0, y: alearySubmitView.frame.size.height)
    }
    
    // @@@@@@@@@@@@@@@@ 해결 해야 됨 @@@@@@@@@@@@
    @objc func handlePanGesture(guesture: UIPanGestureRecognizer){
        
        let translation = guesture.translation(in: self.view) // translation에 움직인 위치를 저장한다.
        
        // sender의 view는 sender가 바라보고 있는 circleView이다. 드래그로 이동한 만큼 circleView를 이동시킨다.
            guesture.view!.center = CGPoint(x: guesture.view!.center.x, y: guesture.view!.center.y + translation.y)
            guesture.setTranslation(.zero, in: self.view) // 0으로 움직인 값을 초기화 시켜준다.
        
        if alearySubmitView.frame.origin.y < 293 {
            alearySubmitView.center.y = 292
            guesture.setTranslation(.zero, in: self.view)
        }
        else if alearySubmitView.frame.origin.y > 620 {
            let move = CGAffineTransform(translationX: 0, y: view.frame.height - alearySubmitView.frame.origin.y)
            
            UIView.animate(withDuration: 0.5, animations: {
                self.alearySubmitView.transform = move
            })
            aleradyClickNum = !aleradyClickNum
        }
        print(alearySubmitView.center.y)
        print("너 사이즈\(view.frame.height - alearySubmitView.frame.origin.y)")
    }
    
    func setInformation(){
        let data1 = HomeInfo(image: "1", organize: "한국 능률 협회", name: "구직확동패키지 지원 '꿈나래' 사업", date: " 2020-01-01(수) ~ 2020-10-20(화)")
        let data2 = HomeInfo(image: "12", organize: "한국산업인력공단", name: "미국취업 Google 디지털 마케팅 실무...", date: "2020-10-30(금) ~ 2020-12-14(월)")
        let data3 = HomeInfo(image: "13", organize: "인사혁신처", name: "2020 공직박람회", date: "2020.11.12(목) ~ 2020.12.09(수)")
        let data4 = HomeInfo(image: "14", organize: "한국능률협회", name: "일생활균형지원 플랫폼 경기도워라밸...", date: " 2020-01-01(수) ~ 2020-10-20(화)")
        let data5 = HomeInfo(image: "18", organize: "워크넷", name: "우리학교 취업지원실", date: "상시 지원 가능")
        let data6 = HomeInfo(image: "19", organize: "경기도청", name: "지역주도형 청년일자리사업 통합채용", date: "2020-01-01(수) ~ 2020-12-31(목)")
        let data7 = HomeInfo(image: "20", organize: "주택도시기금", name: "청년전용 보증부월세대출", date: "상시 지원 가능")
        let data8 = HomeInfo(image: "21", organize: "경기도경제과학진흥원", name: "2020년 판교테크노밸리 임대보증금...", date: "2020-04-08(수) ~ 모집완료시")
        let data9 = HomeInfo(image: "22", organize: "소상공인시장진흥공단", name: "폐업점포 재도전 장려금", date: "2020-09-24(목) ~ 모집완료시")
        
        informations = [data1,data2,data3,data4,data5,data6,data7,data8,data9]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail"{
            let vc = segue.destination as? DetailVC
            vc?.modalPresentationStyle = .fullScreen
            if let index = sender as? Int {
                vc?.image = informations[index].image
                vc?.organize = informations[index].organize
                vc?.name = informations[index].name
                vc?.date = informations[index].date
            }
        }
    }
    
    func viewradious() {
        viewRadious.layer.cornerRadius = 23
        underLineView.backgroundColor = UIColor.whiteBlue
        
        alreadyUnderLineView.backgroundColor = .white
        alearySubmitView.backgroundColor = UIColor.submitBlue
        alreadyTableView.backgroundColor = UIColor.submitBlue
        
        alearySubmitView.layer.cornerRadius = 23
//        alearySubmitView.layer.shadowOffset = CGSize(width: 0, height: 0)
//        alearySubmitView.layer.shadowRadius = 20
    }
    
    // 버튼 눌렀을 때 view가 올라오도록
    @IBAction func reciveBussinessPressBtn(_ sender: Any) {
        
        if aleradyClickNum == false {
            let move = CGAffineTransform(translationX: 0, y: 200)
            UIView.animate(withDuration: 0.5, animations: {
                self.alearySubmitView.transform = move
            })
            aleradyClickNum = !aleradyClickNum
        }
        else{
            let move = CGAffineTransform(translationX: 0, y: alearySubmitView.frame.size.height)
            UIView.animate(withDuration: 0.5, animations: {
                self.alearySubmitView.transform = move
            })
            aleradyClickNum = !aleradyClickNum
        }
    }
}

// MARK: DataSource 관련 코드

extension HomeVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == homeTableView {
            return informations.count
        } else if tableView == alreadyTableView {
            return informations.count
        } else{
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        
        if tableView == homeTableView {
            guard let cell = homeTableView.dequeueReusableCell(withIdentifier: HomeSubmitPossibleTVCell.identifier, for: indexPath) as? HomeSubmitPossibleTVCell else {return UITableViewCell() }
            
            cell.setinfo(image: informations[indexPath.row].image, organize: informations[indexPath.row].organize, name: informations[indexPath.row].name, date: informations[indexPath.row].name)
            cell.selectedBackgroundView = backgroundView
            
            return cell
        }
        else if tableView == alreadyTableView {
            guard  let cell2 = alreadyTableView.dequeueReusableCell(withIdentifier: HomeAlreadySubmitTVCell.identifier, for: indexPath) as? HomeAlreadySubmitTVCell else {
                return UITableViewCell() }
            
            cell2.setinfo(image: informations[indexPath.row].image, organize: informations[indexPath.row].organize, name: informations[indexPath.row].name, date: informations[indexPath.row].name)
            cell2.selectedBackgroundView = backgroundView
            cell2.backgroundColor = UIColor.skyBlue
            return cell2
        } else{
            return UITableViewCell()
        }
    }
}

// MARK: Delegate 관련 코드

extension HomeVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 94
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("----> 이 테이블의 위치는?? \(indexPath.row)")
        
        
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }
}
