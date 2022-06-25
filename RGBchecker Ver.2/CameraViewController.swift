//
//  CameraViewController.swift
//  RGBchecker Ver.2
//
//  Created by Rintaro Kimura on 2022/06/20.
//

import Foundation
import UIKit
import ChameleonFramework

class CameraViewController:UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate, UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate{
    
    var color: UIColor!
//    var color2:[UIColor]!
    var RedFloat:CGFloat = 0.0
    var GreenFloat:CGFloat = 0.0
    var BlueFloat:CGFloat = 0.0
    var AlphaFloat:CGFloat = 0.0
    var ProjectName:String = ""
    
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.image = UIImage(named: "no_image.png")
        }
    }
    
    @IBOutlet weak var ImageTableView: UITableView!
    @IBOutlet weak var ProjectTextFiled: UITextField!
    
    
    @IBAction func CancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func SaveButton(_ sender: UIButton) {
        
        if let text = ProjectTextFiled.text {
            ProjectName = String(text)
            
            RGBchecker.RedColorList.append(RedFloat*255)
            RGBchecker.GreenColorList.append(GreenFloat*255)
            RGBchecker.BlueColorList.append(BlueFloat*255)
            RGBchecker.ListProjectName.append(ProjectName)
            UserDefaults.standard.set(RGBchecker.RedColorList, forKey: "R")
            UserDefaults.standard.set(RGBchecker.GreenColorList, forKey: "G")
            UserDefaults.standard.set(RGBchecker.BlueColorList, forKey: "B")
            UserDefaults.standard.set(RGBchecker.ListProjectName,forKey: "Name")
            
            dismiss(animated: true, completion: nil)
        } else {
            debugPrint("CameraViewController ProjectTextFiled Error")
        }

    }
    
    @IBAction func selectPicture(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            // ライブラリを表示
            picker.sourceType = .photoLibrary
            picker.delegate = self
            // ビューに表示
            self.present(picker, animated: true)
        }
    }
    
    @IBAction func startCamera(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let picker = UIImagePickerController()
            // カメラ起動
            picker.sourceType = .camera
            picker.delegate = self
            // ビューに表示
            self.present(picker, animated: true)
            
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        
//        imageViewに画像を表示
        self.imageView.image = image
        
//        imageの平均色を取得
        color = UIColor(averageColorFrom: image)
        
//        imageの色取得（5色）
//        color2 = ColorsFromImage(image, withFlatScheme: true)
        
        ImageTableView.reloadData()
        self.dismiss(animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "ImageTableViewCell")
        
        if let RGBUIcolor = color {
            let array:[String]
            array = RGBUIcolor.description.components(separatedBy: " ")

            let RedNumFormat = NumberFormatter().number(from: array[1])
            let GreenNumFormat = NumberFormatter().number(from: array[2])
            let BlueNumFormat = NumberFormatter().number(from: array[3])
            let AlphaFormat = NumberFormatter().number(from: array[4])

            func guardColor (){
                guard let Red = RedNumFormat else {
                    debugPrint("CameraViewController RedFloat Error")
                    return
                }
                guard let Green = GreenNumFormat else {
                    debugPrint("CameraViewController GreenFloat Error")
                    return
                }
                guard let Blue = BlueNumFormat else {
                    debugPrint("CameraViewController BlueFloat Error")
                    return
                }
                guard let Alpha = AlphaFormat else {
                    debugPrint("CameraViewController AlphaFloat Error")
                    return
                }

                RedFloat = CGFloat(truncating: Red)
                GreenFloat = CGFloat(truncating: Green)
                BlueFloat = CGFloat(truncating: Blue)
                AlphaFloat = CGFloat(truncating: Alpha)

            }
            guardColor()

            cell.backgroundColor = UIColor(red: RedFloat, green: GreenFloat, blue: BlueFloat, alpha: AlphaFloat)
            cell.textLabel!.text = " #\(String(NSString(format: "%02X%02X%02X", Int(RedFloat*255), Int(GreenFloat*255), Int(BlueFloat*255)))) "
            cell.textLabel!.font = UIFont.systemFont(ofSize: 20)

        } else {
            debugPrint("CameraViewController Optionaltype color in nil Error")
        }
        
        return cell
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ImageTableView.delegate = self
        ImageTableView.dataSource = self
        ProjectTextFiled.delegate = self
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

