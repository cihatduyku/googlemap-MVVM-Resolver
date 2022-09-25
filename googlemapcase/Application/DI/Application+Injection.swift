//
//  Application+Injection.swift
//  googlemapcase
//
//  Created by Cihat Duyku on 24.09.2022.
//

import Resolver

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        registerUI()
        registerData()
        registerDomain()
    }
    
}

func resolve<T>(args: Any?) -> T {
    Resolver.resolve(args: args)
}

func resolve<T>() -> T {
    Resolver.resolve()
}

func resolve<T>(_: T.Type) -> T {
    Resolver.resolve()
}
