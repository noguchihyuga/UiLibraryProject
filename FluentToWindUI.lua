local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
local cac = {}

function cac:CreateWindow(v)
    local lib = {}
    local Window = WindUI:CreateWindow({
        Title = v.Title,
        Author = v.SubTitle,
        Folder = "Noguchi",
        Size = v.Size or UDim2.fromOffset(580, 460),
        Transparent = true,
        Theme = "Dark",
        SideBarWidth = 200,
        HideSearchBar = true,
        ScrollBarEnabled = false,
    })
    function lib:Notify(vv)
        WindUI:Popup({
            Title = vv.Title,
            Content = vv.Content,
        })
    end
    function lib:AddTab(v2)
        local t = {}
        local Tab = Window:Tab({
            Title = v2.Title,
        })
        function t:AddParagraph(v3)
            local Paragraph = Tab:Paragraph({
                Title = v3.Title ,
                Desc = v3.Content,
            })
            return Paragraph
        end
        function t:AddToggle(tn)
            local pp = {}
            
            function pp:OnChanged(vl)
                local Toggle = Tab:Toggle({
                    Title = tn.Title,
                    Desc = tn.Description,
                    Default = tn.Default,
                    Callback = vl
                })
            end
            return pp
        end
        function t:AddDropdown(v2, v)
            local gg = {}
            function gg:OnChanged(v3)
                local Dropdown = Tab:Dropdown({
                    Title = v.Title,
                    Values = v.Values,
                    Value = typeof(v.Default) == "number" and {v.Values[v.Default]} or {v.Default},
                    Multi = v.Multi,
                    Callback = v3
                })
            end
            return gg
        end
        function t:AddButton(v)
            local Button = Tab:Button({
                Title = v.Title,
                Desc = v.Description,
                Callback = v.Callback
            })
        end
        function t:AddSection(v)
            local Section = Tab:Section({ 
                Title = v,
                TextXAlignment = "Left",
                TextSize = 17, -- Default Size
            })
        end
        function t:AddSlider(gg, v)
            local gg = {}
            local Slider = Tab:Slider({
                Title = v.Title,
                Step = v.Rounding,
                Value = {
                    Min = v.Min,
                    Max = v.Max,
                    Default = v.Default,
                },
                Callback = v.Callback
            })
            return Slider
        end
        function t:AddInput(gg, v)
            local Input = Tab:Input({
                Title = v.Title,
                Value = v.Default,
                Type = "Input",
                Placeholder = v.Placeholder,
                Callback = v.Callback
            })
        end
        return t
    end
    return lib
end
return cac
