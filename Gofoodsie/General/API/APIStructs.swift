//
//  APIStructs.swift
//  Gofoodsie
//
//  Created by Mahmoud Shurrab on 30/03/2021.
//

import Foundation

struct GeneralResponseModel: Codable {
    let status_code: Int?
    let status: String?
    let data: GeneralData?
}

struct GeneralData: Codable {
    let message: String?
}

struct DashboardResponse: Codable {
    let status_code: Int?
    let status: String?
    let data: Dashboard?
}

struct KitchenResponse: Codable {
    let status_code: Int?
    let status: String?
    let data: Kitchen?
}

struct MenuResponse: Codable {
    let status_code: Int?
    let status: String?
    let data: Menu?
}

struct MealResponse: Codable {
    let status_code: Int?
    let status: String?
    let data: Meal?
}

struct LoginResponse: Codable {
    let status_code: Int?
    let status: String?
    let data: User?
}

struct CountryCodesResponse: Codable {
    let status_code: Int?
    let status: String?
    let data: [CountryCode]?
}

struct Dashboard: Codable {
    let banner: [Banner]?
    let category: [Category]?
    let slogan: String?
}

struct Banner: Codable {
    let image_path: String?
    let kitchen_id: Int?
    let id: Int?
    let meal_id: Int?
}

struct Category: Codable {
    let name: String?
    let id: Int?
    let kitchens: [Kitchen]?
}

struct Kitchen: Codable {
    let is_available: Bool?
    let rating_count: Int?
    let approval_status: String?
    let original_description: String?
    let short_description: String?
    let id: Int?
    let kitchen_delivery_options: [String]?
    let availability_time: String?
    let menus: [Menu]?
    let description: String?
    let kitchen_currency: String?
    let name: String?
    let kitchen_media: [Media]?
    let rating: Double?
    let new_kitchen_notification_sent: Bool?
    let has_delivery: Bool?
    let is_favorite: Bool?
    let is_notification_enabled: Bool?
}

struct Media: Codable {
    let urls: MediaURLs?
    let id: Int?
}

struct MediaURLs: Codable {
    let href_small: String?
    let href_big: String?
    let href_original: String?
}

struct Menu: Codable {
    let name: String?
    let kitchen_id: Int?
    let description: String?
    let id: Int?
    let food_category_id: Int?
    let meals: [Meal]?
}

struct Meal: Codable {
    let is_available: Bool?
    let rating_count: Int?
    let availability_message: String?
    let additional_notes: String?
    let meal_media: [Media]?
    let qty: Int?
    let meal_unit: String?
    let availability_time: String?
    let name: String?
    let meal_additional_items: [MealItem]?
    let meal_delivery_options: [Int]?
    let menu_id: Int?
    let meal_currency: String?
    let unit_id: Int?
    let must_order_before: Int?
    let quantity_for_the_day: Int?
    let available_count_for_the_day: Int?
    let meal_additional_info: String?
    let must_order_before_unit: String?
    let price: Double?
    let estimated_preparation_time: String?
    let description: String?
    let id: Int?
    let rating: Double?
    let has_delivery: Bool?
    let is_editing: Bool?
    let is_favorite: Bool?
    let kitchen_id: Int?
}

struct MealItem: Codable {
    let is_available: Bool?
    let name: String?
    let price: Double?
    let qty: Int?
    let unit_id: Int?
    let unit_type: String?
    let id: Int?
    let quantity_for_the_day: Int?
    let available_count_for_the_day: Int?
}

struct User: Codable {
    let message: String?
    let validation_errors: [ValidationError]?
    let location: Location?
    let id: Int?
    let first_name: String?
    let last_name: String?
    let type: String?
    let email: String?
    let phone: String?
    let user_country_code: CountryCode?
    let verification_status: VerificationStatus?
    let kitchen_id: Int?
    let unseen_notification_count: Int?
    let is_account_completed: Bool?
}

struct ValidationError: Codable {
    let field: String?
    let error: String?
}

struct Location: Codable {
    let city_name: String?
    let longitude: Double?
    let latitude: Double?
    let area_id: Int?
    let area_name: String?
}

struct CountryCode: Codable {
    let nice_name: String?
    let currency_lookup_id: Int?
    let name: String?
    let phone_code: Int?
    let flag: String?
    let iso3: String?
    let iso: String?
    let id: Int?
    let has_state: Bool?
}

struct VerificationStatus: Codable {
    let phone: String?
    let email: String?
    let account: String?
}


