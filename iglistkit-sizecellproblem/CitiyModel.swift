//
//  CitiyModel.swift
//  iglistkit-sizecellproblem
//
//  Created by Giuseppe Bottiglieri on 04/08/17.
//  Copyright © 2017 GiuBot. All rights reserved.
//

import Foundation
import IGListKit

class CityModel {
    var title = ""
    var imageName = ""
    
    init() {}
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
    
}

extension CityModel: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self.title as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? CityModel else { return false }
        return title == object.title && imageName == object.imageName
    }
}
