// APIEndpoint.swift
// R&M_TestTask. Created by Zlata Guseva.

import Foundation

/// Represents unique API endpoint
enum APIEndpoint: String, CaseIterable, Hashable {
    /// Endpoint to get character info
    case character
    /// Endpoint to get episode info
    case episode
}
