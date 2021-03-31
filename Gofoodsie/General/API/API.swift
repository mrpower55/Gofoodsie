//
//  API.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import Foundation
import SKActivityIndicatorView

class API{
    static let shared = API()
    
    static let mainURL = "http://api-dev.gofoodsie.com/api/v1/"
    static let loginURL = API.mainURL+"login"
    static let logoutURL = API.mainURL+"logout"
    static let countryCodesLookupURL = API.mainURL+"country_codes_lookups"
    static let dashboardURL = API.mainURL+"dashboard/6"
    static let kitchenURL = API.mainURL+"kitchens/"
    static let menuURL = API.mainURL+"menus/"
    static let mealURL = API.mainURL+"meals/"
    
    public func setRequestHeaders(_ request: inout URLRequest){
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    }
    
    public func showLoader(){
        SKActivityIndicator.show()
    }
    
    public func hideLoader(){
        SKActivityIndicator.dismiss()
    }
    
    private func getRequest(_ urlString: String, _ isShowingLoader: Bool, completion: @escaping(Data) -> ()){
        if let url = URL(string: urlString) {
            print("getRequest url: \(url)")
            
            var request = URLRequest(url: url)
            setRequestHeaders(&request)
            
            if isShowingLoader { self.showLoader() }
            
            URLSession.shared.dataTask(with: request){data, response, error in
                
                print("\(urlString), response = \(String(decoding: data ?? Data(), as: UTF8.self))")
                
                self.hideLoader()
                
                guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                    print("error", error ?? "Unknown error")
                    if isShowingLoader { self.executeRequestError(Data()) }
                    return
                }

                guard (200 ... 299) ~= response.statusCode else {
                    print("statusCode should be 2xx, but is \(response.statusCode)")
                    print("response = \(response)")
                    if response.statusCode == 401 { self.doUnAuthorizedError() }
                    if isShowingLoader { self.executeRequestError(data) }
                    
                    return
                }
                
                completion(data)
            }.resume()
        }
    }
    
    private func postRequest(_ urlString: String, _ postParameters: [String: Any], _ isShowingLoader: Bool,
                             completion: @escaping(Data) -> ()){
        if let url = URL(string: urlString) {
            print("postRequest url: \(url)")
            print("postRequest parameters: \(postParameters)")
            
            var request = URLRequest(url: url)
            setRequestHeaders(&request)
            
            request.httpMethod = "POST"
            
            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: postParameters)
            } catch let error {
                print(error.localizedDescription)
                completion(Data())
            }
            
            if isShowingLoader { self.showLoader() }
            
            URLSession.shared.dataTask(with: request){data, response, error in
                
                print("\(urlString), response = \(String(decoding: data ?? Data(), as: UTF8.self))")
                
                self.hideLoader()
                
                guard let data = data, let response = response as? HTTPURLResponse, error == nil else {
                    print("error", error ?? "Unknown error")
                    if isShowingLoader { self.executeRequestError(Data()) }
                    return
                }

                guard (200 ... 299) ~= response.statusCode else {
                    print("statusCode should be 2xx, but is \(response.statusCode)")
                    print("response = \(response)")
                    if response.statusCode == 401 { self.doUnAuthorizedError() }
                    if isShowingLoader { self.executeRequestError(data) }
                    return
                }
                
                completion(data)
            }.resume()
        }
    }
    
    private func executeRequestError(_ data: Data){
        do {
            self.hideLoader()
            
            let response = try JSONDecoder().decode(GeneralResponseModel.self, from: data)
            if response.data?.message != "" {
                general.showAlertDialog("خطأ", response.data?.message ?? "")
            } else {
                general.showAlertDialog("خطأ", "لا يمكن الإتصال بالسيرفر، يرجى المحاولة مرة أخرى")
            }
            
        } catch { }
    }

    private func doUnAuthorizedError(){
        general.showAlertDialog("خطأ", "جسلتك الحالية إنتهت، يرجى إعادة تسجيل الدخول")
    }
    
    public func loginRequest(_ postParameters: [String: Any], completion: @escaping(LoginResponse) -> ()){
        postRequest(API.loginURL, postParameters, true){data in
            DispatchQueue.main.async {
                do {
                    completion(try JSONDecoder().decode(LoginResponse.self, from: data))
                } catch { self.executeRequestError(data) }
            }
        }
    }
    
    public func logoutRequest(completion: @escaping(GeneralResponseModel) -> ()){
        postRequest(API.logoutURL, [:], true){data in
            DispatchQueue.main.async {
                do {
                    completion(try JSONDecoder().decode(GeneralResponseModel.self, from: data))
                } catch { self.executeRequestError(data) }
            }
        }
    }
    
    public func getCountryCodesRequest(completion: @escaping(CountryCodesResponse) -> ()){
        getRequest(API.countryCodesLookupURL, false){data in
            DispatchQueue.main.async {
                do {
                    completion(try JSONDecoder().decode(CountryCodesResponse.self, from: data))
                } catch { self.executeRequestError(data) }
            }
        }
    }
    
    public func getDashboardRequest(completion: @escaping(DashboardResponse) -> ()){
        getRequest(API.dashboardURL, true){data in
            DispatchQueue.main.async {
                do {
                    completion(try JSONDecoder().decode(DashboardResponse.self, from: data))
                } catch { self.executeRequestError(data) }
            }
        }
    }
    
    public func getKitchenRequest(_ kithenID: Int, completion: @escaping(KitchenResponse) -> ()){
        getRequest(API.kitchenURL+"\(kithenID)", true){data in
            DispatchQueue.main.async {
                do {
                    completion(try JSONDecoder().decode(KitchenResponse.self, from: data))
                } catch { self.executeRequestError(data) }
            }
        }
    }
    
    public func getMenuRequest(_ menuID: Int, completion: @escaping(MenuResponse) -> ()){
        getRequest(API.menuURL+"\(menuID)", true){data in
            DispatchQueue.main.async {
                do {
                    completion(try JSONDecoder().decode(MenuResponse.self, from: data))
                } catch { self.executeRequestError(data) }
            }
        }
    }
    
    public func getMealRequest(_ mealID: Int, completion: @escaping(MealResponse) -> ()){
        getRequest(API.mealURL+"\(mealID)", true){data in
            DispatchQueue.main.async {
                do {
                    completion(try JSONDecoder().decode(MealResponse.self, from: data))
                } catch { self.executeRequestError(data) }
            }
        }
    }
}
