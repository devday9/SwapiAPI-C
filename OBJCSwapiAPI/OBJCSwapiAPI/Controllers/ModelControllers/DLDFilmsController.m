//
//  DLDFilmsController.m
//  OBJCSwapiAPI
//
//  Created by Deven Day on 10/1/20.
//

#import "DLDFilmsController.h"
#import "DLDFilms.h"

// https://swapi.dev/api/films/.json

static NSString * const baseURLString = @"https://swapi.dev/api";
static NSString * const filmsComponent = @"films";
static NSString * const jsonComponentString = @".json";

@implementation DLDFilmsController

+ (void)fetchFilmsWithCompletion:(void (^)(NSArray<DLDFilms *> * _Nullable))completion
{
    NSURL *baseURL = [NSURL URLWithString:baseURLString];
    NSURL *filmsURL = [baseURL URLByAppendingPathComponent:filmsComponent];
    NSURL *finalURL = [filmsURL URLByAppendingPathComponent:jsonComponentString];
    NSLog(@"%@", finalURL);
    
    [[NSURLSession.sharedSession dataTaskWithURL:finalURL completionHandler:^(NSData *  _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"There was an error: %@, %@", error, error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"There appears to be no data.");
            completion(nil);
            return;
        }
        
        NSDictionary *topLevelDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
        
        if (!topLevelDictionary)
        {
            NSLog(@"Error parsing the JSON: %@", error);
            completion(nil);
            return;
        }
        
        NSArray * arrayOfFilms = topLevelDictionary[filmsComponent];
        
        NSMutableArray *filmsPlaceholder = [NSMutableArray array];
        
        for (NSDictionary *filmDictionary in arrayOfFilms)
        {
            DLDFilms *film = [[DLDFilms alloc] initWithDictionary:filmDictionary];
            [filmsPlaceholder addObject:film];
        }
        completion(filmsPlaceholder);
    
    }] resume];
}

@end
