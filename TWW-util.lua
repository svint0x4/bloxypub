-- Load Rayfield
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
    Name = "svint0x4 tww utility",
    LoadingTitle = "svint0x4's tww utility",
    LoadingSubtitle = "super fucking alpha very limit yes",
    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "ShiftToggleWidget"
    },
    Discord = {
        Enabled = false,
        Invite = "noinvitelink",
        RememberJoins = false
    },
    KeySystem = false,
    StartMinimized = true
})

local titleBar = Instance.new("ScreenGui", game.CoreGui)
titleBar.Name = "TitleBarWidget"

local widgetFrame = Instance.new("Frame", titleBar)
widgetFrame.Size = UDim2.new(0, 200, 0, 30)
widgetFrame.Position = UDim2.new(0, 10, 0, 10)
widgetFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
widgetFrame.BackgroundTransparency = 0.5

local titleLabel = Instance.new("TextLabel", widgetFrame)
titleLabel.Size = UDim2.new(1, 0, 1, 0)
titleLabel.Text = "svint0x4 tww utility"
titleLabel.TextColor3 = Color3.new(1, 1, 1)
titleLabel.TextScaled = true
titleLabel.BackgroundTransparency = 1

widgetFrame.Active = true
widgetFrame.Draggable = true

local toggleButton = Instance.new("TextButton", widgetFrame)
toggleButton.Size = UDim2.new(0, 100, 0, 30)
toggleButton.Position = UDim2.new(1, -100, 0, 0)
toggleButton.Text = "Open Menu"
toggleButton.TextColor3 = Color3.new(1, 1, 1)
toggleButton.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)

toggleButton.MouseButton1Click:Connect(function()
    if Window.Minimized then
        Window:Unminimize()
        toggleButton.Text = "Close Menu"
    else
        Window:Minimize()
        toggleButton.Text = "Open Menu"
    end
end)

local Tab = Window:CreateTab("utilities", 4483362458)

local Section = Tab:CreateSection("toggles")

local EnableSprintToggle = Tab:CreateToggle({
    Name = "enable automatic sprint",
    CurrentValue = false,
    Flag = "EnableSprint",
    Callback = function(Value)
        sprintEnabled = Value
        wasSprintEnabled = Value

        local notificationContent = sprintEnabled and "automatic sprint [ enabled ]" or "automatic sprint [ disabled ]"
        Rayfield:Notify({
            Title = "infos",
            Content = notificationContent,
            Duration = 3.5,
            Image = 4483362458
        })
    end,
})

local SprintKeybind = Tab:CreateKeybind({
    Name = "automatic sprint toggle",
    CurrentKeybind = "Insert",
    HoldToInteract = false,
    Flag = "SprintKeybind",
    Callback = function()
        sprintEnabled = not sprintEnabled
        wasSprintEnabled = sprintEnabled

        local notificationContent = sprintEnabled and "automatic sprint [ enabled ]" or "automatic sprint [ disabled ]"
        Rayfield:Notify({
            Title = "infos",
            Content = notificationContent,
            Duration = 3.5,
            Image = 4483362458
        })
    end,
})
