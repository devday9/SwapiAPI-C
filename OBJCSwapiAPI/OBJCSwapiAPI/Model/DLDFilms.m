//
//  DLDFilms.m
//  OBJCSwapiAPI
//
//  Created by Deven Day on 10/1/20.
//

#import "DLDFilms.h"

@implementation DLDFilms

- (instancetype)initWithTitle:(NSString *)title episodeId:(NSInteger)episodeId director:(NSString *)director releaseDate:(NSString *)releaseDate
{
    self = [super init];
    
    if (self)
    {
        _title = title;
        _episodeId = episodeId;
        _director = director;
        _releaseDate = releaseDate;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    
    NSString *title = dictionary[@"title"];
    NSInteger episodeId = [dictionary[@"episode_id"] intValue];
    NSString *director = dictionary[@"director"];
    NSString *releaseDate = dictionary[@"release_date"];
    
    return [self initWithTitle:title episodeId:episodeId director:director releaseDate:releaseDate];
}

@end
