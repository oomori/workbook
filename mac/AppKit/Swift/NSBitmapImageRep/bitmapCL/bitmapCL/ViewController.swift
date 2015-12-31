//
//  ViewController.swift
//  bitmapCL
//
//  Created by air on 2015/11/02.
//  Copyright © 2015年 oomori. All rights reserved.
//
// このプロジェクトは未完成です。
//OpenCLの練習用です。

import Cocoa

//OpenCLを使うため
import OpenCL



class ViewController: NSViewController {

    //OpenCL関数
    //デバイス情報を文字列で
    func getStringInfo(deviceId: cl_device_id, deviceInfo: Int32) -> String {
        var valueSize: size_t = 0
        clGetDeviceInfo(deviceId, cl_device_info(deviceInfo), 0, nil, &valueSize)
        
        var value = Array<CChar>(count: Int(valueSize), repeatedValue: CChar(32))
        clGetDeviceInfo(deviceId, cl_device_info(deviceInfo), valueSize, &value, nil)
        
        let stringValue = NSString(bytes: &value, length: Int(valueSize), encoding: NSASCIIStringEncoding)
        return stringValue as! String
    }
    //デバイスIDを返す
    func getNumericalInfo(deviceId: cl_device_id, deviceInfo: Int32) -> cl_uint {
        var value = cl_uint(0)
        clGetDeviceInfo(deviceId, cl_device_info(deviceInfo), sizeof(cl_uint), &value, nil)
        
        return value
    }
    
    
    @IBAction func function001(sender: AnyObject) {
        
        //キューの作成
        let queue = gcl_create_dispatch_queue(cl_queue_flags(CL_DEVICE_TYPE_GPU), nil)!
        
        //デバイスID
        let deviceId = gcl_get_device_id_with_dispatch_queue(queue)
        
        //デバイス名
        let deviceName = getStringInfo(deviceId, deviceInfo: CL_DEVICE_NAME)
        
        //アドレスデータ
        let addressData = getNumericalInfo(deviceId, deviceInfo: CL_DEVICE_ADDRESS_BITS)
        
        //データ
        let extData = getStringInfo(deviceId, deviceInfo: CL_DEVICE_EXTENSIONS)
        
        print("Name: \(deviceName)")
        print("Address Width: \(addressData)")
        print("Extensions: \(extData)")

        
        
        let bitmapWidth : Int = 640
        let bitmapHeight : Int = 480
        let bitmapSample : Int = 3  //アルファがあるときは1つ増える
        let bufferSize  = ( bitmapWidth*bitmapHeight*bitmapSample)//幅*高さ*ピクセルあたりのサンプル数
        var buffer = UnsafeMutablePointer<UInt8>.alloc(bufferSize)//8
        //オフスクリーンを作成
        let theBitmap = NSBitmapImageRep(
            bitmapDataPlanes: &buffer,  //バッファ
            pixelsWide: bitmapWidth,    //幅
            pixelsHigh: bitmapHeight,            //高さ
            bitsPerSample: 8,           //サンプルあたりのビット（色）
            samplesPerPixel: bitmapSample,//ピクセル当たりのサンプル数（RGBなら3,RGBAなら4）
            hasAlpha: false,            //アルファ（不透明度）があるときはtrue
            isPlanar: false,            //プレーン化されるかfalseだとRGBRGBRGBRGBとなる
            colorSpaceName: NSDeviceRGBColorSpace,//カラースペース
            bytesPerRow: 0,
            bitsPerPixel: 0
        )
        
        //ビットマップの操作、ここではバッファのメモリを書き換える
        //バッファをクリア
        for index in 0..<bufferSize
        {
            buffer[index] = 0
        }
        //上から半分赤で埋め尽くす
        for index in 0..<(bufferSize/3)/2
        {
            buffer[index*3] = 255
        }
        //メモリ書き換え終了
        
        
        //ビットマップの加工、ここではブルーに塗りつぶす
        //setColorで塗る
        for y in 20...460 {
            for x in 20...620 {
                theBitmap!.setColor(NSColor.blueColor(), atX: x, y: y)
            }
        }
        //setColor終了
        
        //ビットマップフォーマット
        switch (theBitmap!.bitmapFormat){
        case NSBitmapFormat.NSAlphaFirstBitmapFormat :
            NSLog("NSAlphaFirstBitmapFormat ")
        case NSBitmapFormat.NSAlphaNonpremultipliedBitmapFormat :
            NSLog("NSAlphaNonpremultipliedBitmapFormat ")
        case NSBitmapFormat.NSFloatingPointSamplesBitmapFormat :
            NSLog("NSFloatingPointSamplesBitmapFormat ")
        case NSBitmapFormat.NS16BitLittleEndianBitmapFormat :
            NSLog("NS16BitLittleEndianBitmapFormat ")
        case NSBitmapFormat.NS32BitLittleEndianBitmapFormat :
            NSLog("NS32BitLittleEndianBitmapFormat ")
        case NSBitmapFormat.NS16BitBigEndianBitmapFormat :
            NSLog("NS16BitBigEndianBitmapFormat ")
        case NSBitmapFormat.NS32BitBigEndianBitmapFormat :
            NSLog("NS32BitBigEndianBitmapFormat ")
        default:
            NSLog("default")
        }
        
        //ピクセルあたりのビット数
        NSLog("bitsPerPixel = %d",theBitmap!.bitsPerPixel)
        
        //Planeごとのバイト数
        NSLog("bytesPerPlane = %d",theBitmap!.bytesPerPlane)
        
        //画像の1ラインのバイト数
        NSLog("bytesPerRow = %d",theBitmap!.bytesPerRow)
        
        //プレーンの数
        NSLog("numberOfPlanes = %d",theBitmap!.numberOfPlanes)
        
        //サンプル数
        NSLog("samplesPerPixel = %d",theBitmap!.samplesPerPixel)
        
        //チャンネルあたりのバイト数
        NSLog("byte per pixel = %d",(theBitmap!.bytesPerRow/theBitmap!.samplesPerPixel) )
        
        
        
        
        
        //        for index in 0..<bufferSize
        //        {
        //            NSLog("%d",buffer[index])
        //        }
        
        //ファイル書き出し
        let destiPath : NSString = ("~/Desktop/cl001.png" as NSString).stringByExpandingTildeInPath
        
        theBitmap!.representationUsingType(NSBitmapImageFileType.NSPNGFileType, properties: [:])?.writeToFile(destiPath as String, atomically: true)
        
        
        buffer.dealloc(bufferSize)
    }
    
    @IBAction func function002(sender: AnyObject) {
    
        var mat = [cl_float](count: 16, repeatedValue: 0.0)
        var vec = [cl_float](count: 4, repeatedValue: 0.0)
        var result = [cl_float](count: 4, repeatedValue: 0.0)
        var correct = [cl_float](count: 4, repeatedValue: 0.0)
        
        /* Initialize data to be processed by the kernel */
        for i in 0..<16 {
            mat[i] = cl_float(i) * 2.0;
        }
        for i in 0..<4 {
            vec[i] = cl_float(i) * 3.0;
            correct[0] += mat[i]    * vec[i];
            correct[1] += mat[i+4]  * vec[i];
            correct[2] += mat[i+8]  * vec[i];
            correct[3] += mat[i+12] * vec[i];
        }
        
        let context = gcl_get_context()  //cl_context
        let queue = gcl_create_dispatch_queue(cl_queue_flags(CL_DEVICE_TYPE_CPU), nil)!
        
        dispatch_sync(queue) {
            
            var ndRange = cl_ndrange(
                work_dim: 1,
                global_work_offset: (0, 0, 0),
                global_work_size: (4, 0, 0),
                local_work_size: (0, 0, 0)
            )
            
            var mat_buff = gcl_malloc(sizeof(cl_float) * 16, &mat, cl_malloc_flags(CL_MEM_COPY_HOST_PTR | CL_MEM_READ_ONLY))
            var vec_buff = gcl_malloc(sizeof(cl_float) * 4, &vec, cl_malloc_flags(CL_MEM_COPY_HOST_PTR | CL_MEM_READ_ONLY))
            var res_buff = gcl_malloc(sizeof(cl_float) * 4, nil, cl_malloc_flags(CL_MEM_WRITE_ONLY))
            
            var resC = UnsafeMutablePointer<cl_float>(res_buff)
            var matPointer = UnsafeMutablePointer<cl_float4>(mat_buff)
            var vecPointer = UnsafeMutablePointer<cl_float4>(vec_buff)
            
            withUnsafePointer(&ndRange) {
                matvec_mult_kernel($0, matPointer, vecPointer, resC)
            }
            
            gcl_memcpy(&result, res_buff, sizeof(cl_float) * 4)
            
            /* Test the result */
            if(result == correct) {
                print("Matrix-vector multiplication successful")
            }
            else {
                print("Matrix-vector multiplication unsuccessful")
            }
            
            gcl_free(mat_buff)
            gcl_free(vec_buff)
            gcl_free(res_buff)
        }


    }
    @IBAction func function003(sender: AnyObject) {
        NSLog("!!")
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

