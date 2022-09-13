//
//  MainRouter.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 14.09.2022.
//

import Foundation
import UIKit

protocol MainRoutable : AnyObject{
    var navigationController : UINavigationController? {get}
    func pushVC(vc:UIViewController)
    func popVC()
}

extension MainRoutable {
   weak var navigationController : UINavigationController? {
        
    let vc = UINavigationController.init(rootViewController: HomeRouter.init().openVC())
        return vc
    }
    func pushVC(vc:UIViewController){
        guard let navController = self.navigationController else {return}
        DispatchQueue.main.async { 
            navController.present(vc, animated: true, completion: nil)
        }
       
    }
    func popVC(){
        guard let navController = self.navigationController else {return}
        navController.popViewController(animated: true)
    }
}


final class MainRouter : MainRoutable {
    
}
