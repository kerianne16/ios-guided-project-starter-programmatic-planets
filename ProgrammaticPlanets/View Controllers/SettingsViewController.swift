//
//  SettingsViewController.swift
//  Planets
//
//  Created by Andrew R Madsen on 8/2/18.
//  Copyright © 2018 Lambda Inc. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    var shouldShowPlutoSwitch: UISwitch!

    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateViews()
    }
    
    // MARK: - Action Handlers
    
    @objc func changeShouldShowPluto(_ sender: UISwitch) {
        let userDefaults = UserDefaults.standard
        userDefaults.set(sender.isOn, forKey: .shouldShowPlutoKey)
    }
    
    @objc func done() {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Private
    
    private func setUpSubviews() {
        // Button
        let doneButton = UIButton(type: .system)
        // always turn this off, prevents "Extra" constraints from being applied
            doneButton.translatesAutoresizingMaskIntoConstraints = false
        doneButton.setTitle("Done", for: .normal)
        // the target-action pattern, configures a method to run when the button is tapped
        doneButton.addTarget(self, action: #selector(done), for: .touchUpInside)
        
        // Adds the button to the view hierarchy
        view.addSubview(doneButton)
       
        // This is the y constraint
        let doneButtonTopConstraint = NSLayoutConstraint(item: doneButton, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 20)
       
        // this is the X constraint
        let doneButtonTrailingConstraint = doneButton.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: -20)
       
        NSLayoutConstraint.activate([doneButtonTopConstraint, doneButtonTrailingConstraint])
        
        //Switch
        let shouldShowPlutoSwitch = UISwitch()
        shouldShowPlutoSwitch.translatesAutoresizingMaskIntoConstraints = false
        shouldShowPlutoSwitch.addTarget(self, action: #selector(changeShouldShowPluto(_:)), for: .valueChanged)
        view.addSubview(shouldShowPlutoSwitch)
        
        // This is the y constraint
        let switchTopConstraint = NSLayoutConstraint(item: shouldShowPlutoSwitch, attribute: .top, relatedBy: .equal, toItem: doneButton, attribute: .bottom, multiplier: 1, constant: 60)
      
        // This is the x constraint
        let switchTrailingConstraint = shouldShowPlutoSwitch.trailingAnchor.constraint(equalToSystemSpacingAfter: view.safeAreaLayoutGuide.trailingAnchor, multiplier: -20)
        
        NSLayoutConstraint.activate([switchTopConstraint, switchTrailingConstraint])
        
        self.shouldShowPlutoSwitch = shouldShowPlutoSwitch
        
        // Label
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Is Pluto a planet?"
         
        view.addSubview(label)
        // This is the x constraint
        // another way to turn on a constraint (set isActive to true)
        label.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20).isActive = true
        
        //This is the y constraint
        label.centerYAnchor.constraint(equalTo: shouldShowPlutoSwitch.centerYAnchor).isActive = true
        
        // this protects the switch from being 
        label.trailingAnchor.constraint(equalTo: shouldShowPlutoSwitch.leadingAnchor, constant: -8).isActive = true
    }
    private func updateViews() {
        let userDefaults = UserDefaults.standard
        shouldShowPlutoSwitch.isOn = userDefaults.bool(forKey: .shouldShowPlutoKey)
    }
}
