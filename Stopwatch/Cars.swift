//
//  Cars.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 2/28/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation

class Cars {
    private var _image: String!
    private var _nameDetails: String!
    private var _model: String!
    
    var image: String {
        get {
            return _image }
        set {
            _image = newValue
        }
    }
    
    var nameDetails: String {
        get {
            return _nameDetails }
        set {
            _nameDetails = newValue
        }
    }
    
    var model: String {
        get {
            return _model
        } set {
            _model = newValue
        }
    }
    
    init(image: String, nameDetails: String, model: String){
        _image = image
        _nameDetails = nameDetails
        _model = model
    }
}
