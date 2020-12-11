//
//  TabBarVC.swift
//  Media_Project
//
//  Created by 송황호 on 2020/12/08.
//

import UIKit

class TabBarVC: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setTabBar()
        self.selectedIndex = 1
    }
    
    func setTabBar() {
        
        self.tabBar.tintColor = UIColor.black
        
        // 1
        let Rankings = UIStoryboard.init(name: "Ranking", bundle: nil)
        guard let firstTab = Rankings.instantiateViewController(identifier: "ViewController")
                as? ViewController  else {
            return
        }
        firstTab.tabBarItem.title = "모아보기"
        firstTab.tabBarItem.image = UIImage(systemName: "wallet.pass")
        firstTab.tabBarItem.selectedImage = UIImage(systemName: "wallet.pass.fill")?.withTintColor(.thickBlue, renderingMode: .alwaysOriginal)
        
        // 2
        let Homes = UIStoryboard.init(name: "Home", bundle: nil)
        guard let second = Homes.instantiateViewController(identifier: "HomeVC")
                as? HomeVC  else {
            return
        }
        second.tabBarItem.title = "홈"
        second.tabBarItem.image = UIImage(systemName: "house")
        second.tabBarItem.selectedImage = UIImage(systemName: "house.fill")?.withTintColor(.thickBlue, renderingMode: .alwaysOriginal)

        // 3
        let MyPage = UIStoryboard.init(name: "MyPage", bundle: nil)
        guard let thired = MyPage.instantiateViewController(identifier: "MyPageVC")
                as? MyPageVC  else {
            return
        }
        thired.tabBarItem.title = "마이페이지"
        thired.tabBarItem.image = UIImage(systemName: "person")
        thired.tabBarItem.selectedImage = UIImage(systemName: "person.fill")?.withTintColor(.thickBlue, renderingMode: .alwaysOriginal)
        
        let tabs =  [firstTab, second, thired]
        
        tabBar.layer.shadowOpacity = 0.1
        tabBar.layer.shadowOffset = CGSize(width: 0, height: -3)
        tabBar.layer.shadowRadius = 3
//        tabBar.backgroundColor = .clear
        self.setViewControllers(tabs, animated: false)
    }
}
