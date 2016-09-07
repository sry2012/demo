//
//  ViewController.swift
//  frist
//
//  Created by suxinde on 16/8/29.
//  Copyright © 2016年 sry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var fromNameLabel: UILabel!
    @IBOutlet weak var fromVarlueLable: UILabel!
    @IBOutlet weak var fromUnit: UILabel!
    
    @IBOutlet weak var toNameLable: UILabel!
    @IBOutlet weak var tovalueLabel: UILabel!
    @IBOutlet weak var toUnit: UILabel!
    
    var state = 1
    let to$:Float = 0.15
    let toRMB:Float = 6.13
    
    
    @IBAction func onChangeClicked(sender: AnyObject) {
        //print("交换按钮呗点击")
        if fromNameLabel.text == "从美元"
        {
            fromNameLabel.text = "从人民币"
            fromUnit.text = "¥"
            toNameLable.text = "到美元"
            toUnit.text = "$"
            state = 2
            fromVarlueLable.text = "0"
            tovalueLabel.text = "0"
        }
        else
        {
            fromNameLabel.text = "从美元"
            fromUnit.text = "$"
            toNameLable.text = "到人民币"
            toUnit.text = "¥"
            state = 1
            fromVarlueLable.text = "0"
            tovalueLabel.text = "0"
        }
        
    }
    
    @IBAction func onNumberBtnClick(sender: AnyObject) {
        //print(sender.tag)
        if let valueStr:String = fromVarlueLable.text
        {
            if valueStr == "0"
            {
                fromVarlueLable.text = "\(sender.tag)"
            }
            else
            {
                fromVarlueLable.text = valueStr + "\(sender.tag)"
                
            }
        }
    
    }
    
    @IBAction func onClearBtnClicked(sender: AnyObject) {
        fromVarlueLable.text = "0"
        tovalueLabel.text = "0"
    }
    
    
    @IBAction func onDeleteBtnClicked(sender: AnyObject) {
        if fromVarlueLable.text == "0"
        {
            fromVarlueLable.text = "0"
        }
        else if var valueStr = fromVarlueLable.text
        {
            valueStr = valueStr.substringToIndex(valueStr.endIndex.advancedBy(-1))
            if valueStr == ""
            {
                 fromVarlueLable.text = "0"
            }
            else if valueStr.substringFromIndex(valueStr.endIndex.advancedBy(-1)) == "."
            {
                valueStr = valueStr.substringToIndex(valueStr.endIndex.advancedBy(-1))
                fromVarlueLable.text = valueStr

            }
            else {
                fromVarlueLable.text = valueStr

            }
        }
    }
    
    
    @IBAction func onCalculationBtnClicked(sender: AnyObject) {
        if let value = fromVarlueLable.text {
            if var valueFloat = Float(value){
                let result = state == 1 ? valueFloat * toRMB : valueFloat * to$
                tovalueLabel.text = "\(result)"
            }
        }
        
    }
    
    @IBAction func onDonBtnClicked(sender: AnyObject) {
        if let str = fromVarlueLable.text
        {
            fromVarlueLable.text = str + "."
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

