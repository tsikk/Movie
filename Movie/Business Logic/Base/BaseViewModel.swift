//
//  BaseViewModel.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import Combine
import Foundation

class BaseViewModel: ViewModeling, ObservableObject {

    private var counter = 0
    
    @Published var isLoading = false {
        willSet {
            objectWillChange.send()
        }
    }

    var didChangeLoadingTo: ((Bool) -> Void)?

    required init() {
        initialSetup()
    }

    func initialSetup() {}
    func viewWillAppear(_ animated: Bool) {}
    func viewDidAppear(_ animated: Bool) {}
    func viewWillDisappear(_ animated: Bool) {}

    func retainLoading() {
        if counter == 0 {
            notifyLoadingUpdate(to: true)
        }

        counter += 1
    }
    func releaseLoading() {
        guard counter > 0 else { return }

        counter -= 1

        if counter == 0 {
            notifyLoadingUpdate(to: false)
        }
    }
    func disableLoading() {
        counter = 0
        notifyLoadingUpdate(to: false)
    }

    // MARK: - Private

    private func notifyLoadingUpdate(to isLoading: Bool) {
        
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            self.isLoading = isLoading
            self.didChangeLoadingTo?(isLoading)
        }
    }
}
