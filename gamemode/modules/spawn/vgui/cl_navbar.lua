local PANEL = {}
local CurrentFrame = nil
local CurrentMaterials = {
	Material("materials/vgui/modules/spawn/navbar.png", "noclamp smooth"),
}

function PANEL:UpdateResponsive()
	if IsValid(self) then
		self:gSetPos(0, 0)
		self:gSetSize(2560, 1440)
	end

	if IsValid(self.DImageLogo) then
		self.DImageLogo:gSetPos(150, 410)
		self.DImageLogo:gSetSize(113, 126)
	end

	if IsValid(self.DButtonJoin) then
		self.DButtonJoin:gSetPos(98, 585)
		self.DButtonJoin:gSetSize(218, 50)
	end

	if IsValid(self.DButtonSetting) then
		self.DButtonSetting:gSetPos(91, 640)
		self.DButtonSetting:gSetSize(231, 50)
	end

	if IsValid(self.DButtonSName) then
		self.DButtonSName:gSetPos(124, 1360)
		self.DButtonSName:gSetSize(165, 25)
	end

	if IsValid(self.DButtonSVersion) then
		self.DButtonSVersion:gSetPos(73, 1390)
		self.DButtonSVersion:gSetSize(268, 25)
	end
end

function PANEL:Body()
	self.DImageLogo = vgui.Create("DImage", self)
	self.DImageLogo:gSetPos(150, 470)
	self.DImageLogo:gSetSize(113, 126)
	self.DImageLogo:SetImage("materials/vgui/modules/spawn/logo.png")

	self.DButtonJoin = vgui.Create("DButton", self)
	self.DButtonJoin:gSetPos(98, 645)
	self.DButtonJoin:gSetSize(218, 50)
	self.DButtonJoin:SetText("")
	self.DButtonJoin.Paint = function(self, w, h)
		if self:IsHovered() then
			draw.SimpleText("REJOINDRE", "OxaniumMedium:40", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			draw.SimpleText("REJOINDRE", "OxaniumExtraLight:40", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
	self.DButtonJoin.DoClick = function()
		self.DPanelSecur = vgui.Create("DPanel", self)
		self.DPanelSecur:gSetPos(0, 0)
		self.DPanelSecur:gSetSize(414, 1440)
		self.DPanelSecur.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
		end

		self:gFadeOut(0.5)
		self:gMoveTo(2560, 0, 0.75, 0, -1, function()
			self:Remove()
		end)
	end

	self.DButtonSetting = vgui.Create("DButton", self)
	self.DButtonSetting:gSetPos(91, 700)
	self.DButtonSetting:gSetSize(231, 50)
	self.DButtonSetting:SetText("")
	self.DButtonSetting.Paint = function(self, w, h)
		if self:IsHovered() then
			draw.SimpleText("PARAMETRE", "OxaniumMedium:40", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			draw.SimpleText("PARAMETRE", "OxaniumExtraLight:40", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end

	self.DButtonLeave = vgui.Create("DButton", self)
	self.DButtonLeave:gSetPos(125, 755)
	self.DButtonLeave:gSetSize(163, 50)
	self.DButtonLeave:SetText("")
	self.DButtonLeave.Paint = function(self, w, h)
		if self:IsHovered() then
			draw.SimpleText("QUITTER", "OxaniumMedium:40", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			draw.SimpleText("QUITTER", "OxaniumExtraLight:40", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end

	self.DButtonSName = vgui.Create("DPanel", self)
	self.DButtonSName:gSetPos(124, 1360)
	self.DButtonSName:gSetSize(165, 25)
	self.DButtonSName.Paint = function(self, w, h)
		draw.SimpleText("New World Online", "OxaniumExtraLight:20", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	self.DButtonSVersion = vgui.Create("DPanel", self)
	self.DButtonSVersion:gSetPos(73, 1390)
	self.DButtonSVersion:gSetSize(268, 25)
	self.DButtonSVersion.Paint = function(self, w, h)
		draw.SimpleText("Version 0.0.0, developer mod", "OxaniumExtraLight:20", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end
end

function PANEL:Init()
	self:gSetPos(1978, 0)
	self:gSetSize(414, 1440)
	self:gFadeIn(0.75)
	self:Body()

	hook.Add("OnScreenSizeChanged", self, self.UpdateResponsive)
end

function PANEL:Paint(w, h)
	pMaterials(CurrentMaterials[1], 0, 0, w, h, Color(255, 255, 255))
end

function PANEL:OnRemove()
	hook.Remove("OnScreenSizeChanged", self)
end

vgui.Register("Module:Spawn:VGUI:NavBar", PANEL, "DPanel")