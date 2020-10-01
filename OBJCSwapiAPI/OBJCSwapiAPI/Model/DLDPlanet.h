//
//  DLDPlanet.h
//  OBJCSwapiAPI
//
//  Created by Deven Day on 10/1/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DLDPlanet : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, readonly) NSInteger episodeId;
@property (nonatomic, copy, readonly) NSString *director;
@property (nonatomic, copy, readonly) NSString *releaseDate;

- (instancetype)initWithTitle:(NSString *)title
                    episodeId:(NSInteger )episodeId
                     director:(NSString *)director
                  releaseDate:(NSString *)releaseDate;

@end

@interface DLDPlanet (JSONConvertable)

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
