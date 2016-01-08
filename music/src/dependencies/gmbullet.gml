#define GMBULLET_Init
global.fGMBULLET_AddRigidBody=external_define('GMBullet.DLL','GMBULLET_AddRigidBody',dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_AddRigidBodiesFromList=external_define('GMBullet.DLL','GMBULLET_AddRigidBodiesFromList',dll_cdecl,ty_real,11,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_DeleteRigidBody=external_define('GMBullet.DLL','GMBULLET_DeleteRigidBody',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_DeleteRigidBodiesFromStack=external_define('GMBullet.DLL','GMBULLET_DeleteRigidBodiesFromStack',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_DeleteRigidBodiesFromList=external_define('GMBullet.DLL','GMBULLET_DeleteRigidBodiesFromList',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_SetFriction=external_define('GMBullet.DLL','GMBULLET_SetFriction',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetAllFriction=external_define('GMBullet.DLL','GMBULLET_SetAllFriction',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_DisableDeactivation=external_define('GMBullet.DLL','GMBULLET_DisableDeactivation',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_ActivateBody=external_define('GMBullet.DLL','GMBULLET_ActivateBody',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetCollisionGroupMask=external_define('GMBullet.DLL','GMBULLET_SetCollisionGroupMask',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_AssociateBodyWithInstance=external_define('GMBullet.DLL','GMBULLET_AssociateBodyWithInstance',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetMass=external_define('GMBullet.DLL','GMBULLET_SetMass',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetDeactivationThresholds=external_define('GMBullet.DLL','GMBULLET_SetDeactivationThresholds',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_SetDeactivationTime=external_define('GMBullet.DLL','GMBULLET_SetDeactivationTime',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetHitFraction=external_define('GMBullet.DLL','GMBULLET_SetHitFraction',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetDamping=external_define('GMBullet.DLL','GMBULLET_SetDamping',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_SetRestitution=external_define('GMBullet.DLL','GMBULLET_SetRestitution',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetPosition=external_define('GMBullet.DLL','GMBULLET_SetPosition',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetPositionX=external_define('GMBullet.DLL','GMBULLET_SetPositionX',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetPositionY=external_define('GMBullet.DLL','GMBULLET_SetPositionY',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetPositionZ=external_define('GMBullet.DLL','GMBULLET_SetPositionZ',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetRelativePosition=external_define('GMBullet.DLL','GMBULLET_SetRelativePosition',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_ClearRotation=external_define('GMBullet.DLL','GMBULLET_ClearRotation',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_AddArbitraryRotation=external_define('GMBullet.DLL','GMBULLET_AddArbitraryRotation',dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_AddRotationWithFlags=external_define('GMBullet.DLL','GMBULLET_AddRotationWithFlags',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_AddRotationQuaternion=external_define('GMBullet.DLL','GMBULLET_AddRotationQuaternion',dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_AddRotationSLERP=external_define('GMBullet.DLL','GMBULLET_AddRotationSLERP',dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_AddRotationSLERPEuler=external_define('GMBullet.DLL','GMBULLET_AddRotationSLERPEuler',dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetArbitraryRotation=external_define('GMBullet.DLL','GMBULLET_SetArbitraryRotation',dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetRotationWithFlags=external_define('GMBullet.DLL','GMBULLET_SetRotationWithFlags',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetRotationQuaternion=external_define('GMBullet.DLL','GMBULLET_SetRotationQuaternion',dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetRotationSLERP=external_define('GMBullet.DLL','GMBULLET_SetRotationSLERP',dll_cdecl,ty_real,10,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetRotationSLERPEuler=external_define('GMBullet.DLL','GMBULLET_SetRotationSLERPEuler',dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetBodyPosFromStack=external_define('GMBullet.DLL','GMBULLET_SetBodyPosFromStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetBodyRotWFFromStack=external_define('GMBullet.DLL','GMBULLET_SetBodyRotWFFromStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetBodyPosRotWFFromStack=external_define('GMBullet.DLL','GMBULLET_SetBodyPosRotWFFromStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetBodyPosFromList=external_define('GMBullet.DLL','GMBULLET_SetBodyPosFromList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetBodyRotWFFromList=external_define('GMBullet.DLL','GMBULLET_SetBodyRotWFFromList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetBodyPosRotWFFromList=external_define('GMBullet.DLL','GMBULLET_SetBodyPosRotWFFromList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetAngularFactor=external_define('GMBullet.DLL','GMBULLET_SetAngularFactor',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetAngularVelocityX=external_define('GMBullet.DLL','GMBULLET_SetAngularVelocityX',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetAngularVelocityY=external_define('GMBullet.DLL','GMBULLET_SetAngularVelocityY',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetAngularVelocityZ=external_define('GMBullet.DLL','GMBULLET_SetAngularVelocityZ',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetAngularVelocity=external_define('GMBullet.DLL','GMBULLET_SetAngularVelocity',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_AddAngularVelocity=external_define('GMBullet.DLL','GMBULLET_AddAngularVelocity',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_ApplyTorqueImpulse=external_define('GMBullet.DLL','GMBULLET_ApplyTorqueImpulse',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetLinearVelocityX=external_define('GMBullet.DLL','GMBULLET_SetLinearVelocityX',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetLinearVelocityY=external_define('GMBullet.DLL','GMBULLET_SetLinearVelocityY',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetLinearVelocityZ=external_define('GMBullet.DLL','GMBULLET_SetLinearVelocityZ',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetLinearVelocity=external_define('GMBullet.DLL','GMBULLET_SetLinearVelocity',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_AddLinearVelocity=external_define('GMBullet.DLL','GMBULLET_AddLinearVelocity',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_ApplyCentralImpulse=external_define('GMBullet.DLL','GMBULLET_ApplyCentralImpulse',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_ApplyImpulse=external_define('GMBullet.DLL','GMBULLET_ApplyImpulse',dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_ApplyImpulseFromSpeedAndMass=external_define('GMBullet.DLL','GMBULLET_ApplyImpulseFromSpeedAndMass',dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_AddVelocityAtPoint=external_define('GMBullet.DLL','GMBULLET_AddVelocityAtPoint',dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetGravityX=external_define('GMBullet.DLL','GMBULLET_SetGravityX',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetGravityY=external_define('GMBullet.DLL','GMBULLET_SetGravityY',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetGravityZ=external_define('GMBullet.DLL','GMBULLET_SetGravityZ',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetGravity=external_define('GMBullet.DLL','GMBULLET_SetGravity',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_AddGravity=external_define('GMBullet.DLL','GMBULLET_AddGravity',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetBodyLinVelFromStack=external_define('GMBullet.DLL','GMBULLET_SetBodyLinVelFromStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetBodyAngVelFromStack=external_define('GMBullet.DLL','GMBULLET_SetBodyAngVelFromStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetBodyLinAngVelFromStack=external_define('GMBullet.DLL','GMBULLET_SetBodyLinAngVelFromStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetBodyGravityFromStack=external_define('GMBullet.DLL','GMBULLET_SetBodyGravityFromStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetBodyLinVelFromList=external_define('GMBullet.DLL','GMBULLET_SetBodyLinVelFromList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetBodyAngVelFromList=external_define('GMBullet.DLL','GMBULLET_SetBodyAngVelFromList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetBodyLinAngVelFromList=external_define('GMBullet.DLL','GMBULLET_SetBodyLinAngVelFromList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetBodyGravityFromList=external_define('GMBullet.DLL','GMBULLET_SetBodyGravityFromList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetFriction=external_define('GMBullet.DLL','GMBULLET_GetFriction',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_IsStatic=external_define('GMBullet.DLL','GMBULLET_IsStatic',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_IsKinematic=external_define('GMBullet.DLL','GMBULLET_IsKinematic',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_IsStaticOrKinematic=external_define('GMBullet.DLL','GMBULLET_IsStaticOrKinematic',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_IsActive=external_define('GMBullet.DLL','GMBULLET_IsActive',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_HasCollided=external_define('GMBullet.DLL','GMBULLET_HasCollided',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetDeactivationTime=external_define('GMBullet.DLL','GMBULLET_GetDeactivationTime',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetAssociatedInstance=external_define('GMBullet.DLL','GMBULLET_GetAssociatedInstance',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetAngularFactor=external_define('GMBullet.DLL','GMBULLET_GetAngularFactor',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetGravityX=external_define('GMBullet.DLL','GMBULLET_GetGravityX',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetGravityY=external_define('GMBullet.DLL','GMBULLET_GetGravityY',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetGravityZ=external_define('GMBullet.DLL','GMBULLET_GetGravityZ',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetPositionX=external_define('GMBullet.DLL','GMBULLET_GetPositionX',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetPositionY=external_define('GMBullet.DLL','GMBULLET_GetPositionY',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetPositionZ=external_define('GMBullet.DLL','GMBULLET_GetPositionZ',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRotationAngleAxisX=external_define('GMBullet.DLL','GMBULLET_GetRotationAngleAxisX',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRotationAngleAxisY=external_define('GMBullet.DLL','GMBULLET_GetRotationAngleAxisY',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRotationAngleAxisZ=external_define('GMBullet.DLL','GMBULLET_GetRotationAngleAxisZ',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRotationAngleAxisTheta=external_define('GMBullet.DLL','GMBULLET_GetRotationAngleAxisTheta',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRotationEulerX=external_define('GMBullet.DLL','GMBULLET_GetRotationEulerX',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRotationEulerY=external_define('GMBullet.DLL','GMBULLET_GetRotationEulerY',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRotationEulerZ=external_define('GMBullet.DLL','GMBULLET_GetRotationEulerZ',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRotationQuaternionX=external_define('GMBullet.DLL','GMBULLET_GetRotationQuaternionX',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRotationQuaternionY=external_define('GMBullet.DLL','GMBULLET_GetRotationQuaternionY',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRotationQuaternionZ=external_define('GMBullet.DLL','GMBULLET_GetRotationQuaternionZ',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRotationQuaternionW=external_define('GMBullet.DLL','GMBULLET_GetRotationQuaternionW',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetAngularVelocityX=external_define('GMBullet.DLL','GMBULLET_GetAngularVelocityX',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetAngularVelocityY=external_define('GMBullet.DLL','GMBULLET_GetAngularVelocityY',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetAngularVelocityZ=external_define('GMBullet.DLL','GMBULLET_GetAngularVelocityZ',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetLinearVelocityX=external_define('GMBullet.DLL','GMBULLET_GetLinearVelocityX',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetLinearVelocityY=external_define('GMBullet.DLL','GMBULLET_GetLinearVelocityY',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetLinearVelocityZ=external_define('GMBullet.DLL','GMBULLET_GetLinearVelocityZ',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetCollisionMask=external_define('GMBullet.DLL','GMBULLET_GetCollisionMask',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetCollisionGroup=external_define('GMBullet.DLL','GMBULLET_GetCollisionGroup',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetMass=external_define('GMBullet.DLL','GMBULLET_GetMass',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetHitFraction=external_define('GMBullet.DLL','GMBULLET_GetHitFraction',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRestitution=external_define('GMBullet.DLL','GMBULLET_GetRestitution',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_DeactivationTime=external_define('GMBullet.DLL','GMBULLET_DeactivationTime',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetDistanceToPoint=external_define('GMBullet.DLL','GMBULLET_GetDistanceToPoint',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_GetDistanceToBody=external_define('GMBullet.DLL','GMBULLET_GetDistanceToBody',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetBodyPositionsToStack=external_define('GMBullet.DLL','GMBULLET_GetBodyPositionsToStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetBodyRotationsToStack=external_define('GMBullet.DLL','GMBULLET_GetBodyRotationsToStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetBodyTransformsToStack=external_define('GMBullet.DLL','GMBULLET_GetBodyTransformsToStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetBodyLinVelocitiesToStack=external_define('GMBullet.DLL','GMBULLET_GetBodyLinVelocitiesToStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetBodyAngVelocitiesToStack=external_define('GMBullet.DLL','GMBULLET_GetBodyAngVelocitiesToStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetBodyVelocitiesToStack=external_define('GMBullet.DLL','GMBULLET_GetBodyVelocitiesToStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetBodyPositionsToList=external_define('GMBullet.DLL','GMBULLET_GetBodyPositionsToList',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetBodyRotationsToList=external_define('GMBullet.DLL','GMBULLET_GetBodyRotationsToList',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetBodyTransformsToList=external_define('GMBullet.DLL','GMBULLET_GetBodyTransformsToList',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetBodyLinVelocitiesToList=external_define('GMBullet.DLL','GMBULLET_GetBodyLinVelocitiesToList',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetBodyAngVelocitiesToList=external_define('GMBullet.DLL','GMBULLET_GetBodyAngVelocitiesToList',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetBodyVelocitiesToList=external_define('GMBullet.DLL','GMBULLET_GetBodyVelocitiesToList',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_Prepare2BodyConstraint=external_define('GMBullet.DLL','GMBULLET_Prepare2BodyConstraint',dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_Create1BodyBallConstraint=external_define('GMBullet.DLL','GMBULLET_Create1BodyBallConstraint',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_Create2BodyBallConstraint=external_define('GMBullet.DLL','GMBULLET_Create2BodyBallConstraint',dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetBallConstraintPivot=external_define('GMBullet.DLL','GMBULLET_SetBallConstraintPivot',dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_Create1BodyHingeConstraint=external_define('GMBullet.DLL','GMBULLET_Create1BodyHingeConstraint',dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_Create2BodyHingeConstraint=external_define('GMBullet.DLL','GMBULLET_Create2BodyHingeConstraint',dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_EnableHingeAngularMotor=external_define('GMBullet.DLL','GMBULLET_EnableHingeAngularMotor',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetHingeLimit=external_define('GMBullet.DLL','GMBULLET_SetHingeLimit',dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_Create1BodyConeConstraint=external_define('GMBullet.DLL','GMBULLET_Create1BodyConeConstraint',dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_Create2BodyConeConstraint=external_define('GMBullet.DLL','GMBULLET_Create2BodyConeConstraint',dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetConeLimit=external_define('GMBullet.DLL','GMBULLET_SetConeLimit',dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetHingeConeAngularOnly=external_define('GMBullet.DLL','GMBULLET_SetHingeConeAngularOnly',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_Create2Body6DOFConstraint=external_define('GMBullet.DLL','GMBULLET_Create2Body6DOFConstraint',dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_Set6DOFLimit=external_define('GMBullet.DLL','GMBULLET_Set6DOFLimit',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_DeleteConstraint=external_define('GMBullet.DLL','GMBULLET_DeleteConstraint',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_Create2DConstraint=external_define('GMBullet.DLL','GMBULLET_Create2DConstraint',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_Create2BodySliderConstraint=external_define('GMBullet.DLL','GMBULLET_Create2BodySliderConstraint',dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetSliderLimits=external_define('GMBullet.DLL','GMBULLET_SetSliderLimits',dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetSliderMotor=external_define('GMBullet.DLL','GMBULLET_SetSliderMotor',dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetSliderRestitution=external_define('GMBullet.DLL','GMBULLET_SetSliderRestitution',dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetSliderSoftness=external_define('GMBullet.DLL','GMBULLET_SetSliderSoftness',dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetSliderDamping=external_define('GMBullet.DLL','GMBULLET_SetSliderDamping',dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetCurrentTuning=external_define('GMBullet.DLL','GMBULLET_SetCurrentTuning',dll_cdecl,ty_real,5,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_CreateVehicle=external_define('GMBullet.DLL','GMBULLET_CreateVehicle',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_SetUpWheel=external_define('GMBullet.DLL','GMBULLET_SetUpWheel',dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_AddWheel=external_define('GMBullet.DLL','GMBULLET_AddWheel',dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_ApplyEngineForce=external_define('GMBullet.DLL','GMBULLET_ApplyEngineForce',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_SetBrake=external_define('GMBullet.DLL','GMBULLET_SetBrake',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_SetSteering=external_define('GMBullet.DLL','GMBULLET_SetSteering',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_ChangeWheelProperties=external_define('GMBullet.DLL','GMBULLET_ChangeWheelProperties',dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_GetCurrentSpeed=external_define('GMBullet.DLL','GMBULLET_GetCurrentSpeed',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_CreateBulletWorld=external_define('GMBullet.DLL','GMBULLET_CreateBulletWorld',dll_cdecl,ty_real,7,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_DestroyBulletWorld=external_define('GMBullet.DLL','GMBULLET_DestroyBulletWorld',dll_cdecl,ty_real,0);
global.fGMBULLET_StepSimulationTime=external_define('GMBullet.DLL','GMBULLET_StepSimulationTime',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_SetWorldGravity=external_define('GMBullet.DLL','GMBULLET_SetWorldGravity',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_SetWorldScale=external_define('GMBullet.DLL','GMBULLET_SetWorldScale',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_SetAngleProperties=external_define('GMBullet.DLL','GMBULLET_SetAngleProperties',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_SetRotationFlags=external_define('GMBullet.DLL','GMBULLET_SetRotationFlags',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_RayTestClosestHit=external_define('GMBullet.DLL','GMBULLET_RayTestClosestHit',dll_cdecl,ty_real,10,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_RayTestAllHit=external_define('GMBullet.DLL','GMBULLET_RayTestAllHit',dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_RayTestSingle=external_define('GMBullet.DLL','GMBULLET_RayTestSingle',dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_ConvexSweepOrientation=external_define('GMBullet.DLL','GMBULLET_ConvexSweepOrientation',dll_cdecl,ty_real,6,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_ConvexSweepClosestHit=external_define('GMBullet.DLL','GMBULLET_ConvexSweepClosestHit',dll_cdecl,ty_real,11,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_ConvexSweepAllHit=external_define('GMBullet.DLL','GMBULLET_ConvexSweepAllHit',dll_cdecl,ty_real,10,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_ConvexSweepSingle=external_define('GMBullet.DLL','GMBULLET_ConvexSweepSingle',dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_GetRayConvexTestHitPointX=external_define('GMBullet.DLL','GMBULLET_GetRayConvexTestHitPointX',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRayConvexTestHitPointY=external_define('GMBullet.DLL','GMBULLET_GetRayConvexTestHitPointY',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRayConvexTestHitPointZ=external_define('GMBullet.DLL','GMBULLET_GetRayConvexTestHitPointZ',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRayConvexTestHitNormalX=external_define('GMBullet.DLL','GMBULLET_GetRayConvexTestHitNormalX',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRayConvexTestHitNormalY=external_define('GMBullet.DLL','GMBULLET_GetRayConvexTestHitNormalY',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRayConvexTestHitNormalZ=external_define('GMBullet.DLL','GMBULLET_GetRayConvexTestHitNormalZ',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRayConvexTestHitFraction=external_define('GMBullet.DLL','GMBULLET_GetRayConvexTestHitFraction',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRayConvexTestObjectID=external_define('GMBullet.DLL','GMBULLET_GetRayConvexTestObjectID',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetRayConvexTestGMID=external_define('GMBullet.DLL','GMBULLET_GetRayConvexTestGMID',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_ClearRayConvexTestResults=external_define('GMBullet.DLL','GMBULLET_ClearRayConvexTestResults',dll_cdecl,ty_real,0);
global.fGMBULLET_PerformTestUsingDSStack=external_define('GMBullet.DLL','GMBULLET_PerformTestUsingDSStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_PerformTestUsingDSList=external_define('GMBullet.DLL','GMBULLET_PerformTestUsingDSList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GenerateActiveList=external_define('GMBullet.DLL','GMBULLET_GenerateActiveList',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GenerateCollidedList=external_define('GMBullet.DLL','GMBULLET_GenerateCollidedList',dll_cdecl,ty_real,0);
global.fGMBULLET_GenerateCollideWithBodyList=external_define('GMBullet.DLL','GMBULLET_GenerateCollideWithBodyList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_ClearList=external_define('GMBullet.DLL','GMBULLET_ClearList',dll_cdecl,ty_real,0);
global.fGMBULLET_GetListBodyID=external_define('GMBullet.DLL','GMBULLET_GetListBodyID',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetListBodyIDsToStack=external_define('GMBullet.DLL','GMBULLET_GetListBodyIDsToStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetListBodyIDsToList=external_define('GMBullet.DLL','GMBULLET_GetListBodyIDsToList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetNumNewCollisionPair=external_define('GMBullet.DLL','GMBULLET_GetNumNewCollisionPair',dll_cdecl,ty_real,0);
global.fGMBULLET_GetNumOldCollisionPair=external_define('GMBullet.DLL','GMBULLET_GetNumOldCollisionPair',dll_cdecl,ty_real,0);
global.fGMBULLET_GetNumCollisionPair=external_define('GMBullet.DLL','GMBULLET_GetNumCollisionPair',dll_cdecl,ty_real,0);
global.fGMBULLET_GetNewCollisionPairBodyID=external_define('GMBullet.DLL','GMBULLET_GetNewCollisionPairBodyID',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_GetOldCollisionPairBodyID=external_define('GMBullet.DLL','GMBULLET_GetOldCollisionPairBodyID',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_GetCollisionPairBodyID=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairBodyID',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_GetOldCollisionPairToStack=external_define('GMBullet.DLL','GMBULLET_GetOldCollisionPairToStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetOldCollisionPairToList=external_define('GMBullet.DLL','GMBULLET_GetOldCollisionPairToList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetNewCollisionPairToStack=external_define('GMBullet.DLL','GMBULLET_GetNewCollisionPairToStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetNewCollisionPairToList=external_define('GMBullet.DLL','GMBULLET_GetNewCollisionPairToList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetCollisionPairToStack=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairToStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetCollisionPairToList=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairToList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetCollisionPairNumContactPoints=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairNumContactPoints',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetCollisionPairContactPointX=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairContactPointX',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_GetCollisionPairContactPointY=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairContactPointY',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_GetCollisionPairContactPointZ=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairContactPointZ',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_GetCollisionPairContactPointAverageX=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairContactPointAverageX',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetCollisionPairContactPointAverageY=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairContactPointAverageY',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetCollisionPairContactPointAverageZ=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairContactPointAverageZ',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetCollisionPairContactPointAverageToStack=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairContactPointAverageToStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetCollisionPairContactPointsToStack=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairContactPointsToStack',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetCollisionPairContactPointAverageToList=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairContactPointAverageToList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_GetCollisionPairContactPointsToList=external_define('GMBullet.DLL','GMBULLET_GetCollisionPairContactPointsToList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_CreateBoxShape=external_define('GMBullet.DLL','GMBULLET_CreateBoxShape',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_CreateCylinderShape=external_define('GMBullet.DLL','GMBULLET_CreateCylinderShape',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_CreateConeShape=external_define('GMBullet.DLL','GMBULLET_CreateConeShape',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_CreateSphereShape=external_define('GMBullet.DLL','GMBULLET_CreateSphereShape',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_CreateCompoundShape=external_define('GMBullet.DLL','GMBULLET_CreateCompoundShape',dll_cdecl,ty_real,0);
global.fGMBULLET_AddChildToCompoundShape=external_define('GMBullet.DLL','GMBULLET_AddChildToCompoundShape',dll_cdecl,ty_real,8,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_GetNumCompoundChildShapes=external_define('GMBullet.DLL','GMBULLET_GetNumCompoundChildShapes',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_GetCompoundChildShape=external_define('GMBullet.DLL','GMBULLET_GetCompoundChildShape',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_RemoveCompoundChildShape=external_define('GMBullet.DLL','GMBULLET_RemoveCompoundChildShape',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_StartTriMeshShape=external_define('GMBullet.DLL','GMBULLET_StartTriMeshShape',dll_cdecl,ty_real,0);
global.fGMBULLET_AddTriangle=external_define('GMBullet.DLL','GMBULLET_AddTriangle',dll_cdecl,ty_real,9,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_FinishTriMeshShape=external_define('GMBullet.DLL','GMBULLET_FinishTriMeshShape',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_CreateTriMeshShapeFromQueue=external_define('GMBullet.DLL','GMBULLET_CreateTriMeshShapeFromQueue',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_CreateIndexedTriMeshShapeFromQueue=external_define('GMBullet.DLL','GMBULLET_CreateIndexedTriMeshShapeFromQueue',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_CreateTriMeshShapeFrom3DSFile=external_define('GMBullet.DLL','GMBULLET_CreateTriMeshShapeFrom3DSFile',dll_cdecl,ty_real,2,ty_string,ty_real);
global.fGMBULLET_CreateTriMeshShapeFrom3DSFileList=external_define('GMBullet.DLL','GMBULLET_CreateTriMeshShapeFrom3DSFileList',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_CreateTriMeshShapeFromModelEx=external_define('GMBullet.DLL','GMBULLET_CreateTriMeshShapeFromModelEx',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_CreateShapesFromBSP=external_define('GMBullet.DLL','GMBULLET_CreateShapesFromBSP',dll_cdecl,ty_real,3,ty_string,ty_real,ty_real);
global.fGMBULLET_DeleteShape=external_define('GMBullet.DLL','GMBULLET_DeleteShape',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_DeleteShapesFromStack=external_define('GMBullet.DLL','GMBULLET_DeleteShapesFromStack',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_DeleteShapesFromList=external_define('GMBullet.DLL','GMBULLET_DeleteShapesFromList',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_DeleteAllShapes=external_define('GMBullet.DLL','GMBULLET_DeleteAllShapes',dll_cdecl,ty_real,0);
global.fGMBULLET_SetShapeScaling=external_define('GMBullet.DLL','GMBULLET_SetShapeScaling',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_CreateUniformScalingShape=external_define('GMBullet.DLL','GMBULLET_CreateUniformScalingShape',dll_cdecl,ty_real,2,ty_real,ty_real);
global.fGMBULLET_AddToMultiSphere=external_define('GMBullet.DLL','GMBULLET_AddToMultiSphere',dll_cdecl,ty_real,4,ty_real,ty_real,ty_real,ty_real);
global.fGMBULLET_FinishMultiSphereShape=external_define('GMBullet.DLL','GMBULLET_FinishMultiSphereShape',dll_cdecl,ty_real,3,ty_real,ty_real,ty_real);
global.fGMBULLET_GetGMD3DDevice=external_define('GMBullet.DLL','GMBULLET_GetGMD3DDevice',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_SetD3DTransformMatrix=external_define('GMBullet.DLL','GMBULLET_SetD3DTransformMatrix',dll_cdecl,ty_real,1,ty_real);
global.fGMBULLET_SetupDebugDrawer=external_define('GMBullet.DLL','GMBULLET_SetupDebugDrawer',dll_cdecl,ty_real,0);
global.fGMBULLET_DebugDrawWorld=external_define('GMBullet.DLL','GMBULLET_DebugDrawWorld',dll_cdecl,ty_real,0);
global.fGMBULLET_ImTopmost=external_define('GMBullet.DLL','GMBULLET_ImTopmost',dll_cdecl,ty_real,0);

#define GMBULLET_AddRigidBody
return external_call(global.fGMBULLET_AddRigidBody,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);

#define GMBULLET_AddRigidBodiesFromList
return external_call(global.fGMBULLET_AddRigidBodiesFromList,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);

#define GMBULLET_DeleteRigidBody
return external_call(global.fGMBULLET_DeleteRigidBody,argument0);

#define GMBULLET_DeleteRigidBodiesFromStack
return external_call(global.fGMBULLET_DeleteRigidBodiesFromStack,argument0);

#define GMBULLET_DeleteRigidBodiesFromList
return external_call(global.fGMBULLET_DeleteRigidBodiesFromList,argument0);

#define GMBULLET_SetFriction
return external_call(global.fGMBULLET_SetFriction,argument0,argument1);

#define GMBULLET_SetAllFriction
return external_call(global.fGMBULLET_SetAllFriction,argument0);

#define GMBULLET_DisableDeactivation
return external_call(global.fGMBULLET_DisableDeactivation,argument0,argument1);

#define GMBULLET_ActivateBody
return external_call(global.fGMBULLET_ActivateBody,argument0,argument1);

#define GMBULLET_SetCollisionGroupMask
return external_call(global.fGMBULLET_SetCollisionGroupMask,argument0,argument1,argument2);

#define GMBULLET_AssociateBodyWithInstance
return external_call(global.fGMBULLET_AssociateBodyWithInstance,argument0,argument1);

#define GMBULLET_SetMass
return external_call(global.fGMBULLET_SetMass,argument0,argument1);

#define GMBULLET_SetDeactivationThresholds
return external_call(global.fGMBULLET_SetDeactivationThresholds,argument0,argument1,argument2);

#define GMBULLET_SetDeactivationTime
return external_call(global.fGMBULLET_SetDeactivationTime,argument0,argument1);

#define GMBULLET_SetHitFraction
return external_call(global.fGMBULLET_SetHitFraction,argument0,argument1);

#define GMBULLET_SetDamping
return external_call(global.fGMBULLET_SetDamping,argument0,argument1,argument2);

#define GMBULLET_SetRestitution
return external_call(global.fGMBULLET_SetRestitution,argument0,argument1);

#define GMBULLET_SetPosition
return external_call(global.fGMBULLET_SetPosition,argument0,argument1,argument2,argument3);

#define GMBULLET_SetPositionX
return external_call(global.fGMBULLET_SetPositionX,argument0,argument1);

#define GMBULLET_SetPositionY
return external_call(global.fGMBULLET_SetPositionY,argument0,argument1);

#define GMBULLET_SetPositionZ
return external_call(global.fGMBULLET_SetPositionZ,argument0,argument1);

#define GMBULLET_SetRelativePosition
return external_call(global.fGMBULLET_SetRelativePosition,argument0,argument1,argument2,argument3);

#define GMBULLET_ClearRotation
return external_call(global.fGMBULLET_ClearRotation,argument0);

#define GMBULLET_AddArbitraryRotation
return external_call(global.fGMBULLET_AddArbitraryRotation,argument0,argument1,argument2,argument3,argument4);

#define GMBULLET_AddRotationWithFlags
return external_call(global.fGMBULLET_AddRotationWithFlags,argument0,argument1,argument2,argument3);

#define GMBULLET_AddRotationQuaternion
return external_call(global.fGMBULLET_AddRotationQuaternion,argument0,argument1,argument2,argument3,argument4);

#define GMBULLET_AddRotationSLERP
return external_call(global.fGMBULLET_AddRotationSLERP,argument0,argument1,argument2,argument3,argument4,argument5);

#define GMBULLET_AddRotationSLERPEuler
return external_call(global.fGMBULLET_AddRotationSLERPEuler,argument0,argument1,argument2,argument3,argument4);

#define GMBULLET_SetArbitraryRotation
return external_call(global.fGMBULLET_SetArbitraryRotation,argument0,argument1,argument2,argument3,argument4);

#define GMBULLET_SetRotationWithFlags
return external_call(global.fGMBULLET_SetRotationWithFlags,argument0,argument1,argument2,argument3);

#define GMBULLET_SetRotationQuaternion
return external_call(global.fGMBULLET_SetRotationQuaternion,argument0,argument1,argument2,argument3,argument4);

#define GMBULLET_SetRotationSLERP
return external_call(global.fGMBULLET_SetRotationSLERP,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);

#define GMBULLET_SetRotationSLERPEuler
return external_call(global.fGMBULLET_SetRotationSLERPEuler,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define GMBULLET_SetBodyPosFromStack
return external_call(global.fGMBULLET_SetBodyPosFromStack,argument0,argument1);

#define GMBULLET_SetBodyRotWFFromStack
return external_call(global.fGMBULLET_SetBodyRotWFFromStack,argument0,argument1);

#define GMBULLET_SetBodyPosRotWFFromStack
return external_call(global.fGMBULLET_SetBodyPosRotWFFromStack,argument0,argument1);

#define GMBULLET_SetBodyPosFromList
return external_call(global.fGMBULLET_SetBodyPosFromList,argument0,argument1);

#define GMBULLET_SetBodyRotWFFromList
return external_call(global.fGMBULLET_SetBodyRotWFFromList,argument0,argument1);

#define GMBULLET_SetBodyPosRotWFFromList
return external_call(global.fGMBULLET_SetBodyPosRotWFFromList,argument0,argument1);

#define GMBULLET_SetAngularFactor
return external_call(global.fGMBULLET_SetAngularFactor,argument0,argument1);

#define GMBULLET_SetAngularVelocityX
return external_call(global.fGMBULLET_SetAngularVelocityX,argument0,argument1);

#define GMBULLET_SetAngularVelocityY
return external_call(global.fGMBULLET_SetAngularVelocityY,argument0,argument1);

#define GMBULLET_SetAngularVelocityZ
return external_call(global.fGMBULLET_SetAngularVelocityZ,argument0,argument1);

#define GMBULLET_SetAngularVelocity
return external_call(global.fGMBULLET_SetAngularVelocity,argument0,argument1,argument2,argument3);

#define GMBULLET_AddAngularVelocity
return external_call(global.fGMBULLET_AddAngularVelocity,argument0,argument1,argument2,argument3);

#define GMBULLET_ApplyTorqueImpulse
return external_call(global.fGMBULLET_ApplyTorqueImpulse,argument0,argument1,argument2,argument3);

#define GMBULLET_SetLinearVelocityX
return external_call(global.fGMBULLET_SetLinearVelocityX,argument0,argument1);

#define GMBULLET_SetLinearVelocityY
return external_call(global.fGMBULLET_SetLinearVelocityY,argument0,argument1);

#define GMBULLET_SetLinearVelocityZ
return external_call(global.fGMBULLET_SetLinearVelocityZ,argument0,argument1);

#define GMBULLET_SetLinearVelocity
return external_call(global.fGMBULLET_SetLinearVelocity,argument0,argument1,argument2,argument3);

#define GMBULLET_AddLinearVelocity
return external_call(global.fGMBULLET_AddLinearVelocity,argument0,argument1,argument2,argument3);

#define GMBULLET_ApplyCentralImpulse
return external_call(global.fGMBULLET_ApplyCentralImpulse,argument0,argument1,argument2,argument3);

#define GMBULLET_ApplyImpulse
return external_call(global.fGMBULLET_ApplyImpulse,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define GMBULLET_ApplyImpulseFromSpeedAndMass
return external_call(global.fGMBULLET_ApplyImpulseFromSpeedAndMass,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);

#define GMBULLET_AddVelocityAtPoint
return external_call(global.fGMBULLET_AddVelocityAtPoint,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define GMBULLET_SetGravityX
return external_call(global.fGMBULLET_SetGravityX,argument0,argument1);

#define GMBULLET_SetGravityY
return external_call(global.fGMBULLET_SetGravityY,argument0,argument1);

#define GMBULLET_SetGravityZ
return external_call(global.fGMBULLET_SetGravityZ,argument0,argument1);

#define GMBULLET_SetGravity
return external_call(global.fGMBULLET_SetGravity,argument0,argument1,argument2,argument3);

#define GMBULLET_AddGravity
return external_call(global.fGMBULLET_AddGravity,argument0,argument1,argument2,argument3);

#define GMBULLET_SetBodyLinVelFromStack
return external_call(global.fGMBULLET_SetBodyLinVelFromStack,argument0,argument1);

#define GMBULLET_SetBodyAngVelFromStack
return external_call(global.fGMBULLET_SetBodyAngVelFromStack,argument0,argument1);

#define GMBULLET_SetBodyLinAngVelFromStack
return external_call(global.fGMBULLET_SetBodyLinAngVelFromStack,argument0,argument1);

#define GMBULLET_SetBodyGravityFromStack
return external_call(global.fGMBULLET_SetBodyGravityFromStack,argument0,argument1);

#define GMBULLET_SetBodyLinVelFromList
return external_call(global.fGMBULLET_SetBodyLinVelFromList,argument0,argument1);

#define GMBULLET_SetBodyAngVelFromList
return external_call(global.fGMBULLET_SetBodyAngVelFromList,argument0,argument1);

#define GMBULLET_SetBodyLinAngVelFromList
return external_call(global.fGMBULLET_SetBodyLinAngVelFromList,argument0,argument1);

#define GMBULLET_SetBodyGravityFromList
return external_call(global.fGMBULLET_SetBodyGravityFromList,argument0,argument1);

#define GMBULLET_GetFriction
return external_call(global.fGMBULLET_GetFriction,argument0);

#define GMBULLET_IsStatic
return external_call(global.fGMBULLET_IsStatic,argument0);

#define GMBULLET_IsKinematic
return external_call(global.fGMBULLET_IsKinematic,argument0);

#define GMBULLET_IsStaticOrKinematic
return external_call(global.fGMBULLET_IsStaticOrKinematic,argument0);

#define GMBULLET_IsActive
return external_call(global.fGMBULLET_IsActive,argument0);

#define GMBULLET_HasCollided
return external_call(global.fGMBULLET_HasCollided,argument0);

#define GMBULLET_GetDeactivationTime
return external_call(global.fGMBULLET_GetDeactivationTime,argument0);

#define GMBULLET_GetAssociatedInstance
return external_call(global.fGMBULLET_GetAssociatedInstance,argument0);

#define GMBULLET_GetAngularFactor
return external_call(global.fGMBULLET_GetAngularFactor,argument0);

#define GMBULLET_GetGravityX
return external_call(global.fGMBULLET_GetGravityX,argument0);

#define GMBULLET_GetGravityY
return external_call(global.fGMBULLET_GetGravityY,argument0);

#define GMBULLET_GetGravityZ
return external_call(global.fGMBULLET_GetGravityZ,argument0);

#define GMBULLET_GetPositionX
return external_call(global.fGMBULLET_GetPositionX,argument0);

#define GMBULLET_GetPositionY
return external_call(global.fGMBULLET_GetPositionY,argument0);

#define GMBULLET_GetPositionZ
return external_call(global.fGMBULLET_GetPositionZ,argument0);

#define GMBULLET_GetRotationAngleAxisX
return external_call(global.fGMBULLET_GetRotationAngleAxisX,argument0);

#define GMBULLET_GetRotationAngleAxisY
return external_call(global.fGMBULLET_GetRotationAngleAxisY,argument0);

#define GMBULLET_GetRotationAngleAxisZ
return external_call(global.fGMBULLET_GetRotationAngleAxisZ,argument0);

#define GMBULLET_GetRotationAngleAxisTheta
return external_call(global.fGMBULLET_GetRotationAngleAxisTheta,argument0);

#define GMBULLET_GetRotationEulerX
return external_call(global.fGMBULLET_GetRotationEulerX,argument0);

#define GMBULLET_GetRotationEulerY
return external_call(global.fGMBULLET_GetRotationEulerY,argument0);

#define GMBULLET_GetRotationEulerZ
return external_call(global.fGMBULLET_GetRotationEulerZ,argument0);

#define GMBULLET_GetRotationQuaternionX
return external_call(global.fGMBULLET_GetRotationQuaternionX,argument0);

#define GMBULLET_GetRotationQuaternionY
return external_call(global.fGMBULLET_GetRotationQuaternionY,argument0);

#define GMBULLET_GetRotationQuaternionZ
return external_call(global.fGMBULLET_GetRotationQuaternionZ,argument0);

#define GMBULLET_GetRotationQuaternionW
return external_call(global.fGMBULLET_GetRotationQuaternionW,argument0);

#define GMBULLET_GetAngularVelocityX
return external_call(global.fGMBULLET_GetAngularVelocityX,argument0);

#define GMBULLET_GetAngularVelocityY
return external_call(global.fGMBULLET_GetAngularVelocityY,argument0);

#define GMBULLET_GetAngularVelocityZ
return external_call(global.fGMBULLET_GetAngularVelocityZ,argument0);

#define GMBULLET_GetLinearVelocityX
return external_call(global.fGMBULLET_GetLinearVelocityX,argument0);

#define GMBULLET_GetLinearVelocityY
return external_call(global.fGMBULLET_GetLinearVelocityY,argument0);

#define GMBULLET_GetLinearVelocityZ
return external_call(global.fGMBULLET_GetLinearVelocityZ,argument0);

#define GMBULLET_GetCollisionMask
return external_call(global.fGMBULLET_GetCollisionMask,argument0);

#define GMBULLET_GetCollisionGroup
return external_call(global.fGMBULLET_GetCollisionGroup,argument0);

#define GMBULLET_GetMass
return external_call(global.fGMBULLET_GetMass,argument0);

#define GMBULLET_GetHitFraction
return external_call(global.fGMBULLET_GetHitFraction,argument0);

#define GMBULLET_GetRestitution
return external_call(global.fGMBULLET_GetRestitution,argument0);

#define GMBULLET_DeactivationTime
return external_call(global.fGMBULLET_DeactivationTime,argument0);

#define GMBULLET_GetDistanceToPoint
return external_call(global.fGMBULLET_GetDistanceToPoint,argument0,argument1,argument2,argument3);

#define GMBULLET_GetDistanceToBody
return external_call(global.fGMBULLET_GetDistanceToBody,argument0,argument1);

#define GMBULLET_GetBodyPositionsToStack
return external_call(global.fGMBULLET_GetBodyPositionsToStack,argument0,argument1);

#define GMBULLET_GetBodyRotationsToStack
return external_call(global.fGMBULLET_GetBodyRotationsToStack,argument0,argument1);

#define GMBULLET_GetBodyTransformsToStack
return external_call(global.fGMBULLET_GetBodyTransformsToStack,argument0,argument1);

#define GMBULLET_GetBodyLinVelocitiesToStack
return external_call(global.fGMBULLET_GetBodyLinVelocitiesToStack,argument0,argument1);

#define GMBULLET_GetBodyAngVelocitiesToStack
return external_call(global.fGMBULLET_GetBodyAngVelocitiesToStack,argument0,argument1);

#define GMBULLET_GetBodyVelocitiesToStack
return external_call(global.fGMBULLET_GetBodyVelocitiesToStack,argument0,argument1);

#define GMBULLET_GetBodyPositionsToList
return external_call(global.fGMBULLET_GetBodyPositionsToList,argument0);

#define GMBULLET_GetBodyRotationsToList
return external_call(global.fGMBULLET_GetBodyRotationsToList,argument0);

#define GMBULLET_GetBodyTransformsToList
return external_call(global.fGMBULLET_GetBodyTransformsToList,argument0);

#define GMBULLET_GetBodyLinVelocitiesToList
return external_call(global.fGMBULLET_GetBodyLinVelocitiesToList,argument0);

#define GMBULLET_GetBodyAngVelocitiesToList
return external_call(global.fGMBULLET_GetBodyAngVelocitiesToList,argument0);

#define GMBULLET_GetBodyVelocitiesToList
return external_call(global.fGMBULLET_GetBodyVelocitiesToList,argument0);

#define GMBULLET_Prepare2BodyConstraint
return external_call(global.fGMBULLET_Prepare2BodyConstraint,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define GMBULLET_Create1BodyBallConstraint
return external_call(global.fGMBULLET_Create1BodyBallConstraint,argument0,argument1,argument2,argument3);

#define GMBULLET_Create2BodyBallConstraint
return external_call(global.fGMBULLET_Create2BodyBallConstraint,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);

#define GMBULLET_SetBallConstraintPivot
return external_call(global.fGMBULLET_SetBallConstraintPivot,argument0,argument1,argument2,argument3,argument4);

#define GMBULLET_Create1BodyHingeConstraint
return external_call(global.fGMBULLET_Create1BodyHingeConstraint,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define GMBULLET_Create2BodyHingeConstraint
return external_call(global.fGMBULLET_Create2BodyHingeConstraint,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define GMBULLET_EnableHingeAngularMotor
return external_call(global.fGMBULLET_EnableHingeAngularMotor,argument0,argument1,argument2,argument3);

#define GMBULLET_SetHingeLimit
return external_call(global.fGMBULLET_SetHingeLimit,argument0,argument1,argument2,argument3,argument4,argument5);

#define GMBULLET_Create1BodyConeConstraint
return external_call(global.fGMBULLET_Create1BodyConeConstraint,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define GMBULLET_Create2BodyConeConstraint
return external_call(global.fGMBULLET_Create2BodyConeConstraint,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define GMBULLET_SetConeLimit
return external_call(global.fGMBULLET_SetConeLimit,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define GMBULLET_SetHingeConeAngularOnly
return external_call(global.fGMBULLET_SetHingeConeAngularOnly,argument0,argument1);

#define GMBULLET_Create2Body6DOFConstraint
return external_call(global.fGMBULLET_Create2Body6DOFConstraint,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);

#define GMBULLET_Set6DOFLimit
return external_call(global.fGMBULLET_Set6DOFLimit,argument0,argument1,argument2,argument3);

#define GMBULLET_DeleteConstraint
return external_call(global.fGMBULLET_DeleteConstraint,argument0);

#define GMBULLET_Create2DConstraint
return external_call(global.fGMBULLET_Create2DConstraint,argument0,argument1,argument2);

#define GMBULLET_Create2BodySliderConstraint
return external_call(global.fGMBULLET_Create2BodySliderConstraint,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);

#define GMBULLET_SetSliderLimits
return external_call(global.fGMBULLET_SetSliderLimits,argument0,argument1,argument2,argument3,argument4);

#define GMBULLET_SetSliderMotor
return external_call(global.fGMBULLET_SetSliderMotor,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define GMBULLET_SetSliderRestitution
return external_call(global.fGMBULLET_SetSliderRestitution,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define GMBULLET_SetSliderSoftness
return external_call(global.fGMBULLET_SetSliderSoftness,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define GMBULLET_SetSliderDamping
return external_call(global.fGMBULLET_SetSliderDamping,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define GMBULLET_SetCurrentTuning
return external_call(global.fGMBULLET_SetCurrentTuning,argument0,argument1,argument2,argument3,argument4);

#define GMBULLET_CreateVehicle
return external_call(global.fGMBULLET_CreateVehicle,argument0,argument1,argument2,argument3);

#define GMBULLET_SetUpWheel
return external_call(global.fGMBULLET_SetUpWheel,argument0,argument1,argument2,argument3,argument4,argument5);

#define GMBULLET_AddWheel
return external_call(global.fGMBULLET_AddWheel,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define GMBULLET_ApplyEngineForce
return external_call(global.fGMBULLET_ApplyEngineForce,argument0,argument1,argument2);

#define GMBULLET_SetBrake
return external_call(global.fGMBULLET_SetBrake,argument0,argument1,argument2);

#define GMBULLET_SetSteering
return external_call(global.fGMBULLET_SetSteering,argument0,argument1,argument2);

#define GMBULLET_ChangeWheelProperties
return external_call(global.fGMBULLET_ChangeWheelProperties,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define GMBULLET_GetCurrentSpeed
return external_call(global.fGMBULLET_GetCurrentSpeed,argument0);

#define GMBULLET_CreateBulletWorld
return external_call(global.fGMBULLET_CreateBulletWorld,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define GMBULLET_DestroyBulletWorld
return external_call(global.fGMBULLET_DestroyBulletWorld);

#define GMBULLET_StepSimulationTime
return external_call(global.fGMBULLET_StepSimulationTime,argument0,argument1,argument2);

#define GMBULLET_SetWorldGravity
return external_call(global.fGMBULLET_SetWorldGravity,argument0,argument1,argument2);

#define GMBULLET_SetWorldScale
return external_call(global.fGMBULLET_SetWorldScale,argument0);

#define GMBULLET_SetAngleProperties
return external_call(global.fGMBULLET_SetAngleProperties,argument0,argument1);

#define GMBULLET_SetRotationFlags
return external_call(global.fGMBULLET_SetRotationFlags,argument0,argument1,argument2);

#define GMBULLET_RayTestClosestHit
return external_call(global.fGMBULLET_RayTestClosestHit,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);

#define GMBULLET_RayTestAllHit
return external_call(global.fGMBULLET_RayTestAllHit,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);

#define GMBULLET_RayTestSingle
return external_call(global.fGMBULLET_RayTestSingle,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define GMBULLET_ConvexSweepOrientation
return external_call(global.fGMBULLET_ConvexSweepOrientation,argument0,argument1,argument2,argument3,argument4,argument5);

#define GMBULLET_ConvexSweepClosestHit
return external_call(global.fGMBULLET_ConvexSweepClosestHit,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10);

#define GMBULLET_ConvexSweepAllHit
return external_call(global.fGMBULLET_ConvexSweepAllHit,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);

#define GMBULLET_ConvexSweepSingle
return external_call(global.fGMBULLET_ConvexSweepSingle,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);

#define GMBULLET_GetRayConvexTestHitPointX
return external_call(global.fGMBULLET_GetRayConvexTestHitPointX,argument0);

#define GMBULLET_GetRayConvexTestHitPointY
return external_call(global.fGMBULLET_GetRayConvexTestHitPointY,argument0);

#define GMBULLET_GetRayConvexTestHitPointZ
return external_call(global.fGMBULLET_GetRayConvexTestHitPointZ,argument0);

#define GMBULLET_GetRayConvexTestHitNormalX
return external_call(global.fGMBULLET_GetRayConvexTestHitNormalX,argument0);

#define GMBULLET_GetRayConvexTestHitNormalY
return external_call(global.fGMBULLET_GetRayConvexTestHitNormalY,argument0);

#define GMBULLET_GetRayConvexTestHitNormalZ
return external_call(global.fGMBULLET_GetRayConvexTestHitNormalZ,argument0);

#define GMBULLET_GetRayConvexTestHitFraction
return external_call(global.fGMBULLET_GetRayConvexTestHitFraction,argument0);

#define GMBULLET_GetRayConvexTestObjectID
return external_call(global.fGMBULLET_GetRayConvexTestObjectID,argument0);

#define GMBULLET_GetRayConvexTestGMID
return external_call(global.fGMBULLET_GetRayConvexTestGMID,argument0);

#define GMBULLET_ClearRayConvexTestResults
return external_call(global.fGMBULLET_ClearRayConvexTestResults);

#define GMBULLET_PerformTestUsingDSStack
return external_call(global.fGMBULLET_PerformTestUsingDSStack,argument0,argument1);

#define GMBULLET_PerformTestUsingDSList
return external_call(global.fGMBULLET_PerformTestUsingDSList,argument0,argument1);

#define GMBULLET_GenerateActiveList
return external_call(global.fGMBULLET_GenerateActiveList,argument0);

#define GMBULLET_GenerateCollidedList
return external_call(global.fGMBULLET_GenerateCollidedList);

#define GMBULLET_GenerateCollideWithBodyList
return external_call(global.fGMBULLET_GenerateCollideWithBodyList,argument0,argument1);

#define GMBULLET_ClearList
return external_call(global.fGMBULLET_ClearList);

#define GMBULLET_GetListBodyID
return external_call(global.fGMBULLET_GetListBodyID,argument0,argument1);

#define GMBULLET_GetListBodyIDsToStack
return external_call(global.fGMBULLET_GetListBodyIDsToStack,argument0,argument1);

#define GMBULLET_GetListBodyIDsToList
return external_call(global.fGMBULLET_GetListBodyIDsToList,argument0,argument1);

#define GMBULLET_GetNumNewCollisionPair
return external_call(global.fGMBULLET_GetNumNewCollisionPair);

#define GMBULLET_GetNumOldCollisionPair
return external_call(global.fGMBULLET_GetNumOldCollisionPair);

#define GMBULLET_GetNumCollisionPair
return external_call(global.fGMBULLET_GetNumCollisionPair);

#define GMBULLET_GetNewCollisionPairBodyID
return external_call(global.fGMBULLET_GetNewCollisionPairBodyID,argument0,argument1,argument2);

#define GMBULLET_GetOldCollisionPairBodyID
return external_call(global.fGMBULLET_GetOldCollisionPairBodyID,argument0,argument1,argument2);

#define GMBULLET_GetCollisionPairBodyID
return external_call(global.fGMBULLET_GetCollisionPairBodyID,argument0,argument1,argument2);

#define GMBULLET_GetOldCollisionPairToStack
return external_call(global.fGMBULLET_GetOldCollisionPairToStack,argument0,argument1);

#define GMBULLET_GetOldCollisionPairToList
return external_call(global.fGMBULLET_GetOldCollisionPairToList,argument0,argument1);

#define GMBULLET_GetNewCollisionPairToStack
return external_call(global.fGMBULLET_GetNewCollisionPairToStack,argument0,argument1);

#define GMBULLET_GetNewCollisionPairToList
return external_call(global.fGMBULLET_GetNewCollisionPairToList,argument0,argument1);

#define GMBULLET_GetCollisionPairToStack
return external_call(global.fGMBULLET_GetCollisionPairToStack,argument0,argument1);

#define GMBULLET_GetCollisionPairToList
return external_call(global.fGMBULLET_GetCollisionPairToList,argument0,argument1);

#define GMBULLET_GetCollisionPairNumContactPoints
return external_call(global.fGMBULLET_GetCollisionPairNumContactPoints,argument0);

#define GMBULLET_GetCollisionPairContactPointX
return external_call(global.fGMBULLET_GetCollisionPairContactPointX,argument0,argument1,argument2);

#define GMBULLET_GetCollisionPairContactPointY
return external_call(global.fGMBULLET_GetCollisionPairContactPointY,argument0,argument1,argument2);

#define GMBULLET_GetCollisionPairContactPointZ
return external_call(global.fGMBULLET_GetCollisionPairContactPointZ,argument0,argument1,argument2);

#define GMBULLET_GetCollisionPairContactPointAverageX
return external_call(global.fGMBULLET_GetCollisionPairContactPointAverageX,argument0);

#define GMBULLET_GetCollisionPairContactPointAverageY
return external_call(global.fGMBULLET_GetCollisionPairContactPointAverageY,argument0);

#define GMBULLET_GetCollisionPairContactPointAverageZ
return external_call(global.fGMBULLET_GetCollisionPairContactPointAverageZ,argument0);

#define GMBULLET_GetCollisionPairContactPointAverageToStack
return external_call(global.fGMBULLET_GetCollisionPairContactPointAverageToStack,argument0,argument1);

#define GMBULLET_GetCollisionPairContactPointsToStack
return external_call(global.fGMBULLET_GetCollisionPairContactPointsToStack,argument0,argument1);

#define GMBULLET_GetCollisionPairContactPointAverageToList
return external_call(global.fGMBULLET_GetCollisionPairContactPointAverageToList,argument0,argument1);

#define GMBULLET_GetCollisionPairContactPointsToList
return external_call(global.fGMBULLET_GetCollisionPairContactPointsToList,argument0,argument1);

#define GMBULLET_CreateBoxShape
return external_call(global.fGMBULLET_CreateBoxShape,argument0,argument1,argument2);

#define GMBULLET_CreateCylinderShape
return external_call(global.fGMBULLET_CreateCylinderShape,argument0,argument1,argument2,argument3);

#define GMBULLET_CreateConeShape
return external_call(global.fGMBULLET_CreateConeShape,argument0,argument1,argument2);

#define GMBULLET_CreateSphereShape
return external_call(global.fGMBULLET_CreateSphereShape,argument0);

#define GMBULLET_CreateCompoundShape
return external_call(global.fGMBULLET_CreateCompoundShape);

#define GMBULLET_AddChildToCompoundShape
return external_call(global.fGMBULLET_AddChildToCompoundShape,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define GMBULLET_GetNumCompoundChildShapes
return external_call(global.fGMBULLET_GetNumCompoundChildShapes,argument0);

#define GMBULLET_GetCompoundChildShape
return external_call(global.fGMBULLET_GetCompoundChildShape,argument0,argument1);

#define GMBULLET_RemoveCompoundChildShape
return external_call(global.fGMBULLET_RemoveCompoundChildShape,argument0,argument1);

#define GMBULLET_StartTriMeshShape
return external_call(global.fGMBULLET_StartTriMeshShape);

#define GMBULLET_AddTriangle
return external_call(global.fGMBULLET_AddTriangle,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);

#define GMBULLET_FinishTriMeshShape
return external_call(global.fGMBULLET_FinishTriMeshShape,argument0);

#define GMBULLET_CreateTriMeshShapeFromQueue
return external_call(global.fGMBULLET_CreateTriMeshShapeFromQueue,argument0,argument1,argument2);

#define GMBULLET_CreateIndexedTriMeshShapeFromQueue
return external_call(global.fGMBULLET_CreateIndexedTriMeshShapeFromQueue,argument0,argument1,argument2);

#define GMBULLET_CreateTriMeshShapeFrom3DSFile
return external_call(global.fGMBULLET_CreateTriMeshShapeFrom3DSFile,argument0,argument1);

#define GMBULLET_CreateTriMeshShapeFrom3DSFileList
return external_call(global.fGMBULLET_CreateTriMeshShapeFrom3DSFileList,argument0,argument1);

#define GMBULLET_CreateTriMeshShapeFromModelEx
return external_call(global.fGMBULLET_CreateTriMeshShapeFromModelEx,argument0,argument1,argument2);

#define GMBULLET_CreateShapesFromBSP
return external_call(global.fGMBULLET_CreateShapesFromBSP,argument0,argument1,argument2);

#define GMBULLET_DeleteShape
return external_call(global.fGMBULLET_DeleteShape,argument0);

#define GMBULLET_DeleteShapesFromStack
return external_call(global.fGMBULLET_DeleteShapesFromStack,argument0);

#define GMBULLET_DeleteShapesFromList
return external_call(global.fGMBULLET_DeleteShapesFromList,argument0);

#define GMBULLET_DeleteAllShapes
return external_call(global.fGMBULLET_DeleteAllShapes);

#define GMBULLET_SetShapeScaling
return external_call(global.fGMBULLET_SetShapeScaling,argument0,argument1,argument2,argument3);

#define GMBULLET_CreateUniformScalingShape
return external_call(global.fGMBULLET_CreateUniformScalingShape,argument0,argument1);

#define GMBULLET_AddToMultiSphere
return external_call(global.fGMBULLET_AddToMultiSphere,argument0,argument1,argument2,argument3);

#define GMBULLET_FinishMultiSphereShape
return external_call(global.fGMBULLET_FinishMultiSphereShape,argument0,argument1,argument2);

#define GMBULLET_GetGMD3DDevice
return external_call(global.fGMBULLET_GetGMD3DDevice,argument0);

#define GMBULLET_SetD3DTransformMatrix
return external_call(global.fGMBULLET_SetD3DTransformMatrix,argument0);

#define GMBULLET_SetupDebugDrawer
return external_call(global.fGMBULLET_SetupDebugDrawer);

#define GMBULLET_DebugDrawWorld
return external_call(global.fGMBULLET_DebugDrawWorld);

#define GMBULLET_ImTopmost
return external_call(global.fGMBULLET_ImTopmost);

