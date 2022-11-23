//
//  TagListView.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/23.
//

import SwiftUI
import CoreBluetooth

struct TagListView: View {
    var peripheral: CBPeripheral
    var body: some View {
        VStack(alignment: .leading){
            Text(peripheral.name ?? "unnamed device")
                .fontWeight(.semibold)
        }
    }
}

