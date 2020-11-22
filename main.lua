local Config = {
    EnemyHPScaling = 3, -- Per player, multiply enemy hp by 1 + EnemyHPScaling * 0.1
    BaseHUDOffset = 1, -- Corresponds directly to HUD offset in options
    PVP = 1, -- 1 = Off, 2 = On
    MultiplayerBossSplash = 2, -- 1 = Off, 2 = On
    GhostDeathMode = 4, -- 1 = Off, 2 = Players become ghosts on death rather than the game ending, 3 = Ghosts can be revived by making a sacrifice in the sacrifice room
    PlayerTintMode = 2, -- 1 = Off, players will all use normal colors, 2 = Players will use tinted colors while holding the map button, 3 = Players will always be tinted
    HUDOutlineMode = 2, -- 1 = Off, 2 = Outline when holding the map button, 3 = Always outlined
    PlayerTextMode = 1, -- 1 = Off, 2 = On while holding the map button, 3 = Always on
    HUDTextMode = 1, -- 1 = Off, 2 = On while holding the map button, 3 = Always on
    EnemiesTargetGhosts = 1, -- 1 = Off, 2 = On
    GhostKnockback = 2, -- 1 = Off, 2 = On
    GhostKnockbackChance = 25,
    GhostKnockbackPartitions = {
        EntityPartition.PLAYER,
        EntityPartition.TEAR,
        EntityPartition.BULLET,
        EntityPartition.ENEMY,
        EntityPartition.PICKUP
    },
    PlayerIndexToFetusSpawnIndex = {
        48,
        50,
        54,
        56
    },
    PlayerIndexToFetusSpawnIndexFallback = {
        63,
        65,
        69,
        71
    },
    PlayerIndexToFetusSpawnIndexSkinny = {
        50,
        81,
        83,
        54
    },
    JacobMode = 1, -- 1 = Off, 2 = On
    BigChestJumpOffset = Vector(0, -12),
    ChargeBarOffset = Vector(18, 1),
    PillOffset = Vector(3, 0),
    SmallCardPillOffset = Vector(7, -16),
    UIFontColor = KColor(1, 1, 1, 0.5, 0, 0, 0),
    UIFontScale = Vector(1, 1),
    UIFontOffset = Vector(-10, -10),
    UIFontOffsetPlayerThree = Vector(10, -10),
    PlayerIndicatorPillOffset = Vector(-14, -28),
    PlayerIndicatorTrinketOffset = Vector(-8, -32),
    JarActiveOffset = Vector(4, 3),
    JarOfFliesOffset = Vector(4, 2),
    WebColor = Color(1, 1, 1, 1, 50, 50, 50),
    ActiveHUDOffsetsTopLeft = {
        Vector(18, 16),
        nil,
        nil,
        nil
    },
    ActiveHUDOffsetsBottomLeft = {
        nil,
        nil,
        Vector(103, -16),
        nil
    },
    ActiveHUDOffsetsBottomRight = {
        nil,
        nil,
        nil,
        Vector(-150, -16)
    },
    ActiveHUDOffsetsTopRight = {
        nil,
        Vector(-142, 16),
        nil,
        nil
    },
    HeartHUDOffsetsBottomLeft = {
        nil,
        nil,
        Vector(60, -27.5),
        nil
    },
    HeartHUDOffsetsBottomRight = {
        nil,
        nil,
        nil,
        Vector(-120.5, -27.5)
    },
    HeartHUDOffsetsTopRight = {
        nil,
        Vector(-113.5, 13),
        nil,
        nil
    },
    HeartXSpacing = 12,
    HeartYSpacing = 10,
    SchoolbagOffsets = {
        nil,
        Vector(-35, 0),
        Vector(35, 0),
        Vector(-35, 0)
    },
    ExtraLifeHUDOffsets = { -- From active item
        nil,
        Vector(64, 0),
        Vector(-11, -27),
        Vector(66, 0)
    },
    PillHUDOffsets = {
        Vector(-15, -12),
        Vector(-15, -52),
        Vector(-15, -92),
        Vector(-15, -132)
    },
    TrinketHUDOffsets = {
        {Vector(38, -12), Vector(14, -36)},
        {Vector(38, -62), Vector(14, -86)},
        {Vector(38, -112), Vector(14, -136)},
        {Vector(38, -162), Vector(14, -186)}
    },
    CharacterSelectOffset = Vector(0, 0),
    ColorFadeFrames = 15, -- Frames it takes for color to appear / disappear when tab is pressed / released
    PlayerColors = {
        Color(1, 0.785, 0.785, 1, 75, 0, 0),
        Color(0.706, 0.785, 1, 1, 00, 5, 75),
        Color(0.706, 1, 0.785, 1, 0, 50, 0),
        Color(0.863, 0.863, 0.501, 1, 75, 60, 0)
    },
    PlayerHUDOutlineColors = {
        Color(0, 0, 0, 1, 165, 0, 0),
        Color(0, 0, 0, 1, 0, 0, 160),
        Color(0, 0, 0, 1, 0, 160, 0),
        Color(0, 0, 0, 1, 165, 160, 0),
    },
    TrinketDropTime = 30,
    TrinketDescriptionOffset = Vector(0, 20),
    TrinketDescriptionScale = Vector(1, 1)
}

--[[ MODDERS, use this to interface the True Co-op Mod
local function onTrueCoopInit()
    -- USE INITIALIZATION FUNCTIONS THAT REQUIRE TRUE CO-OP HERE
end

if InfinityTrueCoopInterface then
    onTrueCoopInit()
else
    if not __infinityTrueCoop then
        __infinityTrueCoop = {}
    end

    __infinityTrueCoop[#__infinityTrueCoop + 1] = onTrueCoopInit
end

CURRENT FUNCTIONS ARE:
InfinityTrueCoopInterface.AddCharacter(playerData) -- Stores information about a character. playerData is arranged like so:
{
    Name = String, -- mandatory, this is used as a means of identifying players for adding ghost costumes, and should be used for identifying modded characters. (:GetData().TrueCoop.Save.PlayerName)
    Type = PlayerType, -- this should NOT be a modded character type. It is impossible to change characters to modded ones, use Isaac or another most matching one and instead identify with :GetData().TrueCoop.Save.PlayerName
    SelectionGfx = PngFilename,
    GhostCostume = NullCostumeID,
    MaxHearts = Integer,
    Hearts = Integer,
    SoulHearts = Integer,
    BlackHearts = Integer,
    Pill = Boolean,
    PillEffect = PillEffect, -- if Pill but not PillEffect, gives a random pill
    Card = Card,
    Trinket = Trinket,
    Items = {CollectibleType, ...},
    OnStart = Function, -- You'll want to use this to replace your character's spritesheet / anm2, add a data flag, etc. Passes EntityPlayer.
    OnChangeCharacter = Function, -- Clear up data, remove costumes, etc. Passes EntityPlayer.
    PreDeath = Function, -- If your mod meddles with revival, return false in this function to stop players becoming ghosts. Passes EntityPlayer.
    AllowHijacking = Boolean, -- If true, returns Name to GetName()
    ActualType = Integer, -- If supplied and AllowHijacking is true, this is returned when GetPlayerType() is called with this character
    FetusSprite, = Anm2Filename OR Sprite -- sprite rendered over glow and below heart price in fetus revival system. without this only a glow and price will render
    Coins = Integer,
    Keys = Integer,
    Bombs = Integer,
    BossPortrait = PngFilename, -- Boss information, for the custom multiplayer boss splash. Ghosts have ghost appearances and transparent names.
    BossName = PngFilename,
    GhostPortrait = PngFilename,
    GhostName = PngFilename
}

InfinityTrueCoopInterface.AddCharacterToWheel(name) -- Adds character to selection wheel

InfinityTrueCoopInterface.AssociatePlayerTypeName(PlayerType, name) -- Associating player type with name allows the mod to locate playerData for modded characters as p1.

InfinityTrueCoopInterface.SetExpectedFamiliar(name, variant, pind or EntityPlayer, count, accountForBoxOfFriends, delirium, positions) -- Adds an expected familiar to be added if not found / removed if too many are found. Overrides previous calls with same name.

InfinityTrueCoopInterface.SetFamiliarPlayer(familiar, player) -- Associates a player with a familiar, if not done familiars will be deleted in favor of properly associated ones.

InfinityTrueCoopInterface.AddModdedCardFront(Card, Anm2, Animation) -- allows p2-4's HUD to render modded card fronts correctly.

Example with piber20's Eight of Playing Cards mod, were ui_cardfronts.anm2 to be included in the resources folder:
InfinityTrueCoopInterface.AddModdedCardFront(EightOfClubsCard, "ui_cardfronts.anm2", "8 of Clubs")
InfinityTrueCoopInterface.AddModdedCardFront(EightOfHeartsCard, "ui_cardfronts.anm2", "8 of Hearts")
InfinityTrueCoopInterface.AddModdedCardFront(EightOfSpadesCard, "ui_cardfronts.anm2", "8 of Spades")
InfinityTrueCoopInterface.AddModdedCardFront(EightOfDiamondsCard, "ui_cardfronts.anm2", "8 of Diamonds")

ADDITIONAL COMPATIBILITY TIPS:
This mod uses :GetData().TrueCoop as well as various :GetData.TrueCoopXXXXXXX
Data in :GetData().TrueCoop.Save will be saved and loaded when that player re-joins, so use that for important player-specific save data.
Helpful data:
data.TrueCoop.CoopPlayer
data.TrueCoop.Save.IsGhost
data.TrueCoop.Save.SelectingCharacter
data.TrueCoop.Save.PlayerName
This mod overrides EntityPlayer:CheckFamiliar. It will constantly check for the passed in count of familiars until CheckFamiliar is called again with a different count. This means you must call CheckFamiliar even when the count should be 0.
Isaac.GetPlayer(0) only gets the first player, so items based around it will not function in true co-op. Use MC_POST_PEFFECT_UPDATE or iterate through all players via the code below instead.
-- Player iteration code
for i = 1, Game():GetNumPlayers() do
    local player = Isaac.GetPlayer(i - 1)
    -- Do what you would do if the above line was local player = Isaac.GetPlayer(0) here.
end

InfinityTrueCoopInterface.Config returns the Config table seen at the top of the mod file.
]]


Config.PlayerColorsByFrame = {}
Config.PlayerHUDColorsByFrame = {}
Config.PlayerFontColors = {}

for pind, color in ipairs(Config.PlayerColors) do
    Config.PlayerColorsByFrame[pind] = {}
    for i = 1, Config.ColorFadeFrames do
        local newColor = Color(color.R, color.G, color.B, color.A, math.floor((color.RO / Config.ColorFadeFrames) * i * 255), math.floor((color.GO / Config.ColorFadeFrames) * i * 255), math.floor((color.BO / Config.ColorFadeFrames) * i * 255))
        Config.PlayerColorsByFrame[pind][i] = newColor
    end

    Config.PlayerFontColors[pind] = KColor(color.RO * 4, color.GO * 4, color.BO * 4, 0.5, 0, 0, 0)
end

for pind, color in ipairs(Config.PlayerHUDOutlineColors) do
    Config.PlayerHUDColorsByFrame[pind] = {}
    for i = 1, Config.ColorFadeFrames do
        local hudColor = Color(color.R, color.G, color.B, (color.A / Config.ColorFadeFrames) * i, math.floor((color.RO / Config.ColorFadeFrames) * i * 255), math.floor((color.GO / Config.ColorFadeFrames) * i * 255), math.floor((color.BO / Config.ColorFadeFrames) * i * 255))
        Config.PlayerHUDColorsByFrame[pind][i] = hudColor
    end
end

local previouslyLoaded
if InfinityTrueCoopInterface then
    previouslyLoaded = true
end

InfinityTrueCoopInterface = {Config = Config}

local mod = RegisterMod("True Co-op Mod", 1)

local game = Game()
local itemPool = game:GetItemPool()
local zeroVector = Vector(0, 0)
local players = {}
local sfxManager = SFXManager()

local function RefreshPlayers()
    players = {}
    for i = 1, game:GetNumPlayers() do
        players[i] = Isaac.GetPlayer(i - 1)
        local data = players[i]:GetData()

        if not data.TrueCoop then
            data.TrueCoop = {
                Save = {},
                ExtraFamiliars = {},
                ExtraFamiliarsBuffer = {},
                ExtraExtraFamiliars = {},
            }
        end

        data.TrueCoop.PlayerListIndex = i
        data.TrueCoop.ShouldEvaluate = true
    end
end

RefreshPlayers()

local function playSound(sound)
    sfxManager:Play(sound, 1, 0, false, 1)
end

local function GetHUDOffset()
    return Config.BaseHUDOffset - 1
end

local function GetScreenCenterPosition()
    local room = game:GetRoom()
    local roomCenter = room:GetCenterPos()
    local centerOffset = roomCenter - room:GetTopLeftPos()
    local pos = room:GetCenterPos()
    if centerOffset.X > 260 then
      pos.X = pos.X - 260
    end
    if centerOffset.Y > 140 then
        pos.Y = pos.Y - 140
    end
    return Isaac.WorldToRenderPosition(pos, false), roomCenter, room
end

local function GetBottomRightNoOffset()
    return GetScreenCenterPosition() * 2
end

local function GetBottomLeftNoOffset()
    return Vector(0, GetBottomRightNoOffset().Y)
end

local function GetTopRightNoOffset()
    return Vector(GetBottomRightNoOffset().X, 0)
end

local function GetTopLeftNoOffset()
    return zeroVector
end

local function GetScreenBottomRight()
    local offset = GetHUDOffset()
    local hudOffset = Vector(-offset * 1.6, -offset * 0.6)

    return GetBottomRightNoOffset() + hudOffset
end

local function GetScreenBottomLeft()
    local offset = GetHUDOffset()
    local hudOffset = Vector(offset * 2.2, -offset * 1.6)

    return GetBottomLeftNoOffset() + hudOffset
end

local function GetScreenTopRight()
    local offset = GetHUDOffset()
    local hudOffset = Vector(-offset * 2.2, offset * 1.2)

    return GetTopRightNoOffset() + hudOffset
end

local function GetScreenTopLeft()
    local offset = GetHUDOffset()
    local hudOffset = Vector(offset * 2, offset * 1.2)

    return GetTopLeftNoOffset() + hudOffset
end

local RandomRNG = RNG()
RandomRNG:SetSeed(Random(), 3)

local function random(min, max, rng) -- Re-implements math.random()
    rng = rng or RandomRNG
    if min ~= nil and max ~= nil then -- Min and max passed, integer [min,max]
        return math.floor(rng:RandomFloat() * (max - min + 1) + min)
    elseif min ~= nil then -- Only min passed, integer [0,min]
        return math.floor(rng:RandomFloat() * (min + 1))
    end
    return rng:RandomFloat() -- float [0,1)
end

local iconfig = Isaac.GetItemConfig()
local itemSprites = {}
local itemList = {}
local familiarList = {}
local itemConfigList = {}

local activeList = {}
local passiveList = {}
local trinketConfigList = {}

local function PopulateConfigLists()
    itemSprites = {}
    itemList = {}
    familiarList = {}
    itemConfigList = {}

    activeList = {}
    passiveList = {}
    trinketConfigList = {}

    local counter = 1
    local collectible = iconfig:GetCollectible(counter)
    while collectible or (counter < 534) do
        itemConfigList[counter] = collectible
        itemList[#itemList + 1] = counter
        if collectible and collectible.Type then
            if collectible.Type == ItemType.ITEM_ACTIVE or counter == CollectibleType.COLLECTIBLE_SCHOOLBAG then
                activeList[#activeList + 1] = counter
                local sprite = Sprite()
                sprite:Load("gfx/truecoop/active_item.anm2", false)

                for i = 0, 4 do
                    sprite:ReplaceSpritesheet(i, collectible.GfxFileName)
                end

                sprite:LoadGraphics()
                sprite:Play("On", true)

                local colorSprite = Sprite()
                colorSprite:Load("gfx/truecoop/active_item_color.anm2", false)
                for i = 0, 12 do
                    colorSprite:ReplaceSpritesheet(i, collectible.GfxFileName)
                end

                colorSprite:LoadGraphics()
                colorSprite:Play("On", true)

                itemSprites[counter] = {
                    Sprite = sprite,
                    ColorSprite = colorSprite,
                    Config = collectible
                }
            else
                passiveList[#passiveList + 1] = counter
                if collectible.Type == ItemType.ITEM_FAMILIAR then
                    familiarList[#familiarList + 1] = counter
                end
            end
        end

        counter = counter + 1
        collectible = iconfig:GetCollectible(counter)
    end

    counter = 1
    local trinket = iconfig:GetTrinket(counter)
    while trinket or (counter < 126) do
        if trinket then
            local sprite = Sprite()
            sprite:Load("gfx/truecoop/active_item.anm2", false)
            for i = 0, 4 do
                sprite:ReplaceSpritesheet(i, trinket.GfxFileName)
            end

            local colorSprite = Sprite()
            colorSprite:Load("gfx/truecoop/active_item_color.anm2", false)
            for i = 0, 12 do
                colorSprite:ReplaceSpritesheet(i, trinket.GfxFileName)
            end

            sprite:LoadGraphics()
            sprite:Play("Off", true)

            colorSprite:LoadGraphics()
            colorSprite:Play("Off", true)
            trinketConfigList[counter] = {
                Sprite = sprite,
                ColorSprite = colorSprite,
                Config = trinket
            }
        end

        counter = counter + 1
        trinket = iconfig:GetTrinket(counter)
    end
end

local TrueCoopInit
mod:AddCallback(ModCallbacks.MC_INPUT_ACTION, function()
    if not TrueCoopInit then
        PopulateConfigLists()
        TrueCoopInit = true
    end
end)


local function GetInventory(player)
    local inv = {
        Items = {},
        Trinkets = {},
        Pills = {},
        Cards = {}
    }

    inv.Charge = player:GetActiveCharge()
    inv.MaxHearts = player:GetMaxHearts()
    inv.Hearts = player:GetHearts()
    inv.SoulHearts = player:GetSoulHearts()
    inv.BlackHearts = {}
    inv.PlayerType = player:GetPlayerType()
    inv.TrueCoopData = player:GetData().TrueCoop.Save

    for i = 1, 24 do
        if player:IsBlackHeart(i) then
            inv.BlackHearts[i] = true
            inv.BlackHearts[i + 1] = true
        end
    end

    for _, item in ipairs(itemList) do
        if not ((game.Difficulty == Difficulty.DIFFICULTY_GREED or game.Difficulty == Difficulty.DIFFICULTY_GREEDIER) and item == CollectibleType.COLLECTIBLE_RESTOCK) then
            local cNum = player:GetCollectibleNum(item)
            if cNum > 0 then
                inv.Items[tostring(item)] = player:GetCollectibleNum(item)
            end
        end
    end

    for i = 0, 1 do
        local pill = player:GetPill(i)
        if pill and pill > 0 then
            inv.Pills[#inv.Pills + 1] = pill
        end

        local card = player:GetCard(i)
        if card and card > 0 then
            inv.Cards[#inv.Cards + 1] = card
        end

        local trinket = player:GetTrinket(i)
        if trinket and trinket > 0 then
            inv.Trinkets[#inv.Trinkets + 1] = trinket
        end
    end

    return inv
end

local function RemoveAllItems(player)
    local inv = GetInventory(player)
    for k, icount in pairs(inv.Items) do
        for i = 1, icount do
            player:RemoveCollectible(tonumber(k))
        end
    end

    local trinkets = { player:GetTrinket(0), player:GetTrinket(1) }
    player:AddCollectible(CollectibleType.COLLECTIBLE_MOMS_PURSE, 0, false)
    for _, trinket in ipairs(trinkets) do
        if trinket and trinket > 0 then
            player:TryRemoveTrinket(trinket)
        end
    end
    player:RemoveCollectible(CollectibleType.COLLECTIBLE_MOMS_PURSE)

    local active = player:GetActiveItem()
    if active > 0 then
        player:RemoveCollectible(active)
    end
end

local function LoadInventory(player, inv, loss)
    RemoveAllItems(player)
    for k, count in pairs(inv.Items) do
        local id = tonumber(k)
        for i = 1, count do
            if (not loss or random(1, 100) > loss) then
                player:AddCollectible(id, inv.Charge or 0, false)
            end
        end
    end

    for _, pill in ipairs(inv.Pills) do
        player:AddPill(pill)
    end

    for _, card in ipairs(inv.Cards) do
        player:AddCard(card)
    end

    for _, trinket in ipairs(inv.Trinkets) do
        player:AddTrinket(trinket)
    end
end

local function DoEntitiesCollide(entA, entB, extra)
    local sizeA, sizeB = entA.Size, entB.Size
    local combine = sizeA + sizeB
    return entA.Position:DistanceSquared(entB.Position) < ((combine * combine) + (extra or 0))
end

local json = require("json")
local SaveData

local function SaveModData()
    Isaac.SaveModData(mod, json.encode(SaveData))
end

local function LoadModData()
    if Isaac.HasModData(mod) then
        SaveData = json.decode(Isaac.LoadModData(mod))
    else
        SaveData = {}
    end
end

mod:AddCallback(ModCallbacks.MC_POST_PLAYER_INIT, function(_, p)
    RefreshPlayers()

    if p.Variant > 0 then
        p.Variant = 0
        p:GetSprite():Load("gfx/001.000_player.anm2", true)
        local data = p:GetData().TrueCoop
        data.CoopPlayer = true
        data.JustSpawned = true
        p:AddCoins(players[1]:GetNumCoins())
        p:AddKeys(players[1]:GetNumKeys())
        p:AddBombs(players[1]:GetNumBombs())
        p.GridCollisionClass = EntityGridCollisionClass.GRIDCOLL_GROUND
    end
end)

local defaultGhost = Isaac.GetCostumeIdByPath("gfx/truecoop/costumes/ghost/ghost.anm2")

local PlayersByName = {
    ["Apollyon"] = {
        Type = PlayerType.PLAYER_APOLLYON,
        GhostCostume = "apollyon",
        MaxHearts = 4,
        Hearts = 4,
        Items = {CollectibleType.COLLECTIBLE_VOID},
        SelectionGfx = "14_Apollyon",
        FetusSprite = "15_Apollyon",
        BossName = "15_apollyon",
        BossPortrait = "15_apollyon",
        GhostName = "15_apollyon",
        GhostPortrait = "15_apollyon"
    },
    ["Isaac"] = {
        Type = PlayerType.PLAYER_ISAAC,
        MaxHearts = 6,
        Hearts = 6,
        Items = {CollectibleType.COLLECTIBLE_D6},
        SelectionGfx = "01_Isaac",
        Bombs = 1
    },
    ["Magdalene"] = {
        Type = PlayerType.PLAYER_MAGDALENA,
        GhostCostume = "magdalene",
        MaxHearts = 8,
        Hearts = 8,
        Pill = true,
        PillEffect = PillEffect.PILLEFFECT_SPEED_UP,
        Items = {CollectibleType.COLLECTIBLE_YUM_HEART},
        SelectionGfx = "02_Magdalene"
    },
    ["Cain"] = {
        Type = PlayerType.PLAYER_CAIN,
        GhostCostume = "cain",
        MaxHearts = 4,
        Hearts = 4,
        Items = {CollectibleType.COLLECTIBLE_LUCKY_FOOT},
        Trinket = TrinketType.TRINKET_PAPER_CLIP,
        SelectionGfx = "03_Cain",
        Keys = 1
    },
    ["Judas"] = {
        Type = PlayerType.PLAYER_JUDAS,
        GhostCostume = "judas",
        MaxHearts = 2,
        Hearts = 2,
        Items = {CollectibleType.COLLECTIBLE_BOOK_OF_BELIAL},
        SelectionGfx = "04_Judas",
        Coins = 3
    },
    ["Eve"] = {
        Type = PlayerType.PLAYER_EVE,
        GhostCostume = "eve",
        MaxHearts = 4,
        Hearts = 4,
        Items = {CollectibleType.COLLECTIBLE_RAZOR_BLADE, CollectibleType.COLLECTIBLE_DEAD_BIRD, CollectibleType.COLLECTIBLE_WHORE_OF_BABYLON},
        SelectionGfx = "05_Eve"
    },
    ["Blue Baby"] = {
        Type = PlayerType.PLAYER_XXX,
        GhostCostume = "bluebaby",
        SoulHearts = 6,
        Items = {CollectibleType.COLLECTIBLE_POOP},
        SelectionGfx = "06_BlueBaby"
    },
    ["Samson"] = {
        Type = PlayerType.PLAYER_SAMSON,
        GhostCostume = "samson",
        MaxHearts = 6,
        Hearts = 6,
        Items = {CollectibleType.COLLECTIBLE_BLOODY_LUST},
        Trinket = TrinketType.TRINKET_CHILDS_HEART,
        SelectionGfx = "07_Samson"
    },
    ["Azazel"] = {
        Type = PlayerType.PLAYER_AZAZEL,
        GhostCostume = "azazel",
        BlackHearts = 6,
        Card = Card.CARD_FOOL,
        SelectionGfx = "08_Azazel"
    },
    ["Eden"] = {
        Type = PlayerType.PLAYER_EDEN,
        GhostCostume = "eden",
        SelectionGfx = "10_Eden",
        BossName = "09_eden",
        BossPortrait = "09_eden"
    },
    ["Lazarus"] = {
        Type = PlayerType.PLAYER_LAZARUS,
        GhostCostume = "lazarus",
        MaxHearts = 6,
        Hearts = 6,
        Pill = true,
        Items = {CollectibleType.COLLECTIBLE_ANEMIC},
        SelectionGfx = "09_Lazarus",
        BossName = "10_lazarus"
    },
    ["The Lost"] = {
        Type = PlayerType.PLAYER_THELOST,
        SoulHearts = 1,
        Items = {CollectibleType.COLLECTIBLE_D4, CollectibleType.COLLECTIBLE_HOLY_MANTLE},
        SelectionGfx = "11_TheLost",
        BossName = "12_thelost",
        BossPortrait = "12_thelost",
        Coins = 1
    },
    ["Lilith"] = {
        Type = PlayerType.PLAYER_LILITH,
        GhostCostume = "lilith",
        MaxHearts = 2,
        Hearts = 2,
        BlackHearts = 4,
        Items = {CollectibleType.COLLECTIBLE_BOX_OF_FRIENDS, CollectibleType.COLLECTIBLE_CAMBION_CONCEPTION},
        SelectionGfx = "12_Lilith",
        FetusSprite = "13_Lilith",
        BossName = "13_lilith",
        BossPortrait = "13_lilith",
        GhostName = "13_lilith",
        GhostPortrait = "13_lilith"
    },
    ["Keeper"] = {
        Type = PlayerType.PLAYER_KEEPER,
        GhostCostume = "keeper",
        MaxHearts = 4,
        Hearts = 4,
        Items = {CollectibleType.COLLECTIBLE_WOODEN_NICKEL},
        Trinket = TrinketType.TRINKET_STORE_KEY,
        SelectionGfx = "13_Keeper",
        FetusSprite = "14_Keeper",
        BossName = "14_thekeeper",
        BossPortrait = "14_keeper",
        GhostName = "14_thekeeper",
        GhostPortrait = "14_thekeeper",
        Bombs = 1,
        Coins = 1
    },

    ["The Forgotten"] = {
        Type = PlayerType.PLAYER_THEFORGOTTEN,
        FetusSprite = "16_theforgotten",
        GhostCostume = "theforgotten"
    },
    ["The Soul"] = {
        Type = PlayerType.PLAYER_THESOUL,
        FetusSprite = "17_thesoul",
        GhostCostume = "thesoul",
        GhostName = "16_theforgotten",
        GhostPortrait = "16_theforgotten"
    },

    ["Revived Lazarus"] = {
        Type = PlayerType.PLAYER_LAZARUS2,
        FetusSprite = "09_Lazarus",
        GhostCostume = "lazarus",
        BossName = "10_lazarus"
    },
    ["Dark Judas"] = {
        Type = PlayerType.PLAYER_BLACKJUDAS,
        FetusSprite = "12_DarkJudas",
        GhostCostume = "judasshadow",
        BossName = "04_judas",
        BossPortrait = "blackjudas",
        GhostName = "04_judas"
    },
    ["RANDOM"] = {
        SelectionGfx = "00_Random"
    }
}

local PlayerSelectOrder = {
    "Apollyon",
    "RANDOM",
    "Isaac",
    "Magdalene",
    "Cain",
    "Judas",
    "Eve",
    "Blue Baby",
    "Samson",
    "Azazel",
    "Eden",
    "Lazarus",
    "The Lost",
    "Lilith",
    "Keeper"
}

local PlayerTypeToName = {
    [PlayerType.PLAYER_APOLLYON] = "Apollyon",
    [PlayerType.PLAYER_AZAZEL] = "Azazel",
    [PlayerType.PLAYER_BLACKJUDAS] = "Dark Judas",
    [PlayerType.PLAYER_CAIN] = "Cain",
    [PlayerType.PLAYER_EDEN] = "Eden",
    [PlayerType.PLAYER_EVE] = "Eve",
    [PlayerType.PLAYER_ISAAC] = "Isaac",
    [PlayerType.PLAYER_JUDAS] = "Judas",
    [PlayerType.PLAYER_KEEPER] = "Keeper",
    [PlayerType.PLAYER_LAZARUS] = "Lazarus",
    [PlayerType.PLAYER_LAZARUS2] = "Revived Lazarus",
    [PlayerType.PLAYER_LILITH] = "Lilith",
    [PlayerType.PLAYER_MAGDALENA] = "Magdalene",
    [PlayerType.PLAYER_SAMSON] = "Samson",
    [PlayerType.PLAYER_THELOST] = "The Lost",
    [PlayerType.PLAYER_XXX] = "Blue Baby",
    [PlayerType.PLAYER_THEFORGOTTEN] = "The Forgotten",
    [PlayerType.PLAYER_THESOUL] = "The Soul"
}

for name, playerData in pairs(PlayersByName) do
    if name ~= "RANDOM" then
        local portraitPathBase = playerData.BossPortrait or playerData.SelectionGfx or playerData.FetusSprite
        local namePathBase = playerData.BossName or playerData.SelectionGfx or playerData.FetusSprite

        if portraitPathBase then
            playerData.BossPortrait = "gfx/ui/boss/playerportrait_" .. portraitPathBase .. ".png"
        end

        if namePathBase then
            playerData.BossName =  "gfx/ui/boss/playername_" .. namePathBase .. ".png"
        end

        local ghostPortraitPathBase = playerData.GhostPortrait or playerData.SelectionGfx or playerData.FetusSprite
        local ghostNamePathBase = playerData.GhostName or playerData.SelectionGfx or playerData.FetusSprite

        if ghostPortraitPathBase then
            playerData.GhostPortrait = "gfx/truecoop/versusscreen/playerportrait_ghost/" .. ghostPortraitPathBase .. ".png"
        end

        if ghostNamePathBase then
            playerData.GhostName = "gfx/truecoop/versusscreen/playernames_ghost/" .. ghostNamePathBase .. ".png"
        end
    end

    if playerData.SelectionGfx then
        if not playerData.FetusSprite and name ~= "RANDOM" then
            playerData.FetusSprite = playerData.SelectionGfx
        end

        playerData.SelectionGfx = "gfx/truecoop/char_portraits/" .. playerData.SelectionGfx .. ".png"
    end

    if playerData.FetusSprite then
        local sprite = Sprite()
        sprite:Load("gfx/truecoop/player_fetus/" .. playerData.FetusSprite .. ".anm2", true)
        sprite:Play("Idle", true)
        playerData.FetusSprite = sprite
    end

    playerData.Name = name

    if playerData.GhostCostume and playerData.GhostCostume ~= "BASE" then
        playerData.GhostCostume = Isaac.GetCostumeIdByPath("gfx/truecoop/costumes/ghost/ghost_" .. playerData.GhostCostume .. ".anm2")
    end
end

local function TableConcat(...)
    local ret = {}
    local tables = {...}
    for _, tbl in ipairs(tables) do
        for _, v in ipairs(tbl) do
            ret[#ret + 1] = v
        end
    end

    return ret
end

local actionJustCalled = false
local quadriplegicChallenge = Isaac.GetChallengeIdByName("Quadriplegic")
mod:AddCallback(ModCallbacks.MC_INPUT_ACTION, function(_, player, hook, action)
    if player and player:ToPlayer() then
        local data = player:GetData()

        if data.TrueCoop.Save.IsGhost and (action == ButtonAction.ACTION_BOMB or action == ButtonAction.ACTION_DROP or action == ButtonAction.ACTION_ITEM) then
            if hook == InputHook.GET_ACTION_VALUE then
                return 0
            elseif hook == InputHook.IS_ACTION_PRESSED then
                return false
            elseif hook == InputHook.IS_ACTION_TRIGGERED then
                return false
            end
        end

        if (Config.JacobMode == 2 or Isaac.GetChallenge() == quadriplegicChallenge) and not actionJustCalled then
            if data.TrueCoop.PlayerListIndex ~= 1 and not Input.IsActionPressed(ButtonAction.ACTION_DROP, players[1].ControllerIndex) and not data.TrueCoop.DropFrames then
                if hook == InputHook.GET_ACTION_VALUE then
                    return Input.GetActionValue(action, players[1].ControllerIndex)
                elseif hook == InputHook.IS_ACTION_PRESSED then
                    return Input.IsActionPressed(action, players[1].ControllerIndex)
                elseif hook == InputHook.IS_ACTION_TRIGGERED then
                    return Input.IsActionTriggered(action, players[1].ControllerIndex)
                end
            end
        end
    end
end)

local function DropThings(player, dropActives)
    local room = game:GetRoom()

    for i = 1, 2 do
        player:DropTrinket(room:FindFreePickupSpawnPosition(player.Position, 0, true), false)
        player:DropPoketItem(0, room:FindFreePickupSpawnPosition(player.Position, 0, true))
    end

    if dropActives then
        local actives = {}

        local activeOne = player:GetActiveItem()
        if activeOne and activeOne > 0 then
            actives[#actives + 1] = {
                Item = activeOne,
                Charge = player:GetActiveCharge(),
                BatteryCharge = player:GetBatteryCharge()
            }
        end

        if player.SecondaryActiveItem and player.SecondaryActiveItem.Item > 0 then
            actives[#actives + 1] = {
                Item = player.SecondaryActiveItem.Item,
                Charge = player.SecondaryActiveItem.Charge,
                BatteryCharge = player.SecondaryActiveItem.BatteryCharge
            }
        end

        for _, active in ipairs(actives) do
            player:RemoveCollectible(active.Item)
            local item = Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COLLECTIBLE, active.Item, room:FindFreePickupSpawnPosition(player.Position, 0, true), zeroVector, player):ToPickup()
            item.Charge = active.Charge + active.BatteryCharge
        end
    end

    player:AddCacheFlags(CacheFlag.CACHE_ALL)
    player:EvaluateItems()
end

mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, function(_, player)
    local data = player:GetData()
    if Input.IsActionPressed(ButtonAction.ACTION_DROP, player.ControllerIndex) then
        data.TrueCoop.DropFrames = data.TrueCoop.DropFrames or 0
        data.TrueCoop.DropFrames = data.TrueCoop.DropFrames + 1
    elseif data.TrueCoop.DropFrames then
        data.TrueCoop.DropFrames = nil
    end

    if data.TrueCoop.DropFrames and data.TrueCoop.DropFrames >= Config.TrinketDropTime then
        DropThings(player)
        data.TrueCoop.DropFrames = nil
    end
end)

local ItemFamiliarMap = {
    [CollectibleType.COLLECTIBLE_HALO_OF_FLIES] = {Variant = FamiliarVariant.FLY_ORBITAL, Count = 1},
    [CollectibleType.COLLECTIBLE_CUBE_OF_MEAT] = "MeatCube",
    [CollectibleType.COLLECTIBLE_BALL_OF_BANDAGES] = "BandageBall",
    [CollectibleType.COLLECTIBLE_LIL_DELIRIUM] = "LilDelirium"
}

for k, v in pairs(CollectibleType) do
    local sub = string.sub(k, 13)
    if FamiliarVariant[sub] then
        ItemFamiliarMap[v] = FamiliarVariant[sub]
    end
end

ItemFamiliarMap[CollectibleType.COLLECTIBLE_DEAD_BIRD] = nil
ItemFamiliarMap[CollectibleType.COLLECTIBLE_INCUBUS] = nil
ItemFamiliarMap[CollectibleType.COLLECTIBLE_SPRINKLER] = nil
ItemFamiliarMap[CollectibleType.COLLECTIBLE_SCISSORS] = nil

for k, v in pairs(ItemFamiliarMap) do
    if type(v) ~= "table" then
        ItemFamiliarMap[k] = {Variant = v, Count = 1}
    end
end

local ExtraFamiliarVariants = {}

local ValidMonsterManualFamiliars = {}

for k, v in pairs(FamiliarVariant) do
    local isin = false
    for k2, v2 in pairs(ItemFamiliarMap) do
        if v2[1] == v then
            isin = true
            break
        end
    end

    if v ~= FamiliarVariant.BLUE_FLY and v ~= FamiliarVariant.BLUE_SPIDER and v ~= FamiliarVariant.FAMILIAR_NULL then
        ValidMonsterManualFamiliars[#ValidMonsterManualFamiliars + 1] = v
    end

    if not isin and v ~= FamiliarVariant.BLUE_FLY and v ~= FamiliarVariant.BLUE_SPIDER and v ~= FamiliarVariant.FAMILIAR_NULL then
        ExtraFamiliarVariants[#ExtraFamiliarVariants + 1] = v
    end
end

local meatPhases = {
    FamiliarVariant.CUBE_OF_MEAT_1,
    FamiliarVariant.CUBE_OF_MEAT_2,
    FamiliarVariant.CUBE_OF_MEAT_3,
    FamiliarVariant.CUBE_OF_MEAT_4
}

local bandagePhases = {
    FamiliarVariant.BALL_OF_BANDAGES_1,
    FamiliarVariant.BALL_OF_BANDAGES_2,
    FamiliarVariant.BALL_OF_BANDAGES_3,
    FamiliarVariant.BALL_OF_BANDAGES_4
}

local deliriumFamiliars = {
    FamiliarVariant.CUBE_OF_MEAT_4,
    FamiliarVariant.INCUBUS,
    FamiliarVariant.BBF,
    FamiliarVariant.ACID_BABY,
    FamiliarVariant.LIL_MONSTRO,
    FamiliarVariant.LIL_BRIMSTONE,
    FamiliarVariant.SERAPHIM,
    FamiliarVariant.ROBO_BABY_2,
    FamiliarVariant.ROTTEN_BABY,
    FamiliarVariant.LITTLE_CHUBBY,
    FamiliarVariant.LITTLE_GISH,
    FamiliarVariant.HEADLESS_BABY,
    FamiliarVariant.DRY_BABY,
    FamiliarVariant.HUSHY,
    FamiliarVariant.BOBS_BRAIN,
    FamiliarVariant.LIL_HAUNT
}

local deliriumSprites = {
    {"sexylegs", "cubeofmeatlevel4"},
    "incubus",
    "bff",
    "acidbaby",
    "lilmonstro",
    "lilbrimstone",
    "seraphim",
    "robobaby20",
    "rottenbaby",
    "littlechubby",
    "littlegish",
    "headlessbaby",
    "drybaby",
    "hushy",
    "bobsbrain",
    "lilhaunt"
}

local nDeliriumSprites = {}
for i, v in ipairs(deliriumSprites) do
    if type(v) ~= "table" then
        v = {v}
    end

    for ind, val in ipairs(v) do
        v[ind] = "gfx/familiar/lil delirium/" .. val .. ".png"
    end

    nDeliriumSprites[deliriumFamiliars[i]] = v
end

deliriumSprites = nDeliriumSprites

mod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, function(_, ent, amount)
    local data = ent:GetData()
    if ent:ToPlayer() then
        data.TrueCoop.TakenDamageInRoom = true
    elseif ent.HitPoints - amount < 0 then
        for _, player in ipairs(players) do
            if player:HasTrinket(TrinketType.TRINKET_EVES_BIRD_FOOT) and random(1, 100) <= 15 then
                data.TrueCoop.EvesBirdFootBirds = data.TrueCoop.EvesBirdFootBirds or 0
                data.TrueCoop.EvesBirdFootBirds = data.TrueCoop.EvesBirdFootBirds + 1
            end
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function()
    for _, player in ipairs(players) do
        local data = player:GetData()
        data.TrueCoop.TakenDamageInRoom = false
        data.TrueCoop.EvesBirdFootBirds = 0
    end
end)

local function AddFamiliar(expectedFamiliars, variant, player, count, accountForBoxOfFriends, lilDelirium, positions, overrideExistingVariant)
    -- expectedFamiliars is assumed to be scoped to player [pind]
    if not expectedFamiliars[variant] or overrideExistingVariant then
        expectedFamiliars[variant] = {Count = 0, Found = 0, Delirium = 0, Positions = {}}
    end

    if accountForBoxOfFriends then
        count = count * (player:GetEffects():GetCollectibleEffectNum(CollectibleType.COLLECTIBLE_BOX_OF_FRIENDS) + 1)
    end

    if lilDelirium then
        expectedFamiliars[variant].Delirium = expectedFamiliars[variant].Delirium + count
    end

    if positions then
        for _, position in ipairs(positions) do
            table.insert(expectedFamiliars[variant].Positions, position)
        end
    end

    expectedFamiliars[variant].Count = expectedFamiliars[variant].Count + count
    return expectedFamiliars
end

mod:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, function()
    local p1data = players[1]:GetData()
    if not p1data.TrueCoop.JustUsedRemoteDetonator then
        p1data.TrueCoop.JustUsedRemoteDetonator = true
        players[1]:UseActiveItem(CollectibleType.COLLECTIBLE_REMOTE_DETONATOR, false, true, true, false)
        p1data.TrueCoop.JustUsedRemoteDetonator = nil
        return true
    end
end, CollectibleType.COLLECTIBLE_REMOTE_DETONATOR)

mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, function(_, player)
    if player:GetData().TrueCoop.CoopPlayer and player:HasCollectible(CollectibleType.COLLECTIBLE_REMOTE_DETONATOR) then
        for _, bomb in ipairs(Isaac.FindByType(EntityType.ENTITY_BOMBDROP, -1, -1, false, false)) do
            if bomb.Variant ~= BombVariant.BOMB_TROLL and bomb.Variant ~= BombVariant.BOMB_SUPERTROLL then
                if bomb:GetSprite():IsFinished("Pulse") then
                    bomb:GetSprite():Play("Pulse", true)
                end

                bomb:ToBomb():SetExplosionCountdown(5)
            end
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, function()
    for _, player in ipairs(players) do
        player:RemoveCollectible(CollectibleType.COLLECTIBLE_MAMA_MEGA)
    end
end, CollectibleType.COLLECTIBLE_MAMA_MEGA)

mod:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, function()
    for _, player in ipairs(players) do
        if player:HasCollectible(CollectibleType.COLLECTIBLE_BROWN_NUGGET) and Input.IsActionTriggered(ButtonAction.ACTION_ITEM, player.ControllerIndex) then
            player:AnimateCollectible(CollectibleType.COLLECTIBLE_BROWN_NUGGET, "UseItem", "PlayerPickup")
            local data = player:GetData()
            data.TrueCoop.BrownNuggetPositions = data.TrueCoop.BrownNuggetPositions or {}
            data.TrueCoop.BrownNuggetUses = data.TrueCoop.BrownNuggetUses or 0
            data.TrueCoop.BrownNuggetPositions[#data.TrueCoop.BrownNuggetPositions + 1] = player.Position
            data.TrueCoop.BrownNuggetUses = data.TrueCoop.BrownNuggetUses + 1
            InfinityTrueCoopInterface.SetExpectedFamiliar("BrownNugget", FamiliarVariant.BROWN_NUGGET_POOTER, player, data.TrueCoop.BrownNuggetUses, false, false, data.TrueCoop.BrownNuggetPositions)
            return true
        end
    end
end, CollectibleType.COLLECTIBLE_BROWN_NUGGET)

mod:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, function()
    for _, player in ipairs(players) do
        if player:HasCollectible(CollectibleType.COLLECTIBLE_SPRINKLER) and Input.IsActionTriggered(ButtonAction.ACTION_ITEM, player.ControllerIndex) then
            player:AnimateCollectible(CollectibleType.COLLECTIBLE_SPRINKLER, "UseItem", "PlayerPickup")
            local data = player:GetData()
            data.TrueCoop.SprinklerPositions = data.TrueCoop.SprinklerPositions or {}
            data.TrueCoop.SprinklerUses = data.TrueCoop.SprinklerUses or 0
            data.TrueCoop.SprinklerPositions[#data.TrueCoop.SprinklerPositions + 1] = player.Position
            data.TrueCoop.SprinklerUses = data.TrueCoop.SprinklerUses + 1
            InfinityTrueCoopInterface.SetExpectedFamiliar("Sprinkler", FamiliarVariant.SPRINKLER, player, data.TrueCoop.SprinklerUses, false, false, data.TrueCoop.SprinklerPositions)
            return true
        end
    end
end, CollectibleType.COLLECTIBLE_SPRINKLER)

mod:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, function()
    for _, player in ipairs(players) do
        if player:HasCollectible(CollectibleType.COLLECTIBLE_SCISSORS) and Input.IsActionTriggered(ButtonAction.ACTION_ITEM, player.ControllerIndex) then
            player:AnimateCollectible(CollectibleType.COLLECTIBLE_SCISSORS, "UseItem", "PlayerPickup")
            local data = player:GetData()
            data.TrueCoop.ScissorPositions = data.TrueCoop.ScissorPositions or {}
            data.TrueCoop.ScissorUses = data.TrueCoop.ScissorUses or 0
            data.TrueCoop.ScissorPositions[#data.TrueCoop.ScissorPositions + 1] = player.Position
            data.TrueCoop.ScissorUses = data.TrueCoop.ScissorUses + 1
            InfinityTrueCoopInterface.SetExpectedFamiliar("Scissor", FamiliarVariant.SCISSORS, player, data.TrueCoop.ScissorUses, false, false, data.TrueCoop.ScissorPositions)
            return true
        end
    end
end, CollectibleType.COLLECTIBLE_SCISSORS)

mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function()
    for _, player in ipairs(players) do
        local data = player:GetData()
        data.TrueCoop.BrownNuggetPositions = {}
        data.TrueCoop.BrownNuggetUses = 0
        InfinityTrueCoopInterface.SetExpectedFamiliar("BrownNugget", FamiliarVariant.BROWN_NUGGET_POOTER, player, data.TrueCoop.BrownNuggetUses, false, false, data.TrueCoop.BrownNuggetPositions)

        data.TrueCoop.SprinklerPositions = {}
        data.TrueCoop.SprinklerUses = 0
        InfinityTrueCoopInterface.SetExpectedFamiliar("Sprinkler", FamiliarVariant.SPRINKLER, player, data.TrueCoop.SprinklerUses, false, false, data.TrueCoop.SprinklerPositions)

        data.TrueCoop.ScissorPositions = {}
        data.TrueCoop.ScissorUses = 0
        InfinityTrueCoopInterface.SetExpectedFamiliar("Scissor", FamiliarVariant.SCISSORS, player, data.TrueCoop.ScissorUses, false, false, data.TrueCoop.ScissorPositions)
    end
end)

mod:AddCallback(ModCallbacks.MC_PRE_USE_ITEM, function()
    for _, player in ipairs(players) do
        if Input.IsActionTriggered(ButtonAction.ACTION_ITEM, player.ControllerIndex) and player:HasCollectible(CollectibleType.COLLECTIBLE_YUM_HEART) then
            player:AddHearts(2)
            player:AnimateCollectible(CollectibleType.COLLECTIBLE_YUM_HEART, "UseItem", "PlayerPickup")
            return true
        end
    end
end, CollectibleType.COLLECTIBLE_YUM_HEART)

mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, function(_, player)
    player:GetData().TrueCoop.JustUsedItem = {}
end)

mod:AddCallback(ModCallbacks.MC_FAMILIAR_UPDATE, function(_, fam)
    if fam.Variant == FamiliarVariant.BUMBO and fam:GetData().TrueCoopPlayerListIndex then
        players[fam:GetData().TrueCoopPlayerListIndex]:GetData().TrueCoop.Save.BumboCoins = fam.Coins
    end
end)

local function ExtraFamiliarChecks(expectedFamiliars)
    for pind, player in ipairs(players) do
        for _, variant in ipairs(ExtraFamiliarVariants) do
            expectedFamiliars = AddFamiliar(expectedFamiliars, variant, player, 0)
        end

        local spiderBabyCount = 0
        if player:HasPlayerForm(PlayerForm.PLAYERFORM_SPIDERBABY) then
            spiderBabyCount = 1
        end

        expectedFamiliars = AddFamiliar(expectedFamiliars, FamiliarVariant.SPIDER_BABY, player, spiderBabyCount, true)

        local deadBirdCount = 0
        if player:GetData().TrueCoop.TakenDamageInRoom then
            deadBirdCount = player:GetCollectibleNum(CollectibleType.COLLECTIBLE_DEAD_BIRD)
        end

        expectedFamiliars = AddFamiliar(expectedFamiliars, FamiliarVariant.DEAD_BIRD, player, deadBirdCount, true)

        local isaacHeadCount = 0
        if player:HasTrinket(TrinketType.TRINKET_ISAACS_HEAD) then
            isaacHeadCount = 1
        end

        expectedFamiliars = AddFamiliar(expectedFamiliars, FamiliarVariant.ISAACS_HEAD, player, isaacHeadCount, true)

        local soulCount = 0
        if player:HasTrinket(TrinketType.TRINKET_SOUL) then
            soulCount = 1
        end

        expectedFamiliars = AddFamiliar(expectedFamiliars, FamiliarVariant.BLUE_BABY_SOUL, player, soulCount, true)

        local birdFootBirds = 0
        if player:GetData().TrueCoop.EvesBirdFootBirds then
            birdFootBirds = player:GetData().TrueCoop.EvesBirdFootBirds
        end

        expectedFamiliars = AddFamiliar(expectedFamiliars, FamiliarVariant.EVES_BIRD_FOOT, player, birdFootBirds, true)

        local bodyCount = player:GetEffects():GetCollectibleEffectNum(CollectibleType.COLLECTIBLE_PINKING_SHEARS)
        expectedFamiliars = AddFamiliar(expectedFamiliars, FamiliarVariant.ISAACS_BODY, player, bodyCount, true)

        local incubusCount = player:GetCollectibleNum(CollectibleType.COLLECTIBLE_INCUBUS) + player:GetEffects():GetCollectibleEffectNum(CollectibleType.COLLECTIBLE_INCUBUS)
        expectedFamiliars = AddFamiliar(expectedFamiliars, FamiliarVariant.INCUBUS, player, incubusCount)

        local darkBum, bumFriend, keyBum = expectedFamiliars[FamiliarVariant.DARK_BUM],
                                           expectedFamiliars[FamiliarVariant.BUM_FRIEND],
                                           expectedFamiliars[FamiliarVariant.KEY_BUM]
        local min = math.min(darkBum.Count, bumFriend.Count, keyBum.Count)
        if min > 0 then
            for i = 1, min do
                darkBum.Count = darkBum.Count - 1
                bumFriend.Count = bumFriend.Count - 1
                keyBum.Count = keyBum.Count - 1
                expectedFamiliars = AddFamiliar(expectedFamiliars, FamiliarVariant.SUPER_BUM, player, 1, true)
            end
        end

        local keyPieceOne, keyPieceTwo = expectedFamiliars[FamiliarVariant.KEY_PIECE_1],
                                         expectedFamiliars[FamiliarVariant.KEY_PIECE_2]
        min = math.min(keyPieceOne.Count, keyPieceTwo.Count)
        if min > 0 then
            for i = 1, min do
                keyPieceOne.Count = keyPieceOne.Count - 1
                keyPieceTwo.Count = keyPieceTwo.Count - 1
                expectedFamiliars = AddFamiliar(expectedFamiliars, FamiliarVariant.KEY_FULL, player, 1, true)
            end
        end
    end

    return expectedFamiliars
end

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, function(_, p, f)
    if f == CacheFlag.CACHE_FAMILIARS then
        local data = p:GetData().TrueCoop
        data.FamiliarCacheEvaluated = true
    end
end)

mod:AddCallback(ModCallbacks.MC_FAMILIAR_INIT, function(_, fam)
    fam:GetData().TrueCoopIgnore = true
end, FamiliarVariant.BONE_ORBITAL)

mod:AddCallback(ModCallbacks.MC_POST_PLAYER_UPDATE, function(_, player)
    local data = player:GetData().TrueCoop
    if data.FamiliarCacheEvaluated then
        for variant, famData in pairs(data.ExtraFamiliarsBuffer) do
            data.ExtraFamiliars[variant] = famData
        end

        data.ExtraFamiliarsBuffer = {}
        data.FamiliarCacheEvaluated = nil
    end

    local ExpectedFamiliars = {}
    for item, familiar in pairs(ItemFamiliarMap) do
        local itemCount = player:GetCollectibleNum(item) + player:GetEffects():GetCollectibleEffectNum(item)

        if familiar.Variant == FamiliarVariant.DEAD_CAT then
            itemCount = math.ceil(itemCount / 9)
        end

        local count = itemCount * familiar.Count
        if type(familiar.Variant) ~= "string" then
            ExpectedFamiliars = AddFamiliar(ExpectedFamiliars, familiar.Variant, player, count)
        elseif familiar.Variant == "MeatCube" then
            for i, variant in ipairs(meatPhases) do
                local ccount = 0
                if variant == FamiliarVariant.CUBE_OF_MEAT_4 then
                    ccount = math.floor(count / 4)
                else
                    if count % 4 == i then
                        ccount = 1
                    end
                end

                ExpectedFamiliars = AddFamiliar(ExpectedFamiliars, variant, player, ccount)
            end
        elseif familiar.Variant == "BandageBall" then
            for i, variant in ipairs(bandagePhases) do
                local ccount = 0
                if variant == FamiliarVariant.BALL_OF_BANDAGES_4 then
                    ccount = math.floor(count / 4)
                else
                    if count % 4 == i then
                        ccount = 1
                    end
                end

                ExpectedFamiliars = AddFamiliar(ExpectedFamiliars, variant, player, ccount)
            end
        elseif familiar.Variant == "LilDelirium" then
            data.DeliriumFamiliars = data.DeliriumFamiliars or {}
            data.DeliriumCooldowns = data.DeliriumCooldowns or {}

            if count > 0 then
                for i = 1, count do
                    data.DeliriumCooldowns[i] = data.DeliriumCooldowns[i] or 0
                    if not data.DeliriumFamiliars[i] or data.DeliriumCooldowns[i] <= 0 then
                        data.DeliriumFamiliars[i] = deliriumFamiliars[random(1, #deliriumFamiliars)]
                        data.DeliriumCooldowns[i] = 300
                    end

                    data.DeliriumCooldowns[i] = data.DeliriumCooldowns[i] - 1
                    ExpectedFamiliars = AddFamiliar(ExpectedFamiliars, data.DeliriumFamiliars[i], player, 1, true, true)
                end
            end
        end
    end

    ExpectedFamiliars = ExtraFamiliarChecks(ExpectedFamiliars)

    for variant, familiarData in pairs(data.ExtraFamiliars) do
        ExpectedFamiliars = AddFamiliar(ExpectedFamiliars, variant, player, familiarData.Count)
    end

    for name, familiarsData in pairs(data.ExtraExtraFamiliars) do
        for variant, familiarData in pairs(familiarsData) do
            ExpectedFamiliars = AddFamiliar(ExpectedFamiliars, variant, player, familiarData.Count, false, false, familiarData.Positions)
        end
    end

    for variant, familiarData in pairs(ExpectedFamiliars) do
        if data.Save.IsGhost then
            familiarData.Count = 0
        end

        local familiars = Isaac.FindByType(EntityType.ENTITY_FAMILIAR, variant, -1, false, false)
        for _, fam in ipairs(familiars) do
            local fdata = fam:GetData()
            if not fdata.TrueCoopIgnore then
                if fdata.TrueCoopPlayerListIndex == data.PlayerListIndex then
                    familiarData.Found = familiarData.Found + 1
                elseif not fdata.TrueCoopPlayerListIndex then
                    fam:Remove()
                end
            end
        end

        if familiarData.Found < familiarData.Count then -- Spawn more familiars
            local numToSpawn = familiarData.Count - familiarData.Found
            for i = 1, numToSpawn do
                local fam = Isaac.Spawn(EntityType.ENTITY_FAMILIAR, variant, 0, player.Position, zeroVector, player):ToFamiliar()
                fam:GetData().TrueCoopPlayerListIndex = data.PlayerListIndex
                fam.Player = player

                if variant == FamiliarVariant.BUMBO and data.Save.BumboCoins then
                    fam:AddCoins(data.Save.BumboCoins)
                end

                if i <= familiarData.Delirium then
                    local spritesheet = deliriumSprites[variant]
                    local sprite = fam:GetSprite()

                    for layer, file in ipairs(spritesheet) do
                        sprite:ReplaceSpritesheet(layer - 1, file)
                    end

                    sprite:LoadGraphics()
                end

                if i <= (#familiarData.Positions - familiarData.Found) then
                    if familiarData.Positions[i - familiarData.Found] then
                        fam.Position = familiarData.Positions[i - familiarData.Found]
                    end
                end
            end
        elseif familiarData.Found > familiarData.Count then -- Remove familiars
            local numToRemove = familiarData.Found - familiarData.Count
            local numRemoved = 0
            for _, fam in ipairs(Isaac.FindByType(EntityType.ENTITY_FAMILIAR, variant, -1, false, false)) do
                local fdata = fam:GetData()
                if not fdata.TrueCoopIgnore and fdata.TrueCoopPlayerListIndex == data.PlayerListIndex then
                    fam:Remove()
                    numRemoved = numRemoved + 1
                end

                if numRemoved >= numToRemove then
                    break
                end
            end
        end
    end
end)

if not previouslyLoaded then
    require("apioverride")
    APIOverride.OverrideClassFunction(EntityPlayer, "CheckFamiliar", function(self, variant, count, rng, calcBoxOfFriends)
        local data = self:GetData().TrueCoop
        data.ExtraFamiliarsBuffer = AddFamiliar(data.ExtraFamiliarsBuffer, variant, self, count, calcBoxOfFriends, nil, nil, true)
    end)

    local oldGetPlayerType = APIOverride.GetCurrentClassFunction(EntityPlayer, "GetPlayerType")
    APIOverride.OverrideClassFunction(EntityPlayer, "GetPlayerType", function(self, noHijack)
        if not noHijack and self:GetData().TrueCoop and self:GetData().TrueCoop.Save and self:GetData().TrueCoop.Save.PlayerName then
            local name = self:GetData().TrueCoop.Save.PlayerName

            if PlayersByName[name] and PlayersByName[name].AllowHijacking and PlayersByName[name].ActualType then
                return PlayersByName[name].ActualType
            end
        end

        return oldGetPlayerType(self)
    end)

    local oldGetName = APIOverride.GetCurrentClassFunction(EntityPlayer, "GetName")
    APIOverride.OverrideClassFunction(EntityPlayer, "GetName", function(self)
        if self:GetData().TrueCoop and self:GetData().TrueCoop.Save and self:GetData().TrueCoop.Save.PlayerName then
            local name = self:GetData().TrueCoop.Save.PlayerName
            if PlayersByName[name] and PlayersByName[name].AllowHijacking then
                return name
            end
        end

        return oldGetName(self)
    end)
end

local charSelect = Isaac.GetCostumeIdByPath("gfx/truecoop/costumes/charselect/charselect.anm2")

local sharedItems = {
    CollectibleType.COLLECTIBLE_POLAROID,
    CollectibleType.COLLECTIBLE_NEGATIVE,
    CollectibleType.COLLECTIBLE_DEATH_LIST,

}

local moveToPlayerOne = {
    CollectibleType.COLLECTIBLE_STEAM_SALE,
    CollectibleType.COLLECTIBLE_RESTOCK,
    CollectibleType.COLLECTIBLE_HUMBLEING_BUNDLE,
    CollectibleType.COLLECTIBLE_BOGO_BOMBS,
    CollectibleType.COLLECTIBLE_SACK_HEAD,
    CollectibleType.COLLECTIBLE_THERES_OPTIONS,
    CollectibleType.COLLECTIBLE_MORE_OPTIONS,
    CollectibleType.COLLECTIBLE_CHAOS,
    CollectibleType.COLLECTIBLE_PAY_TO_PLAY,
    CollectibleType.COLLECTIBLE_KEY_PIECE_1,
    CollectibleType.COLLECTIBLE_KEY_PIECE_2,
    CollectibleType.COLLECTIBLE_BUM_FRIEND,
    CollectibleType.COLLECTIBLE_DARK_BUM,
    CollectibleType.COLLECTIBLE_KEY_BUM,
    CollectibleType.COLLECTIBLE_EUCHARIST,
    CollectibleType.COLLECTIBLE_GOAT_HEAD
}

local bannedTrinkets = {
    TrinketType.TRINKET_SILVER_DOLLAR,
    TrinketType.TRINKET_BLOODY_CROWN,
    TrinketType.TRINKET_FRAGMENTED_CARD
}

mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, function(_, npc)
    if npc:IsActiveEnemy(false) and npc:IsVulnerableEnemy() and not npc:GetData().TrueCoopHPMultiplied then
        for pind, player in ipairs(players) do
            if pind > 1 then
                npc.MaxHitPoints = npc.MaxHitPoints * 1 + (Config.EnemyHPScaling - 1) * 0.1
                npc.HitPoints = npc.HitPoints * 1 + (Config.EnemyHPScaling - 1) * 0.1
            end
        end
        npc:GetData().TrueCoopHPMultiplied = true
    end
end)

local function GetNearestNonDeadPlayer(position)
    local dist
    local ply
    for _, player in ipairs(players) do
        if not player:GetData().TrueCoop.Save.IsGhost then
            local distance = player.Position:Distance(position)
            if not dist or distance < dist then
                dist = distance
                ply = player
            end
        end
    end

    return ply
end

mod:AddCallback(ModCallbacks.MC_FAMILIAR_UPDATE, function(_, fam)
    if fam.FrameCount < 10 and (fam.Variant == FamiliarVariant.BLUE_FLY or fam.Variant == FamiliarVariant.BLUE_SPIDER) then
        fam.Player = GetNearestNonDeadPlayer(fam.Position)
    end
end)

mod:AddCallback(ModCallbacks.MC_PRE_ENTITY_SPAWN, function(_, etype, variant, subtype, position, velocity, spawner, seed)
    if etype == EntityType.ENTITY_PICKUP then
        local hasStarterDeck, hasBaggy = false, false
        for _, player in ipairs(players) do
            if player:HasCollectible(CollectibleType.COLLECTIBLE_STARTER_DECK) then
                hasStarterDeck = true
            end

            if player:HasCollectible(CollectibleType.COLLECTIBLE_LITTLE_BAGGY) then
                hasBaggy = true
            end
        end

        if hasBaggy and not hasStarterDeck then
            if variant == PickupVariant.PICKUP_TAROTCARD then
                local pill = itemPool:GetPill(seed)
                return {EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_PILL, pill, seed}
            end
        elseif hasStarterDeck and not hasBaggy then
            if variant == PickupVariant.PICKUP_PILL then
                local card = itemPool:GetCard(seed, true, true, false)
                return {EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TAROTCARD, card, seed}
            end
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, function(_, player)
    local data = player:GetData()

    for slot = 0, 7 do
        local door = game:GetRoom():GetDoor(slot)
        if door then
            if data.TrueCoop.Save.IsGhost then
                if player.Position:Distance(door.Position) < 24 then
                    local away = (player.Position - door.Position):Normalized()
                    player.Velocity = away * 4
                end
            end

            if data.TrueCoop.CoopPlayer then
                if door:IsOpen() and player.Position:Distance(door.Position) < 18 then
                    if door.Sprite:GetFilename() == "gfx/grid/Door_04_SelfSacrificeRoomDoor.anm2" then
                        if door.CurrentRoomType == RoomType.ROOM_CURSE then
                            player:TakeDamage(1, DamageFlag.DAMAGE_CURSED_DOOR, EntityRef(player), 15)
                        elseif not player.CanFly then
                            player:TakeDamage(1, DamageFlag.DAMAGE_CURSED_DOOR, EntityRef(player), 15)
                        end
                    end

                    game:GetLevel().LeaveDoor = slot
                    game:GetLevel().EnterDoor = (slot + 2) % 4
                    game:StartRoomTransition(door.TargetRoomIndex, door.Direction, 0)
                elseif not door:IsOpen() and player.Position:Distance(door.Position) < 32 and game:GetRoom():IsClear() then
                    local isArcade = door:IsTargetRoomArcade()
                    if (isArcade or players[1]:HasCollectible(CollectibleType.COLLECTIBLE_PAY_TO_PLAY)) and player:GetNumCoins() > 0 then
                        door:TryUnlock(false)
                    elseif not isArcade and (player:GetNumKeys() > 0 or player:HasGoldenKey()) then
                        door:TryUnlock(false)
                    end
                end
            end
        end
    end

    if not data.TrueCoop.JustCalledUpdate then
        if data.TrueCoop.ShouldEvaluate then
            player:AddCacheFlags(CacheFlag.CACHE_ALL)
            player:EvaluateItems()
            data.TrueCoop.ShouldEvaluate = false
        end

        for _, item in ipairs(sharedItems) do
            if player:HasCollectible(item) then
                for _, p in ipairs(players) do
                    if not p:HasCollectible(item) then
                        p:AddCollectible(item, 999, false)
                    end
                end
            end
        end

        if data.TrueCoop.CoopPlayer then
            local pind = data.TrueCoop.PlayerListIndex

            for _, item in ipairs(moveToPlayerOne) do
                if player:HasCollectible(item) then
                    players[1]:AddCollectible(item, 0, false)
                    player:RemoveCollectible(item)
                end
            end

            if data.TrueCoop.JustSpawned then
                local stolenMax, stolenHearts, stolenSoul, stolenBone = player:GetMaxHearts(), player:GetHearts(), player:GetSoulHearts(), player:GetBoneHearts()
                local numBlack = 0
                for i = 1, 24 do
                    if player:IsBlackHeart(i) and not (i > stolenSoul + stolenBone * 2 + 1) then
                        if i > stolenSoul + stolenBone * 2 then
                            numBlack = numBlack + 1
                        else
                            numBlack = numBlack + 2
                        end
                    end
                end

                local oriPlayer = players[1]

                oriPlayer:AddMaxHearts(stolenMax)
                oriPlayer:AddSoulHearts(stolenSoul)
                oriPlayer:AddBlackHearts(numBlack)
                oriPlayer:AddBoneHearts(stolenBone)
                oriPlayer:AddHearts(stolenHearts)

                player:AddMaxHearts(-stolenMax)
                player:AddSoulHearts(-stolenSoul)
                player:AddBoneHearts(-stolenBone)

                RemoveAllItems(player)

                if SaveData.PlayerInventories and SaveData.PlayerInventories[tostring(pind)] then
                    local inv = SaveData.PlayerInventories[tostring(pind)]

                    local counter = 0
                    while player:GetPlayerType() ~= inv.PlayerType and counter < 100 do
                        player:UseActiveItem(CollectibleType.COLLECTIBLE_CLICKER, false, true, true, true)
                        counter = counter + 1
                    end

                    LoadInventory(player, inv)

                    data.TrueCoop.Save = inv.TrueCoopData

                    if data.TrueCoop.Save.SelectingCharacter then
                        player:StopExtraAnimation()
                        player:AddNullCostume(charSelect)
                        player.ControlsEnabled = false
                        data.TrueCoop.CharacterSelectionStart = true
                    end

                    if data.TrueCoop.Save.IsGhost then
                        player:AddNullCostume(defaultGhost)
                        if data.TrueCoop.Save.PlayerName and PlayersByName[data.TrueCoop.Save.PlayerName] then
                            local costume = PlayersByName[data.TrueCoop.Save.PlayerName].GhostCostume
                            if costume then
                                player:AddNullCostume(costume)
                                data.TrueCoop.GhostCostume = costume
                            end
                        end

                        player:AddCacheFlags(CacheFlag.CACHE_ALL)
                        player:EvaluateItems()
                        player.FireDelay = 100000
                    end

                    data.TrueCoop.JustCalledUpdate = true
                    player:Update()
                    data.TrueCoop.JustCalledUpdate = false

                    player:AddMaxHearts(-player:GetMaxHearts())
                    player:AddSoulHearts(-player:GetSoulHearts())

                    for i = 1, inv.MaxHearts + inv.SoulHearts do
                        if i <= inv.MaxHearts then
                            player:AddMaxHearts(1)
                        else
                            if inv.BlackHearts[i] then
                                player:AddBlackHearts(1)
                            else
                                player:AddSoulHearts(1)
                            end
                        end
                    end

                    player:AddHearts(inv.Hearts)
                else
                    player:StopExtraAnimation()
                    player:AddNullCostume(charSelect)
                    player.ControlsEnabled = false
                    player:AddSoulHearts(1)
                    data.TrueCoop.CharacterSelectionStart = true
                end

                data.TrueCoop.JustSpawned = nil

                for _, pickup in ipairs(Isaac.FindByType(EntityType.ENTITY_PICKUP, -1, -1, false, false)) do
                    if not pickup:ToPickup():IsShopItem() and pickup.FrameCount <= 1 then
                        pickup:Remove()
                    end
                end
            end
        elseif data.TrueCoop.JustSpawned then -- Original Player just spawned
            local pind = data.TrueCoop.PlayerListIndex

            if SaveData.PlayerInventories and SaveData.PlayerInventories[tostring(pind)] then
                local inv = SaveData.PlayerInventories[tostring(pind)]
                player:AddMaxHearts(-player:GetMaxHearts())
                player:AddSoulHearts(-player:GetSoulHearts())

                for i = 1, inv.MaxHearts + inv.SoulHearts do
                    if i <= inv.MaxHearts then
                        player:AddMaxHearts(1)
                    else
                        if inv.BlackHearts[i + 1] then
                            player:AddBlackHearts(1)
                        else
                            player:AddSoulHearts(1)
                        end
                    end
                end

                player:AddHearts(inv.Hearts)
            end

            data.TrueCoop.JustSpawned = nil
        end

        if not data.TrueCoop.Save.SelectingCharacter then
            if not data.TrueCoop.Save.PlayerType then
                data.TrueCoop.Save.PlayerType = player:GetPlayerType(true)
            elseif player:GetPlayerType(true) ~= data.TrueCoop.Save.PlayerType then
                local newType = player:GetPlayerType(true)
                data.TrueCoop.Save.PlayerType = newType
                if PlayersByName[data.TrueCoop.Save.PlayerName].OnChangeCharacter then
                    PlayersByName[data.TrueCoop.Save.PlayerName].OnChangeCharacter(player)
                end

                data.TrueCoop.Save.PlayerName = PlayerTypeToName[newType]
            end

            if not data.TrueCoop.Save.PlayerName then
                data.TrueCoop.Save.PlayerName = PlayerTypeToName[player:GetPlayerType(true)]
            end
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, function(_, player)
    local data = player:GetData()
    if data.TrueCoop.CoopPlayer then
        local room = game:GetRoom()
        local roomType = room:GetType()
        if roomType == RoomType.ROOM_DICE then
            local ogPosition = players[1].Position
            players[1].Position = player.Position
            players[1]:Update()
            local dice = Isaac.FindByType(EntityType.ENTITY_EFFECT, EffectVariant.DICE_FLOOR, -1, false, false)
            for _, d in ipairs(dice) do
                d:Update()
            end
            players[1]:Update()
            players[1].Position = ogPosition
        end

        if (roomType == RoomType.ROOM_DUNGEON or roomType == RoomType.ROOM_BLACK_MARKET) and not room:IsPositionInRoom(player.Position, 0) then
            players[1].Position = player.Position
        end

        local grid = room:GetGridEntityFromPos(player.Position)
        if grid and grid.Desc.Type == GridEntityType.GRID_STAIRS and grid.State == 1 then
            players[1].Position = player.Position
        end
    end

    if player:HasCollectible(CollectibleType.COLLECTIBLE_BLACK_CANDLE) then
        game:GetLevel():RemoveCurses()
    end

    if not data.TrueCoop.Save.IsGhost and (player:HasCollectible(CollectibleType.COLLECTIBLE_LEO) or player:HasCollectible(CollectibleType.COLLECTIBLE_THUNDER_THIGHS) or player:GetEffects():HasCollectibleEffect(CollectibleType.COLLECTIBLE_THE_NAIL) or player.SpriteScale:Length() > 2.5) then
        for i = 0, game:GetRoom():GetGridSize() do
            local grid = game:GetRoom():GetGridEntity(i)
            if grid then
                local gridType = grid.Desc.Type
                if (gridType == GridEntityType.GRID_ROCK or gridType == GridEntityType.GRID_ROCK_ALT or gridType == GridEntityType.GRID_ROCK_BOMB or gridType == GridEntityType.GRID_ROCK_SS or gridType == GridEntityType.GRID_ROCKT or gridType == GridEntityType.GRID_POOP or gridType == GridEntityType.GRID_SPIDERWEB) and grid.Position:Distance(player.Position) < player.Size + 25 then
                    grid:Destroy()
                end
            end
        end
    end

    if player:HasTrinket(TrinketType.TRINKET_BROKEN_MAGNET) then
        for _, coin in ipairs(Isaac.FindByType(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_COIN, -1, false, false)) do
            if coin.SubType ~= CoinSubType.COIN_STICKYNICKEL then
                coin.Velocity = (player.Position - coin.Position):Resized(1)
            end
        end
    end

    if player:HasCollectible(CollectibleType.COLLECTIBLE_MAGNETO) then
        for _, pickup in ipairs(Isaac.FindByType(EntityType.ENTITY_PICKUP, -1, -1, false, false)) do
            if pickup.Variant == PickupVariant.PICKUP_BOMB or (pickup.Variant == PickupVariant.PICKUP_COIN and pickup.SubType ~= CoinSubType.COIN_STICKYNICKEL) or pickup.Variant == PickupVariant.PICKUP_KEY then
                pickup.Velocity = (player.Position - pickup.Position):Resized(1)
            end
        end
    end

    if player:HasTrinket(TrinketType.TRINKET_STORE_KEY) then
        local room = game:GetRoom()
        for i = 0, 7 do
            local door = room:GetDoor(i)
            if door and door.TargetRoomType == RoomType.ROOM_SHOP then
                door:SetLocked(false)
            end
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_POST_CURSE_EVAL, function(_, curses)
    for _, player in ipairs(players) do
        if player:HasCollectible(CollectibleType.COLLECTIBLE_BLACK_CANDLE) then
            return 0
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, function(_, ply)
    local data = ply:GetData()
    if data.TrueCoop.SteppedOnPlate then
        if data.TrueCoop.ActualStepping then
            data.TrueCoop.ActualStepping:TakeDamage(1, 0, EntityRef(ply), 30)
        end

        return false
    end
end, EntityType.ENTITY_PLAYER)

local function lerp(a, b, t)
    return a:__mul(1 - t) + b:__mul(t)
end

mod:AddCallback(ModCallbacks.MC_POST_PEFFECT_UPDATE, function(_, player)
    local data, sprite = player:GetData(), player:GetSprite()

    if data.TrueCoop.PressurePlateCooldown then
        data.TrueCoop.PressurePlateCooldown = data.TrueCoop.PressurePlateCooldown - 1
    end

    if data.TrueCoop.CoopPlayer and not data.TrueCoop.Save.IsGhost then
        local room = game:GetRoom()
        for i = 1, room:GetGridSize() do
            local grid = room:GetGridEntity(i)
            if grid then
                local dist = grid.Position:Distance(player.Position)
                if dist < player.Size + 24 then
                    if grid:ToPressurePlate() and grid.State == 0 and dist < player.Size + 12 then
                        if not data.TrueCoop.PressurePlateCooldown or data.TrueCoop.PressurePlateCooldown < 1 then
                            local oldPos = players[1].Position
                            local p1data = players[1]:GetData()
                            p1data.TrueCoop.SteppedOnPlate = true
                            p1data.TrueCoop.ActualStepping = player
                            players[1].Position = player.Position
                            grid:Update()
                            players[1].Position = oldPos
                            p1data.TrueCoop.SteppedOnPlate = false
                            data.TrueCoop.PressurePlateCooldown = 30
                        end
                    elseif grid.Desc.Type == GridEntityType.GRID_TRAPDOOR and not sprite:IsPlaying("Trapdoor") and not data.TrueCoop.EnteringTrapdoor and not data.TrueCoop.GoingToNewFloor and grid.State == 1 then
                        for _, p in ipairs(players) do
                            local pdata = p:GetData()
                            if pdata.TrueCoop.CoopPlayer then
                                p:SetTargetTrapDoor(grid)
                                p:AnimateTrapdoor()
                                pdata.TrueCoop.EnteringTrapdoor = true
                                pdata.TrueCoop.Trapdoor = grid
                                p.ControlsEnabled = false
                            end
                        end
                    elseif grid.Desc.Type == GridEntityType.GRID_SPIDERWEB and not player:IsFlying() then
                        player:MultiplyFriction(0.85)
                        if player.FrameCount % 5 < 2 then
                            player:SetColor(Config.WebColor, 1, 1, true, true)
                        end
                    elseif grid.Desc.Type == GridEntityType.GRID_LOCK then
                        local oldPos = players[1].Position
                        players[1].Position = player.Position
                        grid:Update()
                        players[1].Position = oldPos
                    end
                end
            end
        end

        for _, ent in ipairs(Isaac.FindByType(EntityType.ENTITY_EFFECT, EffectVariant.HEAVEN_LIGHT_DOOR, -1, false, false)) do
            if DoEntitiesCollide(ent, player) and not data.TrueCoop.Ascending then
                for _, p in ipairs(players) do
                    local pdata = p:GetData()
                    if pdata.TrueCoop.CoopPlayer and pdata.TrueCoop.PlayerListIndex ~= data.TrueCoop.PlayerListIndex then
                        pdata.TrueCoop.Ascending = true
                        pdata.TrueCoop.AscentFrames = 0
                        pdata.TrueCoop.MoveTo = ent.Position
                        p.ControlsEnabled = false
                        p:PlayExtraAnimation("Jump")
                    end
                end

                player:AnimateLightTravel()
                data.TrueCoop.MoveTo = ent.Position
                data.TrueCoop.Ascending = true
                data.TrueCoop.FloatingUp = true
                player.ControlsEnabled = false
            end
        end

        if data.TrueCoop.EnteringTrapdoor and not sprite:IsPlaying("Trapdoor") then
            player.Visible = false
            local p1data = players[1]:GetData()
            p1data.TrueCoop.Trapdoor = data.TrueCoop.Trapdoor
            p1data.TrueCoop.P1MovingToTrapdoor = true
            p1data.TrueCoop.TrapdoorJumpFrames = 0
            players[1].ControlsEnabled = false
            players[1]:PlayExtraAnimation("Jump")
            data.TrueCoop.EnteringTrapdoor = false
            data.TrueCoop.GoingToNewFloor = true
        end

        if data.TrueCoop.EnteringChest and data.TrueCoop.ChestEntering then
            local chestSprite = data.TrueCoop.ChestEntering:GetSprite()
            if chestSprite:IsPlaying("Open") and chestSprite:GetFrame() > 20 then
                player.Position = data.TrueCoop.ChestEntering.Position + Config.BigChestJumpOffset
                player:AnimateTrapdoor()
                data.TrueCoop.ChestEntering = nil
            end
        elseif data.TrueCoop.EnteringChest and not sprite:IsPlaying("Trapdoor") then
            player.Visible = false
            data.TrueCoop.GoingToNewFloor = true
            data.TrueCoop.EnteringChest = nil
        end
    end

    if data.TrueCoop.P1MovingToTrapdoor then
        local nextPos = lerp(player.Position, data.TrueCoop.Trapdoor.Position, data.TrueCoop.TrapdoorJumpFrames / 20)
        player.Velocity = (nextPos - player.Position) / 2
        data.TrueCoop.TrapdoorJumpFrames = data.TrueCoop.TrapdoorJumpFrames + 1
        if data.TrueCoop.TrapdoorJumpFrames >= 20 then
            data.TrueCoop.TrapdoorJumpFrames = nil
            data.TrueCoop.P1MovingToTrapdoor = nil
        end
    end

    if data.TrueCoop.Ascending and data.TrueCoop.AscentFrames then
        local nextPos = lerp(player.Position, data.TrueCoop.MoveTo, data.TrueCoop.AscentFrames / 20)
        player.Velocity = (nextPos - player.Position) / 2
        data.TrueCoop.AscentFrames = data.TrueCoop.AscentFrames + 1
        if data.TrueCoop.AscentFrames >= 20 then
            data.TrueCoop.AscentFrames = nil
            if not data.TrueCoop.CoopPlayer then
                data.TrueCoop.Ascending = nil
            end
        end
    elseif data.TrueCoop.Ascending and not data.TrueCoop.FloatingUp then
        player:AnimateLightTravel()
        data.TrueCoop.FloatingUp = true
    elseif data.TrueCoop.Ascending and not sprite:IsPlaying("LightTravel") then
        local p = players[1]
        local p1data = p:GetData()
        p1data.TrueCoop.Ascending = true
        p1data.TrueCoop.AscentFrames = 0
        p1data.TrueCoop.MoveTo = data.TrueCoop.MoveTo
        p.ControlsEnabled = false
        p:PlayExtraAnimation("Jump")

        player.Visible = false
        data.TrueCoop.GoingToNewFloor = true
        data.TrueCoop.FloatingUp = nil
        data.TrueCoop.Ascending = nil
    end
end)

mod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, function(_, ent, amount, flags, source, cooldown)
    if source.Entity then
        local e
        if source.Entity.SpawnerEntity then
            e = source.Entity.SpawnerEntity
        elseif source.Entity.Parent then
            e = source.Entity.Parent
        end

        if e then
            local data = e:GetData()
            if data.TrueCoop and data.TrueCoop.PlayerListIndex then
                local player = players[data.TrueCoop.PlayerListIndex]
                if player:HasPlayerForm(PlayerForm.PLAYERFORM_GUPPY) then
                    player:AddBlueFlies(1, player.Position, ent)
                end

                if data.TrueCoop.CoopPlayer and player:HasCollectible(CollectibleType.COLLECTIBLE_INFESTATION_2) and ent.HitPoints - amount < 0 then
                    for i = 1, 2 do
                        player:AddBlueSpider(ent.Position)
                    end
                end
            end
        end
    end
end)

local gridData = {}

mod:AddCallback(ModCallbacks.MC_POST_UPDATE, function()
    local room = game:GetRoom()
    for i = 1, room:GetGridSize() do
        local grid = room:GetGridEntity(i)
        if grid and grid:ToPit() then
            local pit = grid:ToPit()
            if not gridData[i] then
                gridData[i] = {}
            end

            if pit.HasLadder then
                gridData[i].HadLadderLastFrame = true
            elseif gridData[i].HadLadderLastFrame then
                local maintainLadder = false
                for _, player in ipairs(players) do
                    if not player:IsFlying() and pit.Position:Distance(player.Position) < player.Size + 24 then
                        maintainLadder = true
                    end
                end

                if maintainLadder then
                    gridData[i].MaintainingLadder = true
                    gridData[i].LadderEffect = Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.LADDER, 0, pit.Position, zeroVector, nil)
                    pit:SetLadder(true)
                end
            end

            if gridData[i].MaintainingLadder then
                local maintainLadder = false
                for _, player in ipairs(players) do
                    if not player:IsFlying() and pit.Position:Distance(player.Position) < player.Size + 24 then
                        maintainLadder = true
                    end
                end

                if not maintainLadder then
                    gridData[i].MaintainingLadder = nil
                    gridData[i].LadderEffect:Remove()
                    gridData[i].LadderEffect = nil
                    gridData[i].HadLadderLastFrame = false
                    pit:SetLadder(false)
                end
            end
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function()
    gridData = {}
    for _, player in ipairs(players) do
        local data = player:GetData()

        if data.TrueCoop.EnteringTrapdoor or data.TrueCoop.EnteringChest or data.TrueCoop.Ascending then
            data.TrueCoop.ChestEntering = nil
            data.TrueCoop.Trapdoor = nil
            data.TrueCoop.MoveTo = nil
            data.TrueCoop.EnteringTrapdoor = nil
            data.TrueCoop.Ascending = nil
            data.TrueCoop.EnteringChest = nil
            data.TrueCoop.P1MovingToTrapdoor = nil
            data.TrueCoop.FloatingUp = nil
            data.TrueCoop.TrapdoorJumpFrames = nil
            data.TrueCoop.AscentFrames = nil
            player.Visible = true
            player.ControlsEnabled = true
        end

        if data.TrueCoop.GoingToNewFloor then
            player.ControlsEnabled = true
            player.Visible = true
            player:AnimateAppear()
            data.TrueCoop.GoingToNewFloor = false
        end
    end
end)

local consumables = {
    keys = nil,
    bombs = nil,
    coins = nil
}

mod:AddCallback(ModCallbacks.MC_POST_UPDATE, function()
    local prevConsumables = {
        keys = consumables.keys,
        bombs = consumables.bombs,
        coins = consumables.coins
    }

    local hasGoldenKey, hasGoldenBomb
    for i, player in ipairs(players) do
        if player:HasGoldenKey() then
            hasGoldenKey = true
        end

        if player:HasGoldenBomb() then
            hasGoldenBomb = true
        end

        local coins, bombs, keys = player:GetNumCoins(), player:GetNumBombs(), player:GetNumKeys()
        if coins ~= prevConsumables.coins then
            if prevConsumables.coins then
                consumables.coins = consumables.coins + (coins - prevConsumables.coins)
            else
                consumables.coins = coins
            end
        end

        if bombs ~= prevConsumables.bombs then
            if prevConsumables.bombs then
                consumables.bombs = consumables.bombs + (bombs - prevConsumables.bombs)
            else
                consumables.bombs = bombs
            end
        end

        if keys ~= prevConsumables.keys then
            if prevConsumables.keys then
                consumables.keys = consumables.keys + (keys - prevConsumables.keys)
            else
                consumables.keys = keys
            end
        end
    end

    for i, player in ipairs(players) do
        if hasGoldenKey and not player:HasGoldenKey() then
            player:AddGoldenKey()
        end

        if hasGoldenBomb and not player:HasGoldenBomb() then
            player:AddGoldenBomb()
        end

        local coins, bombs, keys = player:GetNumCoins(), player:GetNumBombs(), player:GetNumKeys()
        if coins ~= consumables.coins then
            player:AddCoins(consumables.coins - coins)
        end

        if bombs ~= consumables.bombs then
            player:AddBombs(consumables.bombs - bombs)
        end

        if keys ~= consumables.keys then
            player:AddKeys(consumables.keys - keys)
        end
    end
end)

local defaultColor = Color(1, 1, 1, 1, 0, 0, 0)
local fadedColor = Color(1, 1, 1, 0.5, 0, 0, 0)
local invisibleColor = Color(1, 1, 1, 0, 0, 0, 0)

local defaultChargeColor = Color(1, 1, 1, 1, 0, 0, 0)
local fadedChargeColor = Color(1, 1, 1, 0.5, 0, 0, 0)
local defaultBatteryColor = Color(1, 1, 1, 1, 255, 0, 0)
local fadedBatteryColor = Color(1, 1, 1, 0.5, 255, 0, 0)

local overlays = {
    [1] = "BarOverlay1",
    [2] = "BarOverlay2",
    [3] = "BarOverlay3",
    [4] = "BarOverlay4",
    [6] = "BarOverlay6",
    [12] = "BarOverlay12"
}

local chargeBars = Sprite()
chargeBars:Load("gfx/ui/ui_chargebar.anm2", true)

local function RenderChargeBar(position, maxCharges, charge, batteryCharge, faded)
    if maxCharges and maxCharges > 0 then
        if faded then
            chargeBars.Color = fadedChargeColor
        else
            chargeBars.Color = defaultChargeColor
        end

        chargeBars:Play("BarEmpty", true)
        chargeBars:Render(position, zeroVector, zeroVector)

        chargeBars:Play("BarFull", true)
        local clamp = 27 - (charge / maxCharges * 27)
        chargeBars:Render(position, Vector(0, clamp), zeroVector)

        if batteryCharge and batteryCharge > 0 then
            if faded then
                chargeBars.Color = fadedBatteryColor
            else
                chargeBars.Color = defaultBatteryColor
            end

            local clamp2 = 27 - (batteryCharge / maxCharges * 27)
            chargeBars:Render(position, Vector(0, clamp2), zeroVector)
        end

        if faded then
            chargeBars.Color = fadedChargeColor
        else
            chargeBars.Color = defaultChargeColor
        end

        if overlays[maxCharges] then
            chargeBars:Play(overlays[maxCharges], true)
            chargeBars:Render(position, zeroVector, zeroVector)
        end
    end
end

local pillSprite = Sprite()
pillSprite:Load("gfx/ui/ui_cardspills.anm2", true)

local moddedCardFronts = {}
local moddedCardFrontSprites = {}

local pillsCardsColor = Sprite()
pillsCardsColor:Load("gfx/truecoop/ui_cardspills_color.anm2", true)

local characterSelectionSprites = {

}

for i = 1, 3 do
    characterSelectionSprites[i] = Sprite()
    characterSelectionSprites[i]:Load("gfx/truecoop/coop_char_select.anm2", true)
end

local pillUiFont = Font()
pillUiFont:Load("font/pftempestasevencondensed.fnt")

local isOddFrame = false

local goldHeart = Sprite()
goldHeart:Load("gfx/truecoop/ui_hearts.anm2", true)
goldHeart:Play("GoldHeartCustom", true)

local function WrappingIndex(tbl, index)
    if index > #tbl then
        return (index % (#tbl + 1)) + 1
    else
        return index
    end
end

local function RenderPlayerHUD(pind, player, tintColor, renderOutlines, renderMain, isMapActive)
    pillsCardsColor.Color = tintColor

    local goldHearts = player:GetGoldenHearts()
    if renderMain and goldHearts > 0 and not (game:GetLevel():GetCurses() & LevelCurse.CURSE_OF_THE_UNKNOWN == LevelCurse.CURSE_OF_THE_UNKNOWN) and false then
        local hudOffset
        if Config.HeartHUDOffsetsBottomLeft[pind] then
            hudOffset = Config.HeartHUDOffsetsBottomLeft[pind] + GetScreenBottomLeft()
        elseif Config.HeartHUDOffsetsBottomRight[pind] then
            hudOffset = Config.HeartHUDOffsetsBottomRight[pind] + GetScreenBottomRight()
        elseif Config.HeartHUDOffsetsTopRight[pind] then
            hudOffset = Config.HeartHUDOffsetsTopRight[pind] + GetScreenTopRight()
        end

        local lastHeart = player:GetMaxHearts() + player:GetSoulHearts() + player:GetBoneHearts() * 2
        if lastHeart % 2 ~= 0 then
            lastHeart = lastHeart + 1
        end

        lastHeart = lastHeart / 2

        local y = math.ceil(lastHeart / 3) - 1
        local x = lastHeart % 3 - 1
        if x == -1 then
            x = 2
        end

        for i = 1, goldHearts do
            if x == -1 then
                x = 2
                y = y - 1
            end

            local render = Vector(x * Config.HeartXSpacing, y * Config.HeartYSpacing)
            goldHeart:Render(hudOffset + render, zeroVector, zeroVector)

            x = x - 1
        end
    end

    local active = player:GetActiveItem()
    if active and active ~= -1 and itemSprites[active] then
        local hudOffset
        if Config.ActiveHUDOffsetsTopLeft[pind] then
            hudOffset = Config.ActiveHUDOffsetsTopLeft[pind] + GetScreenTopLeft()
        elseif Config.ActiveHUDOffsetsBottomLeft[pind] then
            hudOffset = Config.ActiveHUDOffsetsBottomLeft[pind] + GetScreenBottomLeft()
        elseif Config.ActiveHUDOffsetsBottomRight[pind] then
            hudOffset = Config.ActiveHUDOffsetsBottomRight[pind] + GetScreenBottomRight()
        elseif Config.ActiveHUDOffsetsTopRight[pind] then
            hudOffset = Config.ActiveHUDOffsetsTopRight[pind] + GetScreenTopRight()
        end

        local activeSprite = itemSprites[active]
        if activeSprite.Config.MaxCharges < 1 or player:GetActiveCharge() < activeSprite.Config.MaxCharges then
            activeSprite.Sprite:Play("Off", true)
            activeSprite.ColorSprite:Play("Off", true)
        else
            activeSprite.Sprite:Play("On", true)
            activeSprite.ColorSprite:Play("On", true)
        end

        if renderMain then
            RenderChargeBar(hudOffset + Config.ChargeBarOffset, activeSprite.Config.MaxCharges, player:GetActiveCharge(), player:GetBatteryCharge(), false)
        end

        activeSprite.Sprite.Color = defaultColor
        activeSprite.ColorSprite.Color = tintColor

        if renderOutlines then
            if active == CollectibleType.COLLECTIBLE_THE_JAR then
                hudOffset = hudOffset + Config.JarActiveOffset
            elseif active == CollectibleType.COLLECTIBLE_JAR_OF_FLIES then
                hudOffset = hudOffset + Config.JarOfFliesOffset
            end

            activeSprite.ColorSprite:Render(hudOffset, zeroVector, zeroVector)
        end

        if renderMain then
            activeSprite.Sprite:Render(hudOffset, zeroVector, zeroVector)
        end
    end

    if player.SecondaryActiveItem and renderMain then
        local item, charge, batteryCharge = player.SecondaryActiveItem.Item, player.SecondaryActiveItem.Charge, player.SecondaryActiveItem.BatteryCharge

        local hudOffset
        if Config.ActiveHUDOffsetsBottomLeft[pind] then
            hudOffset = Config.ActiveHUDOffsetsBottomLeft[pind] + GetScreenBottomLeft() + Config.SchoolbagOffsets[pind]
        elseif Config.ActiveHUDOffsetsBottomRight[pind] then
            hudOffset = Config.ActiveHUDOffsetsBottomRight[pind] + GetScreenBottomRight() + Config.SchoolbagOffsets[pind]
        elseif Config.ActiveHUDOffsetsTopRight[pind] then
            hudOffset = Config.ActiveHUDOffsetsTopRight[pind] + GetScreenTopRight() + Config.SchoolbagOffsets[pind]
        end

        if item < 1 and player:HasCollectible(CollectibleType.COLLECTIBLE_SCHOOLBAG) then
            item = CollectibleType.COLLECTIBLE_SCHOOLBAG
        end

        local activeSprite = itemSprites[item]
        if item ~= 0 and activeSprite then
            activeSprite.Sprite:Play("Off", true)

            if renderMain then
                RenderChargeBar(hudOffset + Config.ChargeBarOffset, activeSprite.Config.MaxCharges, charge, batteryCharge, true)
            end

            activeSprite.Sprite.Color = fadedColor
            activeSprite.Sprite:Render(hudOffset, zeroVector, zeroVector)
        end
    end

    for i = 0, 1 do
        local trinket = player:GetTrinket(i)
        if trinket and trinket > 0 and trinketConfigList[trinket] then
            local trinketConfig = trinketConfigList[trinket]
            local hudOffset = Config.TrinketHUDOffsets[pind][i + 1] + GetScreenBottomLeft()

            if renderOutlines then
                trinketConfig.ColorSprite.Color = tintColor
                trinketConfig.ColorSprite:Render(hudOffset, zeroVector, zeroVector)
            end

            if renderMain then
                trinketConfig.Sprite:Render(hudOffset, zeroVector, zeroVector)
            end

            if i == 0 and (Config.HUDTextMode == 3 or (Config.HUDTextMode == 2 and isMapActive)) then
                pillUiFont:DrawString("P" .. tostring(pind), hudOffset.X + Config.PlayerIndicatorTrinketOffset.X, hudOffset.Y + Config.PlayerIndicatorTrinketOffset.Y, Config.PlayerFontColors[pind], 0, false)
            end
        end
    end

    local lives = player:GetExtraLives()
    if lives and lives > 0 and renderMain then
        local hudOffset
        if Config.ActiveHUDOffsetsBottomLeft[pind] then
            hudOffset = Config.ActiveHUDOffsetsBottomLeft[pind] + GetScreenBottomLeft()
        elseif Config.ActiveHUDOffsetsBottomRight[pind] then
            hudOffset = Config.ActiveHUDOffsetsBottomRight[pind] + GetScreenBottomRight()
        elseif Config.ActiveHUDOffsetsTopRight[pind] then
            hudOffset = Config.ActiveHUDOffsetsTopRight[pind] + GetScreenTopRight()
        end

        hudOffset = hudOffset + Config.ExtraLifeHUDOffsets[pind]

        local text = "x" .. tostring(lives)
        if player:HasCollectible(CollectibleType.COLLECTIBLE_GUPPYS_COLLAR) then
            text = text .. "?"
        end

        pillUiFont:DrawString(text, hudOffset.X, hudOffset.Y, Config.UIFontColor, 0, false)
    end

    local pill = player:GetPill(0)
    if pill and pill > 0 then
        local hudOffset = Config.PillHUDOffsets[pind] + GetScreenBottomRight() + Config.PillOffset
        local effect = itemPool:GetPillEffect(pill)
        local name = iconfig:GetPillEffect(effect).Name
        local text = name
        if not itemPool:IsPillIdentified(pill) then
            text = "???"
        end

        local strLen = pillUiFont:GetStringWidth(text) * Config.UIFontScale.X
        if (Config.HUDTextMode == 3 or (Config.HUDTextMode == 2 and isMapActive)) then
            pillUiFont:DrawString("P" .. tostring(pind), hudOffset.X + Config.PlayerIndicatorPillOffset.X, hudOffset.Y + Config.PlayerIndicatorPillOffset.Y, Config.PlayerFontColors[pind], 0, false)
        end

        pillsCardsColor:SetFrame("Pills", pill - 1)
        if renderOutlines then
            pillsCardsColor:Render(hudOffset, zeroVector, zeroVector)
        end

        pillSprite:SetFrame("Pills", pill - 1)
        if renderMain then
            pillUiFont:DrawStringScaled(text, (hudOffset.X - strLen) + Config.UIFontOffset.X, hudOffset.Y + Config.UIFontOffset.Y, Config.UIFontScale.X, Config.UIFontScale.Y, Config.UIFontColor, 0, false)
            pillSprite:Render(hudOffset, zeroVector, zeroVector)
        end
    end

    local pillTwo = player:GetPill(1)
    if pillTwo and pillTwo > 0 then
        local hudOffset = Config.PillHUDOffsets[pind] + GetScreenBottomRight()

        pillsCardsColor:SetFrame("PillsSmall", pillTwo - 1)
        if renderOutlines then
            pillsCardsColor:Render(hudOffset + Config.SmallCardPillOffset, zeroVector, zeroVector)
        end

        pillSprite:SetFrame("PillsSmall", pillTwo - 1)
        if renderMain then
            pillSprite:Render(hudOffset + Config.SmallCardPillOffset, zeroVector, zeroVector)
        end
    end

    local card = player:GetCard(0)
    if card and card > 0 then
        local hudOffset = Config.PillHUDOffsets[pind] + GetScreenBottomRight()
        local config = iconfig:GetCard(card)

        local anim, frame
        if card < Card.RUNE_HAGALAZ then
            anim = "CardFronts"
            frame = card - 1
        elseif card >= Card.RUNE_HAGALAZ and card < Card.RUNE_ANSUZ then
            anim = "Runes"
            frame = 0
        elseif card >= Card.RUNE_ANSUZ and card < Card.RUNE_BLACK then
            anim = "Runes"
            frame = 1
        elseif card == Card.RUNE_BLACK then
            anim = "Runes"
            frame = 2
        elseif card > Card.RUNE_BLACK then
            anim = "CardFronts"
            frame = card - 11
        end

        if (Config.HUDTextMode == 3 or (Config.HUDTextMode == 2 and isMapActive)) then
            pillUiFont:DrawString("P" .. tostring(pind), hudOffset.X + Config.PlayerIndicatorPillOffset.X, hudOffset.Y + Config.PlayerIndicatorPillOffset.Y, Config.PlayerFontColors[pind], 0, false)
        end

        if anim == "Runes" then
            hudOffset = hudOffset + Config.PillOffset
        end

        pillsCardsColor:SetFrame(anim, frame)
        if renderOutlines then
            pillsCardsColor:Render(hudOffset, zeroVector, zeroVector)
        end

        local text
        if isMapActive and config.Description then
            text = config.Description
        else
            text = config.Name
        end

        local strLen = pillUiFont:GetStringWidth(text) * Config.UIFontScale.X

        pillSprite:SetFrame(anim, frame)

        if renderMain then
            pillUiFont:DrawStringScaled(text, (hudOffset.X - strLen) + Config.UIFontOffset.X, hudOffset.Y + Config.UIFontOffset.Y, Config.UIFontScale.X, Config.UIFontScale.Y, Config.UIFontColor, 0, false)
            local cardData = moddedCardFronts[card]
            if cardData and cardData.Anm2 and cardData.Anim then
                local cardSprite = moddedCardFrontSprites[cardData.Anm2]
                cardSprite:Play(cardData.Anim, true)
                cardSprite:Render(hudOffset, zeroVector, zeroVector)
            else
                pillSprite:Render(hudOffset, zeroVector, zeroVector)
            end
        end
    end

    local cardTwo = player:GetCard(1)
    if cardTwo and cardTwo > 0 then
        local hudOffset = Config.PillHUDOffsets[pind] + GetScreenBottomRight()
        local anim, frame
        if cardTwo < Card.CARD_CLUBS_2 then
            anim = "CardsSmall"
            frame = 0
        elseif cardTwo >= Card.CARD_CLUBS_2 and cardTwo < Card.RUNE_HAGALAZ then
            anim = "CardsSmall"
            frame = 1
        elseif cardTwo >= Card.RUNE_HAGALAZ and cardTwo < Card.RUNE_ANSUZ then
            anim = "RunesSmall"
            frame = 0
        elseif cardTwo >= Card.RUNE_ANSUZ and cardTwo < Card.RUNE_BLACK then
            anim = "RunesSmall"
            frame = 1
        elseif cardTwo == Card.RUNE_BLACK then
            anim = "RunesSmall"
            frame = 2
        elseif cardTwo > Card.RUNE_BLACK and (cardTwo ~= Card.CARD_DICE_SHARD and cardTwo ~= Card.CARD_EMERGENCY_CONTACT) then
            anim = "CardsSmall"
            frame = 1
        elseif cardTwo == Card.CARD_DICE_SHARD then
            anim = "PickupsSmall"
            frame = 0
        elseif cardTwo == Card.CARD_EMERGENCY_CONTACT then
            anim = "PickupsSmall"
            frame = 1
        end

        pillsCardsColor:SetFrame(anim, frame)
        if renderOutlines then
            pillsCardsColor:Render(hudOffset + Config.SmallCardPillOffset, zeroVector, zeroVector)
        end

        pillSprite:SetFrame(anim, frame)
        if renderMain then
            pillSprite:Render(hudOffset + Config.SmallCardPillOffset, zeroVector, zeroVector)
        end
    end
end

mod:AddCallback(ModCallbacks.MC_POST_RENDER, function()
    isOddFrame = not isOddFrame
    for _, selectSprite in ipairs(characterSelectionSprites) do
        if isOddFrame then
            selectSprite:Update()
        end
    end

    for name, byName in pairs(PlayersByName) do
        if byName.FetusSprite then
            if not byName.FetusSprite:IsPlaying("Idle") then
                byName.FetusSprite:Play("Idle", true)
            end

            if isOddFrame then
                byName.FetusSprite:Update()
            end
        end
    end

    local isMapActive = false
    for _, p in ipairs(players) do
        if Input.IsActionPressed(ButtonAction.ACTION_MAP, p.ControllerIndex) then
            isMapActive = true
        end
    end

    local room = game:GetRoom()
    local shouldRender = not (room:GetType() == RoomType.ROOM_BOSS and room:GetFrameCount() < 1 and not room:IsClear())

    for pind, player in ipairs(players) do
        local data = player:GetData()

        local setPlayerColor, setHUDColor = "DEFAULT", invisibleColor

        if Config.PlayerTintMode == 3 then
            setPlayerColor = Config.PlayerColors[pind]
        end

        if Config.HUDOutlineMode == 3 then
            setHUDColor = Config.PlayerHUDOutlineColors[pind]
        end

        if Config.PlayerColorsByFrame[pind] then
            if isMapActive then
                data.TrueCoop.ColorFrames = data.TrueCoop.ColorFrames or 0
                data.TrueCoop.ColorFrames = math.min(data.TrueCoop.ColorFrames + 1, Config.ColorFadeFrames)

                if Config.PlayerTintMode == 2 then
                    setPlayerColor = Config.PlayerColorsByFrame[pind][data.TrueCoop.ColorFrames]
                end

                if Config.HUDOutlineMode == 2 then
                    setHUDColor = Config.PlayerHUDColorsByFrame[pind][data.TrueCoop.ColorFrames]
                end
            elseif data.TrueCoop.ColorFrames and data.TrueCoop.ColorFrames > 0 then
                if Config.PlayerTintMode == 2 then
                    setPlayerColor = Config.PlayerColorsByFrame[pind][data.TrueCoop.ColorFrames]
                end

                if Config.HUDOutlineMode == 2 then
                    setHUDColor = Config.PlayerHUDColorsByFrame[pind][data.TrueCoop.ColorFrames]
                end

                data.TrueCoop.ColorFrames = data.TrueCoop.ColorFrames - 1
            end
        end

        if setPlayerColor ~= "DEFAULT" and #players > 1 then
            player:SetColor(setPlayerColor, 2, 9999, false, false)
        end

        if (Config.PlayerTextMode == 3 or (Config.PlayerTextMode == 2 and isMapActive)) and #players > 1 then
            local position = Isaac.WorldToScreen(player.Position)
            pillUiFont:DrawString("P" .. tostring(pind), position.X - 5, position.Y, Config.PlayerFontColors[pind], 0, false)
        end

        if shouldRender then
            if data.TrueCoop.CoopPlayer then
                RenderPlayerHUD(pind, player, setHUDColor, true, false, isMapActive)
                RenderPlayerHUD(pind, player, setHUDColor, false, true, isMapActive)
            elseif #players > 1 then
                RenderPlayerHUD(pind, player, setHUDColor, true, false, isMapActive)
            end
        end

        if data.TrueCoop.CoopPlayer then
            if not data.TrueCoop.GoingToNewFloor and not data.TrueCoop.EnteringTrapdoor and not data.TrueCoop.EnteringChest then
                player.Visible = true
            end

            local selectSprite = characterSelectionSprites[pind - 1]
            if data.TrueCoop.CharacterSelectionStart then
                for i = 1, 5 do
                    selectSprite:ReplaceSpritesheet(i + 2, PlayersByName[PlayerSelectOrder[i]].SelectionGfx)
                end

                selectSprite:LoadGraphics()

                selectSprite:Play("Appear_Left", true)
                data.TrueCoop.Save.SelectingCharacter = true
                data.TrueCoop.SelectedCharacter = 1
                data.TrueCoop.CharacterSelectionStart = nil
            end

            if data.TrueCoop.Save.SelectingCharacter or selectSprite:IsPlaying("Disappear_Left") then
                player:MultiplyFriction(0)
                if selectSprite:IsPlaying("Idle") or selectSprite:IsFinished("Idle") then
                    local actionLeft, actionRight = Input.IsActionTriggered(ButtonAction.ACTION_MENULEFT, player.ControllerIndex), Input.IsActionTriggered(ButtonAction.ACTION_MENURIGHT, player.ControllerIndex)
                    if actionLeft or actionRight then
                        local disappear
                        if actionLeft then
                            playSound(SoundEffect.SOUND_CHARACTER_SELECT_LEFT)
                            disappear = data.TrueCoop.SelectedCharacter + 4
                            data.TrueCoop.SelectedCharacter = data.TrueCoop.SelectedCharacter - 1
                            if data.TrueCoop.SelectedCharacter == 0 then
                                data.TrueCoop.SelectedCharacter = #PlayerSelectOrder
                            end

                            selectSprite:Play("Transition_Right", true)
                        else
                            playSound(SoundEffect.SOUND_CHARACTER_SELECT_RIGHT)
                            disappear = data.TrueCoop.SelectedCharacter
                            data.TrueCoop.SelectedCharacter = data.TrueCoop.SelectedCharacter + 1
                            if data.TrueCoop.SelectedCharacter == #PlayerSelectOrder + 1 then
                                data.TrueCoop.SelectedCharacter = 1
                            end

                            selectSprite:Play("Transition_Left", true)
                        end

                        selectSprite:ReplaceSpritesheet(9, PlayersByName[PlayerSelectOrder[WrappingIndex(PlayerSelectOrder, disappear)]].SelectionGfx)
                        for i = 1, 5 do
                            local wrappedIndex = WrappingIndex(PlayerSelectOrder, i - 1 + data.TrueCoop.SelectedCharacter)
                            selectSprite:ReplaceSpritesheet(i + 2, PlayersByName[PlayerSelectOrder[wrappedIndex]].SelectionGfx)
                        end

                        selectSprite:LoadGraphics()
                    end

                    if Input.IsActionTriggered(ButtonAction.ACTION_MENUCONFIRM, player.ControllerIndex) then
                        data.TrueCoop.Save.SelectingCharacter = nil
                        player:TryRemoveNullCostume(charSelect)
                        player.ControlsEnabled = true

                        local playerData = PlayersByName[PlayerSelectOrder[WrappingIndex(PlayerSelectOrder, data.TrueCoop.SelectedCharacter + 2)]]
                        if playerData.Name == "RANDOM" then
                            playerData = PlayersByName[PlayerSelectOrder[random(1, #PlayerSelectOrder)]]
                        end

                        local isCorrectPlayer = false
                        while not isCorrectPlayer do
                            local ptype = playerData.Type
                            local counter = 0
                            while player:GetPlayerType() ~= ptype and counter < 100 do
                                player:UseActiveItem(CollectibleType.COLLECTIBLE_CLICKER, false, true, true, true)
                                RemoveAllItems(player)
                                counter = counter + 1
                            end

                            if player:GetPlayerType() == ptype then
                                isCorrectPlayer = true
                            else
                                playerData = PlayersByName.Isaac
                            end
                        end

                        data.TrueCoop.Save.PlayerType = playerData.Type
                        data.TrueCoop.Save.PlayerName = playerData.Name

                        player:AddBoneHearts(-player:GetBoneHearts())
                        player:AddMaxHearts(-player:GetMaxHearts())
                        player:AddSoulHearts(-player:GetSoulHearts())

                        if playerData.MaxHearts then
                            player:AddMaxHearts(playerData.MaxHearts)
                        end

                        if playerData.Hearts then
                            player:AddHearts(playerData.Hearts)
                        end

                        if playerData.SoulHearts then
                            player:AddSoulHearts(playerData.SoulHearts)
                        end

                        if playerData.BlackHearts then
                            player:AddBlackHearts(playerData.BlackHearts)
                        end

                        if playerData.Coins then
                            player:AddCoins(playerData.Coins)
                        end

                        if playerData.Bombs then
                            player:AddBombs(playerData.Bombs)
                        end

                        if playerData.Keys then
                            player:AddKeys(playerData.Keys)
                        end

                        if playerData.Items then
                            for _, item in ipairs(playerData.Items) do
                                player:AddCollectible(item, 999, true)
                            end
                        end

                        if playerData.Type == PlayerType.PLAYER_EDEN then
                            local numHearts = random(1, 3)
                            for i = 1, numHearts do
                                local isSoul = random(1, 2) == 1
                                if isSoul then
                                    player:AddSoulHearts(2)
                                else
                                    player:AddMaxHearts(2)
                                    player:AddHearts(2)
                                end
                            end

                            local activeItem, passiveItem = activeList[random(1, #activeList)], passiveList[random(1, #passiveList)]
                            player:AddCollectible(activeItem, 999, true)
                            player:AddCollectible(passiveItem, 999, true)

                            local extra = random(1, 3)
                            if extra == 1 then
                                player:AddTrinket(itemPool:GetTrinket())
                            elseif extra == 2 then
                                player:AddPill(itemPool:GetPill(player.InitSeed))
                            else
                                player:AddCard(itemPool:GetCard(player.InitSeed, true, true, false))
                            end
                        end

                        if playerData.Pill then
                            if playerData.PillEffect then
                                local pill = itemPool:ForceAddPillEffect(playerData.PillEffect)
                                player:AddPill(pill)
                            else
                                local pill = itemPool:GetPill(player.InitSeed)
                                player:AddPill(pill)
                            end
                        end

                        if playerData.Card then
                            player:AddCard(playerData.Card)
                        end

                        if playerData.Trinket then
                            player:AddTrinket(playerData.Trinket)
                        end

                        if playerData.OnStart then
                            playerData.OnStart(player, playerData)
                        end

                        selectSprite:Play("Disappear_Left", true)
                    end
                elseif not selectSprite:IsPlaying("Appear_Left") and not selectSprite:IsPlaying("Disappear_Left") and not selectSprite:IsPlaying("Transition_Left") and not selectSprite:IsPlaying("Transition_Right") then
                    selectSprite:Play("Idle", true)
                end

                selectSprite:Render(Isaac.WorldToScreen(player.Position) + Config.CharacterSelectOffset, zeroVector, zeroVector)
            end
        end
    end
end)

local TextStreakScales = {
    [0] = Vector(3,0.2),	[1] = Vector(2.6,0.36),
    [2] = Vector(2.2,0.52),	[3] = Vector(1.8,0.68),
    [4] = Vector(1.4,0.84),	[5] = Vector(0.95,1.05),
    [6] = Vector(0.97,1.03),	[7] = Vector(0.98,1.02),
    [61] = Vector(0.99,1.03),	[62] = Vector(0.98,1.05),
    [63] = Vector(0.96,1.08),	[64] = Vector(0.95,1.1),
    [65] = Vector(1.36,0.92),	[66] = Vector(1.77,0.74),
    [67] = Vector(2.18,0.56),	[68] = Vector(2.59,0.38),
    [69] = Vector(3,0.2)
}

local TextStreakPositions = {
    [0] = -800,	[1] = -639,
    [2] = -450,	[3] = -250,
    [4] = -70,	[5] = 10,
    [6] = 6,	[7] = 3,
    [61] = -5,	[62] = -10,
    [63] = -15,	[64] = -20,
    [65] = 144,	[66] = 308,
    [67] = 472,	[68] = 636,
    [69] =800
}

local streakSprite = Sprite()
streakSprite:Load("gfx/streak/streak.anm2", true)

local StreakSprites = {}
local Streaks = {}

local streakFont = Font()
streakFont:Load("font/upheaval.fnt")
local streakDefaultColor = KColor(1,1,1,1,0,0,0)
local streakDefaultPos = Vector(240, 48)
local oneVector = Vector(1, 1)
local function PlayTextStreak(text, extratext, extratextOffset, extratextScaleMulti)
    local index = #Streaks + 1
    if not StreakSprites[index] then -- this system loads as many sprites as it has to play at once
        StreakSprites[index] = Sprite()
        StreakSprites[index]:Load("gfx/streak/streak.anm2", true)
    end

    StreakSprites[index]:Play("Text", true)

    Streaks[index] = {
        Text = text,
        ExtraText = extratext,
        Color = streakDefaultColor,
        Frame = 0,
        Width = streakFont:GetStringWidth(text) / 2,
        RenderPos = streakDefaultPos,
        FontScale = oneVector,
        ExtraFontScale = extratextScaleMulti,
        ExtraOffset = extratextOffset,
        ExtraWidth = pillUiFont:GetStringWidth(extratext)
    }
end

local function UpdateTextStreak()
    for index, streakPlaying in ipairs(Streaks) do
        local sprite = StreakSprites[index]

        sprite:Update()

        streakPlaying.Frame = sprite:GetFrame()
        if streakPlaying.Frame >= 69 then
            sprite:Stop()
            table.remove(Streaks, index)
        end

        streakPlaying.FontScale = (TextStreakScales[streakPlaying.Frame] or oneVector)
        local screenX = GetScreenCenterPosition().X
        streakPlaying.RenderPos.X = screenX
        streakPlaying.PositionX = (TextStreakPositions[streakPlaying.Frame] or 0) - streakPlaying.Width * streakPlaying.FontScale.X + screenX + 0.25
        streakPlaying.ExtraPositionX = (TextStreakPositions[streakPlaying.Frame] or 0) - (streakPlaying.ExtraWidth / 2) * streakPlaying.FontScale.X + screenX + 0.25
    end
end

local function RenderTextStreak()
    for index, streakPlaying in ipairs(Streaks) do
        local sprite = StreakSprites[index]
        sprite:Render(streakPlaying.RenderPos, zeroVector, zeroVector)
        streakFont:DrawStringScaled(streakPlaying.Text, streakPlaying.PositionX, streakPlaying.RenderPos.Y - 9, streakPlaying.FontScale.X, 1, streakPlaying.Color, 0, true)
        if streakPlaying.ExtraText then
            pillUiFont:DrawStringScaled(streakPlaying.ExtraText, streakPlaying.ExtraPositionX + streakPlaying.ExtraOffset.X, (streakPlaying.RenderPos.Y - 9) + streakPlaying.ExtraOffset.Y, streakPlaying.FontScale.X * streakPlaying.ExtraFontScale.X, 1 * streakPlaying.ExtraFontScale.Y, streakPlaying.Color, 0, true)
        end
    end
end

mod:AddCallback(ModCallbacks.MC_POST_UPDATE, UpdateTextStreak)
mod:AddCallback(ModCallbacks.MC_POST_RENDER, RenderTextStreak)

local SleepGiantbook = Sprite()
SleepGiantbook:Load("gfx/ui/giantbook/giantbook_sleep.anm2", true)

mod:AddCallback(ModCallbacks.MC_POST_RENDER, function()
    if isOddFrame then
        SleepGiantbook:Update()
    end

    if SleepGiantbook:IsPlaying("Idle") then
        SleepGiantbook:Render(GetScreenCenterPosition(), zeroVector, zeroVector)
    end
end)

mod:AddCallback(ModCallbacks.MC_POST_ENTITY_REMOVE, function(_, pickup)
    if pickup.Type == EntityType.ENTITY_PICKUP then
        pickup = pickup:ToPickup()
        if pickup:GetData().TrueCoopShouldRestock then
            Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.POOF01, 0, pickup.Position, pickup.Velocity, pickup)
            if pickup.Variant == PickupVariant.PICKUP_TRINKET then
                local newTrinket = Isaac.Spawn(pickup.Type, pickup.Variant, 0, pickup.Position, pickup.Velocity, pickup):ToPickup()
                newTrinket.Price = pickup.Price
                newTrinket.ShopItemId = pickup.ShopItemId
            else
                local newHeart = Isaac.Spawn(pickup.Type, pickup.Variant, pickup.SubType, pickup.Position, pickup.Velocity, pickup):ToPickup()
                newHeart.Price = pickup.Price
                newHeart.ShopItemId = pickup.ShopItemId
                newHeart:GetData().TrueCoopPickupDelay = 60
            end
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_PRE_PICKUP_COLLISION, function(_, pickup, collider)
    if collider:ToPlayer() then
        local player = collider:ToPlayer()
        local data = player:GetData()
        local pdata = pickup:GetData()
        if pickup.Variant == PickupVariant.PICKUP_HEART and not pickup:IsDead() then
            if pickup.SubType == HeartSubType.HEART_FULL
            or pickup.SubType == HeartSubType.HEART_HALF
            or pickup.SubType == HeartSubType.HEART_SCARED
            or pickup.SubType == HeartSubType.HEART_DOUBLEPACK then
                if pickup:IsShopItem() and (player:GetNumCoins() < pickup.Price or player:GetHearts() == player:GetEffectiveMaxHearts() or (pdata.TrueCoopPickupDelay and pdata.TrueCoopPickupDelay > 0)) then
                    return true
                end

                if player:GetHearts() ~= player:GetEffectiveMaxHearts() and not pdata.TrueCoopCollected and not (pdata.TrueCoopPickupDelay and pdata.TrueCoopPickupDelay > 0) then
                    if pickup.SubType == HeartSubType.HEART_HALF then
                        player:AddHearts(1)
                    elseif pickup.SubType == HeartSubType.HEART_DOUBLEPACK then
                        player:AddHearts(4)
                    else
                        player:AddHearts(2)
                    end

                    playSound(SoundEffect.SOUND_BOSS2_BUBBLES)
                    pdata.TrueCoopCollected = true
                    pdata.TrueCoopForcePos = pickup.Position

                    if pickup:IsShopItem() then
                        player:AddCoins(-pickup.Price)

                        local restock
                        for _, p in ipairs(players) do
                            if p:HasCollectible(CollectibleType.COLLECTIBLE_RESTOCK) or p:GetEffects():HasCollectibleEffect(CollectibleType.COLLECTIBLE_RESTOCK) then
                                restock = true
                            end
                        end

                        if restock then
                            pickup:GetData().TrueCoopShouldRestock = true
                        end
                    end

                    pickup:GetSprite():Play("Collect", true)
                    pickup:Die()

                    return true
                end

                return false
            end
        elseif pickup.Variant == PickupVariant.PICKUP_TRINKET and not pickup:IsDead() then
            if pickup:IsShopItem() and player:GetNumCoins() < pickup.Price then
                return true
            end

            if player:IsExtraAnimationFinished() and not player:HasTrinket(pickup.SubType) then
                local canAddTrinket = false
                local trinketA = player:GetTrinket(0)
                local trinketB = player:GetTrinket(1)

                if player:GetMaxTrinkets() == 1 and trinketA and trinketA > 0 then
                    if trinketA ~= TrinketType.TRINKET_TICK or pickup.SubType == TrinketType.TRINKET_MATCH_STICK then
                        canAddTrinket = true
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, trinketA, game:GetRoom():FindFreePickupSpawnPosition(player.Position, 0, true), zeroVector, player)
                        player:TryRemoveTrinket(trinketA)
                    end
                elseif player:GetMaxTrinkets() == 2 and trinketB and trinketB > 0 then
                    if trinketA == TrinketType.TRINKET_TICK and pickup.SubType ~= TrinketType.TRINKET_MATCH_STICK then
                        canAddTrinket = true
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, trinketB, game:GetRoom():FindFreePickupSpawnPosition(player.Position, 0, true), zeroVector, player)
                        player:TryRemoveTrinket(trinketB)
                    else
                        canAddTrinket = true
                        Isaac.Spawn(EntityType.ENTITY_PICKUP, PickupVariant.PICKUP_TRINKET, trinketA, game:GetRoom():FindFreePickupSpawnPosition(player.Position, 0, true), zeroVector, player)
                        player:TryRemoveTrinket(trinketA)
                    end
                else
                    canAddTrinket = true
                end

                if data.TrueCoop.CoopPlayer then
                    for _, trink in ipairs(bannedTrinkets) do
                        if trink == pickup.SubType then
                            canAddTrinket = false
                        end
                    end
                end

                if canAddTrinket then
                    if pickup:IsShopItem() then
                        player:AddCoins(-pickup.Price)

                        local restock
                        for _, p in ipairs(players) do
                            if p:HasCollectible(CollectibleType.COLLECTIBLE_RESTOCK) or p:GetEffects():HasCollectibleEffect(CollectibleType.COLLECTIBLE_RESTOCK) then
                                restock = true
                            end
                        end

                        if restock then
                            pickup:GetData().TrueCoopShouldRestock = true
                        end
                    end

                    pickup:PlayPickupSound()
                    PlayTextStreak(trinketConfigList[pickup.SubType].Config.Name, trinketConfigList[pickup.SubType].Config.Description, Config.TrinketDescriptionOffset, Config.TrinketDescriptionScale)
                    player:AnimateTrinket(pickup.SubType, "Pickup", "PlayerPickup")
                    player:AddTrinket(pickup.SubType)
                    pickup:Remove()
                end
            end

            if pickup:IsShopItem() then
                return true
            else
                return false
            end
        elseif pickup.Variant == PickupVariant.PICKUP_BED then
            if not pickup.Touched then
                local used
                for _, p in ipairs(players) do
                    local maxHP = p:GetMaxHearts()
                    if maxHP > 0 then
                        if p:GetHearts() < maxHP then
                            used = true
                            p:AddHearts(maxHP)
                        end
                    else
                        used = true
                        p:AddSoulHearts(6)
                    end
                end

                if used then
                    for _, p in ipairs(players) do
                        p:AddControlsCooldown(364)
                    end

                    SleepGiantbook:Play("Idle", true)
                    pickup.Touched = true
                end
            end
        elseif pickup.Variant == PickupVariant.PICKUP_BIGCHEST and player:GetData().CoopPlayer and not player:GetData().EnteringChest then
            pickup.Touched = true
            pickup.State = 1
            player.ControlsEnabled = false
            data.TrueCoop.EnteringChest = true
            data.TrueCoop.ChestEntering = pickup
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, function(_, pickup)
    local data = pickup:GetData()
    if data.TrueCoopPickupDelay then
        data.TrueCoopPickupDelay = data.TrueCoopPickupDelay - 1
    end

    if data.TrueCoopForcePos then
        pickup.Position = data.TrueCoopForcePos
        pickup.Velocity = zeroVector
    end
end)

-- Ghost Death
function InfinityTrueCoopInterface.ReviveGhost(p)
    local pdata = p:GetData()
    local inv = pdata.TrueCoop.Save.GhostInventory

    local counter = 0
    while p:GetPlayerType() ~= inv.PlayerType and counter < 100 do
        p:UseActiveItem(CollectibleType.COLLECTIBLE_CLICKER, false, true, true, true)
        counter = counter + 1
    end

    RemoveAllItems(p)
    LoadInventory(p, inv)

    p:TryRemoveNullCostume(defaultGhost)
    if pdata.TrueCoop.GhostCostume then
        p:TryRemoveNullCostume(pdata.TrueCoop.GhostCostume)
    end

    p:Update()

    p:AddMaxHearts(-p:GetMaxHearts())

    if pdata.TrueCoop.Save.PlayerName ~= "The Forgotten" then
        p:AddSoulHearts(-p:GetSoulHearts())
    end

    p:AddMaxHearts(inv.MaxHearts)
    if inv.MaxHearts > 0 then
        if pdata.TrueCoop.Save.PlayerName == "Keeper" then
            p:AddHearts(1)
        else
            p:AddHearts(2)
        end
    else
        if pdata.TrueCoop.Save.PlayerName ~= "The Forgotten" then
            p:AddSoulHearts(2)
        end
    end

    pdata.TrueCoop.Save.IsGhost = nil
    pdata.TrueCoop.Save.GhostInventory = nil
    pdata.TrueCoop.GhostJustRevived = true
    p.FireDelay = 0
    p.EntityCollisionClass = EntityCollisionClass.ENTCOLL_ALL
    p:AddCacheFlags(CacheFlag.CACHE_ALL)
    p:EvaluateItems()

    playSound(SoundEffect.SOUND_SUMMONSOUND)
    Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.POOF01, 0, p.Position, zeroVector, p)
end

local playerFetusVariant = Isaac.GetEntityVariantByName("Player Fetus")
function InfinityTrueCoopInterface.SpawnPlayerFetus(position, player, theresOptions, pricy)
    local fetus = Isaac.Spawn(EntityType.ENTITY_EFFECT, playerFetusVariant, 0, position, zeroVector, players[1])
    fetus:GetSprite():Play("Glow", true)
    local data = fetus:GetData()
    data.TrueCoopHasPrice = pricy
    data.TrueCoopChooseOne = theresOptions
    data.TrueCoopPlayer = player
    data.TrueCoopPlayerName = player:GetData().TrueCoop.Save.PlayerName
    data.TrueCoopInitialized = true
    fetus.Color = Config.PlayerHUDOutlineColors[player:GetData().TrueCoop.PlayerListIndex]
end

local shopItemSprite = Sprite()
shopItemSprite:Load("gfx/005.150_shop item.anm2", true)

mod:AddCallback(ModCallbacks.MC_POST_EFFECT_UPDATE, function(_, eff)
    if not eff:GetData().TrueCoopInitialized then
        local deadPlayers = {}
        for _, player in ipairs(players) do
            local pdata = player:GetData()
            if pdata.TrueCoop.Save.IsGhost and pdata.TrueCoop.Save.GhostInventory then
                deadPlayers[#deadPlayers + 1] = player
            end
        end

        if #deadPlayers > 0 then
            local p = deadPlayers[random(1, #deadPlayers)]
            InfinityTrueCoopInterface.SpawnPlayerFetus(eff.Position, p, true, true)
        end

        eff:Remove()
    end
end, playerFetusVariant)

mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function()
    if Config.GhostDeathMode == 4 then
        local room = game:GetRoom()
        local rtype = room:GetType()
        if rtype == RoomType.ROOM_DEVIL or rtype == RoomType.ROOM_ANGEL then
            local spawnIndices
            if room:GetRoomShape() == RoomShape.ROOMSHAPE_IV then
                spawnIndices = Config.PlayerIndexToFetusSpawnIndexSkinny
            else
                local blocked
                for _, index in ipairs(Config.PlayerIndexToFetusSpawnIndex) do
                    local pos = room:GetGridPosition(index)
                    if room:FindFreePickupSpawnPosition(pos, 0, true):Distance(pos) > 8 then
                        blocked = true
                        break
                    end
                end

                if blocked then
                    spawnIndices = Config.PlayerIndexToFetusSpawnIndexFallback
                else
                    spawnIndices = Config.PlayerIndexToFetusSpawnIndex
                end
            end

            for _, player in ipairs(players) do
                local pdata = player:GetData()
                if pdata.TrueCoop.Save.IsGhost and pdata.TrueCoop.Save.GhostInventory then
                    local grindex = spawnIndices[pdata.TrueCoop.PlayerListIndex]
                    InfinityTrueCoopInterface.SpawnPlayerFetus(room:GetGridPosition(grindex), player, rtype == RoomType.ROOM_ANGEL, rtype == RoomType.ROOM_DEVIL)
                end
            end
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_POST_EFFECT_RENDER, function(_, eff)
    local data = eff:GetData()
    local hasSoul, hasRed

    for _, player in ipairs(players) do
        local pdata = player:GetData()
        if not pdata.TrueCoop.Save.IsGhost then
            if data.TrueCoopHasPrice then
                if player:GetMaxHearts() > 0 then
                    hasRed = true
                else
                    hasSoul = true
                end
            end

            if not data.TrueCoopHasPrice or data.TrueCoopPrice then
                if player.Position:Distance(eff.Position) < player.Size + eff.Size then
                    local canTake = true
                    if data.TrueCoopHasPrice then
                        if data.TrueCoopPrice == "Red" and player:GetMaxHearts() < 2 then
                            canTake = false
                        end
                    end

                    if canTake then
                        if data.TrueCoopHasPrice then
                            if data.TrueCoopPrice == "Red" then
                                player:AddMaxHearts(-2)
                            else
                                player:AddSoulHearts(-6)
                            end

                            if player:GetHearts() + player:GetSoulHearts() == 0 then
                                player:Die()
                            end
                        end

                        if data.TrueCoopChooseOne then
                            for _, fetus in ipairs(Isaac.FindByType(EntityType.ENTITY_EFFECT, playerFetusVariant, -1, false, false)) do
                                Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.POOF01, 0, fetus.Position, zeroVector, nil)
                                fetus:Remove()
                            end
                        else
                            Isaac.Spawn(EntityType.ENTITY_EFFECT, EffectVariant.POOF01, 0, eff.Position, zeroVector, nil)
                            eff:Remove()
                        end

                        InfinityTrueCoopInterface.ReviveGhost(data.TrueCoopPlayer)
                    end
                end
            end
        end
    end

    if data.TrueCoopPlayerName then
        local byName = PlayersByName[data.TrueCoopPlayerName]
        if byName.FetusSprite then
            byName.FetusSprite:Render(Isaac.WorldToScreen(eff.Position), zeroVector, zeroVector)
        end
    end

    if data.TrueCoopHasPrice then
        local price
        if hasSoul and hasRed then
            if math.random(1, 2) == 1 then
                price = "Soul"
            else
                price = "Red"
            end
        elseif hasSoul then
            price = "Soul"
        else
            price = "Red"
        end

        if price == "Red" then
            shopItemSprite:SetFrame("Hearts", 0)
        else
            shopItemSprite:SetFrame("Hearts", 2)
        end

        shopItemSprite:Render(Isaac.WorldToScreen(eff.Position), zeroVector, zeroVector)

        data.TrueCoopPrice = price
    end
end, playerFetusVariant)

mod:AddCallback(ModCallbacks.MC_EVALUATE_CACHE, function(_, player, flag)
    if Config.GhostDeathMode > 1 and player:GetData().TrueCoop.Save.IsGhost then
        if flag == CacheFlag.CACHE_FIREDELAY then
            player.MaxFireDelay = 100000
        elseif flag == CacheFlag.CACHE_FLYING then
            player.CanFly = true
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_ENTITY_TAKE_DMG, function(_, player, amount, flag)
    local data = player:GetData()
    if data.TrueCoop.Save.SelectingCharacter then
        return false
    end

    player = player:ToPlayer()
    if player:HasTrinket(TrinketType.TRINKET_CALLUS) then
        if (flag & DamageFlag.DAMAGE_ACID == DamageFlag.DAMAGE_ACID) or ((flag & DamageFlag.DAMAGE_SPIKES == DamageFlag.DAMAGE_SPIKES) and game:GetRoom():GetType() ~= RoomType.ROOM_SACRIFICE) then
            return false
        end
    end

    if Config.GhostDeathMode > 1 then
        if data.TrueCoop.Save.IsGhost then
            return false
        elseif game:GetRoom():GetType() == RoomType.ROOM_SACRIFICE and flag & DamageFlag.DAMAGE_SPIKES == DamageFlag.DAMAGE_SPIKES and player:GetHearts() + player:GetSoulHearts() > amount and Config.GhostDeathMode > 2 then
            local deadPlayers = {}
            for _, p in ipairs(players) do
                local pdata = p:GetData()
                if pdata.TrueCoop.Save.IsGhost and pdata.TrueCoop.Save.GhostInventory then
                    deadPlayers[#deadPlayers + 1] = player
                end
            end

            if #deadPlayers > 0 then
                local p = deadPlayers[random(1, #deadPlayers)]
                InfinityTrueCoopInterface.ReviveGhost(p)
            end
        end
    end
end, EntityType.ENTITY_PLAYER)

mod:AddCallback(ModCallbacks.MC_POST_UPDATE, function()
    if Config.GhostDeathMode > 1 then
        local isLivePlayer
        for _, player in ipairs(players) do
            local data = player:GetData()
            if player:IsDead() and not data.TrueCoop.DeathFrames and not data.TrueCoop.Save.IsGhost and player:GetExtraLives() <= 0 then
                if not (data.TrueCoop.Save.PlayerName and PlayersByName[data.TrueCoop.Save.PlayerName] and PlayersByName[data.TrueCoop.Save.PlayerName].PreDeath and PlayersByName[data.TrueCoop.Save.PlayerName].PreDeath(player) == false) then
                    data.TrueCoop.DeathFrames = 50
                end
            end

            if data.TrueCoop.DeathFrames then
                data.TrueCoop.DeathFrames = data.TrueCoop.DeathFrames - 1
                if data.TrueCoop.DeathFrames <= 0 then
                    data.TrueCoop.Save.IsGhost = true
                    DropThings(player, true)
                    data.TrueCoop.Save.GhostInventory = GetInventory(player)
                    RemoveAllItems(player)
                    player:Revive()

                    player:AddNullCostume(defaultGhost)
                    if data.TrueCoop.Save.PlayerName and PlayersByName[data.TrueCoop.Save.PlayerName] then
                        local costume = PlayersByName[data.TrueCoop.Save.PlayerName].GhostCostume
                        if costume then
                            player:AddNullCostume(costume)
                            data.TrueCoop.GhostCostume = costume
                        end
                    end

                    player:AddMaxHearts(-player:GetMaxHearts())
                    if data.TrueCoop.Save.PlayerName ~= "The Forgotten" then
                        player:AddSoulHearts(-player:GetSoulHearts() + 1)
                    end

                    player:AddCacheFlags(CacheFlag.CACHE_ALL)
                    player:EvaluateItems()
                    player.FireDelay = 100000

                    data.TrueCoop.DeathFrames = nil
                end
            end

            if data.TrueCoop.Save.IsGhost then
                player.Position = game:GetRoom():GetClampedPosition(player.Position, 0)
                player.EntityCollisionClass = EntityCollisionClass.ENTCOLL_NONE
                player.GridCollisionClass = EntityGridCollisionClass.GRIDCOLL_WALLS

                if Config.GhostKnockback == 2 and player:GetFireDirection() ~= Direction.NO_DIRECTION then
                    for _, partition in ipairs(Config.GhostKnockbackPartitions) do
                        for _, entity in ipairs(Isaac.FindInRadius(player.Position, player.Size, partition)) do
                            if GetPtrHash(entity) ~= GetPtrHash(player) then
                                local diff = (entity.Position - player.Position):Normalized()
                                entity:AddVelocity(diff * 0.25)
                            end
                        end
                    end
                end
            elseif not data.TrueCoop.DeathFrames then
                isLivePlayer = true
            end
        end

        if not isLivePlayer then
            for _, player in ipairs(players) do
                player:GetData().TrueCoop.DeathFrames = nil
                player:Die()
            end
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_NPC_UPDATE, function(_, npc)
    if not npc.Target or npc.Target.Type == EntityType.ENTITY_PLAYER then
        if Config.EnemiesTargetGhosts == 2 then
            npc.Target = game:GetNearestPlayer(npc.Position)
        else
            npc.Target = GetNearestNonDeadPlayer(npc.Position)
        end
    end
end)

mod:AddCallback(ModCallbacks.MC_POST_PICKUP_UPDATE, function(_, pickup)
    local data = pickup:GetData()
    if not data.TrueCoopDevilPriceEvaluated and pickup:IsShopItem() and pickup.Variant == PickupVariant.PICKUP_COLLECTIBLE and pickup.Price < 0 and pickup.Price ~= PickupPrice.PRICE_FREE then
        local originalPrice = itemConfigList[pickup.SubType].DevilPrice
        local chanceToReplace = false
        if pickup.Price ~= PickupPrice.PRICE_THREE_SOULHEARTS then
            for _, player in ipairs(players) do
                if not player:GetData().TrueCoop.Save.IsGhost and player:GetMaxHearts() <= 0 then
                    chanceToReplace = true
                end
            end
        else
            for _, player in ipairs(players) do
                if not player:GetData().TrueCoop.Save.IsGhost and player:GetSoulHearts() <= 0 then
                    chanceToReplace = true
                end
            end
        end

        if chanceToReplace and random(1, 2) == 1 then
            if pickup.Price == PickupPrice.PRICE_THREE_SOULHEARTS then
                pickup.Price = -originalPrice
            else
                pickup.Price = PickupPrice.PRICE_THREE_SOULHEARTS
            end

            pickup.AutoUpdatePrice = false
        end

        data.TrueCoopDevilPriceEvaluated = true
    end
end)

-- Custom Boss Screen
local PlayerSpots = {
    [LevelStage.STAGE1_1] = {
        [StageType.STAGETYPE_ORIGINAL] = "01_basement",
        [StageType.STAGETYPE_WOTL] = "02_cellar",
        [StageType.STAGETYPE_AFTERBIRTH] = "13_burning_basement",
        [StageType.STAGETYPE_GREEDMODE] = "01_basement"
    },
    [LevelStage.STAGE1_2] = {
        [StageType.STAGETYPE_ORIGINAL] = "01_basement",
        [StageType.STAGETYPE_WOTL] = "02_cellar",
        [StageType.STAGETYPE_AFTERBIRTH] = "13_burning_basement",
        [StageType.STAGETYPE_GREEDMODE] = "01_basement"
    },
    [LevelStage.STAGE2_1] = {
        [StageType.STAGETYPE_ORIGINAL] = "03_caves",
        [StageType.STAGETYPE_WOTL] = "04_catacombs",
        [StageType.STAGETYPE_AFTERBIRTH] = "14_drowned_caves",
        [StageType.STAGETYPE_GREEDMODE] = "03_caves"
    },
    [LevelStage.STAGE2_2] = {
        [StageType.STAGETYPE_ORIGINAL] = "03_caves",
        [StageType.STAGETYPE_WOTL] = "04_catacombs",
        [StageType.STAGETYPE_AFTERBIRTH] = "14_drowned_caves",
        [StageType.STAGETYPE_GREEDMODE] = "03_caves"
    },
    [LevelStage.STAGE3_1] = {
        [StageType.STAGETYPE_ORIGINAL] = "05_depths",
        [StageType.STAGETYPE_WOTL] = "06_necropolis",
        [StageType.STAGETYPE_AFTERBIRTH] = "15_dank_depths",
        [StageType.STAGETYPE_GREEDMODE] = "05_depths"
    },
    [LevelStage.STAGE3_2] = {
        [StageType.STAGETYPE_ORIGINAL] = "05_depths",
        [StageType.STAGETYPE_WOTL] = "06_necropolis",
        [StageType.STAGETYPE_AFTERBIRTH] = "15_dank_depths",
        [StageType.STAGETYPE_GREEDMODE] = "05_depths"
    },
    [LevelStage.STAGE4_1] = {
        [StageType.STAGETYPE_ORIGINAL] = "07_womb",
        [StageType.STAGETYPE_WOTL] = "07_womb",
        [StageType.STAGETYPE_AFTERBIRTH] = "16_scarred_womb",
        [StageType.STAGETYPE_GREEDMODE] = "07_womb"
    },
    [LevelStage.STAGE4_2] = {
        [StageType.STAGETYPE_ORIGINAL] = "07_womb",
        [StageType.STAGETYPE_WOTL] = "07_womb",
        [StageType.STAGETYPE_AFTERBIRTH] = "16_scarred_womb",
        [StageType.STAGETYPE_GREEDMODE] = "07_womb"
    },
    [LevelStage.STAGE4_3] = {
        [StageType.STAGETYPE_ORIGINAL] = "17_blue_womb",
        [StageType.STAGETYPE_WOTL] = "17_blue_womb",
        [StageType.STAGETYPE_AFTERBIRTH] = "17_blue_womb",
        [StageType.STAGETYPE_GREEDMODE] = "17_blue_womb"
    },
    [LevelStage.STAGE5] = {
        [StageType.STAGETYPE_ORIGINAL] = "09_sheol",
        [StageType.STAGETYPE_WOTL] = "10_cathedral",
        [StageType.STAGETYPE_AFTERBIRTH] = "09_sheol",
        [StageType.STAGETYPE_GREEDMODE] = "09_sheol"
    },
    [LevelStage.STAGE6] = {
        [StageType.STAGETYPE_ORIGINAL] = "11_darkroom",
        [StageType.STAGETYPE_WOTL] = "12_chest",
        [StageType.STAGETYPE_AFTERBIRTH] = "11_darkroom",
        [StageType.STAGETYPE_GREEDMODE] = "18_shop"
    },
    [LevelStage.STAGE7] = {
        [StageType.STAGETYPE_ORIGINAL] = "19_void",
        [StageType.STAGETYPE_WOTL] = "19_void",
        [StageType.STAGETYPE_AFTERBIRTH] = "19_void",
        [StageType.STAGETYPE_GREEDMODE] = "18_shop"
    }
}

InfinityTrueCoopInterface.bossSprite = Sprite()
InfinityTrueCoopInterface.bossSprite:Load("gfx/truecoop/versusscreen/versusscreen_coop.anm2")

local function TrueCoopBossRender()
    local playing = (InfinityTrueCoopInterface.bossSprite:IsPlaying("2P") or InfinityTrueCoopInterface.bossSprite:IsPlaying("3P") or InfinityTrueCoopInterface.bossSprite:IsPlaying("4P"))
    local ended = not playing
    if not ended then
        for _, player in ipairs(players) do
            if Input.IsActionTriggered(ButtonAction.ACTION_MENUCONFIRM, player.ControllerIndex) then
                ended = true
                break
            end
        end
    end

    if game:IsPaused() and not ended and playing then
        if isOddFrame then
            InfinityTrueCoopInterface.bossSprite:Update()
        end

        InfinityTrueCoopInterface.bossSprite:Render(GetScreenCenterPosition(), zeroVector, zeroVector)
    elseif playing then
        InfinityTrueCoopInterface.bossSprite:Stop()
    end
end

local TrueCoopBossRenderInit
mod:AddCallback(ModCallbacks.MC_INPUT_ACTION, function()
    if not TrueCoopBossRenderInit then
        TrueCoopBossRenderInit = true
        mod:AddCallback(ModCallbacks.MC_POST_RENDER, TrueCoopBossRender)
    end
end)

mod:AddCallback(ModCallbacks.MC_POST_NEW_ROOM, function()
    local room = game:GetRoom()
    if room:GetType() == RoomType.ROOM_BOSS and not room:IsClear() and Config.MultiplayerBossSplash == 2 then
        local numPlayers = #players
        if numPlayers > 1 then
            for layer = 11, 12 - numPlayers, -1 do
                local playerInd = 12 - layer
                local player = players[playerInd]
                local pdata = player:GetData()
                local name = pdata.TrueCoop.Save.PlayerName
                if name then
                    local byName = PlayersByName[name]
                    if byName then
                        local portrait
                        if byName.GhostName and pdata.TrueCoop.Save.IsGhost then
                            portrait = byName.GhostName
                        else
                            portrait = byName.BossName
                        end

                        if portrait then
                            InfinityTrueCoopInterface.bossSprite:ReplaceSpritesheet(layer, portrait)
                        end
                    end
                end
            end

            for layer = 7, 8 - numPlayers, -1 do
                local playerInd = 8 - layer
                local player = players[playerInd]
                local pdata = player:GetData()
                local name = pdata.TrueCoop.Save.PlayerName
                if name then
                    local byName = PlayersByName[name]
                    if byName then
                        local portrait
                        if byName.GhostPortrait and pdata.TrueCoop.Save.IsGhost then
                            portrait = byName.GhostPortrait
                        else
                            portrait = byName.BossPortrait
                        end

                        if portrait then
                            InfinityTrueCoopInterface.bossSprite:ReplaceSpritesheet(layer, portrait)
                        end
                    end
                end
            end

            local level = game:GetLevel()
            local spot

            if StageAPI and StageAPI.CurrentStage then
                if numPlayers == 2 and StageAPI.CurrentStage.CoopSpot2P then
                    spot = StageAPI.CurrentStage.CoopSpot2P
                elseif numPlayers == 3 and StageAPI.CurrentStage.CoopSpot3P then
                    spot = StageAPI.CurrentStage.CoopSpot3P
                elseif numPlayers > 2 and StageAPI.CurrentStage.CoopSpot4P then
                    spot = StageAPI.CurrentStage.CoopSpot4P
                else
                    spot = "gfx/truecoop/versusscreen/playerspot_2P/00_spot.png"
                end
            else
                spot = PlayerSpots[level:GetStage()][level:GetStageType()] or "00_spot"
                if numPlayers == 2 then
                    spot = "gfx/truecoop/versusscreen/playerspot_2P/" .. spot .. ".png"
                else
                    spot = "gfx/truecoop/versusscreen/playerspot_3-4P/" .. spot .. ".png"
                end
            end

            if numPlayers == 2 then
                InfinityTrueCoopInterface.bossSprite:ReplaceSpritesheet(2, spot)
            else
                InfinityTrueCoopInterface.bossSprite:ReplaceSpritesheet(3, spot)
            end

            InfinityTrueCoopInterface.bossSprite:LoadGraphics()
            InfinityTrueCoopInterface.bossSprite:Play(tostring(numPlayers) .. "P", true)
        end
    end
end)

-- PVP
mod:AddCallback(ModCallbacks.MC_POST_TEAR_UPDATE, function(_, tear)
    if Config.PVP == 2 then
        if tear.FrameCount <= 1 then
            local nearPlayers = Isaac.FindInRadius(tear.Position, 12, EntityPartition.PLAYER)
            tear:GetData().TrueCoopPlayer = nearPlayers[1]
        end

        if tear.FrameCount > 5 or tear:GetData().TrueCoopPlayer then
            for _, player in ipairs(players) do
                if DoEntitiesCollide(tear, player) and not player:HasInvincibility() and (not tear:GetData().TrueCoopPlayer or tear:GetData().TrueCoopPlayer.Index ~= player.Index) then
                    player:TakeDamage(1, 0, EntityRef(tear), 30)

                    if not ((tear.TearFlags & TearFlags.TEAR_PIERCING == TearFlags.TEAR_PIERCING) or (tear.TearFlags & TearFlags.TEAR_LUDOVICO == TearFlags.TEAR_LUDOVICO)) or tear.TearFlags & TearFlags.TEAR_EXPLOSIVE == TearFlags.TEAR_EXPLOSIVE then
                        tear:Kill()
                    end
                end
            end
        end
    end
end)

local function LineCheck(point, lineStart, lineEnd, threshold)
    return lineStart:Distance(point) + lineEnd:Distance(point) - lineStart:Distance(lineEnd) < threshold
end

mod:AddCallback(ModCallbacks.MC_POST_LASER_UPDATE, function(_, laser)
    if Config.PVP == 2 then
        for _, player in ipairs(players) do
            if laser.Parent then
                if player.Index ~= laser.Parent.Index and laser.Parent:ToPlayer() then
                    if not laser:IsCircleLaser() then
                        if LineCheck(player.Position, laser.Position, laser:GetEndPoint(), (laser.Size / 2) + (player.Size / 2)) then
                            player:TakeDamage(1, 0, EntityRef(laser.Parent), 30)
                        end
                    else
                        local distanceFromCenter = player.Position:Distance(laser.Position)
                        if math.abs(distanceFromCenter - laser.Radius) < laser.Size then
                            player:TakeDamage(1, 0, EntityRef(laser.Parent), 30)
                        end
                    end
                end
            end
        end
    end
end)

local function SplitCommand(splitstr, separator)
    if separator == nil then
        separator = "%s"
    end
    local t = {}
    for str in string.gmatch(splitstr, "([^"..separator.."]+)") do
        t[#t + 1] = str
    end
    return t
end

local inventoryThen

mod:AddCallback(ModCallbacks.MC_EXECUTE_CMD, function(_, cmd, params)
    local split = SplitCommand(params)
    if cmd == "gi" then
        local player, item, count = tonumber(split[1]), tonumber(split[2]), tonumber(split[3] or "1")
        if split[1] == "all" or split[1] == "a" then
            for _, p in ipairs(players) do
                if item then
                    for i = 1, count do
                        p:AddCollectible(item, 999, true)
                    end
                elseif split[2] and type(split[2]) == "string" then
                    item = Isaac.GetItemIdByName(item)
                    if item ~= -1 then
                        for i = 1, count do
                            p:AddCollectible(item, 999, true)
                        end
                    end
                end
            end
        else
            if players[player] and item then
                for i = 1, count do
                    players[player]:AddCollectible(item, 999, true)
                end
            elseif players[player] and split[2] and type(split[2]) == "string" then
                item = Isaac.GetItemIdByName(item)
                if item ~= -1 then
                    for i = 1, count do
                        players[player]:AddCollectible(item, 999, true)
                    end
                end
            end
        end
    elseif cmd == "re" then
        local player, item, count = tonumber(split[1]), tonumber(split[2]), tonumber(split[3] or "1")
        if split[1] == "all" or split[1] == "a" then
            for _, p in ipairs(players) do
                if item then
                    for i = 1, count do
                        p:RemoveCollectible(item)
                    end
                elseif split[2] and type(split[2]) == "string" then
                    if split[2] == "*" then
                        RemoveAllItems(p)
                    else
                        item = Isaac.GetItemIdByName(item)
                        if item ~= -1 then
                            for i = 1, count do
                                p:RemoveCollectible(item)
                            end
                        end
                    end
                end
            end
        else
            if players[player] and item then
                for i = 1, count do
                    players[player]:RemoveCollectible(item)
                end
            elseif players[player] and split[2] and type(split[2]) == "string" then
                if split[2] == "*" then
                    RemoveAllItems(players[player])
                else
                    item = Isaac.GetItemIdByName(item)
                    if item ~= -1 then
                        for i = 1, count do
                            players[player]:RemoveCollectible(item)
                        end
                    end
                end
            end
        end
    elseif cmd == "cgr" then
        local player, count = tonumber(split[1]), tonumber(split[2])

        if split[1] == "all" or split[1] == "a" then
            for _, p in ipairs(players) do
                local items = {}
                for i = 1, count do
                    items[#items + 1] = itemList[random(1, #itemList)]
                end

                for _, item in ipairs(items) do
                    p:AddCollectible(item, 999, true)
                end
            end
        elseif players[player] then
            local items = {}
            for i = 1, count do
                items[#items + 1] = itemList[random(1, #itemList)]
            end

            for _, item in ipairs(items) do
                players[player]:AddCollectible(item, 999, true)
            end
        end
    elseif cmd == "saveinv" then
        local player = tonumber(split[1])
        if players[player] then
            inventoryThen = GetInventory(players[player])
        end
    elseif cmd == "loadinv" then
        local player = tonumber(split[1])
        if players[player] then
            LoadInventory(players[player], inventoryThen)
        end
    end
end)

function InfinityTrueCoopInterface.AddCharacter(playerData)
    if playerData.FetusSprite and type(playerData.FetusSprite) == "string" then
        local sprite = Sprite()
        sprite:Load(playerData.FetusSprite, true)
        sprite:Play("Idle", true)
        playerData.FetusSprite = sprite
    end

    PlayersByName[playerData.Name] = playerData
end

function InfinityTrueCoopInterface.AssociatePlayerTypeName(ptype, name)
    PlayerTypeToName[ptype] = name
end

function InfinityTrueCoopInterface.AddCharacterToWheel(name)
    PlayerSelectOrder[#PlayerSelectOrder + 1] = name
end

function InfinityTrueCoopInterface.SetExpectedFamiliar(name, variant, player, count, accountForBoxOfFriends, lilDelirium, positions)
    if type(player) == "number" then
        player = players[player]
    end

    local data = player:GetData().TrueCoop
    data.ExtraExtraFamiliars[name] = {}
    data.ExtraExtraFamiliars[name] = AddFamiliar(data.ExtraExtraFamiliars[name], variant, player, count, accountForBoxOfFriends, lilDelirium, positions)
end

function InfinityTrueCoopInterface.SetFamiliarPlayer(familiar, player)
    familiar:GetData().TrueCoopPlayerListIndex = player:GetData().TrueCoop.PlayerListIndex
end

function InfinityTrueCoopInterface.AddModdedCardFront(card, anm2, anim)
    if not moddedCardFrontSprites[anm2] then
        moddedCardFrontSprites[anm2] = Sprite()
        moddedCardFrontSprites[anm2]:Load(anm2, true)
    end

    moddedCardFronts[card] = {
        Anm2 = anm2,
        Anim = anim
    }
end

function InfinityTrueCoopInterface.PlayerJustSpawned(player, mustBeCoop)
    return player.Variant == 1 or (player:GetData().TrueCoop.JustSpawned and (not mustBeCoop or player:GetData().TrueCoop.CoopPlayer)) or player:GetData().TrueCoop.Save.SelectingCharacter
end

function InfinityTrueCoopInterface.PlayerIsGhost(player)
    return player:GetData().TrueCoop.Save.IsGhost
end

if __infinityTrueCoop then
    for _, fn in pairs(__infinityTrueCoop) do
        fn()
    end

    __infinityTrueCoop = {}
end

-- CONFIG

local configSprite = Sprite()
configSprite:Load("gfx/truecoop/options_config.anm2", true)

local configChallenge = Isaac.GetChallengeIdByName("True Co-op Config")

local adjustorWidth = 44
local menuOffset = Vector(32, 0)
local menuTextOffset = Vector(0, -86)
local font = Font()
font:Load("font/teammeatfont12.fnt")
local fontHeight = font:GetBaselineHeight() - 1

local options = {
    {Name = "HUD Offset:", SaveName = "BaseHUDOffset", HasAdjustor = true, Default = Config.BaseHUDOffset},
    {Name = "Ghosts:", SaveName = "GhostDeathMode", Modes = {"Off", "No Revive", "Sacrifice Revive", "Fetus Revive"}, Default = Config.GhostDeathMode},
    {Name = "Player Tint:", SaveName = "PlayerTintMode", Modes = {"Off", "Map", "Always"}, Default = Config.PlayerTintMode},
    {Name = "HUD Outlines:", SaveName = "HUDOutlineMode", Modes = {"Off", "Map", "Always"}, Default = Config.HUDOutlineMode},
    {Name = "Player Text:", SaveName = "PlayerTextMode", Modes = {"Off", "Map", "Always"}, Default = Config.PlayerTextMode},
    {Name = "HUD Text:", SaveName = "HUDTextMode", Modes = {"Off", "Map", "Always"}, Default = Config.HUDTextMode},
    {Name = "HP Scaling:", SaveName = "EnemyHPScaling", HasAdjustor = true, Default = Config.EnemyHPScaling},
    {Name = "Co-op Versus Screen:", SaveName = "MultiplayerBossSplash", Modes = {"Off", "On"}, Default = Config.MultiplayerBossSplash},
    {Name = "Enemies Target Ghosts:", SaveName = "EnemiesTargetGhosts", Modes = {"Off", "On"}, Default = Config.EnemiesTargetGhosts},
    {Name = "Ghost Knockback:", SaveName = "GhostKnockback", Modes = {"Off", "On"}, Default = Config.GhostKnockback},
    {Name = "PVP:", SaveName = "PVP", Modes = {"Off", "On"}, Default = Config.PVP},
    {Name = "Jacob Mode:", SaveName = "JacobMode", Modes = {"Off", "On"}, Default = Config.JacobMode}
}

for i, option in ipairs(options) do
    option.Index = i
    option.Value = option.Default or 1
    option.Name = option.Name .. "  "
    local textWidth = font:GetStringWidth(option.Name)
    option.TextWidth = textWidth
    local modeMaxWidth = 0
    if option.Modes then
        for _, mode in ipairs(option.Modes) do
            local width = font:GetStringWidth(mode)
            if width > modeMaxWidth then
                modeMaxWidth = width
            end
        end
    end

    option.ModeMaxWidth = modeMaxWidth
    option.MaxTotalWidth = modeMaxWidth + textWidth
end

local textColor = KColor(0.212, 0.184, 0.177, 1, 0, 0, 0)

local selected = 1

local function ConfigPostRender()
    local screenCenter, roomCenter, room = GetScreenCenterPosition()

    for i = 0, 7 do
        local door = room:GetDoor(i)
        if door then
            room:RemoveDoor(i)
        end
    end

    local player = Isaac.GetPlayer(0)
    player.Position = Vector(100, roomCenter.Y)
    player.ControlsEnabled = false

    local menuPos = screenCenter + menuOffset

    configSprite:Play("Idle", true)
    configSprite:Render(menuPos, zeroVector, zeroVector)

    local left, right

    if not game:IsPaused() then
        if Input.IsActionTriggered(ButtonAction.ACTION_RESTART, player.ControllerIndex) then
            game:FinishChallenge()
        end

        if Input.IsActionTriggered(ButtonAction.ACTION_MENUDOWN, player.ControllerIndex) then
            selected = selected + 1
            if selected > #options then
                selected = 1
            end
        elseif Input.IsActionTriggered(ButtonAction.ACTION_MENUUP, player.ControllerIndex) then
            selected = selected - 1
            if selected < 1 then
                selected = #options
            end
        end

        left, right = Input.IsActionTriggered(ButtonAction.ACTION_MENULEFT, player.ControllerIndex), Input.IsActionTriggered(ButtonAction.ACTION_MENURIGHT, player.ControllerIndex)
    end

    for i, option in ipairs(options) do
        local str = option.Name
        local width = option.MaxTotalWidth

        if i == selected and (left or right) then
            if left then
                option.Value = option.Value - 1
            else
                option.Value = option.Value + 1
            end

            if option.Modes then
                if option.Value < 1 then
                    option.Value = #option.Modes
                elseif option.Value > #option.Modes then
                    option.Value = 1
                end
            elseif option.HasAdjustor then
                if option.Value < 1 then
                    option.Value = 11
                elseif option.Value > 11 then
                    option.Value = 1
                end
            end

            if Config[option.SaveName] then
                Config[option.SaveName] = option.Value
            end

            if not SaveData.Config then
                SaveData.Config = {}
            end

            SaveData.Config[option.SaveName] = option.Value
            SaveModData()
        end

        if option.HasAdjustor then
            width = width + adjustorWidth
        end

        local renderY = menuPos.Y + ((i - 1) * fontHeight) + menuTextOffset.Y

        local renderPosition = Vector(menuPos.X - (width / 2), renderY)
        local renderMode = Vector(renderPosition.X + option.TextWidth, renderY)

        if option.Index == selected then
            configSprite:Play("Cursor", true)
            configSprite:Render(renderPosition + Vector(-10, 10), zeroVector, zeroVector)
        end

        if option.HasAdjustor then
            local adjustorRender = Vector(renderPosition.X + option.TextWidth, renderPosition.Y + 5 + fontHeight / 2)
            configSprite:Play("Bar", true)
            configSprite:SetFrame("Bar", option.Value - 1)
            configSprite:Render(adjustorRender, zeroVector, zeroVector)
        end

        if option.Modes then
            local mode = option.Modes[option.Value]
            if mode then
                font:DrawString(mode, renderMode.X, renderMode.Y, textColor, 0, false)
            end
        end

        font:DrawString(str, renderPosition.X, renderPosition.Y, textColor, 0, false)
    end
end

if game:GetFrameCount() > 1 then
    LoadModData()
    if SaveData.Config then
        for k, v in pairs(SaveData.Config) do
            if Config[k] then
                Config[k] = v
            end
        end

        for i, option in ipairs(options) do
            if SaveData.Config[option.SaveName] then
                option.Value = SaveData.Config[option.SaveName]
            end
        end
    end
end

mod:AddCallback(ModCallbacks.MC_PRE_GAME_EXIT, function(_, shouldSave)
    if shouldSave then
        if not SaveData.PlayerInventories then
            SaveData.PlayerInventories = {}
        end

        for _, player in ipairs(players) do
            player:GetData().TrueCoop.SaveCheck = false
        end

        for i, player in ipairs(players) do
            local data = player:GetData()
            if not data.TrueCoop.SaveCheck then
                SaveData.PlayerInventories[tostring(i)] = GetInventory(player)
                data.TrueCoop.SaveCheck = true
            end
        end

        SaveModData()
    end

    players = {}
end)

mod:AddCallback(ModCallbacks.MC_POST_GAME_STARTED, function(_, continued)
    RefreshPlayers()

    players[1]:GetData().TrueCoop.JustSpawned = true
    LoadModData()
    if not continued then
        SaveData.PlayerInventories = {}
        SaveModData()
    end

    if SaveData.Config then
        for k, v in pairs(SaveData.Config) do
            if Config[k] then
                Config[k] = v
            end
        end

        for i, option in ipairs(options) do
            if SaveData.Config[option.SaveName] then
                option.Value = SaveData.Config[option.SaveName]
            end
        end
    end

    if Isaac.GetChallenge() == configChallenge then
        local player = players[1]
        player:AddCollectible(CollectibleType.COLLECTIBLE_STARTER_DECK, 999, false)
        player:AddCollectible(CollectibleType.COLLECTIBLE_KAMIKAZE, 0, false)
        player:AddCollectible(CollectibleType.COLLECTIBLE_MOMS_PURSE, 0, false)
        player:AddCard(itemPool:GetCard(player.InitSeed, true, true, false))
        player:AddCard(itemPool:GetCard(player.InitSeed, true, true, false))
        player:AddTrinket(itemPool:GetTrinket())
        player:AddTrinket(itemPool:GetTrinket())
        Isaac.ExecuteCommand("stage 2")
    end
end)

mod:AddCallback(ModCallbacks.MC_POST_RENDER, function()
    if Isaac.GetChallenge() == configChallenge then
        ConfigPostRender()
    end
end)
