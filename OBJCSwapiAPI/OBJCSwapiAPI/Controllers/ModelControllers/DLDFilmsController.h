//
//  DLDFilmsController.h
//  OBJCSwapiAPI
//
//  Created by Deven Day on 10/1/20.
//

#import <Foundation/Foundation.h>
#import "DLDFilms.h"

@interface DLDFilmsController : NSObject

+ (void)fetchFilmsWithCompletion:(void (^)(NSArray<DLDFilms *> *))completion;

@end

