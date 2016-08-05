//
//  ViewController.swift
//  Stretchy Snacks
//
//  Created by Martin Zhang on 2016-08-04.
//  Copyright © 2016 Martin Zhang. All rights reserved.
//

import UIKit

let rotationAngleRadians = M_PI/4

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var animator: UIDynamicAnimator!
    var snackArray = [String]()
    let snackStackView = UIStackView()
    let snackIndexPath = IndexPath.init(row: 0, section: 0)
    let snackLabel = UILabel()
    
    @IBOutlet weak var snackTableView: UITableView!
    @IBOutlet weak var grayView: UIView!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var grayViewHeightConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let colorForHeader = UIColor(netHex: 0xDDDDDD)
        self.grayView.backgroundColor = colorForHeader
        self.configureStackViewForStretchyHeaderView()
        self.snackStackView.isHidden = true
        
        snackLabel.text = "Add a snack!"
        self.grayView.addSubview(snackLabel)
//        snackLabel.centerXAnchor.constraint(equalTo: self.grayView.centerXAnchor).isActive = true
//        snackLabel.centerYAnchor.constraint(equalTo: self.grayView.centerYAnchor).isActive = true
        let centerXConstraint = NSLayoutConstraint.init(item: snackLabel, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: grayView, attribute: NSLayoutAttribute.centerX, multiplier: 1, constant: 0)
        let centerYConstraint = NSLayoutConstraint.init(item: snackLabel, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: grayView, attribute: NSLayoutAttribute.centerY, multiplier: 1, constant: 0)
        centerYConstraint.identifier = "CenterYSnackTitle"

        grayView.addConstraint(centerXConstraint)
        grayView.addConstraint(centerYConstraint)
        snackLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    @IBAction func plusButtonPressed(_ sender: AnyObject) {
        
        if grayViewHeightConstraint.constant == 64 {
            
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 10, options: [], animations: {
                self.snackStackView.isHidden = false
                self.grayViewHeightConstraint.constant = 150
                self.view.layoutIfNeeded()
                self.plusButton.transform = CGAffineTransform(rotationAngle: CGFloat(rotationAngleRadians))
                }, completion: nil)
            
        } else if grayViewHeightConstraint.constant == 150 {
            
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 6, options: [], animations: {
                self.snackStackView.isHidden = true
                self.grayViewHeightConstraint.constant = 64
                self.plusButton.transform = CGAffineTransform(rotationAngle: 0)
                self.view.layoutIfNeeded()
                }, completion: nil)
            
        }
        
    }
    
    func image1Tapped(recognizer: AnyObject) {
        let oreoString = "An Oreo!"
        self.snackArray.insert(oreoString, at: 0)
        self.snackTableView.insertRows(at: [snackIndexPath], with: UITableViewRowAnimation.left)
    }
    
    func image2Tapped(recognizer: AnyObject) {
        let pizzaPocketString = "A Pizza Pocket!"
        self.snackArray.insert(pizzaPocketString, at: 0)
        self.snackTableView.insertRows(at: [snackIndexPath], with: UITableViewRowAnimation.left)
    }
    
    func image3Tapped(recognizer: AnyObject) {
        let popTartString = "A Pop Tart!"
        self.snackArray.insert(popTartString, at: 0)
        self.snackTableView.insertRows(at: [snackIndexPath], with: UITableViewRowAnimation.left)
    }
    
    func image4Tapped(recognizer: AnyObject) {
        let popsicleString = "A Pop Sicle!"
        self.snackArray.insert(popsicleString, at: 0)
        self.snackTableView.insertRows(at: [snackIndexPath], with: UITableViewRowAnimation.left)
    }
    
    func image5Tapped(recognizer: AnyObject) {
        let ramenString = "A RAMEN!"
        self.snackArray.insert(ramenString, at: 0)
        self.snackTableView.insertRows(at: [snackIndexPath], with: UITableViewRowAnimation.left)
    }
    
    func configureStackViewForStretchyHeaderView() {
        
        // 5 * UIImageViews
        
        let oreoImage = UIImageView()
        oreoImage.image = UIImage(named: "oreos")
        oreoImage.widthAnchor.constraint(equalToConstant: 65).isActive = true
        oreoImage.heightAnchor.constraint(equalToConstant: 65).isActive = true
        let tapGestureRecognizer1 = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.image1Tapped))
        oreoImage.addGestureRecognizer(tapGestureRecognizer1)
        oreoImage.isUserInteractionEnabled = true

        let pizzaPocketImage = UIImageView()
        pizzaPocketImage.image = UIImage(named: "pizza_pockets")
        pizzaPocketImage.widthAnchor.constraint(equalToConstant: 65).isActive = true
        pizzaPocketImage.heightAnchor.constraint(equalToConstant: 65).isActive = true
        let tapGestureRecognizer2 = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.image2Tapped))
        pizzaPocketImage.addGestureRecognizer(tapGestureRecognizer2)
        pizzaPocketImage.isUserInteractionEnabled = true
        
        let popTartsImage = UIImageView()
        popTartsImage.image = UIImage(named: "pop_tarts")
        popTartsImage.widthAnchor.constraint(equalToConstant: 65).isActive = true
        popTartsImage.heightAnchor.constraint(equalToConstant: 65).isActive = true
        let tapGestureRecognizer3 = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.image3Tapped))
        popTartsImage.addGestureRecognizer(tapGestureRecognizer3)
        popTartsImage.isUserInteractionEnabled = true
        
        let popsicleImage = UIImageView()
        popsicleImage.image = UIImage(named: "popsicle")
        popsicleImage.widthAnchor.constraint(equalToConstant: 65).isActive = true
        popsicleImage.heightAnchor.constraint(equalToConstant: 65).isActive = true
        let tapGestureRecognizer4 = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.image4Tapped))
        popsicleImage.addGestureRecognizer(tapGestureRecognizer4)
        popsicleImage.isUserInteractionEnabled = true
        
        let ramenImage = UIImageView()
        ramenImage.image = UIImage(named: "ramen")
        ramenImage.widthAnchor.constraint(equalToConstant: 65).isActive = true
        ramenImage.heightAnchor.constraint(equalToConstant: 65).isActive = true
        let tapGestureRecognizer5 = UITapGestureRecognizer.init(target: self, action: #selector(ViewController.image5Tapped))
        ramenImage.addGestureRecognizer(tapGestureRecognizer5)
        ramenImage.isUserInteractionEnabled = true
        
        // 1 * UIStackView
        
        self.snackStackView.axis = UILayoutConstraintAxis.horizontal
        self.snackStackView.distribution = UIStackViewDistribution.equalSpacing
        self.snackStackView.alignment = UIStackViewAlignment.center
        self.snackStackView.spacing = 8.0
        
        self.snackStackView.addArrangedSubview(oreoImage)
        self.snackStackView.addArrangedSubview(pizzaPocketImage)
        self.snackStackView.addArrangedSubview(popTartsImage)
        self.snackStackView.addArrangedSubview(popsicleImage)
        self.snackStackView.addArrangedSubview(ramenImage)
        self.snackStackView.translatesAutoresizingMaskIntoConstraints = false;
        
        self.grayView.addSubview(self.snackStackView)
        
        self.snackStackView.centerXAnchor.constraint(equalTo: self.grayView.centerXAnchor).isActive = true
        self.snackStackView.centerYAnchor.constraint(equalTo: self.grayView.centerYAnchor, constant: 20).isActive = true
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.snackArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")!
        cell.textLabel?.text = (self.snackArray[indexPath.row])
        
        return cell
    }
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}

