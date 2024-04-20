//
//  UserRoutes.swift
//  UIKit-Template
//
//  Created by Steven Wright on 4/19/24.
//

import Foundation
class UserRoutes: Backend {
    
    /// > Tip: `/api/user`
    ///
    /// - Returns:
    func fetchUser() async throws -> User {
        return try await fetch(url: "/api/user", parameters: nil)
    }
}
