//
//  MCustomTextField.m
//  CustomTextField
//
//  Created by Joshua Motley on 4/7/16.
//  Copyright © 2016 Motley. All rights reserved.
//

#import "MCustomTextField.h"

@interface MCustomTextField () <UITextFieldDelegate>




@end

@implementation MCustomTextField

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    self = [super initWithCoder:aDecoder];
    
    if (self) {

        UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0.0);
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *shareImage =  UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        UIImageView *newImgView = [UIImageView new];
        newImgView.frame = self.bounds;
        
        newImgView.image = shareImage;
        newImgView.contentMode = UIViewContentModeScaleAspectFit;
        newImgView.tag = 100;
        
        
        [self addSubview:newImgView];
        self.placeholder = nil;
        self.delegate = self;
        
      
    }
    
    return self;

     
     }

-(void)layoutSubviews{
    
    [super layoutSubviews];
   
    
    
    [self viewWithTag:100].frame = self.bounds;
    [self viewWithTag:100].contentMode = UIViewContentModeScaleAspectFill;
    
    
}

@end
