//
//  PAGFileImpl.swift
//
//  Created by 闫守旺 on 2025/4/9.
//

import Flutter
import libpag

class PAGFileImpl: PigeonApiDelegatePAGFileApi {
    func asset(pigeonApi: PigeonApiPAGFileApi, asset: String) throws -> PAGFile {
        let assetKey = FlutterDartProject.lookupKey(forAsset: asset)
        let assetPath = Bundle.main.path(forResource: assetKey, ofType: nil)!
        return PAGFile.load(assetPath)
    }

    func file(pigeonApi: PigeonApiPAGFileApi, file: String) throws -> PAGFile {
        return PAGFile.load(file)
    }

    func memory(pigeonApi: PigeonApiPAGFileApi, memory: FlutterStandardTypedData) throws -> PAGFile {
        let data = memory.data
        return try! data.withUnsafeBytes<UInt8> {
            return PAGFile.load($0.baseAddress!, size: data.count)
        }
    }
}
