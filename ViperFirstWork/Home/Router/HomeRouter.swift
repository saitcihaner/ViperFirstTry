//
//  HomeRouter.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import Foundation
import UIKit

protocol HomeRouterProtocol : MainRoutable {
    func openVC()->HomeViewController
}

final class HomeRouter : HomeRouterProtocol{
    func openVC() -> HomeViewController {
        let vc = HomeViewController.init(nibName: "HomeViewController", bundle: nil) // vc 1
        let interactor = HomeInteractor.init() // interactor 1
        let presenter = HomePresenter.init() // presenter 1
        presenter.interactor = interactor  // interactor
        interactor.presenter = presenter // presenter 1
        presenter.view = vc  //
        presenter.router = self 
        vc.presenter = presenter // presenter 0
        return vc
    }

}
