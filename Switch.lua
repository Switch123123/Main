local repository = "https://raw.githubusercontent.com/Switch123123/main/main/"
local function Script(NomeDoScript)
    pcall(function()
        repeat
            local s, r = pcall(function()
                loadstring(game:HttpGet(repository .. NomeDoScript))
            end)
            if not s then
                aparecer(function()
                    error(r)
                end)
            end
    end)
end

local Id = game.PlaceId
local GameId = game.GameId
local PlaceId = {
    ["AnimeFighters"] = {6299805723, 9141645420},
}
if table.find(PlaceIds["AnimeFighters"], Id) then
    Script("AfsDupe.lua")
end
