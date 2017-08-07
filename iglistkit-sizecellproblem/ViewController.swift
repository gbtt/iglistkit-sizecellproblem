//
//  ViewController.swift
//  iglistkit-sizecellproblem
//
//  Created by Giuseppe Bottiglieri on 04/08/17.
//  Copyright © 2017 GiuBot. All rights reserved.
//

import UIKit
import IGListKit

class ViewController: UIViewController, UIScrollViewDelegate {

    lazy var adapter: ListAdapter = {
        return ListAdapter(updater: ListAdapterUpdater(), viewController: self, workingRangeSize: 0)
    }()
    
    let collectionView: UICollectionView = {
        let collectionViewLayout = ListCollectionViewLayout(stickyHeaders: false, topContentInset: 0, stretchToEdge: false)
        let view = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        adapter.scrollViewDelegate = self  //Needed to calling scrollViewDidScroll
        adapter.collectionView = collectionView
        adapter.dataSource = self as ListAdapterDataSource
        view.addSubview(collectionView)
        
        adapter.reloadData { (completed) in
            print("reloaded")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.frame = view.bounds
    }
    
}

extension ViewController: ListAdapterDataSource {
    
    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
        let items = [CityDataSource.loadSource()] as [ListDiffable]
        return items
    }
    
    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
        
        let obj = CitySectionController()
        return obj
    }
    
    func emptyView(for listAdapter: ListAdapter) -> UIView? {
        return nil
    }
}

extension NSObject: ListDiffable {
    
    public func diffIdentifier() -> NSObjectProtocol {
        return self
    }
    
    public func isEqual(toDiffableObject object: ListDiffable?) -> Bool {
        if self === object { return true }
        return isEqual(object)
    }
    
}
