local addonName, addonTable = ...
local MH = {}
_G["MillHelper"] = MH

local L = addonTable.L

-- SavedVariables
MillHelperSettings = MillHelperSettings or { minimap = { hide = false }, showTooltip = true }

-- Hierbas molibles
local millableByID = {
    -- Classic
    [765]   = true, -- Silverleaf
    [2447]  = true, -- Peacebloom
    [785]   = true, -- Mageroyal
    [2450]  = true, -- Briarthorn
    [2453]  = true, -- Bruiseweed
    [3820]  = true, -- Stranglekelp
    [3355]  = true, -- Wild Steelbloom
    [3356]  = true, -- Kingsblood
    [3357]  = true, -- Liferoot
    [3358]  = true, -- Khadgar's Whisker
    [3818]  = true, -- Fadeleaf
    [3819]  = true, -- Dragon's Teeth
    [3821]  = true, -- Goldthorn
    [4625]  = true, -- Firebloom
    [8831]  = true, -- Purple Lotus
    [8836]  = true, -- Arthas' Tears
    [8838]  = true, -- Sungrass
    [8839]  = true, -- Blindweed
    [8845]  = true, -- Ghost Mushroom
    [8846]  = true, -- Gromsblood
    [13464] = true, -- Golden Sansam
    [13465] = true, -- Mountain Silversage
    [13466] = true, -- Sorrowmoss
    [13467] = true, -- Icecap

    -- TBC
    [22785] = true, -- Felweed
    [22786] = true, -- Dreaming Glory
    [22787] = true, -- Ragveil
    [22788] = true, -- Terocone
    [22789] = true, -- Ancient Lichen
    [22790] = true, -- Netherbloom
    [22791] = true, -- Nightmare Vine
    [2452]  = true, -- Bloodvine

    -- WotLK
    [36901] = true, -- Goldclover
    [36903] = true, -- Fire Leaf
    [36904] = true, -- Talandra's Rose
    [36905] = true, -- Tiger Lily
    [36906] = true, -- Lichbloom
    [36907] = true, -- Icethorn
    [36908] = true, -- Frozen Herb
    [37921] = true, -- Cinderbloom
    [39970] = true, -- Stormvine
    [39973] = true, -- Azshara's Veil

    -- Cata
    [52983] = true, -- Cinderbloom
    [52984] = true, -- Stormvine
    [52985] = true, -- Azshara's Veil
    [52986] = true, -- Heartblossom
    [52987] = true, -- Whiptail
    [52988] = true, -- Twilight Jasmine
    [52989] = true, -- Fire Leaf
    [52990] = true, -- Green Tea Leaf

    -- MoP
    [72234] = true, -- Green Tea Leaf
    [72235] = true, -- Silkweed
    [72237] = true, -- Snow Lily
    [79010] = true, -- Fool's Cap
    [79011] = true, -- Golden Lotus
    [89326] = true, -- Rain Poppy
    [89327] = true, -- Sha-Touched Herb
    [102461]= true, -- Desecrated Herb
}

-- Agrupación por expansión
local expansionByID = {
    -- Classic
    [765]   = "Classic", [2447] = "Classic", [785] = "Classic",
    [2450]  = "Classic", [2453] = "Classic", [3820] = "Classic",
    [3355]  = "Classic", [3356] = "Classic", [3357] = "Classic",
    [3358]  = "Classic", [3818] = "Classic", [3819] = "Classic",
    [3821]  = "Classic", [4625] = "Classic", [8831] = "Classic",
    [8836]  = "Classic", [8838] = "Classic", [8839] = "Classic",
    [8845]  = "Classic", [8846] = "Classic", [13464] = "Classic",
    [13465] = "Classic", [13466] = "Classic", [13467] = "Classic",

    -- TBC
    [22785] = "The Burning Crusade", [22786] = "The Burning Crusade",
    [22787] = "The Burning Crusade", [22788] = "The Burning Crusade",
    [22789] = "The Burning Crusade", [22790] = "The Burning Crusade",
    [22791] = "The Burning Crusade", [2452]  = "The Burning Crusade",

    -- WotLK
    [36901] = "Wrath of the Lich King", [36903] = "Wrath of the Lich King",
    [36904] = "Wrath of the Lich King", [36905] = "Wrath of the Lich King",
    [36906] = "Wrath of the Lich King", [36907] = "Wrath of the Lich King",
    [36908] = "Wrath of the Lich King", [37921] = "Wrath of the Lich King",
    [39970] = "Wrath of the Lich King", [39973] = "Wrath of the Lich King",

    -- Cata
    [52983] = "Cataclysm", [52984] = "Cataclysm", [52985] = "Cataclysm",
    [52986] = "Cataclysm", [52987] = "Cataclysm", [52988] = "Cataclysm",
    [52989] = "Cataclysm", [52990] = "Cataclysm",

    -- MoP
    [72234] = "Mists of Pandaria", [72235] = "Mists of Pandaria",
    [72237] = "Mists of Pandaria", [79010] = "Mists of Pandaria",
    [79011] = "Mists of Pandaria", [89326] = "Mists of Pandaria",
    [89327] = "Mists of Pandaria", [102461]= "Mists of Pandaria",
}

-- Crear UI
local ui
local function CreateUI()
    ui = CreateFrame("Frame", "MillHelperFrame", UIParent, "BasicFrameTemplateWithInset")
    ui:SetSize(320, 400)
    ui:SetPoint("CENTER")
    ui:SetMovable(true)
    ui:EnableMouse(true)
    ui:RegisterForDrag("LeftButton")
    ui:SetScript("OnDragStart", ui.StartMoving)
    ui:SetScript("OnDragStop", ui.StopMovingOrSizing)
    ui:Hide()

    ui.title = ui:CreateFontString(nil, "OVERLAY", "GameFontHighlight")
    ui.title:SetPoint("TOP", ui.TitleBg, "TOP", 0, -2)
    ui.title:SetText("|cffd597ffMill Helper|r")
    ui.title:SetJustifyH("CENTER")

    -- Scroll
    ui.scroll = CreateFrame("ScrollFrame", nil, ui, "UIPanelScrollFrameTemplate")
    ui.scroll:SetPoint("TOPLEFT", ui, "TOPLEFT", 10, -34)
    ui.scroll:SetPoint("BOTTOMRIGHT", ui, "BOTTOMRIGHT", -30, 10)
    ui.content = CreateFrame("Frame", nil, ui.scroll)
    ui.content:SetSize(280, 1)
    ui.scroll:SetScrollChild(ui.content)

    ui.entries = {}

    addonTable.uiFrame = ui
end

-- Escanear inventario
local function scanInventory()
    local found = {}
    for bag = 0, NUM_BAG_SLOTS do
        local slots = C_Container.GetContainerNumSlots(bag)
        for slot = 1, slots do
            local info = C_Container.GetContainerItemInfo(bag, slot)
            if info and info.itemID and millableByID[info.itemID] then
                local name, link = GetItemInfo(info.itemID)
                if not name then
                    if info.hyperlink then
                        link = info.hyperlink
                        name = "item:"..info.itemID
                    else
                        name = "item:"..info.itemID
                        link = "item:"..info.itemID
                    end
                end
                found[info.itemID] = found[info.itemID] or {name = name, link = link, count = 0}
                found[info.itemID].count = found[info.itemID].count + (info.stackCount or 1)
            end
        end
    end
    return found
end

-- Actualiza UI y macros
MH.selectedItems = MH.selectedItems or {}
function MH.UpdateUI()
    if not ui then return end

    -- Limpiar UI
    for _, entry in ipairs(ui.entries) do
        if entry.checkbox then entry.checkbox:Hide() end
        if entry.button then entry.button:Hide() end
        if entry.header then entry.header:Hide() end
    end
    wipe(ui.entries)

    local found = scanInventory()
    local itemsByExpansion = {}
    for id, data in pairs(found) do
        local exp = expansionByID[id] or L["Other"]
        itemsByExpansion[exp] = itemsByExpansion[exp] or {}
        table.insert(itemsByExpansion[exp], {id = id, name = data.name, link = data.link, count = data.count})
    end

    -- Orden de expansiones
    local expansionOrder = {L["Classic"], L["The Burning Crusade"], L["Wrath of the Lich King"], L["Cataclysm"], L["Mists of Pandaria"], L["Other"]}

    local y = -5
    for _, exp in ipairs(expansionOrder) do
        local items = itemsByExpansion[exp]
        if items and #items > 0 then
            -- Header expansión
            local header = ui.content:CreateFontString(nil, "OVERLAY", "GameFontNormalLarge")
            header:SetPoint("TOPLEFT", ui.content, "TOPLEFT", 5, y)
            header:SetText(exp)
            table.insert(ui.entries, {header = header})
            y = y - 20

            for _, data in ipairs(items) do
                local entry = {}
                local state = MH.selectedItems[data.id] or {checked = false, showButton = false, macroName = nil}

                -- Checkbox
                local cb = CreateFrame("CheckButton", nil, ui.content, "UICheckButtonTemplate")
                cb:SetPoint("TOPLEFT", ui.content, "TOPLEFT", 20, y)
                local txt = cb:CreateFontString(nil, "OVERLAY", "GameFontNormal")
                txt:SetPoint("LEFT", cb, "RIGHT", 6, 0)
                txt:SetText(data.name.." ("..data.count..")")
                cb.itemLink = data.link
                cb.itemID = data.id
                cb:SetChecked(state.checked)
                entry.checkbox = cb

                -- Botón Moler
                local btn = CreateFrame("Button", nil, ui.content, "SecureActionButtonTemplate")
                btn:SetSize(24, 24)
                btn:SetPoint("RIGHT", cb, "RIGHT", 200, 0)
                btn:SetNormalTexture("Interface\\Icons\\ability_miling")
                btn:SetPushedTexture("Interface\\Buttons\\UI-Quickslot-Depress")
                btn:SetHighlightTexture("Interface\\Buttons\\ButtonHilight-Square", "ADD")
                btn:SetShown(state.showButton)
                entry.button = btn

                if data.count < 5 then
                    cb:SetEnabled(false)
                    cb:SetScript("OnEnter", function(self)
                        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
                        GameTooltip:SetText(L["NeedAtLeast5Herbs"], 1, 1, 1, 1, true)
                        GameTooltip:Show()
                    end)
                    cb:SetScript("OnLeave", function(self)
                        GameTooltip:Hide()
                    end)
                else
                    cb:SetScript("OnClick", function(self)
                        local checked = self:GetChecked()
                        state.checked = checked

                        local macroName = state.macroName
                        if not macroName then
                            macroName = "Mill_"..data.name:gsub("%s+",""):gsub("[^%w]","")
                            state.macroName = macroName
                        end

                        if checked then
                            local spellName = GetSpellInfo(51005) -- Milling
                            local macroText = "/use "..spellName.."\n/use "..data.name

                            if GetMacroIndexByName(macroName) == 0 then
                                CreateMacro(macroName, "ability_miling", macroText, false)
                            else
                                EditMacro(GetMacroIndexByName(macroName), macroName, "ability_miling", macroText, false)
                            end

                            btn:SetAttribute("type", "macro")
                            btn:SetAttribute("macro", macroName)
                            btn:Show()
                            state.showButton = true
                        else
                            btn:Hide()
                            local idx = GetMacroIndexByName(macroName)
                            if idx > 0 then DeleteMacro(idx) end
                            state.showButton = false
                        end

                        MH.selectedItems[data.id] = state
                    end)
                end

                if state.showButton and state.macroName then
                    btn:SetAttribute("type", "macro")
                    btn:SetAttribute("macro", state.macroName)
                    btn:Show()
                end

                table.insert(ui.entries, entry)
                y = y - 26
            end
        end
    end

    ui.content:SetHeight(math.max(1, -y + 10))
end

-- Crear UI
CreateUI()

-- Eventos
local ev = CreateFrame("Frame")
ev:RegisterEvent("PLAYER_LOGIN")
ev:RegisterEvent("GET_ITEM_INFO_RECEIVED")
ev:SetScript("OnEvent", function(_, event, itemID)
    if event == "PLAYER_LOGIN" or (event == "GET_ITEM_INFO_RECEIVED" and millableByID[itemID]) then
        MH.UpdateUI()
    end
end)

local invUpdate = CreateFrame("Frame")
invUpdate:RegisterEvent("BAG_UPDATE")
invUpdate:RegisterEvent("BAG_UPDATE_DELAYED")
invUpdate:SetScript("OnEvent", function()
    MH.UpdateUI()
end)

-- Export
addonTable.UpdateCheckboxes = MH.UpdateUI
addonTable.MillHelper = MH
