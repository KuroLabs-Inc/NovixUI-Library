# NovixUI

A modern, sleek, and fully customizable Roblox UI Library designed for script hubs and executors. Built with smooth animations, draggable windows, and a professional dark theme.

![Version](https://img.shields.io/badge/version-1.0.0-blue)
![Platform](https://img.shields.io/badge/platform-Roblox-orange)
![License](https://img.shields.io/badge/license-MIT-green)

---

## Features

- **Modern Dark Theme** — Clean, professional aesthetic with customizable accent colors
- **Draggable & Resizable Window** — Smooth drag-and-drop with animated resizing
- **Tab System** — Organized navigation with icons and animated indicators
- **Collapsible Sections** — Expandable/collapsible content areas with smooth transitions
- **Rich Components** — Buttons, Toggles, Sliders, Inputs, Dropdowns, and Paragraphs
- **Notification System** — Built-in toast notifications with auto-dismiss
- **Destroy Confirmation** — Safe UI destruction with a confirmation dialog (Yes/No)
- **Toggle Button** — Floating open/close button with zoom and fade animations
- **Multi-select Dropdowns** — Searchable dropdowns with single or multi-selection support
- **Responsive Text** — Auto-wrapping text that adjusts component heights dynamically

---

## Installation

Load the library into your Roblox script:

```lua
local NovixUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/KuroLabs-Inc/NovixUI-Library/refs/heads/main/NovixUI_Library.lua"))()
```

Or copy the entire `NovixUI_Library.lua` source into your script.

---

## Quick Start

```lua
local NovixUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/KuroLabs-Inc/NovixUI-Library/refs/heads/main/NovixUI_Library.lua"))()

-- Create the main GUI
local Window = NovixUI:MakeGui({
    NameHub = "NovixUI",
    Description = "My Cool Script",
    Color = Color3.fromRGB(255, 0, 255),  -- Accent color
    ["Tab Width"] = 120,
    Image = "17681429652"  -- rbxassetid for toggle button icon
})

-- Create a Tab
local Tabs = Window:CreateTab({
    Name = "Main",
    Icon = "rbxassetid://16932740082"
})

-- Add a Section
local Section = Tabs:AddSection("General")

-- Add a Button
Section:AddButton({
    Title = "Click Me",
    Content = "This is a button description",
    Icon = "rbxassetid://16932740082",
    Callback = function()
        print("Button clicked!")
    end
})

-- Add a Toggle
local Toggle = Section:AddToggle({
    Title = "Auto Farm",
    Title2 = "Feature",
    Content = "Automatically farms resources",
    Default = false,
    Callback = function(Value)
        print("Toggle:", Value)
    end
})

-- Add a Slider
local Slider = Section:AddSlider({
    Title = "WalkSpeed",
    Content = "Adjust your walk speed",
    Min = 16,
    Max = 200,
    Default = 16,
    Increment = 1,
    Callback = function(Value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
    end
})

-- Add an Input
local Input = Section:AddInput({
    Title = "Player Name",
    Content = "Enter a player's username",
    Default = "",
    Callback = function(Value)
        print("Input:", Value)
    end
})

-- Add a Dropdown
local Dropdown = Section:AddDropdown({
    Title = "Select Weapon",
    Content = "Choose your weapon",
    Multi = false,
    Options = {"Sword", "Gun", "Bow", "Staff"},
    Default = "Sword",
    Callback = function(Value)
        print("Selected:", Value)
    end
})

-- Add a Paragraph
local Paragraph = Section:AddParagraph({
    Title = "Information",
    Content = "This is a paragraph component that supports long text and automatic wrapping."
})

-- Send a Notification
NovixUI:MakeNotify({
    Title = "NovixUI",
    Description = "Loaded",
    Content = "Script has been successfully loaded!",
    Color = Color3.fromRGB(255, 0, 255),
    Time = 0.5,
    Delay = 5
})
```

---

## API Reference

### `NovixUI:MakeGui(GuiConfig)`

Creates the main UI window.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `NameHub` | `string` | `"NovixUI"` | Title displayed in the top bar |
| `Description` | `string` | `"NovixUI | Redesigned UI Library"` | Subtitle/description text |
| `Color` | `Color3` | `Color3.fromRGB(255, 0, 255)` | Primary accent color |
| `Tab Width` | `number` | `120` | Width of the left sidebar tab panel |
| `Image` | `string` | `""` | rbxassetid for the floating toggle button icon |
| `Theme` | `string` | `nil` | Optional rbxassetid for a background image |

**Returns:** `GuiFunc` object

#### `GuiFunc` Methods

| Method | Description |
|--------|-------------|
| `GuiFunc:DestroyGui()` | Destroys the entire UI including the toggle button |
| `GuiFunc:ToggleUI()` | Creates the floating toggle button (called automatically) |

---

### `NovixUI:MakeNotify(NotifyConfig)`

Displays a toast notification.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `Title` | `string` | `"NovixUI"` | Notification title |
| `Description` | `string` | `"Notification"` | Short description |
| `Content` | `string` | `"Content"` | Main message body |
| `Color` | `Color3` | `Color3.fromRGB(255, 0, 255)` | Accent color |
| `Time` | `number` | `0.5` | Animation duration |
| `Delay` | `number` | `5` | Auto-dismiss delay (seconds) |

**Returns:** `NotifyFunction` object with `Close()` method

---

### `Tabs:CreateTab(TabConfig)`

Creates a new tab in the sidebar.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `Name` | `string` | `"Tab"` | Tab display name |
| `Icon` | `string` | `""` | rbxassetid for tab icon |

**Returns:** `Sections` object

---

### `Sections:AddSection(Title)`

Creates a collapsible section within a tab.

| Parameter | Type | Description |
|-----------|------|-------------|
| `Title` | `string` | Section header text |

**Returns:** `Items` object

---

### `Items:AddButton(ButtonConfig)`

Adds a clickable button.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `Title` | `string` | `"Title"` | Button title |
| `Content` | `string` | `"Content"` | Description text |
| `Icon` | `string` | `"rbxassetid://16932740082"` | Button icon |
| `Callback` | `function` | `function() end` | Function called on click |

**Returns:** `ButtonFunc` object

---

### `Items:AddToggle(ToggleConfig)`

Adds a toggle switch.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `Title` | `string` | `"Title"` | Main label |
| `Title2` | `string` | `""` | Secondary label (optional, increases height) |
| `Content` | `string` | `"Content"` | Description text |
| `Default` | `boolean` | `false` | Initial state |
| `Callback` | `function` | `function() end` | Called with `(Value: boolean)` |

**Returns:** `ToggleFunc` object with `Set(Value)` and `Value` property

---

### `Items:AddSlider(SliderConfig)`

Adds a numeric slider.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `Title` | `string` | `"Slider"` | Slider label |
| `Content` | `string` | `"Content"` | Description text |
| `Min` | `number` | `0` | Minimum value |
| `Max` | `number` | `100` | Maximum value |
| `Default` | `number` | `50` | Initial value |
| `Increment` | `number` | `1` | Step size |
| `Callback` | `function` | `function() end` | Called with `(Value: number)` |

**Returns:** `SliderFunc` object with `Set(Value)` and `Value` property

---

### `Items:AddInput(InputConfig)`

Adds a text input field.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `Title` | `string` | `"Title"` | Input label |
| `Content` | `string` | `"Content"` | Description text |
| `Default` | `string` | `""` | Initial text |
| `Callback` | `function` | `function() end` | Called on focus lost with `(Value: string)` |

**Returns:** `InputFunc` object with `Set(Value)` and `Value` property

---

### `Items:AddDropdown(DropdownConfig)`

Adds a dropdown selector.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `Title` | `string` | `"Title"` | Dropdown label |
| `Content` | `string` | `"Content"` | Description text |
| `Multi` | `boolean` | `false` | Enable multi-selection |
| `Options` | `table` | `{}` | List of options `{"A", "B", "C"}` |
| `Default` | `string/table` | `nil` | Default selection |
| `Callback` | `function` | `function() end` | Called on selection change |

**Returns:** `DropdownFunc` object with:
- `Set(Value)` — Set selection programmatically
- `AddOption(Name)` — Add a new option
- `Refresh(List, Selecting)` — Replace all options
- `Clear()` — Remove all options
- `Value` — Current selection

---

### `Items:AddParagraph(ParagraphConfig)`

Adds a text paragraph.

| Property | Type | Default | Description |
|----------|------|---------|-------------|
| `Title` | `string` | `"Title"` | Paragraph title |
| `Content` | `string` | `"Content"` | Body text (auto-wraps) |

**Returns:** `ParagraphFunc` object with `SetContent(content)` method

---

## Window Controls

| Control | Action |
|---------|--------|
| **Drag** | Grab the top bar to move the window |
| **Resize** | Drag the bottom-right corner handle |
| **Maximize** | Click the square icon to toggle fullscreen |
| **Minimize** | Click the dash icon to hide the window (use toggle button to reopen) |
| **Close (X)** | Click the X icon to show the **Destroy Confirmation** dialog |
| **Toggle Button** | Floating circular button to show/hide the UI |

### Destroy Confirmation Dialog

When you click the **X** button, a confirmation dialog appears:

- **Title:** `NovixUI Hub`
- **Message:** `Wanna Destroy The UI?`
- **Yes** → Completely destroys the UI and the toggle button
- **No** → Closes the dialog and keeps the UI open

---

## Theming

### Custom Accent Color

```lua
local Window = NovixUI:MakeGui({
    Color = Color3.fromRGB(0, 170, 255)  -- Blue accent
})
```

### Background Image Theme

```lua
local Window = NovixUI:MakeGui({
    Theme = "1234567890"  -- rbxassetid for background image
})
```

---

## Example: Complete Script Hub

```lua
local NovixUI = loadstring(game:HttpGet("YOUR_URL"))()

local Window = NovixUI:MakeGui({
    NameHub = "NovixUI",
    Description = "Game Hub",
    Color = Color3.fromRGB(138, 43, 226),
    ["Tab Width"] = 130,
    Image = "17681429652"
})

-- Combat Tab
local Combat = Window:CreateTab({Name = "Combat", Icon = "rbxassetid://16932740082"})
local CombatSec = Combat:AddSection("Combat Settings")

CombatSec:AddToggle({
    Title = "Aimbot",
    Content = "Lock onto nearest target",
    Default = false,
    Callback = function(v) print("Aimbot:", v) end
})

CombatSec:AddSlider({
    Title = "FOV",
    Content = "Field of view radius",
    Min = 50, Max = 500, Default = 100, Increment = 10,
    Callback = function(v) print("FOV:", v) end
})

-- Player Tab
local Player = Window:CreateTab({Name = "Player", Icon = "rbxassetid://16932740082"})
local PlayerSec = Player:AddSection("Character")

PlayerSec:AddSlider({
    Title = "WalkSpeed",
    Min = 16, Max = 200, Default = 16, Increment = 1,
    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v
    end
})

PlayerSec:AddSlider({
    Title = "JumpPower",
    Min = 50, Max = 300, Default = 50, Increment = 5,
    Callback = function(v)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = v
    end
})

-- Settings Tab
local Settings = Window:CreateTab({Name = "Settings", Icon = "rbxassetid://16932740082"})
local SettingsSec = Settings:AddSection("Configuration")

SettingsSec:AddDropdown({
    Title = "Theme",
    Content = "Select UI theme",
    Options = {"Default", "Dark", "Purple", "Red"},
    Default = "Default",
    Callback = function(v) print("Theme:", v) end
})

SettingsSec:AddButton({
    Title = "Destroy UI",
    Content = "Click X button on top bar instead for confirmation dialog",
    Callback = function()
        -- Or use: Window:DestroyGui()
    end
})

-- Welcome notification
NovixUI:MakeNotify({
    Title = "NovixUI",
    Description = "Welcome",
    Content = "Script loaded successfully! Press the toggle button or use the X button to close.",
    Color = Color3.fromRGB(138, 43, 226),
    Time = 0.5,
    Delay = 6
})
```

---

## Credits

- *RkpyDevelopment Team's Owner:* *TheRkpyYT*
- **YouTube RDT's Owner:** [YouTube Channel](https://youtube.com/@therkpyyt)
- **Discord:** *therkpyyt_*
- **Discord II:** *therkpyyt2_*
- **Designed Library:** RkpyDevelopment Team
- **Platform:** Roblox (LuaU)

---

## License

This project is provided as-is for educational and development purposes. Use responsibly and in accordance with Roblox's Terms of Service.

---

<p align="center">
  <b>NovixUI</b> — Modern Roblox UI Library
</p>
