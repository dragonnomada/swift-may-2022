//
//  main.m
//  S102_ClasesYObjetos
//
//  Created by Dragon on 02/05/22.
//

#import <Foundation/Foundation.h>

@interface Robot2D : NSObject

{
    int x;
    int y;
    int d; // N = 0 | E = 1 | S = 2 | O = 3
}

- (void) avanzar;
- (void) describir;
- (void) mirarNorte;
- (void) mirarEste;
- (void) mirarSur;
- (void) mirarOeste;

@end

@implementation Robot2D

- (void) avanzar
{
    switch (d) {
        case 0:
            y++;
            break;
            
        case 1:
            x++;
            break;
            
        case 2:
            y--;
            break;
            
        case 3:
            x--;
            break;
            
        default:
            break;
    }
}

-(void) describir
{
    NSLog(@"(%d, %d) [%d]", x, y, d);
}

- (void) mirarNorte
{
    d = 0;
}
- (void) mirarEste
{
    d = 1;
}
- (void) mirarSur
{
    d = 2;
}
- (void) mirarOeste
{
    d = 3;
}

@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Robot2D *robot = [[Robot2D alloc] init];
        
        [robot describir]; // (0, 0) [0]
        
        [robot avanzar];
        
        [robot describir]; // (0, 1) [0]
        
        [robot mirarEste];
        [robot avanzar];
        
        [robot describir]; // (1, 1) [1]
    }
    return 0;
}
