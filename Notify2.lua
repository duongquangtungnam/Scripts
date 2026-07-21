repeat wait() until game:IsLoaded() 
and game.Players.LocalPlayer:FindFirstChild("DataLoaded")
repeat wait(1)
until game.Players.LocalPlayer.Team ~= nil
and game.Players.LocalPlayer.Character
and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
local Scripts = {
    "https://pastefy.app/hP8LGdie/raw",
    "https://raw.githubusercontent.com/duongquangtungnam/Scripts/refs/heads/main/NotifyBloxFruit.lua",
}
for _, url in pairs(Scripts) do
    task.spawn(function()
        pcall(function()
            local Success, Response = pcall(function()
                return game:HttpGet(url)
            end)
            if Success and Response and #Response > 10 then
                local Loaded, Err = pcall(function()
                    loadstring(Response)()
                end)
                if not Loaded then
                    warn("Load Error:", url, Err)
                end
            else
                warn("Http Error:", url)
            end
        end)
    end)
    task.wait(1)
end
