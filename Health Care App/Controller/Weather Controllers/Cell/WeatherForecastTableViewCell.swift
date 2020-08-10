//
//  WeatherForecastTableViewCell.swift
//  Health Care App
//
//  Created by Mac on 07/08/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class WeatherForecastTableViewCell: UITableViewCell {
//MARK: - Properties
    @IBOutlet weak var dateLable: UILabel!
    @IBOutlet weak var temparatureLable: UILabel!
    @IBOutlet weak var minTemparatureLable: UILabel!
    @IBOutlet weak var maxTemparatureLable: UILabel!
    @IBOutlet weak var pressureLable: UILabel!
    @IBOutlet weak var humidityLable: UILabel!
    @IBOutlet weak var windSpeedLable: UILabel!
    @IBOutlet weak var windDegLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
