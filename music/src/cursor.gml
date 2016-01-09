object cursor {

    properties {
        solid: false,
        visible: false,
        depth: 1,
    }

    event create() {
        x = 0;
        y = 0;
        z = 0;
        width = 8;
        height = 8;
        depth2 = 8;
        originx = 0.5;
        originy = 0.5;
        originz = 0.5;
        phys = false;
        CreateCube();
        SetMaterial(255, 0, 0, 255);
        sc_vector = CreateVector(-1, 0, 0, 0);

        drawing = false;
        drawing_inst = noone;
        draw_start_x = 0;
        draw_start_z = 0;
        draw_length = 0;
        draw_rot = 0;
    }

    event destroy() {
        ReleaseVector(sc_vector);
        Destroy();
    }

    event step(step_normal) {
        var ray, rotx2, roty2;
        ScreenCoordToVector(sc_vector, mouse_x, mouse_y, 0);
        rotx2 = CalculateVectorLongitude(sc_vector);
        roty2 = CalculateVectorLatitude(sc_vector);
        ray = CheckRayIntersection(raycast_plane, camera.x, camera.y, camera.z, rotx2, roty2, 0);
        CreateDirectionVector(sc_vector, rotx2, roty2);
        x = GetVector(sc_vector, 1) * ray + camera.x;
        y = GetVector(sc_vector, 2) * ray + camera.y;
        z = GetVector(sc_vector, 3) * ray + camera.z;
        Step();

        // Create instances
        if(global.lmb == 1) {
            drawing = true;
            phys = false;
            draw_start_x = x;
            draw_start_z = z;
            draw_rot = point_direction(draw_start_x, draw_start_z, x, z);
            draw_length = max(point_distance(draw_start_x, draw_start_z, x, z), 1);
            drawing_inst = instance_create(id, 0, platform);

        } else if (global.lmb == 0) {
            if (drawing_inst != noone) {
                with (drawing_inst) instance_destroy();

                draw_rot = point_direction(draw_start_x, draw_start_z, x, z);
                draw_length = max(point_distance(draw_start_x, draw_start_z, x, z), 1);
                phys = true;
                drawing_inst = instance_create(id, 0, platform);

                drawing = false;
                drawing_inst = noone;
            }

        } else {
            draw_rot = point_direction(draw_start_x, draw_start_z, x, z);
            draw_length = max(point_distance(draw_start_x, draw_start_z, x, z), 1);
            drawing_inst.scalx = draw_length;
            drawing_inst.rotz = -draw_rot;
            drawing_inst.x = (x + draw_start_x) / 2;
            drawing_inst.z = (z + draw_start_z) / 2;
        }

        // Destroy instances
        if (global.rmb == 1) {

            var d_min, d_min_inst, dx, dz, d;
            d_min = 100000;
            d_min_inst = noone;
            with (platform) {
                dx = x - cursor.x;
                dz = z - cursor.z;
                d = dx * dx + dz * dz;
                if (d < d_min) {
                    d_min = d;
                    d_min_inst = id;
                }
            }

            if (d_min_inst != noone) {
                with(d_min_inst) {
                    if (!keyboard_check(vk_shift)) instance_destroy();
                    else control.inst = inst;
                }
            }
        }
    }
}
