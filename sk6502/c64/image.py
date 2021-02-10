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
        super().__init__(config, palette)
        self.options[PNG_ENABLE_ANIMATION] = 0

    def _get_default_palette(self):
        return {
            TRANSPARENT: (0, 255, 0),
            BLACK: (0, 0, 0),
            WHITE: (255, 255, 255),
            RED: (136, 0, 0),
            CYAN: (170, 255, 238),
            PURPLE: (204, 68, 204),
            GREEN: (0, 204, 85),
            BLUE: (0, 0, 170),
            YELLOW: (238, 238, 119),
            ORANGE: (221, 136, 85),
            BROWN: (102, 68, 0),
            LIGHT_RED: (255, 119, 119),
            DARK_GREY: (51, 51, 51),
            GREY: (119, 119, 119),
            LIGHT_GREEN: (170, 255, 102),
            LIGHT_BLUE: (0, 136, 255),
            LIGHT_GREY: (187, 187, 187)
        }

    def _create_colours(self, palette):
        self.colours = (
            palette[TRANSPARENT],
            palette[BLACK],
            palette[WHITE],
            palette[RED],
            palette[CYAN],
            palette[PURPLE],
            palette[GREEN],
            palette[BLUE],
            palette[YELLOW],
            palette[ORANGE],
            palette[BROWN],
            palette[LIGHT_RED],
            palette[DARK_GREY],
            palette[GREY],
            palette[LIGHT_GREEN],
            palette[LIGHT_BLUE],
            palette[LIGHT_GREY]
        )

    def _create_attr_index(self):
        self.attr_index = {c: (1 + (c & 0x0f), 1 + c // 16) for c in range(256)}
