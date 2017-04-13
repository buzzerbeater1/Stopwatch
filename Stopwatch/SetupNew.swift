//
//  SetupNew.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/6/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation

//class SetupNew: NSObject, NSCoding {
//    var fl: Wheel
//    var fr: Wheel
//    var rl: Wheel
//    var rr: Wheel
//    var general: General
//    override init () {
//        let wheel = Wheel(rideHeight: Item(unit: "mm"),
//                          trackPlate: Item(unit: "mm"),
//                          spring: Spring(pre: Item(unit: "turn")),
//                          damper: Damper(lb: Item(),
//                                         lr: Item(),
//                                         hb: Item(),
//                                         hr: Item()),
//                          arb: ARB(position: Item(unit: "pos"),
//                                   pre: Item(unit: "Nm")),
//                          camber: Item(unit: "deg"),
//                          toe: Item(unit: "mm"),
//                          coldPressure: Item(unit: "Psi"),
//                          hotPressure: Item(unit: "Psi"))
//        self.fl = wheel
//        self.fr = wheel
//        self.rl = wheel
//        self.rr = wheel
//        self.general = General(brake: Brake(brakeFL: Item(),
//                                            brakeFR: Item(),
//                                            brakeRL: Item(),
//                                            brakeRR: Item(),
//                                            front: Item(),
//                                            rear: Item()),
//                               rearAero: RearAero(rearWingPos: Item()),
//                               fuel: Fuel(consumption: Item(),
//                                          loaded: Item()),
//                               gearbox: Gearbox(gearRatio: GearRatio(firstGear: Item(),
//                                                                     secondGear: Item(),
//                                                                     thirdGear: Item(),
//                                                                     fourthGear: Item(),
//                                                                     fifthGear: Item(),
//                                                                     sixthGear: Item(),
//                                                                     reverse: Item(),
//                                                                     final: Item())),
//                               differential: Differential(rampeAngle: RampAngle(acceleration: Item(),
//                                                                                coast: Item()),
//                                                          frictionPad: Item(),
//                                                          pre: Item()))
//    }
//    
//    required init(coder aDecoder: NSCoder) {
//        self.fl = aDecoder.decodeObject(forKey: "fl") as! Wheel
//        self.fr = aDecoder.decodeObject(forKey: "fr") as! Wheel
//        self.rl = aDecoder.decodeObject(forKey: "rl") as! Wheel
//        self.rr = aDecoder.decodeObject(forKey: "rr") as! Wheel
//        self.general = aDecoder.decodeObject(forKey: "general") as! General
//    }
//    
//    func encode(with aCoder: NSCoder) {
//        aCoder.encode(self.fl, forKey: "fl")
//        aCoder.encode(self.fr, forKey: "fr")
//        aCoder.encode(self.rl, forKey: "rl")
//        aCoder.encode(self.rr, forKey: "rr")
//        aCoder.encode(self.general, forKey: "general")
//    }
//}

class Wheel: NSObject, NSCoding {
    var rideHeight : Item
    var trackPlate : Item
    var spring : Spring
    var damper : Damper
    var arb : ARB
    var camber : Item
    var toe : Item
    var coldPressure : Item
    var hotPressure : Item
    
    override init () {
        self.rideHeight = Item(unit: "mm")
        self.trackPlate = Item(unit: "mm")
        self.spring = Spring()
        self.damper = Damper()
        self.arb = ARB()
        self.camber = Item(unit: "deg")
        self.toe = Item(unit: "mm")
        self.coldPressure = Item(unit: "Psi")
        self.hotPressure = Item(unit: "Psi")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.rideHeight = aDecoder.decodeObject(forKey: "rideHeight") as! Item
        self.trackPlate = aDecoder.decodeObject(forKey: "trackPlate") as! Item
        self.spring = aDecoder.decodeObject(forKey: "spring") as! Spring
        self.damper = aDecoder.decodeObject(forKey: "damper") as! Damper
        self.arb = aDecoder.decodeObject(forKey: "arb") as! ARB
        self.camber = aDecoder.decodeObject(forKey: "camber") as! Item
        self.toe = aDecoder.decodeObject(forKey: "toe") as! Item
        self.coldPressure = aDecoder.decodeObject(forKey: "coldPressure") as! Item
        self.hotPressure = aDecoder.decodeObject(forKey: "hotPressure") as! Item
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.rideHeight, forKey: "rideHeight")
        aCoder.encode(self.trackPlate, forKey: "trackPlate")
        aCoder.encode(self.spring, forKey: "spring")
        aCoder.encode(self.damper, forKey: "damper")
        aCoder.encode(self.arb, forKey: "arb")
        aCoder.encode(self.camber, forKey: "camber")
        aCoder.encode(self.toe, forKey: "toe")
        aCoder.encode(self.coldPressure, forKey: "coldPressure")
        aCoder.encode(self.hotPressure, forKey: "hotPressure")
    }
}

class Item: NSObject, NSCoding {
    var value : String
    var unit : String
    override init () {
        self.value = "0.0"
        self.unit = ""
    }
    init (value: String) {
        self.value = value
        self.unit = ""
    }
    init (unit: String) {
        self.value = "0.0"
        self.unit = unit
    }
    init (value: String, unit: String) {
        self.value = value
        self.unit = unit
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.value = aDecoder.decodeObject(forKey: "value") as! String
        self.unit = aDecoder.decodeObject(forKey: "unit") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.value, forKey: "value")
        aCoder.encode(self.unit, forKey: "unit")
    }
}

class Spring: NSObject, NSCoding {
    var pre : Item
    
    override init() {
        self.pre = Item(unit: "turn")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.pre = aDecoder.decodeObject(forKey: "pre") as! Item
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.pre, forKey: "pre")
    }
}

class Damper: NSObject, NSCoding {
    var lb : Item
    var lr : Item
    var hb : Item
    var hr : Item
    
    override init() {
        self.lb = Item()
        self.lr = Item()
        self.hb = Item()
        self.hr = Item()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.lb = aDecoder.decodeObject(forKey: "lb") as! Item
        self.lr = aDecoder.decodeObject(forKey: "lr") as! Item
        self.hb = aDecoder.decodeObject(forKey: "hb") as! Item
        self.hr = aDecoder.decodeObject(forKey: "hr") as! Item
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.lb, forKey: "lb")
        aCoder.encode(self.lr, forKey: "lr")
        aCoder.encode(self.hb, forKey: "hb")
        aCoder.encode(self.hr, forKey: "hr")
    }
}

class ARB: NSObject, NSCoding {
    var position : Item
    var pre : Item
    
    override init() {
        self.position = Item(unit: "pos")
        self.pre = Item(unit: "Nm")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.position = aDecoder.decodeObject(forKey: "position") as! Item
        self.pre = aDecoder.decodeObject(forKey: "pre") as! Item
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.position, forKey: "position")
        aCoder.encode(self.pre, forKey: "pre")
    }
}

class General: NSObject, NSCoding {
    var brake : Brake
    var rearAero : RearAero
    var fuel : Fuel
    var gearbox : Gearbox
    var differential: Differential
    
    override init () {
        self.brake = Brake()
        self.rearAero = RearAero()
        self.fuel = Fuel()
        self.gearbox = Gearbox()
        self.differential = Differential()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.brake = aDecoder.decodeObject(forKey: "brake") as! Brake
        self.rearAero = aDecoder.decodeObject(forKey: "rearAero") as! RearAero
        self.fuel = aDecoder.decodeObject(forKey: "fuel") as! Fuel
        self.gearbox = aDecoder.decodeObject(forKey: "gearbox") as! Gearbox
        self.differential = aDecoder.decodeObject(forKey: "differential") as! Differential
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.brake, forKey: "brake")
        aCoder.encode(self.rearAero, forKey: "rearAero")
        aCoder.encode(self.fuel, forKey: "fuel")
        aCoder.encode(self.gearbox, forKey: "gearbox")
        aCoder.encode(self.differential, forKey: "differential")
    }
}

class Brake: NSObject, NSCoding {
    var brakeFL : Item
    var brakeFR : Item
    var brakeRL : Item
    var brakeRR : Item
    var front : Item
    var rear : Item
    
    override init() {
        self.brakeFL = Item()
        self.brakeFR = Item()
        self.brakeRL = Item()
        self.brakeRR = Item()
        self.front = Item()
        self.rear = Item()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.brakeFL = aDecoder.decodeObject(forKey: "brakeFL") as! Item
        self.brakeFR = aDecoder.decodeObject(forKey: "brakeFR") as! Item
        self.brakeRL = aDecoder.decodeObject(forKey: "brakeRL") as! Item
        self.brakeRR = aDecoder.decodeObject(forKey: "brakeRR") as! Item
        self.front = aDecoder.decodeObject(forKey: "front") as! Item
        self.rear = aDecoder.decodeObject(forKey: "rear") as! Item
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.brakeFL, forKey: "brakeFL")
        aCoder.encode(self.brakeFR, forKey: "brakeFR")
        aCoder.encode(self.brakeRL, forKey: "brakeRL")
        aCoder.encode(self.brakeRR, forKey: "brakeRR")
        aCoder.encode(self.front, forKey: "front")
        aCoder.encode(self.rear, forKey: "rear")
    }
}

class RearAero: NSObject, NSCoding {
    var rearWingPos : Item
    
    override init() {
        self.rearWingPos = Item()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.rearWingPos = aDecoder.decodeObject(forKey: "rearWingPos") as! Item
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.rearWingPos, forKey: "rearWingPos")
    }
}

class Fuel: NSObject, NSCoding {
    var consumption : Item
    var loaded : Item
    
    override init() {
        self.consumption = Item()
        self.loaded = Item()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.consumption = aDecoder.decodeObject(forKey: "consumption") as! Item
        self.loaded = aDecoder.decodeObject(forKey: "loaded") as! Item
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.consumption, forKey: "consumption")
        aCoder.encode(self.loaded, forKey: "loaded")
    }
}

class Gearbox: NSObject, NSCoding {
    var gearRatio : GearRatio
    
    override init() {
        self.gearRatio = GearRatio()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.gearRatio = aDecoder.decodeObject(forKey: "gearRatio") as! GearRatio
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.gearRatio, forKey: "gearRatio")
    }
}

class GearRatio: NSObject, NSCoding {
    var firstGear : Item
    var secondGear : Item
    var thirdGear : Item
    var fourthGear : Item
    var fifthGear : Item
    var sixthGear : Item
    var reverse : Item
    var final : Item
    
    override init() {
        self.firstGear = Item()
        self.secondGear = Item()
        self.thirdGear = Item()
        self.fourthGear = Item()
        self.fifthGear = Item()
        self.sixthGear = Item()
        self.reverse = Item()
        self.final = Item()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.firstGear = aDecoder.decodeObject(forKey: "firstGear") as! Item
        self.secondGear = aDecoder.decodeObject(forKey: "secondGear") as! Item
        self.thirdGear = aDecoder.decodeObject(forKey: "thirdGear") as! Item
        self.fourthGear = aDecoder.decodeObject(forKey: "fourthGear") as! Item
        self.fifthGear = aDecoder.decodeObject(forKey: "fifthGear") as! Item
        self.sixthGear = aDecoder.decodeObject(forKey: "sixthGear") as! Item
        self.reverse = aDecoder.decodeObject(forKey: "reverse") as! Item
        self.final = aDecoder.decodeObject(forKey: "final") as! Item
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.firstGear, forKey: "firstGear")
        aCoder.encode(self.secondGear, forKey: "secondGear")
        aCoder.encode(self.thirdGear, forKey: "thirdGear")
        aCoder.encode(self.fourthGear, forKey: "fourthGear")
        aCoder.encode(self.fifthGear, forKey: "fifthGear")
        aCoder.encode(self.sixthGear, forKey: "sixthGear")
        aCoder.encode(self.reverse, forKey: "reverse")
        aCoder.encode(self.final, forKey: "final")
    }
}

class Differential: NSObject, NSCoding {
    var rampAngle : RampAngle
    var frictionPad : Item
    var pre : Item
    
    override init() {
        self.rampAngle = RampAngle()
        self.frictionPad = Item()
        self.pre = Item()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.rampAngle = aDecoder.decodeObject(forKey: "rampAngle") as! RampAngle
        self.frictionPad = aDecoder.decodeObject(forKey: "frictionPad") as! Item
        self.pre = aDecoder.decodeObject(forKey: "pre") as! Item
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.rampAngle, forKey: "rampAngle")
        aCoder.encode(self.frictionPad, forKey: "frictionPad")
        aCoder.encode(self.pre, forKey: "pre")
    }
}

class RampAngle: NSObject, NSCoding {
    var acceleration : Item
    var coast : Item
    
    override init() {
        self.acceleration = Item()
        self.coast = Item()
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.acceleration = aDecoder.decodeObject(forKey: "acceleration") as! Item
        self.coast = aDecoder.decodeObject(forKey: "coast") as! Item
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.acceleration, forKey: "acceleration")
        aCoder.encode(self.coast, forKey: "coast")
    }
}

