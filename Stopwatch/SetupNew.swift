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
        self.spring = Spring(pre: Item(unit: "turn"))
        self.damper = Damper(lb: Item(),
                             lr: Item(),
                             hb: Item(),
                             hr: Item())
        self.arb = ARB(position: Item(unit: "pos"),
                       pre: Item(unit: "Nm"))
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

struct Item {
    var value : String
    var unit : String
    init () {
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
}

struct Spring {
    var pre : Item
}

struct Damper {
    var lb : Item
    var lr : Item
    var hb : Item
    var hr : Item
}

struct ARB {
    var position : Item
    var pre : Item
}

class General: NSObject, NSCoding {
    var brake : Brake
    var rearAero : RearAero
    var fuel : Fuel
    var gearbox : Gearbox
    var differential: Differential
    
    override init () {
        self.brake = Brake(brakeFL: Item(),
                           brakeFR: Item(),
                           brakeRL: Item(),
                           brakeRR: Item(),
                           front: Item(),
                           rear: Item())
        self.rearAero = RearAero(rearWingPos: Item())
        self.fuel = Fuel(consumption: Item(),
                         loaded: Item())
        self.gearbox = Gearbox(gearRatio: GearRatio(firstGear: Item(),
                                               secondGear: Item(),
                                               thirdGear: Item(),
                                               fourthGear: Item(),
                                               fifthGear: Item(),
                                               sixthGear: Item(),
                                               reverse: Item(),
                                               final: Item()))
        self.differential = Differential(rampeAngle: RampAngle(acceleration: Item(),
                                                               coast: Item()),
                                         frictionPad: Item(),
                                         pre: Item())
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

struct Brake {
    var brakeFL : Item
    var brakeFR : Item
    var brakeRL : Item
    var brakeRR : Item
    var front : Item
    var rear : Item
}

struct RearAero {
    var rearWingPos : Item
}

struct Fuel {
    var consumption : Item
    var loaded : Item
}

struct Gearbox {
    var gearRatio : GearRatio
}

struct GearRatio {
    var firstGear : Item
    var secondGear : Item
    var thirdGear : Item
    var fourthGear : Item
    var fifthGear : Item
    var sixthGear : Item
    var reverse : Item
    var final : Item
}

struct Differential {
    var rampeAngle : RampAngle
    var frictionPad : Item
    var pre : Item
}

struct RampAngle {
    var acceleration : Item
    var coast : Item
}

