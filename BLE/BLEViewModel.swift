//
//  BLEViewModel.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/21.
//

import Foundation
import CoreBluetooth

class BLEViewModel: NSObject, ObservableObject {
    private var centralManager: CBCentralManager?
    @Published var peripherals:[CBPeripheral] = []
    let services:[CBUUID] = [CBUUID(string: MESHConstant.UUID.rawValue)]
    
    override init(){
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
}

extension BLEViewModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(withServices: services)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if !peripherals.contains(peripheral) {
            self.peripherals.append(peripheral)
        }
    }
}
