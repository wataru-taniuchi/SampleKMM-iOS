//
//  WeatherViewModel.swift
//  shop
//
//  Created by Taniuchi Wataru on 2023/04/26.
//

import Foundation
import shared
import Combine

class WeatherViewModel: ObservableObject {
    private var viewModel: WeatherCallbackViewModel?
    @Published
    var loading = false
    
    @Published
    var weather: WeatherData?
    
    @Published
    var error: String?
    
    private var cancellables = [AnyCancellable]()
    
    func activate() {
        let viewModel = KotlinDependencies.shared.getWeatherViewModel()
        doPublish(viewModel.weatherState) { [weak self] state in
            self?.loading = state.isLoading
            self?.weather = state.weather
        }.store(in: &cancellables)
        
        self.viewModel = viewModel
    }
    
    func deactivate() {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
        
        viewModel?.clear()
        viewModel = nil
    }
    
    func fetch(prefecture: Prefecture) {
        viewModel?.fetch(prefecture: prefecture)
    }
}
