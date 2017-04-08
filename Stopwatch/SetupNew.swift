//
//  SetupNew.swift
//  Stopwatch
//
//  Created by Michael Derstroff on 4/6/17.
//  Copyright © 2017 Stable Engineering. All rights reserved.
//

import Foundation

struct SetupNew {
    var FL: Wheel
    var FR: Wheel
    var RL: Wheel
    var RR: Wheel
    var general: General
    init () {
        let wheel = Wheel(rideHeight: Item(unit: "mm"),
                          trackPlate: Item(unit: "mm"),
                          spring: Spring(pre: Item(unit: "turn")),
                          damper: Damper(lb: Item(),
                                         lr: Item(),
                                         hb: Item(),
                                         hr: Item()),
                          arb: ARB(position: Item(unit: "pos"),
                                   pre: Item(unit: "Nm")),
                          camber: Item(unit: "deg"),
                          toe: Item(unit: "mm"),
                          coldPressure: Item(unit: "Psi"),
                          hotPressure: Item(unit: "Psi"))
        self.FL = wheel
        self.FR = wheel
        self.RL = wheel
        self.RR = wheel
        self.general = General(brake: Brake(brakeFL: Item(),
                                            brakeFR: Item(),
                                            brakeRL: Item(),
                                            brakeRR: Item(),
                                            front: Item(),
                                            rear: Item()),
                               rearAero: RearAero(rearWingPos: Item()),
                               fuel: Fuel(consumption: Item(),
                                          loaded: Item()),
                               gearbox: Gearbox(gearRatio: GearRatio(firstGear: Item(),
                                                                     secondGear: Item(),
                                                                     thirdGear: Item(),
                                                                     fourthGear: Item(),
                                                                     fifthGear: Item(),
                                                                     sixthGear: Item(),
                                                                     reverse: Item(),
                                                                     final: Item())),
                               differential: Differential(rampeAngle: RampAngle(acceleration: Item(),
                                                                                coast: Item()),
                                                          frictionPad: Item(),
                                                          pre: Item()))
    }
}

struct Wheel {
    var rideHeight : Item
    var trackPlate : Item
    var spring : Spring
    var damper : Damper
    var arb : ARB
    var camber : Item
    var toe : Item
    var coldPressure : Item
    var hotPressure : Item
}

struct Item {
    var value : Double
    var unit : String
    init () {
        self.value = 0.0
        self.unit = ""
    }
    init (value: Double) {
        self.value = value
        self.unit = ""
    }
    init (unit: String) {
        self.value = 0.0
        self.unit = unit
    }
    init (value: Double, unit: String) {
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

struct General {
    var brake : Brake
    var rearAero : RearAero
    var fuel : Fuel
    var gearbox : Gearbox
    var differential: Differential
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

