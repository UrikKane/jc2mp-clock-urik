class 'Clock'

function Clock:__init()
	Events:Subscribe( "Render", self, self.Render )
end

function Clock:Render()
	self:CalcTime()

	local font_scale	= math.round(Render.Size.y/1080,1)
	local text1 = "Time"
	local text2 = tostring(self.time)
	local pos1 = Vector2( Render.Width*0.95, Render.Height * 0.10 )
	local pos2 = Vector2( Render.Width*0.95, Render.Height * 0.12 )
	local font1 = 18*font_scale
	local font2 = 18*font_scale	
	pos1.y = pos1.y - Render:GetTextHeight(text1, font1)
	pos1.x = pos1.x - Render:GetTextWidth(text1, font1) / 2		
	pos2.y = pos2.y - Render:GetTextHeight("00:00", font2)
	pos2.x = pos2.x - Render:GetTextWidth("00:00", font2) / 2
	Render:DrawText( pos1 + Vector2(1,1)*font_scale, text1, Color.Black, font1)
	Render:DrawText( pos1, text1, Color.Teal, font1)
	Render:DrawText( pos2 + Vector2(1,1)*font_scale, text2, Color.Black, font2)	
	Render:DrawText( pos2, text2, Color.SkyBlue, font2)
end

function Clock:CalcTime()
	local gettime = Game:GetTime()
	local hh, timedec = math.modf(gettime)
	local mm, _ = math.modf(60*timedec)
	self.time = string.format("%02d:%02d", hh, mm)
end


math.round = function(x, n) -- rounding function
    n = math.pow(10, n or 0)
    x = x * n
    if x >= 0 then x = math.floor(x + 0.5) else x = math.ceil(x - 0.5) end
    return x / n
end

Clock = Clock()