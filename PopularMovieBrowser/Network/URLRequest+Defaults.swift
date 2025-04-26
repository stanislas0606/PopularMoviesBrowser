//
//  URLRequest+Defaults.swift
//  TuneIn
//
//  Created by Dima Vorona on 26.04.2025.
//  Copyright © 2025 TuneIn Inc. All rights reserved.
//

import Foundation

extension URLRequest {
    init(baseURL: URL = URL(string: "https://api.themoviedb.org/3/movie")!, path: String) {
        self.init(url: baseURL.appending(path: path, directoryHint: .notDirectory))
    }
}
