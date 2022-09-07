//
//  HomePresenter.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import Foundation

protocol HomePresenterProtocol {
    func didLoad()
    func getPhotos()
    var interactor : HomeInteractorInputProtocol? {get}
    var view : HomeViewProtocol? {get}
    var router : HomeRouterProtocol? {get}
    var model : [HomeResponse] {get}
}
protocol HomeInteractorOutputProtocol {
    func getPhotos (model:[HomeResponse])
}

final class HomePresenter : HomePresenterProtocol {
    var model : [HomeResponse] = []
    func didLoad() {
        self.getPhotos()
    }
    
    func getPhotos() {
        self.interactor?.fetchPhotos()
    }
    
    var interactor: HomeInteractorInputProtocol?
    
    var view: HomeViewProtocol?
    
    var router: HomeRouterProtocol?
    

}



extension HomePresenter : HomeInteractorOutputProtocol {
    func getPhotos (model:[HomeResponse]) {
        model.forEach { item in
            self.model.append(item)
        }
        self.view?.uploadTableView()
    }
}
