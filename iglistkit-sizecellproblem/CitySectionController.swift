//
//  CitySectionController.swift
//  iglistkit-sizecellproblem
//
//  Created by Giuseppe Bottiglieri on 04/08/17.
//  Copyright © 2017 GiuBot. All rights reserved.
//

import Foundation
import IGListKit

class CitySectionController: ListSectionController {
    
    var data:CityDataSource = CityDataSource()
    
    override init() {
        super.init()
        inset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    override func numberOfItems() -> Int {
        return data.cities.count
    }
    
    override func sizeForItem(at index: Int) -> CGSize {
        let width = collectionContext!.containerSize.width
        if index == 0 {
            return CGSize(width: width, height: width/2)
        } else {
            return CGSize(width: width/2, height: width/2)
        }
    }
    
    override func cellForItem(at index: Int) -> UICollectionViewCell {
        let cell = collectionContext!.dequeueReusableCell(of: CityCell.self, for: self, at: index) as! CityCell
        cell.item = data.cities[index]
        
        return cell
    }
    
    override func didUpdate(to object: Any) {
        precondition(object is CityDataSource)
        data = object as! CityDataSource
    }
    
    override func didSelectItem(at index: Int) {
        print("didSelectItem at \(index)")
    }
}
