//
//  WeatherCell.swift
//  weather
//
//  Created by Radharani Ribas-Valongo on 10/17/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

class WeatherCell: UICollectionViewCell {
    
    //MARK: -- Outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var weatherImage: UIImageView!
    @IBOutlet weak var hiTemp: UILabel!
    @IBOutlet weak var loTemp: UILabel!
    
    //MARK: -- Functions
    
    func configureCell(thing: Weather) {
        self.dateLabel.text = thing.date
        self.hiTemp.text = thing.temperatureHigh.description
        self.loTemp.text = thing.temperatureLow.description
        
    }
    
}
