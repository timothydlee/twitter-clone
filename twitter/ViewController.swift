//
//  ViewController.swift
//  twitter
//
//  Created by Timothy Lee on 7/29/18.
//  Copyright © 2018 Timothy Lee. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    static let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Twitter Home"
        
        collectionView?.backgroundColor = .white
        collectionView?.alwaysBounceVertical = true
        collectionView?.register(StatusCell.self, forCellWithReuseIdentifier: ViewController.cellId)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let statusCell = collectionView.dequeueReusableCell(withReuseIdentifier: ViewController.cellId, for: indexPath) as! StatusCell
        statusCell.statusTextView.text = "Twitter Status Update \(indexPath.item)"
        return statusCell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 80)
    }
}

class StatusCell: BaseCell {
    
    let statusTextView: UITextView = {
        let tv = UITextView()
        tv.isEditable = false
        return tv
    }()
    
    let dividerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
        return view
    }()
    
    override func setupViews() {
        //layer.backgroundColor = UIColor.blue.cgColor
        addSubview(statusTextView)
        addSubview(dividerView)
        
        addConstraintsWithFormat(format: "H:|[v0]|", views: statusTextView)
        addConstraintsWithFormat(format: "V:|[v0]|", views: statusTextView)
        
        addConstraintsWithFormat(format: "H:|-8-[v0]|", views: dividerView)
        addConstraintsWithFormat(format: "V:|[v0(1)]|", views: dividerView)
    }
}

class BaseCell: UICollectionViewCell  {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {}
}


