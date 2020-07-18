//
//  AdviceBrain.swift
//  BMI Calculator App
//
//  Created by Mac on 16/07/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit
struct AdviceBrain {
    let advice = [Advice(effect: "https://youtu.be/2TgyqKmwIJo", yogaVideo: ["https://youtu.be/zpxHe8NxLmI", "https://youtu.be/iv1q-n3jvBc"], exerciseVideo: ["https://youtu.be/1pRfGMjs8Qs", "https://youtu.be/FDpM-CGMXcw"], dietPlanVideo: ["https://youtu.be/SI9zWtKeZAI", "https://youtu.be/XHbGWT5rBHc"]),
                  Advice(effect: "https://youtu.be/iVdlEWXWXRg", yogaVideo: ["https://youtu.be/RJ44oIxWiYI", "https://youtu.be/QPjwawKxuLw "], exerciseVideo: ["https://youtu.be/tamUJ23i33k", ""], dietPlanVideo: ["https://youtu.be/uZZMEYi91wA", "https://youtu.be/HAs6igXAoZU"]),
                  Advice(effect: "https://youtu.be/lKrWIhQDMl8", yogaVideo: ["https://youtu.be/0oYkCpv4n18", "https://youtu.be/qLigjccYrSg"], exerciseVideo: ["https://youtu.be/Yn6vKC55w40", "https://youtu.be/YjmQVMLhNT4"], dietPlanVideo: ["https://youtu.be/S_1zRdiZDjU","https://youtu.be/bFolXZdftNE"])
    ]
    
    func getURLLinks(catagory : String) -> Advice {
        if catagory == "Underweight"{
            return advice[0]
        }
        else if catagory == "Normal"{
            return advice[1]
        }
        else{
            return advice[2]
        }
    }
    
}
