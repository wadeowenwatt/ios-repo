//
//  MovieService.swift
//  study-ios
//
//  Created by Linhtn1 on 14/5/24.
//

import Foundation
import Alamofire

class MovieService {
    static let sharedInstance = MovieService()
    
    func fetchMovieData(callSuccess:@escaping ([MovieResult]) -> Void) -> MovieResponse? {
        var movieResponse: MovieResponse? = nil
        let url = "https://api.themoviedb.org/3/movie/popular?language=en-US&page=1&api_key=b6089aedb1274752de2f1022865a15ac";
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response{ resp in
                switch resp.result{
                case .success(let data):
                    do{
                        let objectData = try JSONDecoder().decode(MovieResponse.self, from: data!)
                        movieResponse = objectData
                        callSuccess(movieResponse?.results ?? [])
                    } catch {
                        print(String(describing: error))
                    }
                case .failure(let error):
                    print(String(describing: error))
                }
            }
        return movieResponse
    }
    
    func fetchMovieDetail(callSuccess: @escaping (MovieDetailReponse) -> Void, movieId: Int) {
        let url = "https://api.themoviedb.org/3/movie/\(movieId)?language=en-US&api_key=b6089aedb1274752de2f1022865a15ac";
        AF.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil)
            .response{ resp in
                switch resp.result{
                case .success(let data):
                    do{
                        let objectData = try JSONDecoder().decode(MovieDetailReponse.self, from: data!)
                        callSuccess(objectData)
                    } catch {
                        print(String(describing: error))
                    }
                case .failure(let error):
                    print(String(describing: error))
                }
            }
    }
}
