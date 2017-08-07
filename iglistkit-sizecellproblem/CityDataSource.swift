//
//  CityDataSource.swift
//  iglistkit-sizecellproblem
//
//  Created by Giuseppe Bottiglieri on 04/08/17.
//  Copyright © 2017 GiuBot. All rights reserved.
//

import Foundation
import IGListKit

class CityDataSource {
    var nation = ""
    var cities : [CityModel] = []
    
    init() { }
    
    init(nation: String, cities: [CityModel]) {
        self.nation = nation
        self.cities = cities
    }
    
    static func loadSource() -> CityDataSource {
        let imageName : [String] = ["napoli", "amalfi", "bari", "bologna", "cinque_terre", "firenze", "matera", "milano", "pisa", "pompei", "procida", "roma", "trieste", "venezia"]
        let cityName  : [String] = ["Napoli", "Amalfi", "Bari", "Bologna", "Cinque Terre", "Firenze", "Matera", "Milano", "Pisa", "Pompei", "Procida", "Roma", "Trieste", "Venezia"]
        
        var cities : [CityModel] = []
        
        for index in 0...imageName.count-1 {
            cities.append(CityModel(title: cityName[index], imageName: imageName[index]))
        }
        
        return CityDataSource(nation: "Italy", cities: cities)
    }
}

extension CityDataSource: ListDiffable {
    
    func diffIdentifier() -> NSObjectProtocol {
        return self.nation as NSObjectProtocol
    }
    
    func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        guard let object = object as? CityDataSource else { return false }
        return nation == object.nation && cities.count == object.cities.count
    }
}
