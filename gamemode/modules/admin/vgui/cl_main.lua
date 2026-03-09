local PANEL = {}
local CurrentFrame = nil

function PANEL:UpdateResponsive()
	if IsValid(self) then
		self:gSetSize(1920, 1080)
		self:gCenter()
	end
end

function PANEL:Init()
	self:gSetSize(1920, 1080)
	self:gCenter()
	self:SetTitle("New World Online - Admin")
	self:ShowCloseButton(true)
	self:SetDraggable(true)
	self:MakePopup()
	self:gFadeIn(0.75)

	hook.Add("OnScreenSizeChanged", self, self.UpdateResponsive)
end

function PANEL:OnRemove()
	hook.Remove("OnScreenSizeChanged", self)
end

vgui.Register("Module:Admin:VGUI:Main", PANEL, "DFrame")

net.Receive("Module:Admin:OpenMainVGUI", function(len)
	if IsValid(CurrentFrame) then
		CurrentFrame:Remove()
	end
	CurrentFrame = vgui.Create("Module:Admin:VGUI:Main")
end)