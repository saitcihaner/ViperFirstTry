//
//  HomeDetailPresenter.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import Foundation

protocol HomeDetailPresenterProtocol {
    func didLoad()
    var view : HomeDetailViewProtocol? {get}
    var router : HomeDetailRouterProtocol? {get}
}

final class HomeDetailPresenter : HomeDetailPresenterProtocol {
    private let model : HomeResponse

    var view: HomeDetailViewProtocol?
    
    var router: HomeDetailRouterProtocol?
    
    func didLoad() {
        self.view?.upLoadVC(model: model)
    }
    init(model:HomeResponse){
        self.model = model
    }
}
