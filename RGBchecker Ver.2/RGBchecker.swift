//
//  RGBchecker.swift
//  RGBchecker Ver.2
//
//  Created by Rintaro Kimura on 2022/06/15.
//

import UIKit

class RGBchecker:UIViewController,UITableViewDelegate,UITableViewDataSource,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var RedColor: UILabel!
    @IBOutlet weak var GreenColor: UILabel!
    @IBOutlet weak var BlueColor: UILabel!
    @IBOutlet weak var RGBColor: UILabel!
    @IBOutlet weak var RGBTable: UITableView!
    
    var red:CGFloat = 255
    var green:CGFloat = 255
    var blue:CGFloat = 255
    
    static var RedColorList = UserDefaults.standard.array(forKey: "R")!
    static var GreenColorList = UserDefaults.standard.array(forKey: "G")!
    static var BlueColorList = UserDefaults.standard.array(forKey: "B")!
    static var ListProjectName = UserDefaults.standard.array(forKey: "Name")!
    
    @IBAction func RedSlider(_ sender: UISlider) {
        red = CGFloat(sender.value)
        RedColor.text = "R:\(String(format: "%.0f", red))"
        ChangeText()
    }
    
    @IBAction func GreenSlider(_ sender: UISlider) {
        green = CGFloat(sender.value)
        GreenColor.text = "G:\(String(format: "%.0f", green))"
        ChangeText()
    }
    
    @IBAction func BlueSlider(_ sender: UISlider) {
        blue = CGFloat(sender.value)
        BlueColor.text = "B:\(String(format: "%.0f", blue))"
        ChangeText()
    }
    
    func ChangeText(){
        RGBColor.text = "RGBColor is #\(String(NSString(format: "%02X%02X%02X", Int(red), Int(green), Int(blue)))) for Hexadecimal"
        RGBTable.reloadData()
    }
    
    
    func CheckValue(value:Int) -> Int{
        var value = value
        if value > 255 {
            value = 255
        } else if value < 0{
            value = 0
        }
        return value
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "RGBTableViewCell")
        
        var r = red, g = green, b = blue
        switch indexPath.row{
        case 1:
            r = CGFloat(CheckValue(value:Int(red) - 10))
        case 2:
            r = CGFloat(CheckValue(value:Int(red) + 10))
        case 3:
            g = CGFloat(CheckValue(value:Int(green) - 10))
        case 4:
            g = CGFloat(CheckValue(value:Int(green) + 10))
        case 5:
            b = CGFloat(CheckValue(value:Int(blue) - 10))
        case 6:
            b = CGFloat(CheckValue(value:Int(blue) + 10))
        default:
            break
        }
        
        cell.backgroundColor = UIColor(red:r/255,green:g/255, blue:b/255, alpha: 1)
        cell.textLabel!.text = " #\(String(NSString(format: "%02X%02X%02X", Int(r), Int(g), Int(b)))) "
        cell.textLabel!.font = UIFont.systemFont(ofSize: 20) 
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
        }
   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RGBTable.delegate = self
        RGBTable.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let SaveRGBNavCon = segue.destination as? UINavigationController,
           let NextSaveRGBNavCon = SaveRGBNavCon.topViewController as? RGBSave{
            NextSaveRGBNavCon.SecondRed = red
            NextSaveRGBNavCon.SecondGreen = green
            NextSaveRGBNavCon.SecondBlue = blue
        } else {
            debugPrint("RGBchecker prepare Error")
        }
    }
    
    
}
