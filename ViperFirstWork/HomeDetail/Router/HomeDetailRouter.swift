//
//  HomeDetailRouter.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import Foundation
import UIKit

protocol HomeDetailRouterProtocol {
    func openVc(model:HomeResponse)->HomeDetailViewController
    func closeVc()
}


final class HomeDetailRouter : HomeDetailRouterProtocol {
    var presenter: HomeDetailPresenterProtocol?
    
    func openVc(model: HomeResponse) -> HomeDetailViewController {
        var vc = HomeDetailViewController.init(nibName: "HomeDetailViewController", bundle: nil)
        let presenter = HomeDetailPresenter.init(model: model)
        presenter.view = vc
        presenter.router = self
        vc.presenter = presenter
        return vc
    }
    func closeVc(){
    }
}
