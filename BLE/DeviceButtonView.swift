//
//  DeviceButtonView.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/26.
//

import SwiftUI
import CoreBluetooth

struct DeviceButtonView: View {
    @EnvironmentObject var manager: DeviceManager
    var device: Device
    var operation: Operation
    
    var body: some View {
        Button {
            toggle(operation)
        } label: {
            Text(operation.description)
                .bold()
                .padding()
                .frame(width: 150,height: 150)
                .foregroundColor(.primary)
                .overlay(
                    Circle()
                        .stroke(Color.primary, lineWidth: 3)
                )
        }
    }
    
    internal enum Operation: String {
        case connect = "Connect"
        case disconect = "Disconect"
        var description: String {
            return rawValue
        }
    }
    
    private func toggle(_ operation: Operation) {
        switch operation {
        case .connect: manager.connect(perioheral: device.peripheral)
        case .disconect: manager.disconnect(peripheral: device.peripheral)
        }
    }
}
