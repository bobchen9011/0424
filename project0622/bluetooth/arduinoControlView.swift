import SwiftUI
import CoreBluetooth
import Charts

class BluetoothManagerr: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    weak var delegate: BluetoothManagerDelegate?
    var centralManager: CBCentralManager!
    var peripheral: CBPeripheral?
    let EMGServiceUUID = CBUUID(string: "FFE0")
    let EMGCharacteristicUUID = CBUUID(string: "FFE1")
    var EMGCharacteristic: CBCharacteristic?
    
    override init() {
        super.init()
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch central.state {
        case .poweredOn:
            centralManager.scanForPeripherals(withServices: [EMGServiceUUID], options: nil)
        default:
            print("藍牙不可用。")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String: Any], rssi RSSI: NSNumber) {
        self.peripheral = peripheral
        centralManager.connect(peripheral, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.delegate = self
        peripheral.discoverServices([EMGServiceUUID])
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services {
                if service.uuid == EMGServiceUUID {
                    peripheral.discoverCharacteristics([EMGCharacteristicUUID], for: service)
                }
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                print("Characteristic UUID: \(characteristic.uuid)")
                print("Service UUID: \(service.uuid)")
                if characteristic.uuid == EMGCharacteristicUUID {
                    EMGCharacteristic = characteristic
                    peripheral.setNotifyValue(true, for: characteristic)
                }
            }
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
        if let data = characteristic.value, let emgString = String(data: data, encoding: .utf8) {
            delegate?.didReceiveEMGString(emgString)
        }
    }
}

protocol BluetoothManagerDelegate: AnyObject {
    func didReceiveEMGString(_ emgString: String)
}

class AnalysisViewModel: ObservableObject, BluetoothManagerDelegate {
    @Published var emgValues: [String] = []
    @Published var status: String = ""
    @Published var countdown: Int = 0
    
    private var bluetoothManagerr: BluetoothManagerr
    private var isCapturing: Bool = false
    private var captureTimer: Timer?
    private let captureDuration: TimeInterval = 10 // 10秒
    
    init() {
        bluetoothManagerr = BluetoothManagerr()
        bluetoothManagerr.delegate = self
    }
    
    func didReceiveEMGString(_ emgString: String) {
        if isCapturing {
            DispatchQueue.main.async {
                self.emgValues.append(emgString)
                self.updateStatus(with: emgString)
            }
        }
    }
    
    private func updateStatus(with emgString: String) {
        let pattern = "\\d+" // 只匹配數字字符
        if let range = emgString.range(of: pattern, options: .regularExpression) {
            let emgValueString = emgString[range]
            if let emgValue = Int(emgValueString) {
                print("轉換成功：\(emgValue)")
                if emgValue < 340 {
                    status = "收縮"
                } else if emgValue <= 362 {
                    status = "平均"
                } else {
                    status = "緊繃"
                }
            } else {
                print("轉換失敗")
                status = "轉換錯誤"
            }
        } else {
            print("不是數字字符")
            status = "轉換錯誤"
        }
    }
    
    func startCapture() {
        emgValues = []
        isCapturing = true
        countdown = Int(captureDuration)
        
        // 啟動計時器，在指定時間結束後停止擷取
        captureTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.countdown -= 1
            
            if self.countdown <= 0 {
                timer.invalidate()
                self.stopCapture()
            }
        }
    }
    
    func stopCapture() {
        isCapturing = false
        captureTimer?.invalidate()
        captureTimer = nil
    }
}

struct AnalysisView: View {
    @StateObject private var viewModel: AnalysisViewModel
    
    init() {
        _viewModel = StateObject(wrappedValue: AnalysisViewModel())
    }
    
    var body: some View {
        VStack {
            Text("EMG 值")
                .font(.title)
                .padding()
            
            VStack {
                Button(action: {
                    viewModel.startCapture()
                }, label: {
                    Text("開始擷取 EMG 值")
                        .font(.headline)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(10)
                })
                .padding()
                
                List(viewModel.emgValues, id: \.self) { emgValue in
                    Text("EMG 值：\(emgValue)")
                        .font(.system(size: 16))
                        .padding()
                }
                
                Text("狀態：\(viewModel.status)")
                    .font(.headline)
                    .padding()
                
                Text("倒數計時：\(viewModel.countdown) 秒")
                    .font(.headline)
                    .padding()
            }
        }
    }
}


struct AnalysisView_Previews: PreviewProvider {
    static var previews: some View {
        AnalysisView()
    }
}
