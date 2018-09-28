//
//  UITextView+CSCategory.m
//  iOSProject
//
//  Created by changcai on 2018/9/11.
//  Copyright © 2018年 changcai. All rights reserved.
//

#import "UITextView+CSCategory.h"
#import <objc/runtime.h>

@implementation UITextView (CSCategory)

#define UI_PLACEHOLDER_TEXT_COLOR [UIColor colorWithRed:170.0/255.0 green:170.0/255.0 blue:170.0/255.0 alpha:1.0]
/*
 * 1、@property有两个对应的词，一个是@synthesize，一个是@dynamic。如果@synthesize和@dynamic都没写，那么默认的就是@syntheszie var = _var;
 * 2、@synthesize的语义是如果你没有手动实现setter方法和getter方法，那么编译器会自动为你加上这两个方法。
 * 3、@dynamic告诉编译器,属性的setter与getter方法由用户自己实现，不自动生成。（当然对于readonly的属性只需提供getter即可）。假如一个属性被声明为@dynamic var，然后你没有提供@setter方法和@getter方法，编译的时候没问题，但是当程序运行到instance.var =someVar，由于缺setter方法会导致程序崩溃；或者当运行到 someVar = var时，由于缺getter方法同样会导致崩溃。编译时没问题，运行时才执行相应的方法，这就是所谓的动态绑定。
*/


@dynamic placeholder;
@dynamic placeholderLabel;
@dynamic textValue;

-(void)setTextValue:(NSString *)textValue
{
    //  Change the text of our UITextView, and check whether we need to display the placeholder.
    self.text = textValue;
    [self checkIfNeedToDisplayPlaceholder];
}

-(NSString*)textValue
{
    return self.text;
}

-(void)checkIfNeedToDisplayPlaceholder
{
    //  If our UITextView is empty, display our Placeholder label (if we have one)
    if (self.placeholderLabel == nil)
    return;
    
    self.placeholderLabel.hidden = (![self.text isEqualToString:@""]);
}

-(void)onTap
{
    //  When the user taps in our UITextView, we'll see if we need to remove the placeholder text.
    [self checkIfNeedToDisplayPlaceholder];
    
    //  Make the onscreen keyboard appear.
    [self becomeFirstResponder];
}

-(void)keyPressed:(NSNotification*)notification
{
    //  The user has just typed a character in our UITextView (or pressed the delete key).
    //  Do we need to display our Placeholder label ?
    [self checkIfNeedToDisplayPlaceholder];
}

#pragma mark - Add a "placeHolder" string to the UITextView class

NSString const *kKeyPlaceHolder = @"kKeyPlaceHolder";
-(void)setPlaceholder:(NSString *)_placeholder
{
    //  Sets our "placeholder" text string, creates a new UILabel to contain it, and modifies our UITextView to cope with
    //  showing/hiding the UILabel when needed.
    objc_setAssociatedObject(self, &kKeyPlaceHolder, (id)_placeholder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    self.placeholderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, 0, 0)];
    self.placeholderLabel.numberOfLines = 1;
    self.placeholderLabel.text = _placeholder;
    self.placeholderLabel.textColor = UI_PLACEHOLDER_TEXT_COLOR;
    self.placeholderLabel.backgroundColor = [UIColor clearColor];
    self.placeholderLabel.userInteractionEnabled = true;
    self.placeholderLabel.font = self.font;
    [self addSubview:self.placeholderLabel];
    
    [self.placeholderLabel sizeToFit];
    
    //  Whenever the user taps within the UITextView, we'll give the textview the focus, and hide the placeholder if necessary.
    [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onTap)]];
    
    //  Whenever the user types something in the UITextView, we'll see if we need to hide/show the placeholder label.
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyPressed:) name:UITextViewTextDidChangeNotification object:nil];
    
    [self checkIfNeedToDisplayPlaceholder];
}
-(NSString*)placeholder
{
    //  Returns our "placeholder" text string
    return objc_getAssociatedObject(self, &kKeyPlaceHolder);
}

#pragma mark - Add a "UILabel" to this UITextView class

NSString const *kKeyLabel = @"kKeyLabel";
-(void)setPlaceholderLabel:(UILabel *)placeholderLabel
{
    //  Stores our new UILabel (which contains our placeholder string)
    objc_setAssociatedObject(self, &kKeyLabel, (id)placeholderLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector: @selector(keyPressed:) name:UITextViewTextDidChangeNotification object:nil];
    
    [self checkIfNeedToDisplayPlaceholder];
}
-(UILabel*)placeholderLabel
{
    //  Returns our new UILabel
    return objc_getAssociatedObject(self, &kKeyLabel);
}

@end
