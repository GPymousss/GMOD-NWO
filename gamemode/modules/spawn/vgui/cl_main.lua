local PANEL = {}
local CurrentFrame = nil

function PANEL:UpdateResponsive()
	if IsValid(self) then
		self:gSetPos(0, 0)
		self:gSetSize(1920, 1080)
	end
end

function PANEL:Init()
	self:gSetPos(0, 0)
	self:gSetSize(1920, 1080)
	self:SetTitle("")
	self:ShowCloseButton(true)
	self:SetDraggable(false)
	self:MakePopup()
	self:gFadeIn(0.75)

	hook.Add("OnScreenSizeChanged", self, self.UpdateResponsive)
end

function PANEL:OnClose()
	net.Start("Module:Spawn:LoadingFinish")
	net.SendToServer()

	self:gFadeOut(0.75, 0, function()
		self:Remove()
	end)
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