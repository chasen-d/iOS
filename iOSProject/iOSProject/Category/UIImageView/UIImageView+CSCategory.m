//
//  UIImageView+CSCategory.m
//  iOSProject
//
//  Created by changcai on 2018/10/16.
//  Copyright © 2018 changcai. All rights reserved.
//

#import "UIImageView+CSCategory.h"

@implementation UIImageView (CSCategory)

- (void)setHeader:(NSString *)url{
    
    UIImage *placeholder = [[UIImage imageNamed:@"headImage"] circleimage];
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.image = image?[image circleimage]:placeholder;
        
    }];
    
}



@end
