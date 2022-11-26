//
//  TagDetailView.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/23.
//

import SwiftUI
import CoreBluetooth

struct DeviceDetailView: View {
    @EnvironmentObject var manager: DeviceManager
    var device: Device
    var body: some View {
        VStack(alignment: .leading){
            Text(device.peripheral.name ?? "unnamed device")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text(device.peripheral.identifier.description)
                .font(.subheadline)
                .padding(.bottom,50)
            HStack {
                connectButton
                disconnectButton
            }
            Spacer()
       }
    }
    
    private var connectButton: some View {
        Button {
            manager.connect(perioheral: device.peripheral)
        } label: {
            Text("Connect")
                .bold()
                .padding()
                .frame(width: 150,height: 150)
                .foregroundColor(.primary)
                .overlay(
                    Circle()
                        .stroke(Color.primary, lineWidth: 3)
                )
        }
        .padding()
    }
    
    private var disconnectButton: some View {
        Button {
            manager.disconnect(peripheral: device.peripheral)
        } label: {
            Text("Disconnect")
                .bold()
                .padding()
                .frame(width: 150,height: 150)
                .foregroundColor(.primary)
                .overlay(
                    Circle()
                        .stroke(Color.primary, lineWidth: 3)
                )
        }
        .padding()
    }
}
