//
//  ViewController.swift
//  CoffeeShop
//
//  Created by Denis Skuratovich on 2.03.23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var customersLabel: UILabel!
    @IBOutlet var revenueLabel: UILabel!
    @IBOutlet var totalRevenueLabel: UILabel!
    @IBOutlet var priceField: UITextField!
    
    let coffeeManager = CoffeeShop.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createGradientBackground()
        coffeeManager.startNewDay()
        updateUserInterface()
        
    }
    
    
    @IBAction func startNewDay(_ sender: Any) {
        coffeeManager.startNewDay()
        updateUserInterface()
    }
    

    @IBAction func buyCoffee(_ sender: Any) {
        coffeeManager.buyCoffee(price: Int(priceField.text!)!)
        updateUserInterface()
    }
    
    
    private func updateUserInterface() {
        dayLabel.text = "День \(coffeeManager.day)"
        customersLabel.text = "Посетителей \(coffeeManager.customersCounter)"
        revenueLabel.text = "Выручка \(coffeeManager.revenue)"
        totalRevenueLabel.text = "Всего \(coffeeManager.totalRevenue)"
    }
    
    private func createGradientBackground() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.darkGray.cgColor, UIColor.lightGray.cgColor, UIColor.darkGray.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)

        UIGraphicsBeginImageContext(gradientLayer.bounds.size)
        gradientLayer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()

        self.view.backgroundColor = UIColor(patternImage: image!)
    }
}

