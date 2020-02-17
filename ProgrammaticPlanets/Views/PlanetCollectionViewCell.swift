//
//  PlanetCollectionViewCell.swift
//  ProgrammaticPlanets
//
//  Created by Spencer Curtis on 9/8/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class PlanetCollectionViewCell: UICollectionViewCell {
    
    private var imageView: UIImageView!
    private var nameLabel: UILabel!
    
    var planet: Planet! {
        didSet {
            updateViews()
        }
    }
    // this init runs when creating a cell entirely from code
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubviews()
    }
    // this init runs when defining the cell in the storyvboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpSubviews()
    }
    
    private func updateViews() {
        imageView.image = planet.image
        nameLabel.text = planet.name
    }
    
    private func setUpSubviews() {
        // ImageView
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        addSubview(imageView)
        
        // This is the y constraint
        NSLayoutConstraint(item: imageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 4).isActive = true
       
        // This is the x constraint
        NSLayoutConstraint(item: imageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 4).isActive = true
        
        // this is the width contraint
        NSLayoutConstraint(item: imageView, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -4).isActive = true
        
        // this is the height constraint
        NSLayoutConstraint(item: imageView, attribute: .height, relatedBy: .equal, toItem: imageView, attribute: .width, multiplier: 1, constant: 0).isActive = true
        
        self.imageView = imageView
        
        // Label
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        addSubview(label)
        
        // This is the y constraint
        label.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4).isActive = true
        
        // This is the x constraint
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2).isActive = true
        
        // This is the width constraint
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2).isActive = true
        
        self.nameLabel = label
        
        
    }
}
