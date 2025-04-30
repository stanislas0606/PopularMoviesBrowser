//
//  URLRequest+Defaults.swift
//  PopularMoviesBrowser
//
//  Created by Dima Vorona on 26.04.2025.
//  Copyright © 2025 TuneIn Inc. All rights reserved.
//

import Foundation

extension URLRequest {
    public init(baseURL: URL = URL(string: NetworkConfig.default.baseURL)!, path: String) {
        self.init(url: baseURL.appending(path: path, directoryHint: .notDirectory))
        self.setValue("application/json", forHTTPHeaderField: "Content-Type")
    }
}
