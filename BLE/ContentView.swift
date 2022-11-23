//
//  ContentView.swift
//  BLE
//
//  Created by 田中大地 on 2022/11/21.
//

import SwiftUI
import CoreBluetooth

struct ContentView: View {
    @EnvironmentObject var viewModel: BLEViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.peripherals,id:\.self){ peripheral in
                NavigationLink {
                    TagDetailView(peripheral: peripheral)
                } label: {
                    TagListView(peripheral: peripheral)
                }
            }
            .navigationTitle(Text("Peripherals"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
