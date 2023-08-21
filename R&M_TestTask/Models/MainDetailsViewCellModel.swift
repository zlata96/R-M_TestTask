// MainDetailsViewCellModel.swift
// R&M_TestTask. Created by Zlata Guseva.

import Foundation

struct MainDetailsViewCellModel {
    let name: String
    let imageURL: URL?
    let lifeStatus: String

    init(name: String, imageURL: URL?, lifeStatus: String) {
        self.name = name
        self.imageURL = imageURL
        self.lifeStatus = lifeStatus
    }
}
