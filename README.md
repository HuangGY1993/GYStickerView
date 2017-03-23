# GYStickerView
### iOS 一款可绕指定点旋转、缩放的多功能贴纸
#### 支持双指手势操作，单指移动控制图操作，满足你所有需求


#####先上效果图：

![image](https://github.com/HuangGY1993/GYStickerView/blob/master/res/GYStickerView.gif)


#####示例用法：

######把Demo中GYStickerView文件夹添加到项目,#import "GYStickerView.h"

######CtrlTypeGesture:双指手势模式，支持等比缩放，绕中心旋转，可设置ScaleMode（缩放模式，通过改变bounds或transform达到缩放效果）
示例代码：

        GYStickerView *stickerView = [[GYStickerView alloc] initWithContentView:yourCustomView];
        stickerView.ctrlType = GYStickerViewCtrlTypeGesture;
        stickerView.scaleMode = GYStickerViewScaleModeTransform;
        [self.view addSubview:stickerView];
效果：
![image](https://github.com/HuangGY1993/GYStickerView/blob/master/res/CtrlTypeGesture.png)
 
 
######CtrlTypeOne:一个控制图模式，同时控制旋转和缩放，支持等比缩放，可设置绕指定点旋转，可设置ScaleMode
示例代码：

        GYStickerView *stickerView = [[GYStickerView alloc] initWithContentView:yourCustomView];
        stickerView.ctrlType = GYStickerViewCtrlTypeOne;
        stickerView.scaleMode = GYStickerViewScaleModeTransform;
        stickerView.originalPoint = CGPointMake(0.2, 0.2);
        [stickerView showOriginalPoint:YES];
        [self.view addSubview:stickerView];
效果：
![image](https://github.com/HuangGY1993/GYStickerView/blob/master/res/CtrlTypeOne.png)
 
 
######CtrlTypeTwo:两个控制图模式，右下角控制图控制缩放，右上角控制图控制旋转，支持等比缩放和自由缩放，可设置绕指定点旋转，可设置ScaleMode
######注意：自由缩放不支持ScaleModeTransform
示例代码：

        GYStickerView *stickerView = [[GYStickerView alloc] initWithContentView:yourCustomView];
        stickerView.ctrlType = GYStickerViewCtrlTypeTwo;
        stickerView.scaleMode = GYStickerViewScaleModeBounds;
        stickerView.scaleFit = YES;
        stickerView.originalPoint = CGPointMake(-0.2, -0.2);
        [stickerView showOriginalPoint:YES];
        [self.view addSubview:stickerView];
效果：
![image](https://github.com/HuangGY1993/GYStickerView/blob/master/res/CtrlTypeTwo.png)

 
 
 
 
#####部分属性分析：
######指定点originalPoint
        /**
        指定参考点(比例)，不设置默认为中心点 CGPoint(0.5, 0.5)
        范围：x: 0 --- 1
             y: 0 --- 1
        提示：可以超出范围，设置参考点在self外面
        注意：CtrlTypeGesture  仅支持中心点，该属性无效
        */
        @property (nonatomic) CGPoint originalPoint;
可通过方法(showOriginalPoint:)显示红色的指定参考点

######是否为等比缩放scaleFit
        /**
        等比缩放 : YES
        自由缩放 : NO
        注意：1、仅适用于CtrlTypeTwo的缩放，默认YES.  
             2、与ScaleModeTransform不兼容，待完善
        */
        @property (nonatomic, getter=isScaleFit) BOOL scaleFit;
######等比缩放：
![image](https://github.com/HuangGY1993/GYStickerView/blob/master/res/等比缩放.gif)
######自由缩放：
![image](https://github.com/HuangGY1993/GYStickerView/blob/master/res/自由缩放.gif)

######缩放模式scaleMode
        typedef NS_ENUM(NSInteger, GYStickerViewScaleMode) {
            GYStickerViewScaleModeBounds,    //通过改变self.bounds达到缩放效果
            GYStickerViewScaleModeTransform  //通过改变self.transform达到缩放效果
        };

        @property (nonatomic) GYStickerViewScaleMode scaleMode;
######ScaleModeBounds:
![image](https://github.com/HuangGY1993/GYStickerView/blob/master/res/ScaleModeBounds.gif)
######ScaleModeTransform:
![image](https://github.com/HuangGY1993/GYStickerView/blob/master/res/ScaleModeTransform.gif)


####欢迎下载Demo体验，有问题的可以提Issues，大家互相学习。觉得还不错的请给个赞。你的点赞就是我创作的动力！！
