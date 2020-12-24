
//
//  EHISearchViewOne.m
//  1haiiPhone
//
//  Created by yhb on 2020/8/27.
//  Copyright © 2020 EHi. All rights reserved.
//

#import "EHISearchViewOne.h"
@interface EHISearchViewOne()<UITextFieldDelegate>

@property (nonatomic,strong)UILabel *titleLabel ;
/**
 输入框
 */
@property (nonatomic, strong) UITextField *textField;

/**
 取消按钮
 */
@property (nonatomic, strong) UIButton *cancelBtn;
@end
@implementation EHISearchViewOne
SINGLETON_FOR_CLASS(EHISearchViewOne)
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置圆角效果
        self.layer.cornerRadius = frame.size.height / 2.0;
        self.layer.masksToBounds = YES;
        self.backgroundColor = [UIColor whiteColor];
    }
       [self getCurrentUIVC].navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchBtnAction)];
        return self;
    }


    #pragma mark - —— Private Methods ——
    + (instancetype)setSearchBarWithFrame:(CGRect)frame
    {
       return [[self alloc] initWithFrame:frame];
    }
    - (void)setupCancelButton
    {
        _isSearch = YES;
        [self getCurrentUIVC].navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:self.cancelBtn];
    }
    - (void)cancelAction
    {
        _textField.text = @"";
        [_textField resignFirstResponder];
        // 设置导航条
        [self getCurrentUIVC].navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchBtnAction)];
        [self setTitleLabel];
        self.callBack(self.textField.text);
    }

    - (void)searchBtnAction
    {
        self.hidden = NO;
        [self getCurrentUIVC].navigationItem.titleView = self;
         [self.textField becomeFirstResponder];
    }

    - (void)setTitleLabel
    {
        _isSearch = NO;
        self.hidden = YES;
        if (!_titleLabel) {
            _titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, Main_Screen_Width - 60, 30)];
            _titleLabel.font = [UIFont boldSystemFontOfSize:18];
            _titleLabel.textColor = EHIColor.hexColor_FFFFFF_fitDark_1F1F1F;
            _titleLabel.textAlignment = NSTextAlignmentCenter;
        }
        _titleLabel.text = [self getCurrentUIVC].title;
        
        [self getCurrentUIVC].navigationItem.titleView = _titleLabel;
        
    }

    -(UIViewController *)getCurrentUIVC
    {
        UIViewController  *superVC = [self getCurrentVC];
        
        if ([superVC isKindOfClass:[UITabBarController class]]) {
            
            UIViewController  *tabSelectVC = ((UITabBarController*)superVC).selectedViewController;
            
            if ([tabSelectVC isKindOfClass:[UINavigationController class]]) {
                
                return ((UINavigationController*)tabSelectVC).viewControllers.lastObject;
            }
            return tabSelectVC;
        }else
            if ([superVC isKindOfClass:[UINavigationController class]]) {
                
                return ((UINavigationController*)superVC).viewControllers.lastObject;
            }
        return superVC;
    }

    -(UIViewController *)getCurrentVC{
        
        UIViewController *result = nil;
        
        UIWindow *window = [self getKeyWindow];
        
        if (window.windowLevel != UIWindowLevelNormal)
        {
            NSArray *windows = [[UIApplication sharedApplication] windows];
            for(UIWindow * tmpWin in windows)
            {
                if (tmpWin.windowLevel == UIWindowLevelNormal)
                {
                    window = tmpWin;
                    break;
                }
            }
        }
        
        UIView *frontView = [[window subviews] firstObject];
        id nextResponder = [frontView nextResponder];
        
        if ([nextResponder isKindOfClass:[UIViewController class]])
            result = nextResponder;
        else
            result = window.rootViewController;
        
        return result;
    }

    - (UIWindow *)getKeyWindow
    {
        UIWindow* window = nil;
        
       
        if (@available(iOS 13.0, *))
        {
            for (UIWindowScene* windowScene in [UIApplication sharedApplication].connectedScenes)
            {
                if (windowScene.activationState == UISceneActivationStateForegroundActive)
                {
                    window = windowScene.windows.firstObject;
                    
                    break;
                }
            }
        } else {
            window = [UIApplication sharedApplication].keyWindow;
        }
        
        return window;
    }
    #pragma mark - —— UITextFieldDelegate ——
    //输入框开始编辑
    - (void)textFieldDidBeginEditing:(UITextField *)textField {
        
        [self setupCancelButton];
        
    }

    - (BOOL)textFieldShouldReturn:(UITextField *)textField
    {
        [textField resignFirstResponder];
        self.callBack(textField.text);
        return YES;
    }

    #pragma mark - —— Setter Getter ——

    - (UITextField *)textField
    {
        if (!_textField) {
            _textField = [[UITextField alloc] initWithFrame:CGRectMake(15, 0, CGRectGetWidth(self.frame) - 10, CGRectGetHeight(self.frame))];
            [self addSubview:_textField];
            
            _textField.font = [UIFont systemFontOfSize:13];
            
            //清除按钮
            _textField.clearButtonMode =UITextFieldViewModeWhileEditing;
            
            _textField.delegate = self;
            //键盘属性
            _textField.returnKeyType = UIReturnKeySearch;
            
            //为textField设置属性占位符
            _textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@" 请输入搜索关键字" attributes:@{NSForegroundColorAttributeName:[UIColor grayColor]}];
            
            _textField.textColor = [UIColor lightGrayColor];
            _textField.tintColor = [UIColor blueColor];
        }
        
        return _textField;
    }
    - (UIButton *)cancelBtn
    {
        if (!_cancelBtn) {
            _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _cancelBtn.frame = CGRectMake(0, 0, 30, 23);
            _cancelBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
            
            _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:18 weight:0.2];
            
            [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
            
            [_cancelBtn addTarget:self action:@selector(cancelAction) forControlEvents:UIControlEventTouchUpInside];
        }
        
        return _cancelBtn;
    }

    - (void)setTintColor:(UIColor *)tintColor
    {
        _tintColor = tintColor;
        _textField.tintColor = tintColor;
    }
    - (void)setPlaceholder:(NSString *)placeholder
    {
        _placeholder = placeholder;
        _textField.placeholder = placeholder;
    }
    @end
