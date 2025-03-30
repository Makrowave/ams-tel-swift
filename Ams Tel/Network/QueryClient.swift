//
//  QueryClient.swift
//  Ams Tel
//
//  Created by makrowave on 29/03/2025.
//

import Foundation

class QueryClient: ObservableObject {
    private var queries: [any QueryProtocol] = []
    private var _baseUrl: String
    
    private init(_ baseUrl: String) {
        _baseUrl = baseUrl
    }
    private static var _instance: QueryClient?
    public static func GetQueryClient(_ baseUrl: String = "http://localhost:5001") -> QueryClient {
        if(_instance == nil) {
            _instance = QueryClient(baseUrl)
        }
        return _instance!
    }
    
    public func setBaseUrl(_ baseUrl: String) {
        for query in queries {
            query.setBaseUrl(baseUrl)
        }
        _baseUrl = baseUrl
    }
    
    public func getQuery(queryKey: [String]) throws -> any QueryProtocol {
        
        guard let query = findQuery(queryKey: queryKey) else {
            throw QueryError.queryNotFound
        }
        return query
    }
    
    public func backgroundPause(_ queryKeys: [[String]]) {
        for query in queries {
            if(queryKeys.contains(query.queryKey) && query.pauseInBackground) {
                query.pause()
            }
        }
    }
    
    public func backgroundResume(_ queryKeys: [[String]]) {
        for query in queries {
            if(queryKeys.contains(query.queryKey) && query.pauseInBackground) {
                query.resume()
            }
        }
    }
    
    public func createAndGetQuery<T: QueryProtocol>(
        queryKey: [String],
        url: String,
        interval: Int = 0,
        isStopped: Bool = false,
        pauseInBackgroud: Bool = true,
        template: T
    ) -> T {
        //If query exists return it
        let foundQuery = findQuery(queryKey: queryKey)
        if(foundQuery != nil) {
            return foundQuery as! T
        }
        //If not create it
        let query = T(queryKey: queryKey, url: url, baseUrl: _baseUrl, interval: interval, isStopped: isStopped, pauseInBackground: pauseInBackgroud)
        queries.append(query)
        return query
    }
    
    private func findQuery(queryKey: [String]) -> (any QueryProtocol)? {
        guard let query = queries.first(where: { $0.queryKey == queryKey }) else {
            return nil as (any QueryProtocol)?
        }
        return query
    }
    
}

class AnyQuery: ObservableObject {
    private let base: any QueryProtocol
    
    init<T: Codable>(_ query: Query<T>) {
        self.base = query
    }
}

class Query<T: Codable>: QueryProtocol {
    required init() {
        queryKey = []
        _url = ""
        _baseUrl = ""
        isStopped = true
        _interval = 0
        _timer = nil
        error = nil
        pauseInBackground = true
    }
    
    @Published public var isLoading: Bool = true
    @Published public var isError: Bool = false
    @Published public var data: T?
    
    internal var queryKey: [String]
    private var _url: String
    private var _baseUrl: String
    
    public var isStopped: Bool
    private var _interval: Int
    private var _timer: Timer?
    public var pauseInBackground: Bool
    
    @Published public var error: String?
    
    required internal init(
        queryKey: [String],
        url: String,
        baseUrl: String,
        interval: Int,
        isStopped: Bool,
        pauseInBackground: Bool
    ) {
        self.queryKey = queryKey
        _url = url
        _baseUrl = baseUrl
        if(interval <= 0) {
            _interval = 0
        } else {
            _interval = interval
        }
        self.isStopped = isStopped
        self.pauseInBackground = pauseInBackground
        if( !isStopped && !(_interval == 0)) {
            _timer = createTimer()
        }
    }
    
    public func setBaseUrl(_ baseUrl: String) {
        _baseUrl = baseUrl
    }
    //Used to fetch data
    private func fetch() async {
        guard case let (data, response) as (Data, URLResponse) = await getResponse() else {
            return
        }
        
        guard let response = response as? HTTPURLResponse else {
            setError(msg: "Nastąpił problem z odpowiedzią")
            return
        }
        if(response.statusCode == 404) {
            setError(msg: "Nie znaleziono danych")
            print("\(_baseUrl)/api\(_url) - \(response.statusCode)")
        } else if(response.statusCode == 401 || response.statusCode == 403) {
            setError(msg: "Nie przyznano dostępu do tych danych")
            print("\(_baseUrl)/api\(_url) - \(response.statusCode)")
        } else if(response.statusCode == 400) {
            setError(msg: "Złe zapytanie")
            print("\(_baseUrl)/api\(_url) - \(response.statusCode)")
        } else if(response.statusCode == 200) {
            //Handle data
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            do {
                self.data = try decoder.decode(T.self, from: data)
                clearError()
                isLoading = false
            } catch {
                setError(msg: "Nastąpił problem z danymi")
            }
        } else if(response.statusCode/100 == 4 || response.statusCode/100 == 5){
            print("\(_baseUrl)/api\(_url) - \(response.statusCode)")
            setError(msg: "Nastąpił nieoczekiwany błąd")
        } else {
            
        }
    }
    
    //Gets response and handles network errors
    private func getResponse() async -> (Data?, URLResponse?) {
        let url = URL(string: _baseUrl + "/api" + _url)
        
        if(url == nil) {
            setError(msg: "Niepoprawny adres serwera")
            return (nil as Data?, nil as URLResponse?)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url!)
            return (data, response)
        } catch {
            setError(msg: "Nastąpił problem z połączeniem")
            print(error)
            return (nil as Data?, nil as URLResponse?)
        }
    }
    private func setError(msg: String) {
        isError = true
        error = msg
    }
    private func clearError() {
        isError = false
        error = nil
    }
    
    public func refetch() async {
        await fetch()
    }
    
    public func resume() {
        _timer?.invalidate()
        _timer = createTimer()
        isStopped = false
        
    }
    public func pause() {
        _timer?.invalidate()
        _timer = nil
        isStopped = true
    }
    public func createTimer() -> Timer? {
        if(_interval == 0) {
            return nil
        }
        return Timer.scheduledTimer(
            withTimeInterval: TimeInterval((Double(_interval))/1000.0),
            repeats: true
        ) {_ in
            Task {
                await self.fetch()
            }
        }
    }
    
    
    
}

protocol QueryProtocol: ObservableObject {
    associatedtype T
    var isLoading: Bool {get}
    var isError: Bool {get}
    var data: T? {get}
    var error: String? {get}
    var isStopped: Bool {get}
    var queryKey: [String] {get}
    var pauseInBackground: Bool {get set}
    func pause()
    func resume()
    func setBaseUrl(_ baseUrl: String)
    init(queryKey: [String], url: String, baseUrl: String, interval: Int, isStopped: Bool, pauseInBackground: Bool)
    init()
}

enum QueryError: Error {
    case invalidURL
    case negativeTimerInterval
    case queryNotFound
}
