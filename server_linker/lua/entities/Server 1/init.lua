AddCSLuaFile( "cl_init.lua" ) 
AddCSLuaFile( "shared.lua" )  

include('shared.lua')
 
function ENT:Initialize() 

	self.Entity:SetModel( "models/Combine_Helicopter/helicopter_bomb01.mdl" )
	self.Entity:PhysicsInit( SOLID_VPHYSICS )
	self.Entity:SetMoveType(MOVETYPE_NONE)
	self.Entity:SetSolid(SOLID_VPHYSICS)
	
	self.Entity:SetCollisionGroup(COLLISION_GROUP_WEAPON)

	self:SetTrigger(true)


	local phys = self.Entity:GetPhysicsObject()
	if ( phys:IsValid() ) then
		phys:Wake()
	end
	
	self:SetDTFloat( 0, math.Rand( 0.5, 1.3 ) )
	self:SetDTFloat( 1, math.Rand( 0.3, 1.2 ) )
	
end

function ENT:SetupDataTables()

	self:DTVar( "Float", 0, "RotationSeed1" )
	self:DTVar( "Float", 1, "RotationSeed2" )

end

function ENT:OnTakeDamage( dmginfo )
	self.Entity:TakePhysicsDamage( dmginfo )
end

function ENT:StartTouch(OtherENT)
	if OtherENT: IsPlayer() then 
		BroadcastLua([[gui.OpenURL( "https://tinyurl.com/y9b5cl82" )]])

	end
end
