local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 15,["13"] = 17,["14"] = 17,["16"] = 22,["18"] = 25,["19"] = 25,["20"] = 26,["21"] = 26,["22"] = 25,["25"] = 24,["26"] = 18,["27"] = 31,["28"] = 31,["29"] = 48,["30"] = 41,["31"] = 42,["32"] = 44,["33"] = 45,["34"] = 46,["35"] = 49,["37"] = 50,["38"] = 50,["39"] = 51,["40"] = 51,["41"] = 50,["44"] = 48,["49"] = 56,["53"] = 59,["54"] = 60,["55"] = 61,["56"] = 62,["57"] = 63,["58"] = 64,["60"] = 59,["61"] = 68,["62"] = 69,["63"] = 70,["64"] = 71,["65"] = 72,["67"] = 68,["68"] = 76,["69"] = 77,["72"] = 80,["73"] = 81,["74"] = 83,["76"] = 84,["77"] = 84,["78"] = 85,["79"] = 86,["80"] = 87,["81"] = 88,["83"] = 84,["87"] = 76,["88"] = 32,["89"] = 33,["90"] = 34,["91"] = 35,["92"] = 36,["93"] = 36,["94"] = 36,["95"] = 36,["96"] = 36,["97"] = 36,["98"] = 36,["99"] = 35,["100"] = 35,["101"] = 35,["102"] = 95,["103"] = 95,["104"] = 95});
local ____exports = {}
local ____event = require("event")
local Event = ____event.Event
local ____quickbar = require("autohammer.quickbar")
local AHQuickbar = ____quickbar.AHQuickbar
local QUICKBAR_SIZE = 10
local Quickbar = __TS__Class()
Quickbar.name = "Quickbar"
function Quickbar.prototype.____constructor(self)
    self.items = {}
    do
        local i = 0
        while i < QUICKBAR_SIZE do
            local ____self_items_0 = self.items
            ____self_items_0[#____self_items_0 + 1] = INVALID_ENTITYID
            i = i + 1
        end
    end
end
Quickbar.SCHEMA = Schema.new({SchemaField.new("items", DataTypes.ARRAY, DataTypes.ENTITY)})
local QuickbarComponent = __TS__Class()
QuickbarComponent.name = "QuickbarComponent"
function QuickbarComponent.prototype.____constructor(self, quickbar)
    self.quickbars = {}
    self.activeBar = 0
    self.onActiveChange = __TS__New(Event)
    self.onActiveIndexChange = __TS__New(Event)
    self.onItemChange = __TS__New(Event)
    self.size = quickbar.size
    do
        local i = 0
        while i < self.size do
            local ____self_quickbars_1 = self.quickbars
            ____self_quickbars_1[#____self_quickbars_1 + 1] = __TS__New(Quickbar)
            i = i + 1
        end
    end
end
__TS__SetDescriptor(
    QuickbarComponent.prototype,
    "active",
    {get = function(self)
        return self.quickbars[self.activeBar + 1]
    end},
    true
)
function QuickbarComponent.prototype.setActiveBar(self, index)
    if index ~= self.activeBar then
        self:setActiveItem()
        local previous = self.activeBar
        self.activeBar = index
        self.onActiveChange:invoke(self.active, previous, index)
    end
end
function QuickbarComponent.prototype.setActiveItem(self, index)
    if index ~= self.activeItem then
        local previous = self.activeItem
        self.activeItem = index
        self.onActiveIndexChange:invoke(self.active, previous, index)
    end
end
function QuickbarComponent.prototype.set(self, quickbarIndex, index, entityID)
    if not AHQuickbar:QuickbarSet(quickbarIndex, index, entityID) then
        return
    end
    self.quickbars[quickbarIndex + 1].items[index + 1] = entityID
    self.onItemChange:invoke(self.quickbars[quickbarIndex + 1], index, entityID)
    if entityID ~= INVALID_ENTITYID then
        do
            local i = 0
            while i < #self.quickbars[quickbarIndex + 1].items do
                local item = self.quickbars[quickbarIndex + 1].items[i + 1]
                if item == entityID and index ~= i then
                    self.quickbars[quickbarIndex + 1].items[i + 1] = INVALID_ENTITYID
                    self.onItemChange:invoke(self.quickbars[quickbarIndex + 1], i, INVALID_ENTITYID)
                end
                i = i + 1
            end
        end
    end
end
QuickbarComponent.type = "quickbar"
QuickbarComponent.cid = hash.hash_str32(QuickbarComponent.type)
QuickbarComponent.serialization = SERIALIZATION_SCRIPT
QuickbarComponent.SCHEMA = Schema.new({
    SchemaField.new(
        "quickbars",
        DataTypes.ARRAY,
        DataTypes.COMPLEX,
        function()
            return __TS__New(Quickbar)
        end
    ),
    SchemaField.new("activeBar", DataTypes.UINT8)
})
____exports.QuickbarComponent = QuickbarComponent
____exports.component = QuickbarComponent
____exports.Quickbar = Quickbar
return ____exports
