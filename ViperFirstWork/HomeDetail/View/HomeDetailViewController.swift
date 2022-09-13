//
//  HomeDetailViewController.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import UIKit
import Kingfisher

protocol HomeDetailViewProtocol {
    func upLoadVC(model:HomeResponse)
}

 final class HomeDetailViewController: UIViewController {
     @IBOutlet private weak var photoLbl: UILabel!
     @IBOutlet private weak var imgView: UIImageView!
     var presenter : HomeDetailPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.didLoad()
        print(self.navigationController?.viewControllers.count)
    }
     deinit{
         print("detail controller uçtu")
     }
//     override func viewDidAppear(_ animated: Bool) {
//         Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { [weak self] _ in
//             guard let self = self else {return}
//             self.navigationController?.popViewController(animated: true)
//         }
//     }
     @IBAction func deneme(_ sender: Any) {
         presenter?.router?.closeVc()
     }
   
 }





extension HomeDetailViewController : HomeDetailViewProtocol {
    func upLoadVC(model:HomeResponse) {
        imgView.kf.setImage(with: URL.init(string: model.url ?? ""))
        photoLbl.text = model.title ?? ""
    }
    
    
}
