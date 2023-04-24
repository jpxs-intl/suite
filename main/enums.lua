--  Global Enums

types = {}


types["sound"] = {
    
    -- ref https://github.com/noche-x/RosaServer/wiki#sounds

    -- Vehicle Sounds

    CAR_ENGINE = 8
    CAR_DRIFT = 10

    CAR_CRASH_1 = 19
    CAR_CRASH_2 = 20

    GEAR_SHIFT = 41

    HELI = 42
    
    -- Gun Sounds

    RICOCHET_1 = 11
    RICOCHET_2 = 12
    RICOCHET_3 = 13
    RICOCHET_4 = 14
    RICOCHET_5 = 15
    RICOCHET_6 = 16
    RICOCHET_7 = 17
    RICOCHET_8 = 18

    MAG_LOAD = 39

    AK_FIRE_1 = 71
    AK_FIRE_2 = 72
    AK_FIRE_3 = 73
    AK_FIRE_4 = 74
    AK_FIRE_5 = 75
    AK_FIRE_6 = 76

    M16_FIRE_1 = 77
    M16_FIRE_2 = 78
    M16_FIRE_3 = 79
    M16_FIRE_4 = 80
    M16_FIRE_5 = 81
    M16_FIRE_6 = 82

    MP5_FIRE_1 = 83
    MP5_FIRE_2 = 84
    MP5_FIRE_3 = 85
    MP5_FIRE_4 = 86
    MP5_FIRE_5 = 87
    MP5_FIRE_6 = 88

    UZI_FIRE_1 = 89
    UZI_FIRE_2 = 90
    UZI_FIRE_3 = 91
    UZI_FIRE_4 = 92
    UZI_FIRE_5 = 93
    UZI_FIRE_6 = 94

    MM9_FIRE_1 = 95
    MM9_FIRE_2 = 96
    MM9_FIRE_3 = 97
    MM9_FIRE_4 = 98
    MM9_FIRE_5 = 99
    MM9_FIRE_6 = 100

    -- Bullet Sounds

    BULLET_HIT_BODY_1 = 21
    BULLET_HIT_BODY_2 = 22

    BULLET_HIT_METAL_1 = 23
    BULLET_HIT_METAL_2 = 24

    BULLET_SHELL = 40

    -- Phone Sounds

    PHONE_RING = 27

    PHONE_BUTTON_0 = 28
    PHONE_BUTTON_1 = 29
    PHONE_BUTTON_2 = 30
    PHONE_BUTTON_3 = 31
    PHONE_BUTTON_4 = 32
    PHONE_BUTTON_5 = 33
    PHONE_BUTTON_6 = 34
    PHONE_BUTTON_7 = 35
    PHONE_BUTTON_8 = 36
    PHONE_BUTTON_9 = 37

    PHONE_BUSY = 38

    -- Misc

    GLASS_BREAK = 25
    FACTORY_WHISTLE = 47
    EXPLOSION = 48

    COMPUTER_DIALUP = 49
    COMPUTER_DRIVE = 50

}

types["item"] = {

    -- ref https://github.com/noche-x/RosaServer/wiki#item-types

    AUTO_5 = 0
    
    AK47 = 1
    AK47_MAG = 2

    M16 = 3
    M16_MAG = 4

    MAGNUM = 5
    MAGNUM_MAG = 6

    MP5 = 7
    MP5_MAG = 8

    UZI = 9
    UZI_MAG = 10

    MM9 = 11
    MM9_MAG = 12

    GRENADE = 13
    BANDAGE = 14
    BREIFCASE = 15
    OPEN_BREIFCASE = 16
    
    ROUND_CASH = 17
    WORLD_CASH = 18

    BLACK_DISK = 19
    GREEN_DISK = 20
    BLUE_DISK = 21
    WHITE_DISK = 22
    GOLD_DISK = 23
    RED_DISK = 24

    CELL_PHONE = 25
    WALKIE_TALKIE = 26

    KEY = 27
    DOOR = 28
    NEWSPAPER = 29
    BURGER = 30
    DESK = 31
    LAMP = 32
    PAY_PHONE = 33
    MEMO = 34
    SOCCER_BALL = 35
    ROPE = 36
    BOX = 37
    PLANK = 38
    COMPUTER = 39
    ARCADE = 40
    TABLE = 41
    TABLE_2 = 42
    WALL = 43
    BOTTLE = 44
    WATERMELON = 45
    
}

types["bullet"] = {

    -- ref https://github.com/noche-x/RosaServer/wiki#bullet-types

    AK47 = 0
    M16 = 1
    AUTO_5 = 2
    MP5 = 2
    UZI = 2
    MM9 = 2
    MAGNUM = 3

}

types["vehicle"] = {

    -- ref https://github.com/noche-x/RosaServer/wiki#vehicle-types

    TOWN_CAR = 0
    TOWN_CAR_2 = 1
    METRO = 2
    LIMO = 3
    TURBO = 4
    TURBO_S = 5
    BEAMER = 6
    VAN = 7
    VAN_2 = 8
    MINI_VAN = 9
    TRUCK = 10
    TRAILER = 11
    HELI = 12
    TRAIN = 13
    NOCLIP = 14
    HATCHBACK = 15
    TEST = 16

}

types["vehicle_color"] = {

    -- refhttps://github.com/noche-x/RosaServer/wiki#vehicle-colors

    BLACK = 0
    RED = 1
    BLUE = 2
    GREY = 3
    WHITE = 4
    GOLD = 5
    BROKEN = 6

}

types["clothing_color"] = {

    -- ref https://github.com/noche-x/RosaServer/wiki#clothing-colors
    
    SHIRT = {

        WHITE = 0
        PINK = 1
        YELLOW = 2
        GREEN = 3
        CYAN = 4
        RED = 5
        BLACK = 9
        BLUE = 10

    }

    SUIT = {

        BROWN = 0
        BLACK = 1
        LIGHT_GREY = 2
        TUROQUOISE = 3
        GREEN = 4
        PINK = 5
        GOLD = 6
        WHITE = 7
        RED = 8
        BLUE = 9
        DARK_BLUE = 10
        GREY = 11

    }

}

types["tie_color"] = {

    -- ref https://github.com/noche-x/RosaServer/wiki#tie-colors

    NONE = 0
    GREEN = 1
    GOLD = 2
    RED = 3
    PINK = 4
    DARK_RED = 5
    WHITE = 6
    LIGHT_GREY = 7
    BLACK = 8
    CYAN = 9
    PURPLE = 10
    
}

types["necklace"] = {

    -- ref https://github.com/noche-x/RosaServer/wiki#necklaces

    NONE = 0
    JEWEL = 1
    DOLLAR = 2

}

types["body_part"] = {

    -- ref https://github.com/noche-x/RosaServer/wiki#body-parts

    PELVIS = {
        ID = 0
        MASS = 14
    }

    STOMACH = {
        ID = 1
        MASS = 14
    }

    TORSO = {
        ID = 2
        MASS = 14
    }

    HEAD = {
        ID = 3
        MASS = 8
    }

    LEFT_SHOULDER = {
        ID = 4
        MASS = 3
    }

    LEFT_FOREARM = {
        ID = 5
        MASS = 2.5
    }

    LEFT_HAND = {
        ID = 6
        MASS = 1.5
    }

    RIGHT_SHOULDER = {
        ID = 7
        MASS = 3
    }

    RIGHT_FOREARM = {
        ID = 8
        MASS = 2.5
    }

    RIGHT_HAND = {
        ID = 9
        MASS = 1.5
    }

    LEFT_THIGH = {
        ID = 10
        MASS = 12
    }

    LEFT_SHIN = {
        ID = 11
        MASS = 7
    }

    LEFT_FOOT = {
        ID = 12
        MASS = 3
    }

    RIGHT_THIGH = {
        ID = 13
        MASS = 12
    }

    RIGHT_SHIN = {
        ID = 14
        MASS = 7
    }

    RIGHT_FOOT = {
        ID = 15
        MASS = 3
    }

}

types["movement_state"] = {
    
        -- ref https://github.com/noche-x/RosaServer/wiki#movement-states

        STANDING = 0
        IN_AIR = 1
        SLIDING = 2
        FLOATING = 3
        IN_VEHICLE = 4
        ON_GROUND = 5
        LEGS_STRAIGHT = 6

}

types["input"] = {

    -- ref https://github.com/noche-x/RosaServer/wiki#input-flags

    NOTHING = 0 -- 2^0
    
    LEFT_MOUSE = 1 -- 2^1
    RIGHT_MOUSE = 2 -- 2^2

    SPACE = 4 -- 2^3
    CONTROL = 8 -- 2^4
    SHIFT = 16 -- 2^5
    Q = 32 -- 2^6

    -- missing 2^7
    -- missing 2^8
    -- missing 2^9
    -- missing 2^10

    E = 2048 -- 2^11
    R = 4096 -- 2^12
    F = 8192 -- 2^13

    -- missing 2^14
    -- missing 2^15
    -- missing 2^16
    -- missing 2^17

    DELETE = 262144 -- 2^18
    Z = 524288 -- 2^19

}

types["team"] = {

    -- ref https://github.com/noche-x/RosaServer/wiki#teams

    GOLDMEN = 0
    MONSOTA = 1
    OXS = 2
    NEXACO = 3
    PENTACOM = 4
    PRODOCON = 5
    MEGACORP = 6
    CIVILIAN = 17

}

types["gamemode"] = {

    -- ref https://github.com/noche-x/RosaServer/wiki#game-types

    PRACTICE = 0 
    DRIVING = 1
    RACING = 2
    ROUND = 3
    WORLD = 4
    ELIMINATOR = 5
    CO_OP = 6
    VERSUS = 7
    NONE = 8

}

types["gamestate"] = {

    -- ref https://github.com/noche-x/RosaServer/wiki#game-states

    IDLE = 0
    INTERMISSION = 1
    IN_GAME = 2
    RESTARTING = 3
    PAUSED = 4

}

types["menu_tabs"] = {

    -- ref https://github.com/noche-x/RosaServer/wiki#menu-tabs

    NOTHING = 0
    
    ENTER_CITY = 1
    LOBBY = 2
    EMPTY_BASE = 3

    WORLD_CAR_SHOP = 9
    WORLD_GUN_STORE 10
    BURGER_SHOP = 10
    CLOTHING_STORE = 10
    WORLD_STORE = 11
    WORLD_BANK = 12

    ROUND_WEAPONS = 14
    ROUND_AMMO = 15
    ROUND_EQUIPMENT = 16
    ROUND_VEHICLES = 17
    ROUND_STOCK = 18

    WORLD_EMPTY_CORP = 19
    WORLD_CORP_APPLY = 20
    WORLD_CORP_HIRE = 22
    WORLD_CORP_FIRE = 23
    WORLD_CORP_TEAM = 24
    WORLD_CORP_REAQUIRE = 25

}
