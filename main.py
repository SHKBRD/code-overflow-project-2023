import pygame

pygame.init()
pygame.font.init()

SCREEN_WIDTH, SCREEN_HEIGHT = 800, 800
size = (SCREEN_WIDTH, SCREEN_HEIGHT)
screen = pygame.display.set_mode(size)

run = True
while run:
    
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            run = False
            
    
    pygame.display.update()