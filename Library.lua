-- no docs pls read - this is open source.
-- may anh lon dung luc github em va share (open source r ma) no ko ngau dau huhu

local UserInputService = game:GetService("UserInputService")

function MakeSlider(knob, track, minValue, maxValue, onChanged)
	-- bro cre chat gpt, i am not skill 💔
	minValue = minValue or 0
	maxValue = maxValue or 100
	local dragging = false

	local function update(mouseX)
		local absPos = track.AbsolutePosition.X
		local absSize = track.AbsoluteSize.X
		local knobSize = knob.AbsoluteSize.X

		local relativeX = math.clamp(mouseX - absPos, 0, absSize)
		local percent = relativeX / absSize

		knob.Position = UDim2.new(0, relativeX - knobSize / 2, 0.5, -knob.AbsoluteSize.Y / 2 + 5)

		local value = math.floor(minValue + (maxValue - minValue) * percent + 0.5)

		if onChanged then
			onChanged(value)
		end
	end

	knob.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = true
		end
	end)

	UserInputService.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragging = false
		end
	end)

	UserInputService.InputChanged:Connect(function(input)
		if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
			update(input.Position.X)
		end
	end)
end



local function MakeDraggable(topbarobject, object)
	local Dragging = nil
	local DragInput = nil
	local DragStart = nil
	local StartPosition = nil

	local function Update(input)
		local Delta = input.Position - DragStart
		local pos =
			UDim2.new(
				StartPosition.X.Scale,
				StartPosition.X.Offset + Delta.X,
				StartPosition.Y.Scale,
				StartPosition.Y.Offset + Delta.Y
			)
		object.Position = pos
	end

	topbarobject.InputBegan:Connect(
		function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
				Dragging = true
				DragStart = input.Position
				StartPosition = object.Position

				input.Changed:Connect(
					function()
						if input.UserInputState == Enum.UserInputState.End then
							Dragging = false
						end
					end
				)
			end
		end
	)

	topbarobject.InputChanged:Connect(
		function(input)
			if
				input.UserInputType == Enum.UserInputType.MouseMovement or
				input.UserInputType == Enum.UserInputType.Touch
			then
				DragInput = input
			end
		end
	)

	UserInputService.InputChanged:Connect(
		function(input)
			if input == DragInput and Dragging then
				Update(input)
			end
		end
	)
end

local noguchi = {}
function noguchi:Change(info, target, obj)
	local gg = game:GetService("TweenService"):Create(obj, info, target)
	gg:Play()
	return {
		Wait = function()
			gg.Completed:Wait()
		end,
	}
end
local lib = {}
function lib:AddWindow()
	local tnhuw = {}
	-- StarterGui.ScreenGui
	local ScreenGui = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
	ScreenGui["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;


	-- StarterGui.ScreenGui.gg
	local FRAME = Instance.new("Frame", ScreenGui);
	FRAME["BorderSizePixel"] = 0;
	FRAME["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	FRAME["Size"] = UDim2.new(0, 1250, 0, 804);
	FRAME["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	FRAME["Name"] = [[gg]];
	FRAME["BackgroundTransparency"] = 1;

    local camera = workspace.CurrentCamera
    local viewSize = camera.ViewportSize
    local frameSize = FRAME.AbsoluteSize

    FRAME.Position = UDim2.new(0, viewSize.X/2 - frameSize.X/2, 0, viewSize.Y/2 - frameSize.Y/2)

    -- StarterGui.ScreenGui.gg.Main
	local Main = Instance.new("Frame", FRAME);
	Main["BorderSizePixel"] = 0;
	Main["BackgroundColor3"] = Color3.fromRGB(10, 10, 10);
	Main["AnchorPoint"] = Vector2.new(0.5, 0.5);
	Main["Size"] = UDim2.new(0, 407, 0, 245);
	Main["Position"] = UDim2.new(0.49, 0, 0.49938, 0);
	Main["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	Main["Name"] = [[Main]];

	-- StarterGui.ScreenGui.gg.Main.UICorner
	local idk = Instance.new("UICorner", Main);
	idk["CornerRadius"] = UDim.new(0, 3);


	-- StarterGui.ScreenGui.gg.Main.deco
	local lol = Instance.new("Frame", Main);
	lol["BorderSizePixel"] = 0;
	lol["BackgroundColor3"] = Color3.fromRGB(56, 169, 255);
	lol["Size"] = UDim2.new(0, 407, 0, 1);
	lol["Position"] = UDim2.new(0, 0, 0.145, 0);
	lol["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	lol["Name"] = [[deco]];


	local avatar = Instance.new("ImageLabel", Main);
	avatar["BorderSizePixel"] = 0;
	avatar["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	avatar["Image"] = [[rbxassetid://80424892346620]];
	avatar["Size"] = UDim2.new(0, 38, 0, 35);
	avatar["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	avatar["BackgroundTransparency"] = 1;
	avatar["Name"] = [[icon]];

	local MainTitle = Instance.new("TextLabel", Main);
	MainTitle["BorderSizePixel"] = 0;
	MainTitle["TextSize"] = 16;
	MainTitle["TextXAlignment"] = Enum.TextXAlignment.Left;
	MainTitle["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	MainTitle["FontFace"] = Font.new([[rbxasset://fonts/families/FredokaOne.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
	MainTitle["TextColor3"] = Color3.fromRGB(255, 255, 255);
	MainTitle["BackgroundTransparency"] = 1;
	MainTitle["Size"] = UDim2.new(0, 385, 0, 35);
	MainTitle["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	MainTitle["Text"] = [[Noguchi Hub - Shit Project]];
	MainTitle["Name"] = [[MainTitle]];
	MainTitle["Position"] = UDim2.new(0.10673, 0, 0, 0);
	MakeDraggable(MainTitle, Main)

	-- StarterGui.ScreenGui.gg.Main.TabControl
	local TabControl = Instance.new("ScrollingFrame", Main);
	TabControl["Active"] = true;
	TabControl["BorderSizePixel"] = 0;
	TabControl["CanvasSize"] = UDim2.new(0, 0, 0, 0);
	TabControl["BackgroundColor3"] = Color3.fromRGB(16, 16, 16);
	TabControl["Name"] = [[TabControl]];
	TabControl["ScrollBarImageTransparency"] = 1;
	TabControl["AutomaticCanvasSize"] = Enum.AutomaticSize.X;
	TabControl["Size"] = UDim2.new(0, 393, 0, 26);
	TabControl["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
	TabControl["Position"] = UDim2.new(0.01624, 0, 0.16, 0);
	TabControl["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	TabControl["ScrollBarThickness"] = 2;

	-- StarterGui.ScreenGui.gg.Main.TabFrame
	local LocalTabs = Instance.new("CanvasGroup", Main);
	LocalTabs["BorderSizePixel"] = 0;
	LocalTabs["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
	LocalTabs["Size"] = UDim2.new(0, 431, 0, 180);
	LocalTabs["Position"] = UDim2.new(0, 0, 0.26531, 0);
	LocalTabs["BorderColor3"] = Color3.fromRGB(0, 0, 0);
	LocalTabs["Name"] = [[TabFrame]];
	LocalTabs["BackgroundTransparency"] = 1;

	-- StarterGui.ScreenGui.gg.Main.TabControl.UIListLayout
	local idk = Instance.new("UIListLayout", TabControl);
	idk["Wraps"] = true;
	idk["Padding"] = UDim.new(0, 5);
	idk["SortOrder"] = Enum.SortOrder.LayoutOrder;
	local cache__ = false
	function tnhuw:AddTab(optio)
		optio = optio or {
			Title = "Tab"
		}
		-- StarterGui.ScreenGui.gg.Main.TabControl.TabCtrl
		local JustATabButton = Instance.new("TextButton", TabControl);
		JustATabButton["BorderSizePixel"] = 0;
		JustATabButton["TextSize"] = 14;
		JustATabButton["TextColor3"] = Color3.fromRGB(255, 255, 255);
		JustATabButton["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
		JustATabButton["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
		JustATabButton["AutomaticSize"] = Enum.AutomaticSize.X;
		JustATabButton["Size"] = UDim2.new(0, 97, 0, 26);
		JustATabButton["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		JustATabButton["Name"] = [[TabCtrl]];
		JustATabButton.Text = optio.Title
		
		

		-- StarterGui.ScreenGui.gg.Main.TabFrame.UICorner
		local idk = Instance.new("UICorner", LocalTabs);
		idk["CornerRadius"] = UDim.new(0, 3);


		-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab
		local RealTab = Instance.new("ScrollingFrame", LocalTabs);
		RealTab["Active"] = true;
		RealTab["BorderSizePixel"] = 0;
		RealTab["CanvasSize"] = UDim2.new(0, 0, 0, 0);
		RealTab["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		RealTab["Name"] = [[Tab]];
		RealTab["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
		RealTab["Size"] = UDim2.new(0, 393, 0, 174);
		RealTab["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		RealTab["Position"] = UDim2.new(0.01624, 0, 0, 0);
		RealTab["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		RealTab["ScrollBarThickness"] = 2;
		RealTab["BackgroundTransparency"] = 1;
		RealTab.Visible = false
		if not cache__ then
			RealTab.Visible = not cache__
			cache__ = true
		end
		JustATabButton.MouseButton1Click:Connect(function()
			for i, v in pairs(LocalTabs:GetChildren()) do
				if v:IsA("ScrollingFrame") then
					v.Visible = false
				end
			end
			RealTab.Visible = true
		end)

		-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.UIListLayout
		local idk = Instance.new("UIListLayout", RealTab);
		idk["Wraps"] = true;
		idk["Padding"] = UDim.new(0, 5);
		idk["SortOrder"] = Enum.SortOrder.LayoutOrder;


		-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left
		local SectionLeft = Instance.new("ScrollingFrame", RealTab);
		SectionLeft["Active"] = true;
		SectionLeft["BorderSizePixel"] = 0;
		SectionLeft["CanvasSize"] = UDim2.new(0, 0, 0, 0);
		SectionLeft["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		SectionLeft["Name"] = [[Left]];
		SectionLeft["ScrollBarImageTransparency"] = 1;
		SectionLeft["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
		SectionLeft["Size"] = UDim2.new(0, 190, 0, 174);
		SectionLeft["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		SectionLeft["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		SectionLeft["ScrollBarThickness"] = 0;
		SectionLeft["BackgroundTransparency"] = 1;

		-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Right
		local SectionRight = Instance.new("ScrollingFrame", RealTab);
		SectionRight["Active"] = true;
		SectionRight["BorderSizePixel"] = 0;
		SectionRight["CanvasSize"] = UDim2.new(0, 0, 0, 0);
		SectionRight["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
		SectionRight["Name"] = [[Right]];
		SectionRight["ScrollBarImageTransparency"] = 1;
		SectionRight["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
		SectionRight["Size"] = UDim2.new(0, 190, 0, 174);
		SectionRight["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
		SectionRight["BorderColor3"] = Color3.fromRGB(0, 0, 0);
		SectionRight["ScrollBarThickness"] = 0;
		SectionRight["BackgroundTransparency"] = 1;


		-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Right.UIListLayout
		local idk = Instance.new("UIListLayout", SectionRight);
		idk["Padding"] = UDim.new(0, 5);
		idk["SortOrder"] = Enum.SortOrder.LayoutOrder;


		-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Right.UIPadding
		local idk = Instance.new("UIPadding", SectionRight);
		idk["PaddingTop"] = UDim.new(0, 10);
		idk["PaddingBottom"] = UDim.new(0, 10);

		-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.UIListLayout
		local idk = Instance.new("UIListLayout", SectionLeft);
		idk["Padding"] = UDim.new(0, 5);
		idk["SortOrder"] = Enum.SortOrder.LayoutOrder;


		-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.UIPadding
		local idk = Instance.new("UIPadding", SectionLeft);
		idk["PaddingTop"] = UDim.new(0, 10);
		idk["PaddingBottom"] = UDim.new(0, 10);

		

		local Tablib = {}

		function Tablib:AddSelection(v22)
			if not v22 or v22 ~= "Right" and v22 ~= "Left" then
				v22 = "Left"
			end
			local l = {}
			local SelectionLib = {
				["Right"] = SectionRight,
				["Left"] = SectionLeft
			}

			-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection
			local Selection = Instance.new("Frame", SelectionLib[v22]);
			Selection["BorderSizePixel"] = 0;
			Selection["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
			Selection["AutomaticSize"] = Enum.AutomaticSize.Y;
			Selection["Size"] = UDim2.new(0, 189, 0, 275);
			Selection["BorderColor3"] = Color3.fromRGB(0, 0, 0);
			Selection["Name"] = [[Selection]];

			-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.UIListLayout
			local idk = Instance.new("UIListLayout", Selection);
			idk["Padding"] = UDim.new(0, 10);
			idk["SortOrder"] = Enum.SortOrder.LayoutOrder;


			-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.UIPadding
			local idk = Instance.new("UIPadding", Selection);
			idk["PaddingTop"] = UDim.new(0, 10);
			idk["PaddingBottom"] = UDim.new(0, 10);


			-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.UICorner
			local idk = Instance.new("UICorner", Selection);
			idk["CornerRadius"] = UDim.new(0, 3);

			function l:AddSection(opt)
				opt = opt or {}
				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Section
				local Section = Instance.new("Frame", Selection);
				Section["BorderSizePixel"] = 0;
				Section["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				Section["Size"] = UDim2.new(0, 184, 0, 1);
				Section["Position"] = UDim2.new(0.01075, 0, 0.11335, 0);
				Section["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Section["Name"] = [[Section]];

				local SectionTitle = Instance.new("TextLabel", Section);
				SectionTitle["ZIndex"] = 5;
				SectionTitle["BorderSizePixel"] = 0;
				SectionTitle["TextSize"] = 14;
				SectionTitle["BackgroundColor3"] = Color3.fromRGB(21, 21, 21);
				SectionTitle["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				SectionTitle["TextColor3"] = Color3.fromRGB(255, 255, 255);
				SectionTitle["AnchorPoint"] = Vector2.new(0.5, 0);
				SectionTitle["Size"] = UDim2.new(0, 60, 0, 17);
				SectionTitle["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				SectionTitle["Text"] = opt.Title or "Section"
				SectionTitle["AutomaticSize"] = Enum.AutomaticSize.X;
				SectionTitle["Name"] = [[SectionTitle]];
				SectionTitle["Position"] = UDim2.new(0.49457, 0, -8, 0);
			end

			function l:AddButton(opt)
				opt = opt or {
					Title = "Button",
					CallBack = function()
						print("Hello World")
					end,
				}
				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Button
				local Button = Instance.new("TextButton", Selection);
				Button["BorderSizePixel"] = 0;
				Button["TextSize"] = 14;
				Button["TextColor3"] = Color3.fromRGB(255, 255, 255);
				Button["BackgroundColor3"] = Color3.fromRGB(26, 26, 26);
				Button["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				Button["Size"] = UDim2.new(0, 186, 0, 24);
				Button["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				Button["Text"] = opt.Title;
				Button["Name"] = [[Button]];
				Button["Position"] = UDim2.new(0, 0, 0.31429, 0);

				Button.MouseButton1Click:Connect(function()
					opt.CallBack()
				end)
			end

			function l:AddToggle(opt)
				opt = opt or {
					Title = "Toggle",
					Default = false,
					CallBack = function(v)
						print("toggle:", v)
					end,
				}
				local togglelib = {}
				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Toggle
				local frametoggle = Instance.new("Frame", Selection);
				frametoggle["BorderSizePixel"] = 0;
				frametoggle["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				frametoggle["Size"] = UDim2.new(0, 184, 0, 27);
				frametoggle["Position"] = UDim2.new(0, 0, 0.47887, 0);
				frametoggle["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				frametoggle["Name"] = [[Toggle]];
				frametoggle["BackgroundTransparency"] = 1;

				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Toggle.DECO
				local decotoggle = Instance.new("Frame", frametoggle);
				decotoggle["ZIndex"] = 0;
				decotoggle["BorderSizePixel"] = 0;
				decotoggle["BackgroundColor3"] = Color3.fromRGB(57, 57, 57);
				decotoggle["AnchorPoint"] = Vector2.new(0.5, 0.5);
				decotoggle["Size"] = UDim2.new(0, 25, 0, 25);
				decotoggle["Position"] = UDim2.new(0.10004, 0, 0.48148, 0);
				decotoggle["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				decotoggle["Name"] = [[DECO]];


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Toggle.DECO.UICorner
				local idk = Instance.new("UICorner", decotoggle);
				idk["CornerRadius"] = UDim.new(0, 3);


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Toggle.ToggleTitle
				local toggletitle = Instance.new("TextLabel", frametoggle);
				toggletitle["BorderSizePixel"] = 0;
				toggletitle["TextSize"] = 14;
				toggletitle["TextXAlignment"] = Enum.TextXAlignment.Left;
				toggletitle["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				toggletitle["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				toggletitle["TextColor3"] = Color3.fromRGB(255, 255, 255);
				toggletitle["BackgroundTransparency"] = 1;
				toggletitle["Size"] = UDim2.new(0, 145, 0, 26);
				toggletitle["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				toggletitle["Text"] = opt.Title
				toggletitle["Name"] = [[ToggleTitle]];
				toggletitle["Position"] = UDim2.new(0.21196, 0, 0, 0);


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Toggle.ImageButton
				local imagetoggle = Instance.new("ImageButton", frametoggle);
				imagetoggle["BorderSizePixel"] = 0;
				-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
				imagetoggle["BackgroundColor3"] = Color3.fromRGB(10, 10, 10);
				imagetoggle["AnchorPoint"] = Vector2.new(0.5, 0.5);
				imagetoggle["Image"] = [[rbxassetid://112879527742153]];
				imagetoggle["Size"] = UDim2.new(0, 21, 0, 22);
				imagetoggle["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				imagetoggle["Position"] = UDim2.new(0.1, 0, 0.475, 0);
				local togglecache = opt.Default
				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Toggle.ImageButton.UICorner
				local idk = Instance.new("UICorner", imagetoggle);
				idk["CornerRadius"] = UDim.new(0, 3);
				local g = {
					[false] = 1,
					[true] = 0
				}
				imagetoggle.ImageTransparency = g[opt.Default]
				function togglelib:Set(v)
					
					noguchi:Change(TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{['ImageTransparency'] = g[v]},
						imagetoggle
					)
					opt.CallBack(v)
				end
				if typeof(opt.Default) == "boolean" and opt.Default then
					togglelib:Set(opt.Default)
				end
				imagetoggle.MouseButton1Click:Connect(function()
					togglecache = not togglecache
					togglelib:Set(togglecache)
				end)
				return togglelib
			end

			function l:AddInput(opt)
				opt = opt or {
					Title = "Toggle",
					Default = "",
					CallBack = function(v)
						print("input:", v)
					end,
				}
				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Input
				local frameinput = Instance.new("Frame", Selection);
				frameinput["BorderSizePixel"] = 0;
				frameinput["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				frameinput["Size"] = UDim2.new(0, 184, 0, 34);
				frameinput["Position"] = UDim2.new(0, 0, 0.2931, 0);
				frameinput["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				frameinput["Name"] = [[Input]];
				frameinput["BackgroundTransparency"] = 1;


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Input.TextLabel
				local titleinput = Instance.new("TextLabel", frameinput);
				titleinput["BorderSizePixel"] = 0;
				titleinput["TextSize"] = 14;
				titleinput["TextXAlignment"] = Enum.TextXAlignment.Left;
				titleinput["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				titleinput["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				titleinput["TextColor3"] = Color3.fromRGB(255, 255, 255);
				titleinput["BackgroundTransparency"] = 1;
				titleinput["Size"] = UDim2.new(0, 170, 0, 34);
				titleinput["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				titleinput["Text"] = opt.Title
				titleinput["Position"] = UDim2.new(0.04348, 0, 0, 0);


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Input.TextBoxFrame
				local textbox = Instance.new("CanvasGroup", frameinput);
				textbox["BorderSizePixel"] = 0;
				textbox["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				textbox["Size"] = UDim2.new(0, 55, 0, 34);
				textbox["Position"] = UDim2.new(0.668, 0, 0, 0);
				textbox["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				textbox["Name"] = [[TextBoxFrame]];
				textbox["BackgroundTransparency"] = 1;


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Input.TextBoxFrame.UICorner
				local idk = Instance.new("UICorner", textbox);



				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Input.TextBoxFrame.TextBox
				local textbox2 = Instance.new("TextBox", textbox);
				textbox2["CursorPosition"] = -1;
				textbox2["BorderSizePixel"] = 0;
				textbox2["TextSize"] = 14;
				textbox2["TextColor3"] = Color3.fromRGB(255, 255, 255);
				textbox2["BackgroundColor3"] = Color3.fromRGB(10, 10, 10);
				textbox2["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
				textbox2["MultiLine"] = true;
				textbox2["Size"] = UDim2.new(0, 55, 0, 34);
				textbox2["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				textbox2["Text"] = [[]];

				if typeof(opt.Default) == "string" then
					textbox2.Text = opt.Default
					opt.CallBack(textbox2.Text)
				end
				textbox2.FocusLost:Connect(function(c,b)
					opt.CallBack(textbox2.Text)
				end)
			end

			function l:AddDropdown(opt)
				opt = opt or {
					Title = "Dropdown",
					Default = "Option 1",
					Option = {"Option 1", "Option 2", "Option 3"},
					CallBack = function(v)
						print("choosed:", v)
					end,
				}
				local ddlib = {}
				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Dropdown
				local framedd = Instance.new("Frame", Selection);
				framedd["BorderSizePixel"] = 0;
				framedd["BackgroundColor3"] = Color3.fromRGB(14, 14, 14);
				framedd["AutomaticSize"] = Enum.AutomaticSize.Y;
				framedd["Size"] = UDim2.new(0, 186, 0, 35);
				framedd["Position"] = UDim2.new(0.02688, 0, 0.69388, 0);
				framedd["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				framedd["Name"] = [[Dropdown]];


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Dropdown.ImageButton
				local ddclick = Instance.new("ImageButton", framedd);
				ddclick["BorderSizePixel"] = 0;
				-- [ERROR] cannot convert ImageContent, please report to "https://github.com/uniquadev/GuiToLuaConverter/issues"
				ddclick["BackgroundColor3"] = Color3.fromRGB(14, 14, 14);
				ddclick["ZIndex"] = 5;
				ddclick["Image"] = [[rbxassetid://81521192845375]];
				ddclick["Size"] = UDim2.new(0, 28, 0, 32);
				ddclick["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				ddclick["Rotation"] = 90;
				ddclick["Position"] = UDim2.new(0.83871, 0, 0.01005, 0);


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Dropdown.Frame
				local dd = Instance.new("Frame", framedd);
				dd["BorderSizePixel"] = 0;
				dd["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				dd["AutomaticSize"] = Enum.AutomaticSize.Y;
				dd["Size"] = UDim2.new(0, 186, 0, 36);
				dd["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				dd["BackgroundTransparency"] = 1;


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Dropdown.Frame.IDK
				local justaframe = Instance.new("Frame", dd);
				justaframe["BorderSizePixel"] = 0;
				justaframe["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				justaframe["Size"] = UDim2.new(0, 184, 0, 36);
				justaframe["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				justaframe["Name"] = [[IDK]];
				justaframe["BackgroundTransparency"] = 1;

				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Dropdown.UICorner
				local idk = Instance.new("UICorner", framedd);
				idk["CornerRadius"] = UDim.new(0, 4);


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Dropdown.TextLabel
				local ddtitle = Instance.new("TextLabel", framedd);
				ddtitle["BorderSizePixel"] = 0;
				ddtitle["TextSize"] = 14;
				ddtitle["TextXAlignment"] = Enum.TextXAlignment.Left;
				ddtitle["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				ddtitle["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				ddtitle["TextColor3"] = Color3.fromRGB(255, 255, 255);
				ddtitle["BackgroundTransparency"] = 1;
				ddtitle["Size"] = UDim2.new(0, 148, 0, 36);
				ddtitle["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				ddtitle["Text"] = opt.Title
				ddtitle["Position"] = UDim2.new(0.04301, 0, 0, 0);

				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Dropdown.Frame.UIListLayout
				local idk = Instance.new("UIListLayout", dd);
				idk["SortOrder"] = Enum.SortOrder.LayoutOrder;


				function ddlib:Set(v)
					noguchi:Change(TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
						{["Rotation"] = 90},
						ddclick
					)
					for i, v in pairs(dd:GetChildren()) do
						if v:IsA("TextButton") then
							v.Visible = false
						end
					end
					ddtitle.Text = string.format("%s | %s", opt.Title, v)
					opt.CallBack(v)
				end

				function ddlib:Reset()
					for i, v in pairs(dd:GetChildren()) do
						if v:IsA("TextButton") then
							v:Destroy()
						end
					end
					ddtitle.Text = opt.Title
				end

				function ddlib:AddOption(v)
					-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Dropdown.Frame.Option
					local jusaoption = Instance.new("TextButton", dd);
					jusaoption["BorderSizePixel"] = 0;
					jusaoption["TextSize"] = 14;
					jusaoption["TextColor3"] = Color3.fromRGB(255, 255, 255);
					jusaoption["BackgroundColor3"] = Color3.fromRGB(14, 14, 14);
					jusaoption["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
					jusaoption["Size"] = UDim2.new(0, 186, 0, 31);
					jusaoption["BorderColor3"] = Color3.fromRGB(0, 0, 0);
					jusaoption["Text"] = v
					jusaoption["Name"] = [[Option]];
					jusaoption["Position"] = UDim2.new(0, 0, 0.56944, 0);
					jusaoption.Visible = false
					jusaoption.MouseButton1Click:Connect(function()
						ddlib:Set(v)
					end)
				end
				for i, v in pairs(opt.Option) do
					ddlib:AddOption(v)
				end
				if not opt.Default then
					opt.Default = opt.Option[1]
				end
				if typeof(opt.Default) == "string" then
					ddlib:Set(opt.Default)
				end

				ddclick.MouseButton1Click:Connect(function()
					if ddclick.Rotation == 90 then
						noguchi:Change(TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut),
							{["Rotation"] = 0},
							ddclick
						)
						for i, v in pairs(dd:GetChildren()) do
							if v:IsA("TextButton") then
								v.Visible = true
							end
						end
					end
				end)

				return ddlib
			end

			function l:AddSlider(opt)
				opt = opt or {
					Title = "Slider",
					Min = 1,
					Max = 100,
					Default = 50,
					CallBack = function(v)
						print("Slider Changed:", v)
					end,
				}
				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Slider
				local frameslider = Instance.new("Frame", Selection);
				frameslider["BorderSizePixel"] = 0;
				frameslider["BackgroundColor3"] = Color3.fromRGB(13, 13, 13);
				frameslider["Size"] = UDim2.new(0, 184, 0, 40);
				frameslider["Position"] = UDim2.new(0, 0, 0.83987, 0);
				frameslider["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				frameslider["Name"] = [[Slider]];
				frameslider["BackgroundTransparency"] = 1;


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Slider.Title
				local slidertitle = Instance.new("TextLabel", frameslider);
				slidertitle["BorderSizePixel"] = 0;
				slidertitle["TextSize"] = 14;
				slidertitle["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				slidertitle["FontFace"] = Font.new([[rbxasset://fonts/families/RobotoMono.json]], Enum.FontWeight.Bold, Enum.FontStyle.Normal);
				slidertitle["TextColor3"] = Color3.fromRGB(255, 255, 255);
				slidertitle["BackgroundTransparency"] = 1;
				slidertitle["Size"] = UDim2.new(0, 185, 0, 20);
				slidertitle["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				slidertitle["Text"] = opt.Title;
				slidertitle["Name"] = [[Title]];


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Slider.thanh
				local motcaithanh = Instance.new("Frame", frameslider);
				motcaithanh["BorderSizePixel"] = 0;
				motcaithanh["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
				motcaithanh["Size"] = UDim2.new(0, 184, 0, 2);
				motcaithanh["Position"] = UDim2.new(0, 0, 0.59184, 0);
				motcaithanh["BorderColor3"] = Color3.fromRGB(0, 0, 0);
				motcaithanh["Name"] = [[thanh]];


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Slider.Frame
				local cainut = Instance.new("Frame", frameslider);
				cainut["BorderSizePixel"] = 0;
				cainut["BackgroundColor3"] = Color3.fromRGB(68, 153, 255);
				cainut["Size"] = UDim2.new(0, 11, 0, 11);
				cainut["Position"] = UDim2.new(0.15167, 0, 0.4898, 0);
				cainut["BorderColor3"] = Color3.fromRGB(0, 0, 0);


				-- StarterGui.ScreenGui.gg.Main.TabFrame.Tab.Left.Selection.Slider.Frame.UICorner
				local cac = Instance.new("UICorner", cainut);
				MakeSlider(cainut, motcaithanh, opt.Min, opt.Max, function(v)
					slidertitle.Text = string.format("%s | %s", opt.Title, tostring(v))
					opt.CallBack(v)
				end)
				if opt.Default then
					opt.CallBack(opt.Default)
					slidertitle.Text = string.format("%s | %s", opt.Title, tostring(opt.Default))
				end
			end

			return l
		end
		return Tablib
	end
	return tnhuw
end
return lib
