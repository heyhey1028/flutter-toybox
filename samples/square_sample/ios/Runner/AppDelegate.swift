import UIKit
import Flutter
import SquarePointOfSaleSDK

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

    private var final_result: FlutterResult?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
      let controller : FlutterViewController = window?.rootViewController as! FlutterViewController

      let squareChannel = FlutterMethodChannel(name:"kiosk.flutter/square", binaryMessenger: controller.binaryMessenger)

      squareChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult)-> Void in
        guard call.method == "openSquare" else {
          result(FlutterMethodNotImplemented)
          return
        }
          
          let parameters = call.arguments as! Dictionary<String, Any>
          if let price = parameters["price"] as? Int,
             let memo=parameters["memo"] as? String,
             let disablesKeyedInCardEntry = parameters["disablesKeyedInCardEntry"] as? Bool{
              self.openSquare(result: result, price:price, memo:memo, disablesKeyedInCardEntry: disablesKeyedInCardEntry)
          }else{
              print("パラメータの型が不正です")
              result(FlutterMethodNotImplemented)
              return
          }
      })

    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
    
    private func openSquare(result:@escaping FlutterResult, price: Int, memo: String, disablesKeyedInCardEntry: Bool){
        final_result = result
        
        let callbackURL = URL(string: "square-sample://")!
        
        var amount: SCCMoney?
        do{
            // 支払い金額の設定
            amount = try SCCMoney(amountCents: price, currencyCode: "JPY")
        }catch {
            // エラーハンドリング
        }
        
        SCCAPIRequest.setApplicationID("sq0idp-bICm22xi65P8r2aNhObW9w")
        SCCAPIRequest.clientID = "sq0idp-bICm22xi65P8r2aNhObW9w"
        var request: SCCAPIRequest?
        do{
            request = try SCCAPIRequest(callbackURL: callbackURL,
                                        amount:amount!,
                                        userInfoString: memo, // 注文番号
                                        locationID: nil,
                                        notes:memo,
                                        customerID: nil,
                                        supportedTenderTypes: SCCAPIRequestTenderTypeCard, // 支払い方法の設定
                                        clearsDefaultFees: true, // ???
                                        returnsAutomaticallyAfterPayment: true,
                                        disablesKeyedInCardEntry: disablesKeyedInCardEntry,
                                        skipsReceipt: true
            )
        }catch{
            // エラーハンドリング
        }
        
        // var success = false
        do{
            try SCCAPIConnection.perform(request!)
            // success = true
        }catch let error as NSError{
            print(error.localizedDescription)
        }
        
        
    }
    
    override func application(_ app:UIApplication, open url: URL, options:[UIApplication.OpenURLOptionsKey: Any]=[:])-> Bool{
        
        // guard SCCAPIResponse.isSquareResponse(url)else{return false}
        
        // var decodeError: Error?
        
        do{
            let response = try SCCAPIResponse(responseURL: url)
            
            if let error = response.error{
                // Handle a failed request.
                print("Error: \(error.localizedDescription)")
            }
            // Print checkout object
            print("Transaction successful: \(response)")
            final_result?(response.transactionID)
            return true
        }catch let error as NSError{
            // Handle unexpected errors.
            print(error.localizedDescription)
        }

        return false
    }
}
