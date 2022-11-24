//
//  BLEViewModel.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/21.
//

import Foundation
import CoreBluetooth

class DeviceManager: NSObject, ObservableObject {
    private let centralManager: CBCentralManager
    private let services:[CBUUID] = [CBUUID(string: MESH.UUID.description)]
    @Published var devices:[Device] = []
    
    override init(){
        centralManager = CBCentralManager(delegate: nil, queue: nil)
        super.init()
        centralManager.delegate = self
        self.scan()
    }
    
    func scan(){
        centralManager.scanForPeripherals(withServices: services, options: nil)
    }
    
    func stopScan(){
        centralManager.stopScan()
    }
    
    func connect(perioheral: CBPeripheral){
        centralManager.connect(perioheral, options: nil)
    }
    
    func disconnect(peripheral: CBPeripheral){
        centralManager.cancelPeripheralConnection(peripheral)
    }
}

extension DeviceManager: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            centralManager.scanForPeripherals(withServices: services)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        let device = Device(peripheral: peripheral, rssi: RSSI)
        if let index = devices.firstIndex(where: { $0.peripheral.identifier == device.peripheral.identifier }) {
            devices[index] = device
        } else {
            devices.append(device)
        }
        centralManager.stopScan()
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        devices.first { $0.peripheral == peripheral }
            .map { $0.state = .connected }
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
        devices.first { $0.peripheral == peripheral }
            .map { $0.state = .disconnected }
    }
}
