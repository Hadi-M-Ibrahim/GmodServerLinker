include('shared.lua')
 

ENT.RenderGroup = RENDERGROUP_TRANSLUCENT

local GlowMat = Material( "sprites/light_glow02_add" )

--The LightSpheres fixed by Gmod4phun original by Dlaor is the "model" I used for the linker credit goes to them for the looks of the ent

function ENT:Draw()

	self:DrawShadow( false )

	render.SetMaterial( GlowMat )
	
	local Seed1 = self:GetDTFloat( 0 )
	local Seed2 = self:GetDTFloat( 1 )
	local MyPos = self:GetPos()
	local Index = self:EntIndex()
	
	for i = 1, 180 do
		local Ang = ( Index + 1337 + CurTime() ) * i 
		local Size = ( 155 - i ) / 6 
		local Forward = Angle( Ang * Seed1, Ang * Seed2, 0 ):Forward()
		local Pos = MyPos + Forward * i * 0.1
		render.DrawSprite( Pos, Size, Size, self:GetColor() )
	end

end

function ENT:Think()
	local dlight = DynamicLight( self:EntIndex() )
	if ( dlight ) then
		local color = self:GetColor()
		local r,g,b,a = color.r,color.g,color.b,color.a 
		dlight.Pos = self:GetPos()
		dlight.r = r
		dlight.g = g
		dlight.b = b
		dlight.Brightness = 1
		dlight.Size = 128
		dlight.Decay = 0
		dlight.DieTime = CurTime() + 1
	end
end
