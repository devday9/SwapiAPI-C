//
//  DLDPlanet.m
//  OBJCSwapiAPI
//
//  Created by Deven Day on 10/1/20.
//

#import "DLDPlanet.h"

@implementation DLDPlanet

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

@end

@implementation DLDPlanet (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    NSDictionary *dataDictionary = dictionary[@"results"];
    
    NSString *title = dataDictionary[@"title"];
    NSInteger episodeId = [dataDictionary[@"episode_id"] integerValue];
    NSString *director = dataDictionary[@"director"];
    NSString *releaseDate = dataDictionary[@"release_date"];
    
    return [self initWithTitle:title episodeId:episodeId director:director releaseDate:releaseDate];
}

@end

