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
        

        
      
    }
    
    return self;

     
     }

-(void)layoutSubviews{
    
    [super layoutSubviews];
   
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        CGSize size = [self.placeholder sizeWithAttributes:
                       @{NSFontAttributeName:
                             [UIFont systemFontOfSize:30.0f]}];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, size.width, size.height)];
        label.text = self.placeholder;
        
        
        
        NSLog(@"TE %@", label.text);
        
        UIGraphicsBeginImageContextWithOptions(label.bounds.size, 0.0, 0.0);
        [label.layer renderInContext:UIGraphicsGetCurrentContext()];
        UIImage *shareImage =  UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        UIImageView *newImgView = [UIImageView new];
        newImgView.frame = self.bounds;
        newImgView.center = self.center;


        
        newImgView.image = shareImage;
        newImgView.contentMode = UIViewContentModeScaleAspectFill;
        newImgView.tag = 100;
        
        
        [self addSubview:newImgView];
//        self.placeholder = nil;
        
        
    });
    
    
}





@end
