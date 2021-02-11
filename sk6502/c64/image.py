from skoolkit.image import (ImageWriter, TRANSPARENT, BLACK, BLUE, RED, GREEN,
                            CYAN, YELLOW, WHITE, PNG_ENABLE_ANIMATION)

PURPLE = 'PURPLE'
ORANGE = 'ORANGE'
BROWN = 'BROWN'
LIGHT_RED = 'LIGHT_RED'
DARK_GREY = 'DARK_GREY'
GREY = 'GREY'
LIGHT_GREEN = 'LIGHT_GREEN'
LIGHT_BLUE = 'LIGHT_BLUE'
LIGHT_GREY = 'LIGHT_GREY'

class C64ImageWriter(ImageWriter):
    def __init__(self, config=None, palette=None):
        config[PNG_ENABLE_ANIMATION] = 0
        super().__init__(config, palette)

    def get_default_colours(self):
        return (
            (TRANSPARENT, (0, 255, 0)),
            (BLACK, (0, 0, 0)),
            (WHITE, (255, 255, 255)),
            (RED, (136, 0, 0)),
            (CYAN, (170, 255, 238)),
            (PURPLE, (204, 68, 204)),
            (GREEN, (0, 204, 85)),
            (BLUE, (0, 0, 170)),
            (YELLOW, (238, 238, 119)),
            (ORANGE, (221, 136, 85)),
            (BROWN, (102, 68, 0)),
            (LIGHT_RED, (255, 119, 119)),
            (DARK_GREY, (51, 51, 51)),
            (GREY, (119, 119, 119)),
            (LIGHT_GREEN, (170, 255, 102)),
            (LIGHT_BLUE, (0, 136, 255)),
            (LIGHT_GREY, (187, 187, 187))
        )

    def get_attr_map(self):
        return {c: (1 + (c & 0x0f), 1 + c // 16) for c in range(256)}
