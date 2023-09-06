////
////  AllesTest.swift
////  TempEngiOSTest
////
////  Created by Florian Klenk
////
//
//import SwiftUI
//import Charts
//
//struct AllesTest: View {
//    @State private var Aufnahme = [1, 2, 3, 4, 5]
//    @State private var dataset1 = [1, 2, 3, 4, 5]
//    @State private var dataset2 = [1, 2, 3, 4, 5]
//    @State private var sensor1_x = [27, 23, 9, 19, 24]
//    @State private var sensor1_y = [45, 22, 5, 12, 43]
//    @State private var sensor1_z = [32, 1, 41, 17, 48]
//    @State private var sensor2_x = [19, 11, 17, 8, 40]
//    @State private var sensor2_y = [14, 16, 19, 49, 42]
//    @State private var sensor2_z = [46, 11, 16, 42, 47]
//    let numbers: [Double]
//    let numbersMatrix: [[Double]]
//    
////    Nur für Beispiele
//    let Markierung = [5, 8]
////    Ende nur für Beispiele
//
//    
//    var body: some View {
//        
//        let (MaxWert, MaxPos) = findMaximumInArray(numbers)
//        let titel = "Test1"
//        let notiz = "Sensor x1"
//
//        
//        NavigationView{
//            VStack {
//                Text("Test")
//                    .font(.title)
//                
////                Button("Graph anzeigen; nur kleines Fenster") {
////                    GraphViewTestVariabel(numbers: [TestData.datensatz, TestData2.datensatz], NamenNumbers: [TestData.name, TestData2.name]);                    let hostingController = UIHostingController(rootView: graphView)
////                    UIApplication.shared.windows.first?.rootViewController?.present(hostingController, animated: true)
////                }
//                
//                NavigationLink(destination:
////                                GraphViewTestVariabel(numbers: [TestData.datensatz], NamenNumbers: [TestData.name])
//                               GraphViewTestVariabel(numbers: [TestData.datensatz, TestData2.datensatz], NamenNumbers: [TestData.name, TestData2.name], Titel: titel, Notiz: notiz)
//                ){Text("Neues Fenster; Tests")}
//                }
//            }
//        }
//    }
//
//public struct GraphViewTestMitMarkierung: View {
//    let numbers: [Double]
//    let MarkierungWert: Double
//    let MarkierungPosition: Int
//    
//    
//
//    public var body: some View {
//            VStack {
//                Text("Graph")
//                //            Text("Durchschnitt: \(average)")
//        ScrollView{
//                Chart {
//                    ForEach(Array(numbers.enumerated()), id: \.offset) { index, value in
//                        LineMark(
//                            x: .value("Index", index),
//                            y: .value("Value", value)
//                        )
//                        PointMark(
//                            x: .value("index", MarkierungPosition),
//                            y: .value("index", MarkierungWert)
//                        )
//                    }
//                }
//                .frame(height: 600)
//            }
//        }
//    }
//}
//
//struct GraphViewTestVariabel: View {
//    let numbers: [[Double]]
//    let NamenNumbers: [String]
//    let Titel: String
//    let Notiz: String
//    
//    var body: some View {
//        VStack {
//            Text(Titel)
//                .font(.title)
//            Text(Notiz)
//                .font(.title2)
//            
////                        Text("Durchschnitt: \(average)")
//            ScrollView{
//                Chart {
//
//                ForEach(Array(numbers.enumerated()), id: \.offset) { rowIndex, row in
//                        ForEach(Array(row.enumerated()), id: \.offset){ columnIndex, value in
//                            LineMark(
//                                x: .value("Index", columnIndex),
//                                y: .value("Value", value)
//                            )
//                            .foregroundStyle(by: .value("Daten", NamenNumbers[rowIndex]))
//                        }
//                    }
//                }
//                .frame(height: 600)
//
//            }
//        }
//    }
//}
//
///*
// Alt, allerdings können hiermit die Graphen auch in einer Abbildung dargestellt werden.
//struct GraphViewTestMehrereDatenMehrereViews: View {
//    let numbers: [[Double]]
//    
//    var body: some View {
//        VStack {
//            Text("Graph")
////                        Text("Durchschnitt: \(average)")
//            ScrollView{
//                Chart {
//                ForEach(Array(numbers.enumerated()), id: \.offset) { rowIndex, row in
//
//                        ForEach(Array(row.enumerated()), id: \.offset){ columnIndex, value in
//                            LineMark(
//                                x: .value("Index", columnIndex),
//                                y: .value("Value", value)
//                            )
//                        }
//                    }
//                }
//                                        .frame(height: 600)
//            }
//        }
//    }
//}
//*/
//
//
//struct AllesTest_Previews: PreviewProvider {
//    static var previews: some View {
//        AllesTest(numbers: [46, 11, 16, 42, 47], numbersMatrix: [[46, 11, 16, 42, 47], [45, 22, 5, 12, 43]])
//    }
//}
//
//
//
//func multiplyByTwo(_ data: [Double]) -> [Double] {
//        return data.map { $0 * 2 }
//    }
//    
//func calculateAverage(_ data: [Double]) -> Double {
//        let sum = data.reduce(0, +)
//        return Double(sum) / Double(data.count)
//    }
//    
//func integrateData(_ data: [Double]) -> [Double] {
//        var integratedData = [Double]()
//    var sum = 0.0
//        for value in data {
//            sum += value
//            integratedData.append(sum)
//        }
//        return integratedData
//    }
//    
//func resetToOriginalData(_ data: [Double]) -> [Double] {
//        return data
//    }
//
//public func findMaximumInArray(_ array: [Double]) -> (maximumValue: Double, position: Double) {
//        var maximumValue: Double = 0.0
//        var position: Double = -1
//
//        for (index, value) in array.enumerated() {
//            if value > maximumValue {
//                maximumValue = value
//                position = Double(index)
//            }
//        }
//
//        return (maximumValue, position)
//    }
//
//struct TestStruct: Identifiable {
//    var id = UUID()
//    var datensatz: [Double]
//    var zeit: [Int]
//    var name: String
//                    
//    init(datensatz: [Double], zeit: [Int], name: String){
//                        self.datensatz = datensatz
//                        self.zeit = zeit
//                        self.name = name
//                    }
//                }
//
//var TestData: TestStruct = TestStruct(datensatz: [19.0, 11.0, 17.0, 8.0, 40.0], zeit: [1, 2, 3, 4, 5], name: "Eins")
//var TestData2: TestStruct = TestStruct(datensatz: [46, 11, 16, 42, 47], zeit: [1, 2, 3, 4, 5], name: "Zwei")
