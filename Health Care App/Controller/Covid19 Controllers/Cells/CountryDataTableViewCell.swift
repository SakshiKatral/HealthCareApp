//
//  CountryDataTableViewCell.swift
//  Health Care App
//
//  Created by Mac on 27/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class CountryDataTableViewCell: UITableViewCell {

    //MARK: - Variable Declaration
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var confirmedCases: UILabel!
    @IBOutlet weak var activeCases: UILabel!
    @IBOutlet weak var recoveredCases: UILabel!
    @IBOutlet weak var deaths: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
