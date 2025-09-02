local addonName, addonTable = ...
local L = {}
addonTable.L = L

local locale = GetLocale()

-- Español
if locale == "esES" or locale == "esMX" then
    L["Mill Helper"] = "|cffd597ffMill Helper|r"
    L["NeedAtLeast5Herbs"] = "Necesitas al menos 5 hierbas para moler"
    L["UI not initialized"] = "UI no inicializada"
    L["Left click to toggle the Mill Helper UI, right click for this info."] = "Click izquierdo: Abrir/Cerrar interfaz del Mill Helper, click derecho: mostrar información"
    L["Left click: Toggle UI"] = "Click izquierdo: Abrir/Cerrar interfaz"
    L["Right click: Info"] = "Click derecho: Información"
    L["Classic"] = "Classic"
    L["The Burning Crusade"] = "The Burning Crusade"
    L["Wrath of the Lich King"] = "Wrath of the Lich King"
    L["Cataclysm"] = "Cataclysm"
    L["Mists of Pandaria"] = "Mists of Pandaria"
    L["Other"] = "Otros"

-- Deutsch
elseif locale == "deDE" then
    L["Mill Helper"] = "|cffd597ffMill Helper|r"
    L["NeedAtLeast5Herbs"] = "Du benötigst mindestens 5 Kräuter zum Mahlen"
    L["UI not initialized"] = "UI nicht initialisiert"
    L["Left click to toggle the Mill Helper UI, right click for this info."] = "Linksklick: Mill Helper UI öffnen/schließen, Rechtsklick: Info"
    L["Left click: Toggle UI"] = "Linksklick: UI öffnen/schließen"
    L["Right click: Info"] = "Rechtsklick: Info"
    L["Classic"] = "Classic"
    L["The Burning Crusade"] = "The Burning Crusade"
    L["Wrath of the Lich King"] = "Wrath of the Lich King"
    L["Cataclysm"] = "Cataclysm"
    L["Mists of Pandaria"] = "Mists of Pandaria"
    L["Other"] = "Andere"

-- Français
elseif locale == "frFR" then
    L["Mill Helper"] = "|cffd597ffMill Helper|r"
    L["NeedAtLeast5Herbs"] = "Vous avez besoin d'au moins 5 herbes pour les réduire en pigments"
    L["UI not initialized"] = "UI non initialisée"
    L["Left click to toggle the Mill Helper UI, right click for this info."] = "Clic gauche: ouvrir/fermer l'UI de Mill Helper, clic droit: infos"
    L["Left click: Toggle UI"] = "Clic gauche: ouvrir/fermer l'UI"
    L["Right click: Info"] = "Clic droit: infos"
    L["Classic"] = "Classic"
    L["The Burning Crusade"] = "The Burning Crusade"
    L["Wrath of the Lich King"] = "Wrath of the Lich King"
    L["Cataclysm"] = "Cataclysm"
    L["Mists of Pandaria"] = "Mists of Pandaria"
    L["Other"] = "Autres"

-- Italiano
elseif locale == "itIT" then
    L["Mill Helper"] = "|cffd597ffMill Helper|r"
    L["NeedAtLeast5Herbs"] = "Hai bisogno di almeno 5 erbe per macinare"
    L["UI not initialized"] = "UI non inizializzata"
    L["Left click to toggle the Mill Helper UI, right click for this info."] = "Click sinistro: apri/chiudi l'interfaccia di Mill Helper, click destro: info"
    L["Left click: Toggle UI"] = "Click sinistro: apri/chiudi interfaccia"
    L["Right click: Info"] = "Click destro: info"
    L["Classic"] = "Classic"
    L["The Burning Crusade"] = "The Burning Crusade"
    L["Wrath of the Lich King"] = "Wrath of the Lich King"
    L["Cataclysm"] = "Cataclysm"
    L["Mists of Pandaria"] = "Mists of Pandaria"
    L["Other"] = "Altro"

-- Português (Brasil)
elseif locale == "ptBR" then
    L["Mill Helper"] = "|cffd597ffMill Helper|r"
    L["NeedAtLeast5Herbs"] = "Você precisa de pelo menos 5 ervas para macerar"
    L["UI not initialized"] = "Interface não inicializada"
    L["Left click to toggle the Mill Helper UI, right click for this info."] = "Clique esquerdo: abrir/fechar a interface do Mill Helper, clique direito: informações"
    L["Left click: Toggle UI"] = "Clique esquerdo: abrir/fechar interface"
    L["Right click: Info"] = "Clique direito: informações"
    L["Classic"] = "Clássico"
    L["The Burning Crusade"] = "The Burning Crusade"
    L["Wrath of the Lich King"] = "Wrath of the Lich King"
    L["Cataclysm"] = "Cataclysm"
    L["Mists of Pandaria"] = "Mists of Pandaria"
    L["Other"] = "Outros"

-- Русский
elseif locale == "ruRU" then
    L["Mill Helper"] = "|cffd597ffMill Helper|r"
    L["NeedAtLeast5Herbs"] = "Вам нужно как минимум 5 трав для помола"
    L["UI not initialized"] = "Интерфейс не инициализирован"
    L["Left click to toggle the Mill Helper UI, right click for this info."] = "ЛКМ: открыть/закрыть Mill Helper, ПКМ: информация"
    L["Left click: Toggle UI"] = "ЛКМ: открыть/закрыть интерфейс"
    L["Right click: Info"] = "ПКМ: информация"
    L["Classic"] = "Classic"
    L["The Burning Crusade"] = "The Burning Crusade"
    L["Wrath of the Lich King"] = "Wrath of the Lich King"
    L["Cataclysm"] = "Cataclysm"
    L["Mists of Pandaria"] = "Mists of Pandaria"
    L["Other"] = "Прочее"

-- 한국어
elseif locale == "koKR" then
    L["Mill Helper"] = "|cffd597ffMill Helper|r"
    L["NeedAtLeast5Herbs"] = "제분하려면 최소한 약초 5개가 필요합니다"
    L["UI not initialized"] = "UI가 초기화되지 않았습니다"
    L["Left click to toggle the Mill Helper UI, right click for this info."] = "좌클릭: Mill Helper UI 열기/닫기, 우클릭: 정보"
    L["Left click: Toggle UI"] = "좌클릭: UI 열기/닫기"
    L["Right click: Info"] = "우클릭: 정보"
    L["Classic"] = "오리지널"
    L["The Burning Crusade"] = "불타는 성전"
    L["Wrath of the Lich King"] = "리치 왕의 분노"
    L["Cataclysm"] = "대격변"
    L["Mists of Pandaria"] = "판다리아의 안개"
    L["Other"] = "기타"

-- 简体中文
elseif locale == "zhCN" then
    L["Mill Helper"] = "|cffd597ffMill Helper|r"
    L["NeedAtLeast5Herbs"] = "研磨需要至少 5 株草药"
    L["UI not initialized"] = "界面未初始化"
    L["Left click to toggle the Mill Helper UI, right click for this info."] = "左键: 打开/关闭 Mill Helper 界面，右键: 信息"
    L["Left click: Toggle UI"] = "左键: 打开/关闭界面"
    L["Right click: Info"] = "右键: 信息"
    L["Classic"] = "经典旧世"
    L["The Burning Crusade"] = "燃烧的远征"
    L["Wrath of the Lich King"] = "巫妖王之怒"
    L["Cataclysm"] = "大地的裂变"
    L["Mists of Pandaria"] = "熊猫人之谜"
    L["Other"] = "其他"

-- 繁體中文
elseif locale == "zhTW" then
    L["Mill Helper"] = "|cffd597ffMill Helper|r"
    L["NeedAtLeast5Herbs"] = "碾磨需要至少 5 株草藥"
    L["UI not initialized"] = "介面未初始化"
    L["Left click to toggle the Mill Helper UI, right click for this info."] = "左鍵: 開啟/關閉 Mill Helper 介面，右鍵: 資訊"
    L["Left click: Toggle UI"] = "左鍵: 開啟/關閉介面"
    L["Right click: Info"] = "右鍵: 資訊"
    L["Classic"] = "經典舊世"
    L["The Burning Crusade"] = "燃燒的遠征"
    L["Wrath of the Lich King"] = "巫妖王之怒"
    L["Cataclysm"] = "浩劫與重生"
    L["Mists of Pandaria"] = "潘達利亞之謎"
    L["Other"] = "其他"

-- Default: Inglés
else
    L["Mill Helper"] = "|cffd597ffMill Helper|r"
    L["NeedAtLeast5Herbs"] = "Need at least 5 herbs to mill"
    L["UI not initialized"] = "UI not initialized"
    L["Left click to toggle the Mill Helper UI, right click for this info."] = "Left click: Toggle the Mill Helper UI, right click: show info"
    L["Left click: Toggle UI"] = "Left click: Toggle UI"
    L["Right click: Info"] = "Right click: Info"
    L["Classic"] = "Classic"
    L["The Burning Crusade"] = "The Burning Crusade"
    L["Wrath of the Lich King"] = "Wrath of the Lich King"
    L["Cataclysm"] = "Cataclysm"
    L["Mists of Pandaria"] = "Mists of Pandaria"
    L["Other"] = "Other"
end