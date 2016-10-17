//
//  ViewController.swift
//  UIView+Shake
//
//  Created by admin on 2016/10/14.
//  Copyright © 2016年 Ding. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var shakeView: UIView!
    @IBOutlet weak var textTimes: UITextField!
    @IBOutlet weak var textSpeed: UITextField!
    @IBOutlet weak var textOffset: UITextField!
    @IBOutlet weak var shakeDirection: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initViews() {
        for textFeild in [textOffset, textTimes, textSpeed] {
            textFeild?.layer.borderWidth = 2
            textFeild?.layer.borderColor = UIColor(red: 49.0/255.0, green: 186.0/255.0, blue: 81.0/255.0, alpha: 1.0).cgColor
        }
        shakeDirection.layer.borderWidth = 2
        shakeDirection.layer.borderColor = shakeDirection.tintColor.cgColor
        shakeDirection.selectedSegmentIndex = 1
        
        shakeView.layer.cornerRadius = 21
        shakeView.layer.masksToBounds = true
    }
    
    @IBAction func shake(_ sender: AnyObject) {
        let direction: ShakeDirection = shakeDirection.selectedSegmentIndex == 0 ? .horizontal : .vertical
        guard let times = UInt(textTimes.text!) else { return }
        shakeView.shake(times, offset: CGFloat((textOffset.text! as NSString).floatValue), speed: TimeInterval((textSpeed.text! as NSString).floatValue), direction: direction)
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }


}

