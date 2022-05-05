//
//  main.m
//  S101_IntroduccionObjectiveC
//
//  Created by Dragon on 02/05/22.
//

#import <Foundation/Foundation.h>

@interface Hola : NSObject

{
    int a;
    int b;
}

@property(nonatomic, readwrite) int a;

- (void) saludar;
- (void) describirAB;

@end

@implementation Hola

@synthesize a;

- (void) saludar
{
    NSLog(@"Hola mundo");
}

- (void) describirAB
{
    NSLog(@"a = %d b = %d", a, b);
}

@end

int sum(int x, int y) {
    return x + y;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        int a = 123;
        
        NSString * mensaje = @"Hola mundo";
        
        NSLog(@"a = %d mensaje = %@", a, mensaje);
        
        int b = sum(45, a);
        
        NSLog(@"b = %d", b);
        
        Hola *hola = [[Hola alloc] init];
        
        [hola saludar];
        
        hola.a = 123;
        
        [hola describirAB];
    }
    return 0;
}
