//
//  NetworkError.swift
//  searchGithubAndItunes
//
//  Created by Andrey Posnov on 26/05/2019.
//  Copyright © 2019 Andrey Posnov. All rights reserved.
//

import Foundation

enum  NetworkError : Error {
    case failInternerError
    case noInternetConnection
}
