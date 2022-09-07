//
//  HomeDetailRouter.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import Foundation
import UIKit

protocol HomeDetailRouterProtocol {
    func openVc(model:HomeResponse)->UIViewController
}


final class HomeDetailRouter : HomeDetailRouterProtocol {
    
    func openVc(model: HomeResponse) -> UIViewController {
        var presenter = HomeDetailPresenter.init(model: model)
        var vc = HomeDetailViewController.init(nibName: "HomeDetailViewController", bundle: nil)
        presenter.view = vc
        presenter.router = self
        vc.presenter = presenter
        return vc
    } 
}
