//
//  RGBList.swift
//  RGBchecker Ver.2
//
//  Created by Rintaro Kimura on 2022/06/17.
//

import UIKit

class RGBList:UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var RedList = UserDefaults.standard.array(forKey: "R")
    var GreenList = UserDefaults.standard.array(forKey: "G")
    var BlueList = UserDefaults.standard.array(forKey: "B")
    var NameList = UserDefaults.standard.array(forKey: "Name")
    
    @IBAction func CancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var RGBListTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NameList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "RGBListCell")
        
        cell.backgroundColor = UIColor(red:RedList![indexPath.row] as! CGFloat/255,green:GreenList![indexPath.row] as! CGFloat/255, blue:BlueList![indexPath.row] as! CGFloat/255, alpha: 1)
        cell.textLabel!.text = "ProjectName:\(NameList![indexPath.row] as! String)" +
        "  #\(String(NSString(format: "%02X%02X%02X", Int(RedList![indexPath.row]  as! CGFloat), Int(GreenList![indexPath.row]  as! CGFloat), Int(BlueList![indexPath.row]  as! CGFloat))))"
        cell.textLabel!.font = UIFont.systemFont(ofSize: 20)
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50
        }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            RedList!.remove(at:indexPath.row)
            GreenList!.remove(at:indexPath.row)
            BlueList!.remove(at:indexPath.row)
            NameList!.remove(at:indexPath.row)
            RGBchecker.RedColorList.remove(at: indexPath.row)
            RGBchecker.GreenColorList.remove(at: indexPath.row)
            RGBchecker.BlueColorList.remove(at: indexPath.row)
            RGBchecker.ListProjectName.remove(at:indexPath.row)
            UserDefaults.standard.set(RGBchecker.RedColorList, forKey: "R")
            UserDefaults.standard.set(RGBchecker.GreenColorList, forKey: "G")
            UserDefaults.standard.set(RGBchecker.BlueColorList, forKey: "B")
            UserDefaults.standard.set(RGBchecker.ListProjectName,forKey: "Name")
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        RGBListTable.delegate = self
        RGBListTable.dataSource = self
    }
    
}
