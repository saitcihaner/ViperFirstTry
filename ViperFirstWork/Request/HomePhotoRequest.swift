//
//  HomePhotoRequest.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import Foundation

final class HomePhotoRequest : BaseRequest {
    override init(httpMethod: HttpMethod) {
        super.init(httpMethod: httpMethod)
        self.pathExtension = "photos"
    }
}
