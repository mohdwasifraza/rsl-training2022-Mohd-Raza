//
//  CustomDataModel.h
//  RSS_News_Reader
//
//  Created by Mohd Raza on 19/05/22.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CustomDataModel : NSObject
@property(nonatomic) NSString *labelName;
@property(nonatomic) NSString *labelDescription;
@property(nonatomic) UIImage *labelImage;
@property(nonatomic) NSString *labelLink;

- (instancetype)initWithlabelName:(NSString *)labelName labelDescription:(NSString *)labelDescription
                       labelImage:(UIImage *)image labelLink:(NSString *)labelLink;

@end

NS_ASSUME_NONNULL_END
