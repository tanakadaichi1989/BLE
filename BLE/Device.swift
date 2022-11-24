//
//  Device.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/24.
//

import Foundation
import CoreBluetooth

final class Device: NSObject {
    let peripheral: CBPeripheral
    let rssi: NSNumber
    var state = State.disconnected
    
    init(peripheral: CBPeripheral, rssi: NSNumber){
        self.peripheral = peripheral
        self.rssi = rssi
        super.init()
        peripheral.delegate = self
    }
}

extension Device {
    enum State: String, CustomStringConvertible {
        case disconnected
        case connected
        var description: String {
            return rawValue
        }
    }
}

extension Device: CBPeripheralDelegate {}
