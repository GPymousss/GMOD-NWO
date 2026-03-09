local PANEL = {}
local CurrentFrame = nil
local SpawnUtils = GPYMOUSSS.SpawnUtils
local PlayerCount = 0
local CurrentMaterials = {
	Material("materials/vgui/modules/spawn/register/logo.png", "noclamp smooth"),
	Material("materials/vgui/modules/spawn/register/entry.png", "noclamp smooth"),
	Material("materials/vgui/modules/spawn/register/buttonoff.png", "noclamp smooth"),
	Material("materials/vgui/modules/spawn/register/buttonon.png", "noclamp smooth")
}

local function gValidateField(value)
	if SpawnUtils.IsEmpty(value) then return nil end
	if value:find("%s") then return false end
	if not SpawnUtils.IsValidLength(value) then return false end
	if not SpawnUtils.IsAlpha(value) then return false end
	return true
end

function PANEL:UpdateResponsive()
	if IsValid(self) then
		self:gSetPos(0, 0)
		self:gSetSize(2560, 1440)
	end

	if IsValid(self.DImageLogo) then
		self.DImageLogo:gSetPos(1194, 282)
		self.DImageLogo:gSetSize(172, 192)
	end

	if IsValid(self.DLabelTitle) then
		self.DLabelTitle:gSetPos(1017, 522)
		self.DLabelTitle:gSetSize(532, 80)
	end

	if IsValid(self.DLabelPlayerNum) then
		self.DLabelPlayerNum:gSetPos(1023, 602)
		self.DLabelPlayerNum:gSetSize(520, 30)
	end

	if IsValid(self.DPanelBGFirstN) then
		self.DPanelBGFirstN:gSetPos(1088, 686)
		self.DPanelBGFirstN:gSetSize(384, 68)
	end

	if IsValid(self.DTextFirstN) then
		self.DTextFirstN:gSetPos(0, 0)
		self.DTextFirstN:gSetSize(384, 68)
	end

	if IsValid(self.DPanelBGLastN) then
		self.DPanelBGLastN:gSetPos(1088, 770)
		self.DPanelBGLastN:gSetSize(384, 68)
	end

	if IsValid(self.DTextLastN) then
		self.DTextLastN:gSetPos(0, 0)
		self.DTextLastN:gSetSize(384, 68)
	end
end

local function gMakeTextEntryPaint(entry, placeholderText)
	entry.Paint = function(self, w, h)
		local text = self:GetValue()

		if text == "" then
			text = placeholderText
			if self.HasError then
				surface.SetTextColor(220, 50, 50)
			else
				surface.SetTextColor(150, 150, 150)
			end
		else
			if self.FieldValid == true then
				surface.SetTextColor(255, 255, 255)
			else
				surface.SetTextColor(220, 50, 50)
			end
		end

		surface.SetFont("OxaniumRegular:30")
		local tw, th = surface.GetTextSize(text)
		surface.SetTextPos((w - tw) / 2, (h - th) / 2)
		surface.DrawText(text)
	end
end

local function gMakeOnValueChange(entry)
	entry.OnValueChange = function(self, value)
		self.HasError   = false
		self.FieldValid = gValidateField(value)
	end
end

function PANEL:Body()
	self.DImageLogo = vgui.Create("DPanel", self)
	self.DImageLogo:gSetPos(1194, 282)
	self.DImageLogo:gSetSize(172, 192)
	self.DImageLogo.Paint = function(self, w, h)
		pMaterials(CurrentMaterials[1], 0, 0, w, h, Color(255, 255, 255, 255))
	end

	self.DLabelTitle = vgui.Create("DPanel", self)
	self.DLabelTitle:gSetPos(1017, 522)
	self.DLabelTitle:gSetSize(532, 80)
	self.DLabelTitle.Paint = function(self, w, h)
		draw.SimpleText("New World Online", "OxaniumMedium:64", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	self.DLabelPlayerNum = vgui.Create("DPanel", self)
	self.DLabelPlayerNum:gSetPos(1023, 602)
	self.DLabelPlayerNum:gSetSize(520, 30)
	self.DLabelPlayerNum.Paint = function(self, w, h)
		draw.SimpleText("Nombre d'enregistrement de joueur : " .. PlayerCount, "OxaniumExtraLight:24", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
	end

	self.DPanelBGFirstN = vgui.Create("DPanel", self)
	self.DPanelBGFirstN:gSetPos(1088, 686)
	self.DPanelBGFirstN:gSetSize(384, 68)
	self.DPanelBGFirstN.Paint = function(self, w, h)
		pMaterials(CurrentMaterials[2], 0, 0, w, h, Color(255, 255, 255, 255))
	end

	self.DTextFirstN = vgui.Create("DTextEntry", self.DPanelBGFirstN)
	self.DTextFirstN:gSetPos(0, 0)
	self.DTextFirstN:gSetSize(384, 68)
	self.DTextFirstN:SetPlaceholderColor(Color(150, 150, 150))
	self.DTextFirstN:SetPlaceholderText("Daniel")
	self.DTextFirstN:SetFont("OxaniumRegular:30")
	self.DTextFirstN:SetTextColor(Color(255, 255, 255))
	self.DTextFirstN:SetPaintBackground(false)
	self.DTextFirstN:SetUpdateOnType(true)
	self.DTextFirstN:SetDrawLanguageID(false)
	self.DTextFirstN:SetCursorColor(Color(255, 255, 255))
	self.DTextFirstN:SetText("")
	self.DTextFirstN.FieldValid = nil

	gMakeTextEntryPaint(self.DTextFirstN, "Daniel")
	gMakeOnValueChange(self.DTextFirstN)

	self.DPanelBGLastN = vgui.Create("DPanel", self)
	self.DPanelBGLastN:gSetPos(1088, 770)
	self.DPanelBGLastN:gSetSize(384, 68)
	self.DPanelBGLastN.Paint = function(self, w, h)
		pMaterials(CurrentMaterials[2], 0, 0, w, h, Color(255, 255, 255, 255))
	end

	self.DTextLastN = vgui.Create("DTextEntry", self.DPanelBGLastN)
	self.DTextLastN:gSetPos(0, 0)
	self.DTextLastN:gSetSize(384, 68)
	self.DTextLastN:SetPlaceholderColor(Color(150, 150, 150))
	self.DTextLastN:SetPlaceholderText("Crowman")
	self.DTextLastN:SetFont("OxaniumRegular:30")
	self.DTextLastN:SetTextColor(Color(255, 255, 255))
	self.DTextLastN:SetPaintBackground(false)
	self.DTextLastN:SetUpdateOnType(true)
	self.DTextLastN:SetDrawLanguageID(false)
	self.DTextLastN:SetCursorColor(Color(255, 255, 255))
	self.DTextLastN:SetText("")
	self.DTextLastN.FieldValid = nil

	gMakeTextEntryPaint(self.DTextLastN, "Crowman")
	gMakeOnValueChange(self.DTextLastN)

	self.DButtonCancel = vgui.Create("DButton", self)
	self.DButtonCancel:gSetPos(1044, 910)
	self.DButtonCancel:gSetSize(231, 65)
	self.DButtonCancel:SetText("")
	self.DButtonCancel.Paint = function(self, w, h)
		if self:IsHovered() then
			pMaterials(CurrentMaterials[4], 0, 0, w, h, Color(255, 255, 255, 255))
			draw.SimpleText("ANNULER", "OxaniumBold:40", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			pMaterials(CurrentMaterials[3], 0, 0, w, h, Color(255, 255, 255, 255))
			draw.SimpleText("ANNULER", "OxaniumMedium:40", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
	self.DButtonCancel.DoClick = function()
		self.DPanelSecur = vgui.Create("DPanel", self)
		self.DPanelSecur:gSetPos(0, 0)
		self.DPanelSecur:gSetSize(2560, 1440)
		self.DPanelSecur.Paint = function(self, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
		end

		self:gFadeOut(0.75, 0, function()
			self:GetParent().SubFrame = vgui.Create("Module:Spawn:VGUI:NavBar", self:GetParent())
			self:Remove()
		end)
	end

	self.DButtonKeep = vgui.Create("DButton", self)
	self.DButtonKeep:gSetPos(1285, 910)
	self.DButtonKeep:gSetSize(231, 65)
	self.DButtonKeep:SetText("")
	self.DButtonKeep.Paint = function(self, w, h)
		if self:IsHovered() then
			pMaterials(CurrentMaterials[4], 0, 0, w, h, Color(255, 255, 255, 255))
			draw.SimpleText("VALIDER", "OxaniumBold:40", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		else
			pMaterials(CurrentMaterials[3], 0, 0, w, h, Color(255, 255, 255, 255))
			draw.SimpleText("VALIDER", "OxaniumMedium:40", w/2, h/2, Color(255,255,255,255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
		end
	end
	self.DButtonKeep.DoClick = function()
		local firstname = self.DTextFirstN:GetValue()
		local lastname  = self.DTextLastN:GetValue()

		local valid, errors = SpawnUtils.ValidateName(firstname, lastname)

		if not valid then
			if errors.firstname then self.DTextFirstN.HasError = true end
			if errors.lastname  then self.DTextLastN.HasError  = true end
			return
		end

		self.DPanelSecur = vgui.Create("DPanel", self)
		self.DPanelSecur:gSetPos(0, 0)
		self.DPanelSecur:gSetSize(2560, 1440)
		self.DPanelSecur.Paint = function(s, w, h)
			draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
		end

		net.Start("Module:Spawn:RegisterPlayer")
		net.WriteString(firstname)
		net.WriteString(lastname)
		net.SendToServer()

		self.WaitingRegister = true
	end
end

function PANEL:Init()
	self:gSetPos(0, 0)
	self:gSetSize(2560, 1440)
	self:gFadeIn(0.75)

	self:Body()

	hook.Add("OnScreenSizeChanged", self, self.UpdateResponsive)
end

function PANEL:Paint(w, h)
	draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 0))
end

function PANEL:OnRemove()
	hook.Remove("OnScreenSizeChanged", self)
end

vgui.Register("Module:Spawn:VGUI:Register", PANEL, "DPanel")

net.Receive("Module:Spawn:PlayerCount", function(len)
	PlayerCount = net.ReadUInt(32)
end)