//
//  RGBchecker.swift
//  RGBchecker Ver.2
//
//  Created by Rintaro Kimura on 2022/06/15.
//

import UIKit

class RGBchecker:UIViewController{
    
    @IBOutlet weak var RedColor: UILabel!
    @IBOutlet weak var GreenColor: UILabel!
    @IBOutlet weak var BlueColor: UILabel!
    
    @IBAction func RedSlider(_ sender: UISlider) {
        RedColor.text = "R:\(Float(sender.value))"
    }
    @IBAction func GreenSlider(_ sender: UISlider) {
        GreenColor.text = "G:\(Float(sender.value))"
    }
    @IBAction func BlueSlider(_ sender: UISlider) {
        BlueColor.text = "B:\(Float(sender.value))"
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
