//
//  HomeRouter.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import Foundation
import UIKit

protocol HomeRouterProtocol {
    func openVC()->UIViewController
}

final class HomeRouter : HomeRouterProtocol{
    func openVC() -> UIViewController {
        let vc = HomeViewController.init(nibName: "HomeViewController", bundle: nil)
        let interactor = HomeInteractor.init()
        let presenter = HomePresenter.init()
        presenter.interactor = interactor
        interactor.presenter = presenter
        presenter.view = vc
        presenter.router = self
        vc.presenter = presenter
        return vc
    }

}
