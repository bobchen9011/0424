//
//  blueToothView.swift
//  go
//
//  Created by e530 on 2022/12/14.
//

import SwiftUI
import CoreBluetooth

class BluetoothViewModel: NSObject, ObservableObject, CBPeripheralDelegate {
    private var centralManager: CBCentralManager?
    private var peripherals: [CBPeripheral] = []
    @Published var peripheralNames: [String] = []
    private var connectedPeripheral: CBPeripheral?
    
    override init() {
        super.init()
        self.centralManager = CBCentralManager(delegate: self, queue: .main)
    }
}

extension BluetoothViewModel: CBCentralManagerDelegate {
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            self.centralManager?.scanForPeripherals(withServices: nil, options: [CBCentralManagerScanOptionAllowDuplicatesKey:true])
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        if !peripherals.contains(peripheral) {
            self.peripherals.append(peripheral)
            self.peripheralNames.append(peripheral.name ?? "\(peripheral)")
        }
    }
    
    func connectToPeripheral(at index: Int) {
        let peripheral = self.peripherals[index]
        peripheral.delegate = self
        self.centralManager?.connect(peripheral, options: nil)
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services {
                print("Service UUID: \(service.uuid)")
            }
        }
    }
}


struct blueToothView: View {
    @ObservedObject private var bluetoothViewModel = BluetoothViewModel()
    @State private var showAlert = false
    @State private var selectedPeripheral = ""
    
    var body: some View {
        NavigationView {
            List(bluetoothViewModel.peripheralNames, id: \.self) { peripheral in
                Button(peripheral) {
                    self.selectedPeripheral = peripheral
                    self.showAlert = true
                }
            }
            .navigationTitle("其他裝置")
            .alert(isPresented: $showAlert) {
                connectionAlert()
            }
        }
    }
    
    func connectionAlert() -> Alert {
        Alert(
            title: Text("連接藍芽"),
            message: Text("請問要連接此藍芽嗎？"),
            primaryButton: .default(Text("確認"), action: {
                self.connectToPeripheral(self.selectedPeripheral)
            }),
            secondaryButton: .cancel(Text("取消"))
        )
    }
    
    func connectToPeripheral(_ peripheral: String) {
        let index = self.bluetoothViewModel.peripheralNames.firstIndex(of: peripheral)!
        self.bluetoothViewModel.connectToPeripheral(at: index)
    }
}

struct blueToothView_Previews: PreviewProvider {
    static var previews: some View {
        blueToothView()
    }
}
