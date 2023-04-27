//
//  HomeView.swift
//  shop
//
//  Created by Taniuchi Wataru on 2023/04/26.
//

import SwiftUI
import shared

struct HomeView: View {
    @StateObject
    var viewModel = WeatherViewModel()
    
    @State
    private var selectedPrefecture = 1
    
    
    var body: some View {
        if(viewModel.loading) {
            ProgressView()
        }
        Picker(selection: $selectedPrefecture, label: Text("ラベル")) {
            Text("東京").tag(1)
            Text("千葉").tag(2)
            Text("神奈川").tag(3)
        }.onAppear() {
            viewModel.fetch(prefecture: Prefecture.convert(tag: selectedPrefecture))
        }.onChange(of: selectedPrefecture) { newValue in
            viewModel.fetch(prefecture: Prefecture.convert(tag: selectedPrefecture))
        }.pickerStyle(SegmentedPickerStyle())
            .onAppear()
        ScrollView {
            Text(viewModel.weather?.description_?.bodyText ?? "")
        }
        Spacer()

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
