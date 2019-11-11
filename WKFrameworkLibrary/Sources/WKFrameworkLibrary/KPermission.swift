//
//  KPermission.swift
//  
//
//  Created by Hsu on 2019/11/7.
//

import Foundation
import UIKit
import AVFoundation
import Photos

public struct KPermission {
    
    /// 取的麥克風權權限狀態
    func getMicrophonePermission () -> AVAudioSession.RecordPermission {
        return AVAudioSession.sharedInstance().recordPermission
    }
    
    /// 取的相機權限狀態
    /// - Parameter type: ＃AVAuthorizationStatus
    ///.notDetermind ：媒體捕獲需要明確的使用者權限，但用戶尚未允許或拒絕此權限。
    ///.restricted：使用者不允許訪問媒體捕獲設備。
    ///.denied：使用者明確的拒絕媒體捕獲的權限。
    ///.authorized ：使用者明確的允許媒體捕獲權限，或者對於相關媒體類型不需要明確的使用者權限。
    func getCameraPermission(AVMediaType type:AVMediaType) -> AVAuthorizationStatus{
        return AVCaptureDevice.authorizationStatus(for: type)
    }
    
    /// 取的相簿權限狀態
    /// - Parameter type: ＃AVAuthorizationStatus
    ///.notDetermind ：媒體捕獲需要明確的使用者權限，但用戶尚未允許或拒絕此權限。
    ///.restricted：使用者不允許訪問媒體捕獲設備。
    ///.denied：使用者明確的拒絕媒體捕獲的權限。
    ///.authorized ：使用者明確的允許媒體捕獲權限，或者對於相關媒體類型不需要明確的使用者權限。
    func getPHPhotoPermission() -> PHAuthorizationStatus{
        return PHPhotoLibrary.authorizationStatus()
    }
    
}
