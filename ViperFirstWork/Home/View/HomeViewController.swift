//
//  HomeViewController.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import UIKit

protocol HomeViewProtocol {
    func uploadTableView()
}


final class HomeViewController: UIViewController {
    var presenter : HomePresenterProtocol?
    @IBOutlet private weak var tblView: UITableView! {
        didSet{
            tblView.delegate = self
            tblView.dataSource = self
            tblView.register(UINib.init(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Ana Sayfa"
        presenter?.didLoad()
        // Do any additional setup after loading the view.
    }

}

extension HomeViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.model.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        cell.setCell(imgUrl: self.presenter?.model[indexPath.row].url ?? "", title: self.presenter?.model[indexPath.row].title ?? "", url: self.presenter?.model[indexPath.row].url ?? "")
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.navigationController?.pushViewController(HomeDetailRouter.init().openVc(model: presenter?.model[indexPath.row] ?? HomeResponse.init(albumID: nil, id: nil, title: nil, url: nil, thumbnailURL: nil)), animated: true)
//        if self.isModal {
//            print("evet navım ")
//        }
//        else{
//            print("hayır nav degilim")
//        }
    }
}



extension HomeViewController : HomeViewProtocol {
    func uploadTableView() {
        self.tblView.reloadData()
    }
    
    
}


extension UIViewController {

    var isModal: Bool {

        let presentingIsModal = presentingViewController != nil
        let presentingIsNavigation = navigationController?.presentingViewController?.presentedViewController == navigationController
        let presentingIsTabBar = tabBarController?.presentingViewController is UITabBarController

        return presentingIsModal || presentingIsNavigation || presentingIsTabBar
    }
}
