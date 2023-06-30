//
//  ViewController.swift
//  CardGame
//
//  Created by student1 on 29/05/2023.
//
import CoreLocation
import UIKit

class MyDataManager {
    static let shared = MyDataManager()
    var myVariable: String = " "
   
}


class ViewController:  UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var showName: UITextView!
    @IBOutlet weak var getName: UITextField!
    
    @IBOutlet weak var enterButton: UIButton!
    @IBOutlet weak var eastGlob: UIImageView!
    @IBOutlet weak var westGlob: UIImageView!
    
    @IBOutlet weak var startButtton: UIButton!// start
    
    private var locationManager:CLLocationManager?
    
        var size = 0
        var currentLocation = 0.0
        var comparedLocation = 0.0
        var saveGetName = MyDataManager.shared.myVariable
       // var ckiceToSaveBouten : UIButton

        override func viewDidLoad() {
            super.viewDidLoad()
            getUserLocation()
            startButtton.isHidden = true
           
            
            if  MyDataManager.shared.myVariable != " " {
                showName.text = "Hi " + MyDataManager.shared.myVariable
                getName.isHidden = true
                startButtton.isHidden = false
                enterButton.isHidden = true
                //ckiceToSaveBouten.isHidden = true
                if comparedLocation > 34.817549168324334 {
                    eastGlob.isHidden = true
                } else {
                    westGlob.isHidden = true
                    size = 1
                }
               
                
            }
            
        }

        @IBAction func start(_ sender: UIButton) {
            sender.isHidden = true
            performSegue(withIdentifier: "toGame", sender: self)
        }

        @IBAction func clickToSave(_ sender: UIButton) {
            showName.text = "Hi " + (getName.text ?? "")
            saveGetName = (getName.text ?? "")
            MyDataManager.shared.myVariable = (getName.text ?? "")
            getName.isHidden = true
            sender.isHidden = true
            //ckiceToSaveBouten = sender
            startButtton.isHidden = false
           

            if comparedLocation > 34.817549168324334 {
                eastGlob.isHidden = true
            } else {
                westGlob.isHidden = true
                size = 1
            }
        }

        func getUserLocation() {
            locationManager = CLLocationManager()
            locationManager?.requestAlwaysAuthorization()
            locationManager?.startUpdatingLocation()
            locationManager?.stopUpdatingLocation()
            locationManager?.delegate = self
        }

        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            if let location = locations.last {
                print("Lat : \(location.coordinate.latitude) \nLng : \(location.coordinate.longitude)")
                currentLocation = location.coordinate.longitude
            }
        }

        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if segue.identifier == "toGame" {
                if let gameController = segue.destination as? gameController {
                    gameController.viewCon = self
                }
            }
        }
    }



