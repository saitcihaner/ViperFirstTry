//
//  HomeTableViewCell.swift
//  ViperFirstWork
//
//  Created by Sait Cihaner on 7.09.2022.
//

import UIKit
import Kingfisher

final class HomeTableViewCell: UITableViewCell {

    @IBOutlet private weak var photoImg: UIImageView!
    @IBOutlet private weak var photoTitleLbl: UILabel!
    @IBOutlet private weak var photoUrlLbl: UILabel!
    
    func setCell(imgUrl:String,title:String,url:String){
        self.photoImg.kf.setImage(with: URL.init(string: imgUrl))
        self.photoTitleLbl.text = title
        self.photoUrlLbl.text = url
    }
}
