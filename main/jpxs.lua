local version = 11

--- JPXS backend system

local json = require 'main.json'

local worker
local workerPending = 0

local requestQueue = {}
local key = nil
local serverId = nil
local enabled = false

local awaitingPlayers = {}
local elapsed = 0

local startTime = os.clock()

local webserverconfig = {
    host = 'https://jpxs.international',
    pingPath = '/api/data/ping',
    initPath = '/api/data/init',
    joinPath = '/api/data/join',
    pingInterval = 15,
    maximumWaitTime = 120
}

local serverConfig = {
    icon = '',
    description = '',
    link = '',
}

---@class JPXS
jpxs = {}

---@param text string print logs
function jpxs:print(text)
    print('\27[30;1m[' .. os.date('%X') .. ']\27[0m \27[38;5;202m[JPXS]\27[0m ' .. text)
end

---@param method string
---@param scheme string
---@param path string
---@param headers table<string, string>
---@param body? string
---@param contentType? string
---@param callback fun(response?: HTTPResponse)
local function request(method, scheme, path, headers, body, contentType, callback)
    local index = #requestQueue + 1

    local serialized = ('znssn'):pack(method, index, scheme, path, table.numElements(headers))
    for key, value in pairs(headers) do
        serialized = serialized .. ('ss'):pack(key, value)
    end

    if method == 'POST' then
        serialized = serialized .. ('ss'):pack(body, contentType)
    end

    table.insert(requestQueue, {
        serialized = serialized,
        callback = callback,
    })

    workerPending = workerPending + 1
    worker:sendMessage(serialized)
end

---@param message string
local function handleMessage(message)
    local callbackIndex, hasResponse, pos = ('ni1'):unpack(message)

    ---@type HTTPResponse?
    local res
    if hasResponse == 1 then
        res = {}
        local status, body, numHeaders
        status, body, numHeaders, pos = ('nsn'):unpack(message, pos)
        res.status = status
        res.body = body

        local headers = {}
        for _ = 1, numHeaders do
            local key, value
            key, value, pos = ('ss'):unpack(message, pos)
            headers[key] = value
        end

        res.headers = headers
    end

    local callback = requestQueue[callbackIndex].callback
    if callback then
        callback(res)
    end

    requestQueue[callbackIndex] = nil
end

---Send an HTTP(S) GET request asynchronously.
---@param scheme string The hostname of the server to send the request to, with optional protocol and port. Ex. google.com, https://google.com, https://google.com:443
---@param path string The path to request from the server.
---@param headers table<string, string> The table of request headers.
---@param callback fun(response?: HTTPResponse) The function to be called when the response is received or there was an error.
local function get(scheme, path, headers, callback)
    request('GET', scheme, path, headers, nil, nil, callback)
end

---Send an HTTP(S) POST request asynchronously.
---@param scheme string The hostname of the server to send the request to, with optional protocol and port. Ex. google.com, https://google.com, https://google.com:443
---@param path string The path to request from the server.
---@param headers table<string, string> The table of request headers.
---@param body string The request body.
---@param contentType string The request body MIME type.
---@param callback fun(response?: HTTPResponse) The function to be called when the response is received or there was an error.
local function post(scheme, path, headers, body, contentType, callback)
    request('POST', scheme, path, headers, body, contentType, callback)
end

---@param file string The path to the JPXS key file.
function jpxs:auth(file)
    local f = io.open(file, 'r')
    if f then
        key = f:read('*all')
        f:close()
        enabled = true
    else
        warn('No JPXS key found. Please contact gart to get one.')
        warn('Join the discord at https://gart.sh/jpxs')
    end

    --- Init

    local initBody = {
        name = server.name,
        icon = serverConfig.icon,
        description = serverConfig.description,
        link = serverConfig.link,
        port = server.port,
        gameType = server.type,
        version = version,
        bans = {}
    }

    for _, acc in ipairs(accounts.getAll()) do
        if acc.banTime > 0 then
            table.insert(initBody.bans,
                { name = acc.name, subRosaId = acc.subRosaID })
        end
    end

    hook.run('PreJPXSInit', initBody)

    initBody.auth = key
    local initString = json.encode(initBody)

    post(webserverconfig.host, webserverconfig.initPath, {},
        initString, 'application/json', function(httpRequestReturn)
            if not enabled then return end
            if (not httpRequestReturn or httpRequestReturn.status ~= 200) then
                jpxs:print('Failed to load, init failed. Your key may be invalid.')
                return
            end
            local body = json.decode(httpRequestReturn.body)
            serverId = body.serverId

            if body.status and body.status == 'error' then
                jpxs:print('error: ' .. body.error)
                return
            end

            if not serverId then
                jpxs:print('Failed to load, init failed. Your key may be invalid.')
                return
            end

            jpxs:print('Init successful! Server ID: ' .. serverId)

            if body.updateAvailable then
                jpxs:print("New update available! Current: " .. version ..
                    " => Latest: " .. body.latestVersion)
                jpxs:print("Get it at https://jpxs.international/download")
            end
        end)
end

function jpxs:handleIncomingPlayers()
    for index, _ in pairs(awaitingPlayers) do
        local ply = players[index]

        if ply.isBot then
            awaitingPlayers[index] = nil
            return
        end

        local body = {
            auth = key,
            serverId = serverId,
            name = ply.name,
            phoneNumber = ply.phoneNumber,
            steamId = ply.account.steamID,
            gameId = ply.account.subRosaID,
            hashedIp = ply.connection.address,
            gender = ply.gender,
            head = ply.head,
            skinColor = ply.skinColor,
            hairColor = ply.hairColor,
            hair = ply.hair,
            eyeColor = ply.eyeColor
        }

        ply.data.jpxsDataReady = false

        local postString = json.encode(body)

        post(webserverconfig.host, webserverconfig.joinPath,
            {}, postString, 'application/json', function(res)
                if (not res or res.status ~= 200) then return end

                local body = json.decode(res.body)

                ply.data.isVpn = body.isVpn
                ply.data.country = body.country
                ply.data.countryCode = body.countryCode
                ply.data.timeZone = body.timeZone

                ply.data.nameHistory = body.nameHistory
                ply.data.alts = body.alts

                ply.data.jpxsDataReady = true

                hook.run('JPXSDataReady', ply)
            end)

        awaitingPlayers[index] = nil
    end
end

--- Send a ping to the JPXS server.
function jpxs:ping()
    if not enabled then return end
    if not serverId then return end

    local body = {
        players = {},
        uptime = math.floor(os.clock() - startTime),
        serverId = serverId
    }

    for _, ply in pairs(players.getNonBots()) do
        table.insert(body.players, {
            subRosaId = ply.account.subRosaID,
            team = ply.team,
            corp = ply.corporateRating,
            money = ply.money
        })
    end

    hook.run('PreJPXSPing', body)

    body.auth = key

    local postString = json.encode(body)
    post(webserverconfig.host, webserverconfig.pingPath,
        {}, postString, 'application/json')
end

function jpxs:setInfo(info)
    serverConfig = info    
end

hook.add(
    'Logic', 'main.jpxs',
    function()
        -- worker management

        if workerPending ~= 0 then
            while true do
                local message = worker:receiveMessage()
                if not message then
                    break
                end

                handleMessage(message)
                workerPending = workerPending - 1
            end
        end

        --- ping management

        if not enabled then return end
        elapsed = elapsed + (1 / server.TPS)

        if elapsed >= webserverconfig.pingInterval then
            elapsed = 0
            jpxs:ping()
        end


        --- player management
        jpxs:handleIncomingPlayers()
    end
)

hook.add("PostPlayerCreate", "main.jpxs", function(ply)
    if not enabled then return end
    awaitingPlayers[ply.index] = true
end)

-- start needed threads
worker = Worker.new('main/jpxs.worker.lua')
jpxs:auth(".jpxs.key")
