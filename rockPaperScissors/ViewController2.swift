//
//  ViewController2.swift
//  rockPaperScissors
//
//  Created by SAMANTHA SPRAGUE on 11/17/22.
//

import UIKit

class AppData{
    static var move1: String!
    static var move2: String!
    static var move3: String!
    static var pic1: UIImage!
    static var pic2: UIImage!
    static var pic3: UIImage!
}

class ViewController2: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageOutlet: UIImageView!
    @IBOutlet weak var image2Outlet: UIImageView!
    @IBOutlet weak var image3Outlet: UIImageView!
    var image: Int!
    @IBOutlet weak var move1Outlet: UITextField!
    @IBOutlet weak var move2Outlet: UITextField!
    @IBOutlet weak var move3Outlet: UITextField!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imagePicker.delegate = self
    }
    

    
    @IBAction func move1Action(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
        image = 1
    }
    
    @IBAction func move2Action(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
        image = 2
    }
    
    
    @IBAction func move3Action(_ sender: Any) {
        imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        present(imagePicker, animated: true, completion: nil)
        image = 3
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        picker.dismiss(animated: true){
            if self.image == 1{
                self.imageOutlet.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
                AppData.pic1 = self.imageOutlet.image
            }else if self.image == 2{
                self.image2Outlet.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
                AppData.pic2 = self.image2Outlet.image
            }else{
                self.image3Outlet.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
                AppData.pic3 = self.image3Outlet.image
            }
        }
    }
    
    @IBAction func move1CameraAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
        }else{
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func move2CameraAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
        }else{
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    @IBAction func move3CameraAction(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
        }else{
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
        }
        present(imagePicker, animated: true, completion: nil)
    }
    
    
    @IBAction func createAction(_ sender: Any) {
        AppData.move1 = move1Outlet.text
        AppData.move2 = move2Outlet.text
        AppData.move3 = move3Outlet.text
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
