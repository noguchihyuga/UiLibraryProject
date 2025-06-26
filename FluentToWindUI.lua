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
        function t:AddToggle(clm,tn)
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
        function t:AddDropdown(v2, v6)
            local gg = {}
            function gg:OnChanged(v3)
                local Dropdown = Tab:Dropdown({
                    Title = v6.Title,
                    Values = v6.Values,
                    Value = typeof(v6.Default) == "number" and {v6.Values[v6.Default]} or {v6.Default},
                    Multi = v6.Multi,
                    Callback = v3
                })
            end
            return gg
        end
        function t:AddButton(v5)
            local Button = Tab:Button({
                Title = v5.Title,
                Desc = v5.Description,
                Callback = v5.Callback
            })
        end
        function t:AddSection(v5)
            local Section = Tab:Section({ 
                Title = v5,
                TextXAlignment = "Left",
                TextSize = 17, -- Default Size
            })
        end
        function t:AddSlider(gg, v5)
            local gg = {}
            local Slider = Tab:Slider({
                Title = v5.Title,
                Step = v5.Rounding,
                Value = {
                    Min = v5.Min,
                    Max = v5.Max,
                    Default = v5.Default,
                },
                Callback = v5.Callback
            })
            return Slider
        end
        function t:AddInput(gg, v5)
            local Input = Tab:Input({
                Title = v5.Title,
                Value = v5.Default,
                Type = "Input",
                Placeholder = v5.Placeholder,
                Callback = v5.Callback
            })
        end
        return t
    end
    return lib
end
return cac
