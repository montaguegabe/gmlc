#define UpdateBody
{
      // Use: Updates an object's transformation to match the transformation of their body in GMBULLET
      // Arguments: None
      var matrix_position, matrix_scaling, matrix_rotx, matrix_roty, matrixrotz;

      x = GMBULLET_GetPositionX( body );
      y = GMBULLET_GetPositionY( body );
      z = GMBULLET_GetPositionZ( body );

      rotx = GMBULLET_GetRotationEulerX( body );
      rotz = GMBULLET_GetRotationEulerY( body );
      roty = GMBULLET_GetRotationEulerZ( body );

      matrix_position = CreateTranslationMatrix( -1, x, y, z );
      matrix_scaling = CreateScalingMatrix( -1, scalx, scaly, scalz );

      matrix_rotx = CreateRotationMatrix( -1, rotx, 0, 0 );
      matrix_roty = CreateRotationMatrix( -1, 0, roty, 0 );
      matrix_rotz = CreateRotationMatrix( -1, 0, 0, rotz );

      TransformMatrix( matrix_rotx, matrix_rotx, matrix_rotz );
      TransformMatrix( matrix_rotx, matrix_rotx, matrix_roty );

      // Apply the rest
      TransformMatrix( matrix_scaling, matrix_rotx, matrix_scaling );
      TransformMatrix( matrix_position, matrix_scaling, matrix_position );

      // Now we save the transformation
      //CopyMatrix( GetObjectTransformation( id ), matrix_position );
      ApplyTransformationMatrix( matrix_position );

      // We release all of our matrices.
      ReleaseMatrix( matrix_position );
      ReleaseMatrix( matrix_scaling );
      ReleaseMatrix( matrix_rotx );
      ReleaseMatrix( matrix_roty );
      ReleaseMatrix( matrix_rotz );
}
