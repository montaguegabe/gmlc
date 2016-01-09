object sphere {

    properties {
        solid: false,
        visible: true,
        depth: 0
    }

    event create() {
        // The initialized X value is the dropper id
        y = x.y;
        z = x.z - 10;
        x = x.x;
        scalx = 0.25;
        scaly = 0.25;
        scalz = 0.25;
        file = program_directory + "\Media\Sphere.3ds";
        LoadMesh();
        SetModelMaterial(0, 131, 240, 94, 255);

        body = GMBULLET_AddRigidBody(4/3 * pi * power(scalx, 3) * 2.7, 1, global.shape_sphere, x, y, z, rotx, roty, rotz);
        GMBULLET_SetCollisionGroupMask(body, 1, 30);
        GMBULLET_AssociateBodyWithInstance(body, id);
        GMBULLET_SetDeactivationThresholds(body, 0.01, 0.5);
        GMBULLET_SetRestitution(body, 1);
    }

    event destroy() {
        GMBULLET_DeleteRigidBody(body);
        Destroy();
    }

    event step(step_normal) {
        UpdateBody();
        Step();

        if(z < -600) instance_destroy();
    }
}
