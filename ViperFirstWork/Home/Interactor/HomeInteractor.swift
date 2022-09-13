//
//  HomeInteractor.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import Foundation

protocol HomeInteractorInputProtocol  {
    func fetchPhotos()
     var presenter : HomeInteractorOutputProtocol? {get}
}

final class HomeInteractor : HomeInteractorInputProtocol {
    func fetchPhotos() {
        Network.getApiRequest(baseRequest: HomePhotoRequest.init(httpMethod: .Get), responseType: [HomeResponse].self) { [weak self] res in
            guard let self = self else {return}
            self.presenter?.getPhotos(model: res)
        } errorHandler: { [weak self] err in
            guard let self = self else {return}
            self.presenter?.getPhotos(model: [])
        }
    }
    
    weak var presenter: HomeInteractorOutputProtocol?
    deinit{
        print("interactor uçtu")
    }
    
}
