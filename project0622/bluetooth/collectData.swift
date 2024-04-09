//
//  collectData.swift
//  newProject
//
//  Created by e530 on 2023/6/9.
//

import Foundation
import SwiftUI
import Firebase

struct collectView: View {
    @State private var documents: [QueryDocumentSnapshot] = []

    var body: some View {
        VStack {
            Button("接收數據") {
                fetchFirestoreData()
            }
            List(documents, id: \.documentID) { document in
                VStack(alignment: .leading) {
                    Text("emg數據: \(document.data()["emgData"] as? String ?? "")")
                    Text("使用時間: \(formattedTimestamp(document.data()["time:"] as? Timestamp))")
                }
            }
        }
    }
    
    func fetchFirestoreData() {
        let collectionRef = Firestore.firestore().collection("emgData")
        collectionRef.getDocuments { (snapshot, error) in
            if let error = error {
                print("Error fetching documents: \(error)")
                return
            }
            
            guard let documents = snapshot?.documents else {
                print("No documents found")
                return
            }
            
            self.documents = documents
        }
    }
    
    func formattedTimestamp(_ timestamp: Timestamp?) -> String {
        guard let timestamp = timestamp else {
            return ""
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        return formatter.string(from: timestamp.dateValue())
    }
}
