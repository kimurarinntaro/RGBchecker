//
//  RGBchecker.swift
//  RGBchecker Ver.2
//
//  Created by Rintaro Kimura on 2022/06/15.
//

import UIKit

class RGBchecker:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var RedColor: UILabel!
    @IBOutlet weak var GreenColor: UILabel!
    @IBOutlet weak var BlueColor: UILabel!
    @IBOutlet weak var RGBColor: UILabel!
    @IBOutlet weak var RGBTable: UITableView!
    
    var red:CGFloat = 0
    var green:CGFloat = 0
    var blue:CGFloat = 0
    
    @IBAction func RedSlider(_ sender: UISlider) {
        red = CGFloat(sender.value)
        RedColor.text = "R:\(String(format: "%.0f", red))"
        ChangeTextAndColor()
    }
    @IBAction func GreenSlider(_ sender: UISlider) {
        green = CGFloat(sender.value)
        GreenColor.text = "G:\(String(format: "%.0f", green))"
        ChangeTextAndColor()
    }
    @IBAction func BlueSlider(_ sender: UISlider) {
        blue = CGFloat(sender.value)
        BlueColor.text = "B:\(String(format: "%.0f", blue))"
        ChangeTextAndColor()
    }
    
    func ChangeTextAndColor(){
        RGBColor.text = "RGBColor is #\(String(NSString(format: "%02X%02X%02X", Int(red), Int(green), Int(blue)))) for Hexadecimal"
//        RGBTable.backgroundColor = UIColor(red:red/255,green:green/255, blue:blue/255, alpha: 1)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "RGBTableViewCell")
        
        cell.backgroundColor = UIColor(red:red/255,green:green/255, blue:blue/255, alpha: 1)
        
        return cell
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RGBTable.delegate = self
        RGBTable.dataSource = self
    }
}
