local PANEL = {}
local CurrentFrame = nil
local CurrentMaterials = {
	Material("materials/vgui/modules/spawn/main/background.png", "noclamp smooth"),
}

function PANEL:UpdateResponsive()
	if IsValid(self) then
		self:gSetPos(0, 0)
		self:gSetSize(2560, 1440)
	end
end

function PANEL:Init()
	self:gSetPos(0, 0)
	self:gSetSize(2560, 1440)
	self:SetTitle("")
	self:ShowCloseButton(false)
	self:SetDraggable(false)
	self:MakePopup()
	self:gFadeIn(0.75)
	self.SubFrame = vgui.Create("Module:Spawn:VGUI:NavBar", self)

	hook.Add("OnScreenSizeChanged", self, self.UpdateResponsive)
end

function PANEL:Paint(w, h)
	pMaterials(CurrentMaterials[1], 0, 0, w, h, Color(255, 255, 255))
end

function PANEL:CloseMain()
	if self.IsClosing then return end
	self.IsClosing = true

	self:SetMouseInputEnabled(false)
	self:SetKeyboardInputEnabled(false)

	net.Start("Module:Spawn:LoadingFinish")
	net.SendToServer()

	self:gFadeOut(1.5, 0, function()
		self:Remove()
	end)
end

function PANEL:OnClose()
	return false
end

function PANEL:OnRemove()
	hook.Remove("OnScreenSizeChanged", self)
end

vgui.Register("Module:Spawn:VGUI:Main", PANEL, "DFrame")

net.Receive("Module:Spawn:OpenMainVGUI", function(len)
	if IsValid(CurrentFrame) then
		CurrentFrame:Remove()
	end
	CurrentFrame = vgui.Create("Module:Spawn:VGUI:Main")
end)