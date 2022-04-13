--[[    
██████╗ ███████╗███╗   ██╗███████╗███████╗██████╗     ██████╗ ███████╗██╗   ██╗███████╗██╗      ██████╗ ██████╗ ███████╗██████╗ 
██╔══██╗██╔════╝████╗  ██║╚══███╔╝██╔════╝██╔══██╗    ██╔══██╗██╔════╝██║   ██║██╔════╝██║     ██╔═══██╗██╔══██╗██╔════╝██╔══██╗
██████╔╝█████╗  ██╔██╗ ██║  ███╔╝ █████╗  ██████╔╝    ██║  ██║█████╗  ██║   ██║█████╗  ██║     ██║   ██║██████╔╝█████╗  ██████╔╝
██╔══██╗██╔══╝  ██║╚██╗██║ ███╔╝  ██╔══╝  ██╔══██╗    ██║  ██║██╔══╝  ╚██╗ ██╔╝██╔══╝  ██║     ██║   ██║██╔═══╝ ██╔══╝  ██╔══██╗
██║  ██║███████╗██║ ╚████║███████╗███████╗██║  ██║    ██████╔╝███████╗ ╚████╔╝ ███████╗███████╗╚██████╔╝██║     ███████╗██║  ██║
╚═╝  ╚═╝╚══════╝╚═╝  ╚═══╝╚══════╝╚══════╝╚═╝  ╚═╝    ╚═════╝ ╚══════╝  ╚═══╝  ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝  ╚═╝
Discord: https://discord.gg/cD4tUF2Bza
Facebook: https://www.facebook.com/RenZerDeveloperShop
WebShop : https://renzershop.com
💕 "Thanks for your support" 💕
]]

RZ = {}
RZ.Base = {
    getSharedObject = 'esx:getSharedObject'
}

RZ.Zone = {                                           --[[ กำหนดโซนในการกินอาหาร สามารถเพิ่มได้มากกว่า1จุด ]]
    {
        Pos     = vector3(-278.67, -1041.22, 36.35),
        Radius  = 7.9
    }
}

RZ.UseItem = {
    ['bread'] = {                                   --[[ ใส่ไอเท็มที่ต้องการให้กดใช้ ]]
        NeedZone        = true,                     --[[ true = สามารถกินได้แค่ในโซน false = สามารถกินนอกโซนได้ ]]
        Time            = 5,                        --[[ ระยะเวลาในการกินอาหาร หน่วยเป็นวินาที ]]
        Status = {                                  --[[ ตั้งค่า Status สามารถเช็คได้มากกว่า 1 ค่า ]]
            {
                Action = 'add',                     --[[ add = เพื่มค่า status | remove = ลบค่า status ]]
                Type = 'hunger',                    --[[ hunger = ค่าอาหาร | thirst = ค่าน้ำ ]]
                Count = 50                          --[[ จะให้เพิ่มกี่ % ]]
            }
        },
        Prop = {                                    --[[ ตั้งค่าPropบนมือ ]]
            Name = 'prop_cs_burger_01',
            BoneIndex = 18905,
            xPos = 0.12, yPos = 0.028, zPos = 0.001, xRot = 10.0, yRot = 175.0, zRot = 0.0,
        },
        AnimDict = {                                --[[ ตั้งค่าท่าทาง ]]
            Anim = 'mp_player_inteat@burger',
            Dict = 'mp_player_int_eat_burger_fp'
        }
    },
    ['water'] = {
        NeedZone        = true,                     --[[ true = สามารถกินได้แค่ในโซน false = สามารถกินนอกโซนได้ ]]
        Time            = 5,                        --[[ ระยะเวลาในการกินอาหาร หน่วยเป็นวินาที ]]
        Status = {
            {
                Action = 'add',                     --[[ add = เพื่มค่า status | remove = ลบค่า status ]]
                Type = 'thirst',                    --[[ hunger = ค่าอาหาร | thirst = ค่าน้ำ ]]
                Count = 50                          --[[ จะให้เพิ่มกี่ % ]]
            }
        },
        Prop = {                                    --[[ ตั้งค่าPropบนมือ ]]
            Name = 'prop_cs_burger_01',
            BoneIndex = 18905,
            xPos = 0.12, yPos = 0.028, zPos = 0.001, xRot = 10.0, yRot = 175.0, zRot = 0.0,
        },
        AnimDict = {                                --[[ ตั้งค่าท่าทาง ]]
            Anim = 'mp_player_inteat@burger',
            Dict = 'mp_player_int_eat_burger_fp'
        }
    },
    ['pinto'] = {
        NeedZone        = true,                     --[[ true = สามารถกินได้แค่ในโซน false = สามารถกินนอกโซนได้ ]]
        Time            = 5,                        --[[ ระยะเวลาในการกินอาหาร หน่วยเป็นวินาที ]]
        Status = {
            {
                Action = 'add',                     --[[ add = เพื่มค่า status | remove = ลบค่า status ]]
                Type = 'hunger',                    --[[ hunger = ค่าอาหาร | thirst = ค่าน้ำ ]]
                Count = 100                          --[[ จะให้เพิ่มกี่ % ]]
            },
            {
                Action = 'add',                     --[[ add = เพื่มค่า status | remove = ลบค่า status ]]
                Type = 'thirst',                    --[[ hunger = ค่าอาหาร | thirst = ค่าน้ำ ]]
                Count = 100                          --[[ จะให้เพิ่มกี่ % ]]
            }
        },
        Prop = {                                    --[[ ตั้งค่าPropบนมือ ]]
            Name = 'prop_cs_burger_01',
            BoneIndex = 18905,
            xPos = 0.12, yPos = 0.028, zPos = 0.001, xRot = 10.0, yRot = 175.0, zRot = 0.0,
        },
        AnimDict = {                                --[[ ตั้งค่าท่าทาง ]]
            Anim = 'mp_player_inteat@burger',
            Dict = 'mp_player_int_eat_burger_fp'
        }
    }
}