//
//  main.m
//  S103_MetodosYParametros
//
//  Created by Dragon on 02/05/22.
//

#import <Foundation/Foundation.h>

@interface AreaTriangulo : NSObject

- (double) calcularArea: (double)a withB: (double)b andC: (double)c;

@end

@implementation AreaTriangulo

- (double) calcularArea: (double)a withB: (double)b andC: (double)c
{
    double s = (a + b + c) / 2;
    double a2 = s * (s - a) * (s - b) * (s - c);
    NSLog(@"%f %f %f %f %f", a, b, c, s, a2);
    return sqrt(a2);
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        AreaTriangulo *areaTriangulo = [[AreaTriangulo alloc] init];
        
        double area = [areaTriangulo calcularArea:12.0 withB:13.0 andC:14.0];
        
        NSLog(@"Área: %f", area);
        
    }
    return 0;
}
