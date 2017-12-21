//
//  GYStickerView.h
//  GYStickerView
//
//  Created by 黄国裕 on 17/1/23.
//  Copyright © 2017年 黄国裕. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, GYStickerViewScaleMode) {
    GYStickerViewScaleModeBounds,    //通过改变self.bounds达到缩放效果
    GYStickerViewScaleModeTransform  //通过改变self.transform达到缩放效果
};

typedef NS_ENUM(NSInteger, GYStickerViewCtrlType) {
    GYStickerViewCtrlTypeGesture,    //手势,无控制图，双指控制旋转和缩放
    GYStickerViewCtrlTypeOne,        //一个控制图，同时控制旋转和缩放,
    GYStickerViewCtrlTypeTwo         //两个控制图，一个控制旋转，一个控制缩放
};



@interface GYStickerView : UIView

/**
 需要添加到StickerView的内容，如:UIView, UITextView, UIImageView等
 */
@property (strong, nonatomic) UIView *contentView;



/**
 参考点(比例)，不设置默认为中心点 CGPoint(0.5, 0.5)
 范围：x: 0 --- 1
      y: 0 --- 1

 提示：可以超出范围，设置参考点在self外面
 */
@property (nonatomic) CGPoint originalPoint;


/**
 等比缩放 : YES
 自由缩放 : NO

 注意：1、仅适用于CtrlTypeTwo的缩放，默认YES.  其他CtrlType也属于等比缩放
      2、与ScaleModeTransform不兼容，待完善
 */
@property (nonatomic, getter=isScaleFit) BOOL scaleFit;


@property (nonatomic) GYStickerViewScaleMode scaleMode;
@property (nonatomic) GYStickerViewCtrlType ctrlType;


/**
 初始化StickerView
 */
- (instancetype)initWithContentView:(UIView *)contentView;

/**
 显示参考点，默认不显示

 注意：CtrlTypeGesture 仅支持中心点，该方法无效
 */
- (void)showOriginalPoint:(BOOL)b;

/**
 显示左上角移除按钮，默认显示
 */
- (void)showRemoveCtrl:(BOOL)b;


/**
 设置控制图片
 */
- (void)setTransformCtrlImage:(UIImage *)image;// CtrlTypeOne
- (void)setResizeCtrlImage:(UIImage *)resizeImage rotateCtrlImage:(UIImage *)rotateImage;//CtrlTypeTwo
- (void)setRemoveCtrlImage:(UIImage *)image;

@end
