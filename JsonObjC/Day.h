//
//  Day.h
//  JsonObjC
//
//  Created by Alexander Zorinov on 2023-09-24.
//

#ifndef Day_h
#define Day_h

@interface Day : NSObject {
    
}
@property (nonatomic,retain) NSString *day;
@property (nonatomic,retain) NSString *date;
@property (nonatomic,retain) NSString *ID;

- (instancetype)init;
@end

#endif /* Day_h */
