//
//  RequestViewModel.swift
//  APItest
//
//  Created by Peter Delgado on 18/5/22.
//  Copyright © 2022 London App Brewery. All rights reserved.
//

import RxSwift
import MGSelector
import Alamofire


struct DetailOption {
    var key: String
}

extension DetailOption: MGSelectorOption {
    
    var title: String {
        return key
    }
    
    var detail: String? {
        switch key {
        case "GET": return "GET"
        case "POST": return "POST"
        case "PUT": return "PUT"
        case "DELETE": return "DELETE"
        
        default: return nil
        }
    }
}
