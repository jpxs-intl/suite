---@type Plugin
local plugin = ...
plugin.name = 'jpxsUploader'
plugin.author = 'jdb, FieriFerret, gart, Jpsh, noche'
plugin.description = 'Streams player info to the JPXS database'

---@type JPXS
local jpxs = require 'main.jpxs'

-- Commands

plugin.commands["/namehist"] = {
    info = "Check the previous names of a given user",
    usage = "name",
    call = function(ply, _, args)
        assert(#args >= 1, "usage")
        local option = string.lower(args[1])
        local target = findOnePlayer(option)
        assert(target, "Invalid player")
        if target and target.data.nameHistory ~= nil then
            ply:sendMessage(string.format("%s's name history:", target.name))
            for i = 1, #target.data.nameHistory do
                ply:sendMessage(string.format("Name %s : %s", i,
                    target.data.nameHistory[i]))
            end
        end
    end
}

plugin.commands["/isvpn"] = {
    info = "Check if a given user is using a VPN",
    usage = "name",
    canCall = function(ply) return ply.isAdmin or ply.isConsole end,
    call = function(ply, _, args)
        assert(#args >= 1, "usage")
        local option = string.lower(args[1])
        local target = findOnePlayer(option)
        assert(target, "Invalid player")
        if not target or not target.data.jpxsDataReady then
            ply:sendMessage("Data not ready yet, try again in a few seconds")
            return
        end
        if target and target.data.isVpn ~= nil then
            ply:sendMessage(string.format("%s %s using a VPN | Country: %s",
                target.name, target.data.isVpn and
                "is" or "is not",
                target.data.country))
        end
    end
}
