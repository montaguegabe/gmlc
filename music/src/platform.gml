object platform {

    properties {
        solid: false,
        visible: true,
        depth: 0
    }

    event create() {
        // X has parent id
        w = x.draw_length;
        rot = x.draw_rot;
        phys = x.phys;
        y = x.y;
        z = (x.z + x.draw_start_z) / 2;
        x = (x.x + x.draw_start_x) / 2;

        rotx = 0;
        roty = 0;
        rotz = -rot;

        width = 1;
        height = 8;
        depth2 = 32;

        originx = 0.5;
        originy = 0.5;
        originz = 0.5;

        scalx = w;
        scaly = 1;
        scalz = 1;

        pitch = 100 - round(w / 1.5);
        inst = control.inst;
        random_set_seed(inst);

        CreateCube();
        SetMaterial(random(255), random(255), random(255), 255);
        Step();


        myshape = -1;
        body = -1;
        if (phys) {
            myshape = GMBULLET_CreateBoxShape(w / 2, 16, 4);
            body = GMBULLET_AddRigidBody(0, 0, myshape, x, y, z, rotx, rot, roty);
            GMBULLET_AssociateBodyWithInstance(body, id);
            GMBULLET_SetRestitution(body, 1);
            //UpdateBody();
        }
    }

    event destroy() {
        Destroy();

        if (myshape == -1) exit;
        GMBULLET_DeleteShape(myshape);
        GMBULLET_DeleteRigidBody(body);
    }

    event step(step_normal) {
        if (scaly > 1.05) scaly /= 1.1;
        else scaly = 1.0;
        if (scalz < 0.95) scalz *= 1.1;
        else scalz = 1.0;

        Step();
    }
}
