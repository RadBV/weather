//
//  ViewController.swift
//  weather
//
//  Created by Radharani Ribas-Valongo on 10/17/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -- Outlets
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherCollectionView: UICollectionView!
    @IBOutlet weak var zipcodeTextField: UITextField!
    
    //MARK: -- Properties
    
    var cityName = String() {
        didSet {
            cityLabel.text = "Forecast for \(self.cityName)"
        }
    }
    
    var weather = [Weather]() {
        didSet {
            weatherCollectionView.reloadData()
        }
    }
    
    var test = ["aaaa","bbbb","ccccc"]
    //MARK: - View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDefaults()
        setUpStuff()
        
        // Do any additional setup after loading the view.
    }
    
    //MARK: -- Functions
    func loadLatLong(zipCode: String) {
        ZipCodeHelper.getLatName(fromZipCode: zipCode) { (result) in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let info):
                UserDefaults.standard.set(info.lat, forKey: "latitude")
                UserDefaults.standard.set(info.long, forKey: "longitude")
                UserDefaults.standard.set(info.name, forKey: "name")
                self.cityName = info.name
                self.loadData(lat: info.lat, long: info.long)
            }
        }
    }
    
    private func loadData(lat: Double, long: Double) {
        WeatherAPIHelper.manager.getDailyWeather(info: (lat: lat, long: long)) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print(error)
                case .success(let dataFromOnline):
                    self.weather = dataFromOnline
                    dump(dataFromOnline)
                }
            }
        }
    }
    
    private func loadDefaults() {
        if let latitude = UserDefaults.standard.value(forKey: "latitude") as? Double, let longitude = UserDefaults.standard.value(forKey: "longitude") as? Double, let name = UserDefaults.standard.value(forKey: "name") as? String {
            cityName = name
            loadData(lat: latitude, long: longitude)
        }
    }
    
    private func setUpStuff() {
        zipcodeTextField.keyboardType = .numberPad
        zipcodeTextField.delegate = self
        weatherCollectionView.dataSource = self
        weatherCollectionView.delegate = self
        
        let layout = weatherCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if textField.text?.count == 5 {
            textField.resignFirstResponder()
            loadLatLong(zipCode: textField.text!)
        }
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return test.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeatherCell", for: indexPath) as! WeatherCell
//        let currentWeather = weather[indexPath.row]
//        cell.configureCell(thing: currentWeather)
        cell.dateLabel.text = test[0]
        cell.hiTemp.text = test[1]
        cell.loTemp.text = test[2]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
    
}
