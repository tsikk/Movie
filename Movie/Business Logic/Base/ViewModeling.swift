//
//  ViewModelling.swift
//  Movie
//
//  Created by Ilia Tsikelashvili on 29.07.22.
//

import Foundation

protocol ViewModeling: AnyObject {
    func initialSetup()
    func viewWillAppear(_ animated: Bool)
    func viewDidAppear(_ animated: Bool)
    func viewWillDisappear(_ animated: Bool)
}
