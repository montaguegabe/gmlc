#define Step
// Step()
// This function has to be called in the step event of every primitive
// object, model object and light object!
if(u3d_type==1){
    if(textureprevious!=texture
     ||xprevious2!=x
     ||yprevious2!=y
     ||zprevious!=z
     ||rotxprevious!=rotx
     ||rotyprevious!=roty
     ||rotzprevious!=rotz
     ||scalxprevious!=scalx
     ||scalyprevious!=scaly
     ||scalzprevious!=scalz){
        external_call(global.u3d_model_step,u3d_index,x,y,z,rotx,roty,rotz,scalx,scaly,scalz,texture);
        textureprevious=texture;
        xprevious2=x;
        yprevious2=y;
        zprevious=z;
        rotxprevious=rotx;
        rotyprevious=roty;
        rotzprevious=rotz;
        scalxprevious=scalx;
        scalyprevious=scaly;
        scalzprevious=scalz;
    }
    if(frameprevious!=frame
     ||first_frameprevious!=first_frame
     ||last_frameprevious!=last_frame){
        external_call(global.u3d_model_set_frame,u3d_index,frame,first_frame,last_frame);
        frameprevious=frame;
        first_frameprevious=first_frame;
        last_frameprevious=last_frame;
    }
}
else if(u3d_type>=2 && u3d_type<=4){
    if(rprevious!=r
     ||gprevious!=g
     ||bprevious!=b
     ||spec_rprevious!=spec_r
     ||spec_gprevious!=spec_g
     ||spec_bprevious!=spec_b
     ||xprevious2!=x
     ||yprevious2!=y
     ||zprevious!=z
     ||rotxprevious!=rotx
     ||rotyprevious!=roty
     ||rangeprevious!=range
     ||degprevious!=deg){
        external_call(global.u3d_transmit_doubles,spec_r,spec_g,spec_b,0,0,0,0,0,0,0,0);
        external_call(global.u3d_light_step,u3d_index,r,g,b,x,y,z,rotx,roty,range,deg);
        rprevious=r;
        gprevious=g;
        bprevious=b;
        xprevious2=x;
        yprevious2=y;
        zprevious=z;
        rotxprevious=rotx;
        rotyprevious=roty;
        rangeprevious=range;
        degprevious=deg;
    }
}
else if(u3d_type>=7){
    if(textureprevious!=texture
     ||xprevious2!=x
     ||yprevious2!=y
     ||zprevious!=z
     ||rotxprevious!=rotx
     ||rotyprevious!=roty
     ||rotzprevious!=rotz
     ||scalxprevious!=scalx
     ||scalyprevious!=scaly
     ||scalzprevious!=scalz){
        external_call(global.u3d_transform_primitive,u3d_index,texture,x,y,z,rotx,roty,rotz,scalx,scaly,scalz);
        textureprevious=texture;
        xprevious2=x;
        yprevious2=y;
        zprevious=z;
        rotxprevious=rotx;
        rotyprevious=roty;
        rotzprevious=rotz;
        scalxprevious=scalx;
        scalyprevious=scaly;
        scalzprevious=scalz;
    }
}


#define Destroy
// Destroy()
// This function has to be called in the destroy event of every primitive
// object, model object and light object!
if(u3d_type==1){
    external_call(global.u3d_destroy_model,u3d_index);
}
if(u3d_type>=2 && u3d_type<=4){
    external_call(global.u3d_destroy_light_source,u3d_index);
}
if(u3d_type==5){
    external_call(global.u3d_destroy_terrain,u3d_index);
}
if(u3d_type==6){
    external_call(global.u3d_destroy_particle_system,u3d_index);
}
if(u3d_type>=7 && u3d_type<=13){
    external_call(global.u3d_destroy_primitive,u3d_index);
}
if(u3d_type==14){
    external_call(global.u3d_destroy_post_screen_shader,u3d_index);
}
if(u3d_type==15){
    external_call(global.u3d_destroy_camera,number);
}
u3d_index=0;
u3d_type=0;

#define LoadTexture
// LoadTexture(SourceFile,TextureIndex,Width,Height)
// This function loads a texture from the given file and uses the given
// index to manage it. Width and Height are optional arguments to scale the
// texture while loading.
return external_call(global.u3d_load_texture,argument1,argument0,argument2,argument3);

#define SetFog
// SetFog(FogColorRed,FogColorGreen,FogColorBlue,FogStart,FogEnd)
// This function sets up the fog with the given parameters.
// FogColorRed/Green/Blue give the fog color. Everything that's father away
// from the camera than FogEnd will have this color. Everything closer to
// the camera than FogEnd will be normal. Inbetween a linear interpolation
// is performed.
Init();
return external_call(global.u3d_set_fog,argument0,argument1,argument2,argument3,argument4);

#define DisableFog
// DisableFog()
// This function disables the fog.
return external_call(global.u3d_set_fog,0,0,0,0,0);

#define SetAmbient
// SetAmbient(R,G,B)
// Sets the ambient lighting to the given color. R, G and B should be in
// the range from 0 to 255.
return external_call(global.u3d_set_ambient_light,argument0,argument1,argument2,-1);

#define LoadBackground
// LoadBackground(File)
// This function loads a background from the given file. If the string
// contains a * it will be replaced by Front, Back, Left, Right, Top and
// Bottom to load a sky cube texture. Else it loads a sky sphere texture.
Init();
return external_call(global.u3d_load_background,argument0);

#define UnloadBackground
// UnloadBackground()
// This function disables the current background and uses the solid color.
Init();
return external_call(global.u3d_load_background,"");

#define CreateWall
// CreateWall()
// This function creates a wall object and associates it with the object
// the function is called by. Before you can call this function you have
// to set the variables x2 and y2 which define where the wall goes to
// from it's origin, the variable height which defines the height of the
// wall and the variable texture which gives the index of the texture that
// is to be used for the wall. For information on optional variables and
// more information on how to use primitive objects read the help file.
Init();
InitializePrimitiveVariables();
InitializeVariable("x2",0);
InitializeVariable("y2",0);
InitializeVariable("height",0);
u3d_index=external_call(global.u3d_create_wall,x2,y2,height,texture,texx1,texy1,texx2,texy2,partsx,partsy);
if(u3d_index){
    u3d_type=7;
}
return u3d_index!=0;

#define CreateFloor
// CreateFloor()
// This function creates a floor object and associates it with the object
// the function is called by. Before you can call this function you
// have to set the variables width and height which define the dimensions
// of the floor object and the variable texture which gives the index of
// the texture that is to be used for the wall. For information on
// optional variables and more information on how to use primitive
// objects read the help file.
Init();
InitializePrimitiveVariables();
InitializeVariable("width",0);
InitializeVariable("height",0);
u3d_index=external_call(global.u3d_create_floor,width,height,texture,texx1,texy1,texx2,texy2,partsx,partsy);
if(u3d_index){
    u3d_type=8;
}
return u3d_index!=0;

#define CreateCube
// CreateCube()
// This function creates a cube object and associates it with the object
// the function is called by. Before you can call this function you
// have to set the variables width, height and depth_2 to define the
// dimensions of the cube and the variable texture which gives the index of
// the texture that is to be used for the cube. For information on
// optional variables and more information on how to use primitive
// objects read the help file.
Init();
InitializePrimitiveVariables();
InitializeVariable("width",0);
InitializeVariable("height",0);
InitializeVariable("depth2",0);
InitializeVariable("texz1",0);
InitializeVariable("texz2",1);
InitializeVariable("partsz",1);
InitializeVariable("originx",0);
InitializeVariable("originy",0);
InitializeVariable("originz",0);
InitializeVariable("subdivide_texture",false);
external_call(global.u3d_transmit_doubles,partsx,partsy,partsz,originx,originy,originz,0,0,0,0,0);
u3d_index=external_call(global.u3d_create_cube,width,height,depth2,texture,texx1,texy1,texz1,texx2,texy2,texz2,subdivide_texture);
if(u3d_index){
    u3d_type=9;
}
return u3d_index!=0;

#define Create2D
// Create2D()
// This function creates a billboard object and associates it with the
// object that has called it. Before you can call this function you have
// to set the variables width, height and texture. For more information
// about billboard objects and information about optional variables have a
// look at the help file.
Init();
InitializePrimitiveVariables();
InitializeVariable("originx",0);
InitializeVariable("originy",0);
InitializeVariable("width",0);
InitializeVariable("height",0);
u3d_index=external_call(global.u3d_create_billboard,width,height,originx,1-originy,partsx,partsy,texture,texx1,texy1,texx2,texy2);
if(u3d_index){
    u3d_type=11;
}
return u3d_index!=0;

#define BeginPolygon
// BeginPolygon(VertexCount)
// This function will prepare everything for creating a polygon with the
// given number of vertices. It has to be called before AddVertex and
// CreatePolygon. Then AddVertex has to be called as often as declared by
// the parameter VertexCount. Finally you have to call CreatePolygon.
Init();
return external_call(global.u3d_begin_polygon,argument0);

#define AddVertex
// AddVertex(X,Y,Z,U,V)
// Adds a vertex to the polygon that has been begun using BeginPolygon. The
// parameters X, Y and Z define the position of the vertex. U and V define
// the texture coordinate that will define which part of the texture will
// be used at this vertex.
return external_call(global.u3d_add_vertex,argument0,argument1,argument2,argument3,argument4);

#define CreatePolygon
// CreatePolygon()
// This function creates a polygon object and associates it with the object
// it has been called by. Before it can be called BeginPolygon and AddVertex
// must have been called correctly.
InitializePrimitiveVariables();
u3d_index=external_call(global.u3d_create_polygon);
if(u3d_index){
    u3d_type=10;
}
return u3d_index!=0;

#define LightDirectional
// LightDirectional()
// This function initializes a new directional light source using the
// values of the member variables r, g, b, rotx and roty.
Init();
InitializeLightVariables();
u3d_index=external_call(global.u3d_create_directional_light,r,g,b,spec_r,spec_g,spec_b,rotx,roty);
if(u3d_index){
    u3d_type=2;
}
return u3d_index!=0;

#define LightPoint
// LightPoint()
// This function initializes a new point light source using the values of
// the member variables r, g, b, x, y, z and range.
Init();
InitializeLightVariables();
u3d_index=external_call(global.u3d_create_point_light,r,g,b,spec_r,spec_g,spec_b,x,y,z,range);
if(u3d_index){
    u3d_type=3;
}
return u3d_index!=0;

#define LightSpot
// LightSpot()
// This function initializes a new spot light source using the values of
// the member variables r, g, b, x, y, z, rotx, roty, range and deg.
Init();
InitializeLightVariables();
external_call(global.u3d_transmit_doubles,spec_r,spec_g,spec_b,0,0,0,0,0,0,0,0);
u3d_index=external_call(global.u3d_create_spot_light,r,g,b,x,y,z,rotx,roty,range,deg);
if(u3d_index){
    u3d_type=4;
}
return u3d_index!=0;

#define LoadMesh
// LoadMesh()
// This function loads a model from the file given by the variable file.
// The name isn't current. In the first versions it could load only simple
// meshs, but now it's also able to load different animated model file
// formats.
Init();
InitializeVariable("xprevious2",-123);
InitializeVariable("yprevious2",-123);
InitializeVariable("z",0);
InitializeVariable("zprevious",-123);
InitializeVariable("rotx",0);
InitializeVariable("rotxprevious",-123);
InitializeVariable("roty",0);
InitializeVariable("rotyprevious",-123);
InitializeVariable("rotz",0);
InitializeVariable("rotzprevious",-123);
InitializeVariable("scalx",1);
InitializeVariable("scalxprevious",-123);
InitializeVariable("scaly",1);
InitializeVariable("scalyprevious",-123);
InitializeVariable("scalz",1);
InitializeVariable("scalzprevious",-123);
InitializeVariable("texture",0);
InitializeVariable("textureprevious",-123);
InitializeVariable("frame",-1);
InitializeVariable("frameprevious",-123);
InitializeVariable("first_frame",0);
InitializeVariable("first_frameprevious",-123);
InitializeVariable("last_frame",0);
InitializeVariable("last_frameprevious",-123);
InitializeVariable("password","");
if(scalx==0 && scaly==0 && scalz==0){
    scalx=1;
    scaly=1;
    scalz=1;
}
u3d_index=external_call(global.u3d_load_mesh,file,password);
if(u3d_index){
    u3d_type=1;
}
else{
    u3d_type=0;
}
return u3d_index!=0;

#define SetVertex
// SetVertex(VertexIndex,X,Y,Z,U,V)
// This function works almost in the same way as AddVertex. But it has to
// be called after CreatePolygon and you can define which vertex you want
// to be changed by passing it's vertex index (the vertex that gets defined
// first using AddVertex has the index 0).
xprevious2+=1;
return external_call(global.u3d_set_vertex,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5);

#define GetVertex
// GetVertex(VertexIndex,ElementIndex)
// This function retrieves the element with the given index of the vertex
// with the given index. It can be called after CreatePolygon. The vertex
// that gets defined first using AddVertex has the index 0. The elment
// indices are defined in the following way:
// 0 -> X
// 1 -> Y
// 2 -> Z
// 3 -> U
// 4 -> V
return external_call(global.u3d_get_vertex,u3d_index,argument0,argument1);

#define SetMaterial
// SetMaterial(ColorR,ColorG,ColorB,ColorA)
// This function changes the color of the material that's used by the
// primitive object that's associated with the object that has called this
// function. ColorR/G/B give the colour and the brightness of the material.
// ColorA gives the alpha of the material. All parameters should lie in
// the range from 0 to 255. Please note that the object will completely
// invisible if you use an alpha of zero!
return external_call(global.u3d_set_material,u3d_index,argument0,argument1,argument2,argument3);

#define SetMaterialEmissive
// SetMaterialEmissive(ColorR,ColorG,ColorB)
// This function defines how many light the material of the object it is
// called by emits. ColorR/G/B define the color and the intensity of the
// emited light. They should lie in the range from 0 to 255. For more
// information about what exactly emissive materials mean have a look at
// the help file.
return external_call(global.u3d_set_material_emissive,u3d_index,argument0,argument1,argument2);

#define RecreatePrimitive
// RecreatePrimitive()
// This function recreates the primitive that's associated with the object
// that calls this function. You have to use it if you want to change the
// values of the parameters of an primitive object that have to be set
// before calling it's create-function after calling this function. For
// example you could create a floor object with a paticular size given by
// the variables width and height. When you change the values of the
// variables width and height after calling CreateFloor that won't effect
// the size of the floor. But when calling RecreatePrimitive this change
// will take effect. Note that the material information gets set back to
// the default values when calling this function.
if(u3d_type>=7){
    if(u3d_type==7){
        Destroy();
        CreateWall();
    }
    if(u3d_type==8){
        Destroy();
        CreateFloor();
    }
    if(u3d_type==9){
        Destroy();
        CreateCube();
    }
    if(u3d_type==10){
        Destroy();
        CreatePolygon();
    }
    if(u3d_type==11){
        Destroy();
        Create2D();
    }
    external_call(global.u3d_transform_primitive,u3d_index,texture,x,y,z,rotx,roty,rotz,scalx,scaly,scalz);
}


#define DrawTex
// DrawTex(TextureIndex,X,Y,Scaling,Rotation,Alpha)
// This function draws the texture with the given index at the given
// position. If scaling is equal to one the size it's drawed in will match
// the size of the texture as it's loaded (note that textures have to use
// dimensions made up of powers of two). If scaling has another value this
// value will be used as factor for the size. The rotation argument takes
// degrees and rotates the drawed texture counter-clockwise. Alpha can be
// a value in the range from 0 to 255 where 255 means full opacity and 1
// means full transparency. If you pass 0 Ultimate 3D will assume that you
// have forgotten to pass a correct value and will use full opacity.
return external_call(global.u3d_draw_texture,argument0,argument1,argument2,argument3,argument4,argument5+255*(argument5==0));

#define DrawTexEx
// DrawTexEx(TextureIndex,TextureLeft,TextureTop,TextureRight,TextureBottom,X,Y,ScalingX,ScalingY,Rotation,ColorR,ColorG,ColorB,ColorA,CameraIndex)
// This function is a more complex version of DrawTex. It also draws the
// given texture at the position given by X and Y. TextureLeft/Top/Right/
// Bottom define the part of the texture that is to be used. These
// variables are usually in the range from 0 to 1 where 0|0 refers to the
// left top of the textue and 1|1 refers to the right bottom (see also:
// texture coordinates in the help file). ScalingX and ScalingY can be
// used to scale the texture. Despite the fact that there are two scaling
// factors now it works in the same way as for DrawTex. Rotation takes
// degrees and rotates the texture counter-clockwise. ColorR/G/B/A have to
// lie in the range from 0 to 255. If you pass 255 to all color arguments
// it won't change the texture at all. Finally CameraIndex is required if
// you want to draw a texture to another texture that is being used as
// render target for a camera. For more informaiton on textures, texture
// coordinates and render targets have a look at the help file.
external_call(global.u3d_transmit_doubles,argument10,argument11,argument12,argument13+255*(argument13==0),0,0,0,0,0,0,0);
return external_call(global.u3d_draw_texture_ex,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument14);

#define SetFont
// SetFont(FontName,FontIndex,FontSize,FontStyle,FontColorR,FontColorG,FontColorB,FontColorA)
// This function sets up a font using the given index. If the font is
// already in use the font gets overwritten. FontName is the name of the
// file that contains the font in the font folder of the operating system
// (e.g. "Times New Roman"). FontSize is the size of the font as known from
// office programs. FontStyle can be zero for a normal font, one for a fat
// font or two for a italic font. FontColorR/G/B/A give the color that's
// used for the font. Proper values are in the range from 0 to 255.
// It can be changed lateron using SetFontColor(...).
Init();
if(argument7==0){
    argument7=255;
}
external_call(global.u3d_set_font,argument1,argument0,argument2,argument3);
external_call(global.u3d_set_font_color,argument1,argument4,argument5,argument6,argument7);
return true;


#define SetFontColor
// SetFontColor(FontIndex,FontColorR,FontColorG,FontColorB,FontColorA)
// This function changes the color of the font with the given index. The
// color values have to lie in the range from 0 to 255.
return external_call(global.u3d_set_font_color,argument0,argument1,argument2,argument3,argument4);

#define DrawText
// DrawText(FontIndex,PositionX,PositionY,TextString,CameraIndex)
// This function draws the given text string at the given position using
// the font that has been associated with the given FontIndex. CameraIndex
// can be used to make Ultimate 3D draw the text to the texture render
// target of the camera with the given index (the value of the number
// variable of the camera).
external_call(global.u3d_transmit_doubles,argument4,0,0,0,0,0,0,0,0,0,0);
return external_call(global.u3d_draw_text,argument0,argument1,argument2,argument3);

#define Draw3DText
// DrawText3D(Text,FontIndex,X,Y,Z,RotationX,RotationY,RotationZ,ScalingX,ScalingY,ScalingZ)
// This function draws the given text using the font with the given index.
// The transformation given by X/Y/Z, RotationX/Y/Z and ScalingX/Y/Z will
// be used to transform the text.
external_call(global.u3d_transmit_doubles,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,0,0);
return external_call(global.u3d_draw_text_3d,argument1,argument0);

#define Move
// Move(rotx,roty,speed)
// This function moves the object that calls it speed steps into the given
// direction.
x+=sin(degtorad(argument1))*cos(degtorad(argument0))*argument2;
y+=cos(degtorad(argument1))*cos(degtorad(argument0))*argument2;
z-=sin(degtorad(argument0))*argument2;

#define MouseCheckButton
// MouseCheckButton(MouseButton)
// mouse_check_button doesn't work correctly when Ultimate 3D is being
// used. For that reason you have to use this function instead.
return keyboard_check_direct(argument0);

#define GetMousePos
// GetMousePos()
// This function retrieves the position of the mouse cursor in screen space
// and saves it to the variables global.mouse_x and global.mouse_y
global.mouse_x=external_call(global.u3d_get_mouse_position_x);
global.mouse_y=external_call(global.u3d_get_mouse_position_y);
return true;

#define SetMousePos
// SetMousePos(MousePositionX,MousePositionY)
// This function sets the mouse cursor to the given coordinates in screen
// space.
return external_call(global.u3d_set_mouse_position,argument0,argument1);

#define TakeScreenshot
// TakeScreenshot(BMPFile)
// This function will take a screenshot and save it to the given *.bmp file.
return external_call(global.u3d_take_screenshot,argument0);

#define TakeScreenshotEx
// TakeScreenshotEx(BMPFile,Unused,Left,Top,Right,Bottom)
// This function will take a screenshot of the defined part of the screen
// and save it to the given *.bmp file. The second argument has been in use
// by a previous version of Ultimate 3D but is now unused.
external_call(global.u3d_transmit_doubles,argument2,argument3,argument4,argument5,0,0,0,0,0,0,0);
return external_call(global.u3d_take_screenshot_ex,argument0);

#define CollisionH
// CollisionH()
// This function may be called in the collision event of a horizontal wall
// object with the camera to implement simple collision detection.
if(other.z<height+z && other.z+height>z){
    other.y-=((other.y<y)*2-1)*abs(other.y-other.yprevious);
}

#define CollisionV
// CollisionV()
// This function may be called in the collision event of a vertical wall
// object with the camera to implement simple collision detection.
if(other.z<height+z &&  other.z+height>z){
    other.x-=((other.x<x)*2-1)*abs(other.x-other.xprevious);
}

#define CollisionZ
// CollisionZ()
// This function may be called in the collision event of a cube or floor
// object with the camera to implement simple collision detection.
if(other.z>z+height*(u3d_type==9)){
    other.falling=true;
}
else if(other.z+other.height>z+height*(u3d_type==9)){
    other.z=z+height*(u3d_type==9);
    other.falling=false;
    other.falling_speed=0;
}

#define CollisionTerrainModel
// CollisionModelTerrain()
// This function may be called in the collision event of a terrain model
// with the camera to achieve simple collision detection.
terrain_height=-external_call(global.u3d_get_distance_to_model,u3d_index,other.x,other.y,10000,90,0)+10000;

if(terrain_height==-90000){
    other.falling=false;
    other.falling_speed=0;
    return false;
}

// Collision detection along the z-axis
if((other.z>=terrain_height-other.height/4 && other.z<terrain_height+other.height/4)||(other.zprevious>terrain_height && other.z<terrain_height)){
    // Collision detection along the x and the y-axis (Dependent on the
    // degree of the terrain)
    if(terrain_height-other.z>other.height/2){
        other.x=other.xprevious;
        other.y=other.yprevious;
    }
    other.falling=false;
    other.falling_speed=0;
    other.z=terrain_height;
}
if(other.z+other.height<terrain_height || other.z>terrain_height+other.height/4){
    other.falling=true;
}
return true;

#define PreloadMesh
// PreloadMesh(FileName,Password)
// This function preloads the given model file to avoid that a lag occurs
// when it's used for the first time. If password is a valid string and
// FileName refers to an *.u3d file Ultimate 3D will use this password to
// decrypt the model file.
Init();
return external_call(global.u3d_preload_mesh,argument0,argument1);

#define ReleaseModel
// ReleaseModel(ModelFile)
// This function match to PreloadMesh(...). Once Ultimate 3D has loaded a
// model file, no matter whether this has been done through LoadMesh(...)
// or PreloadMesh(...) Ultimate 3D keeps this model file in memory so it
// doesn't need to load it again when it's needed again. An example: You
// load a model using LoadMesh(...). Later this model object gets
// destroyed. The model will be still in memory then. When another model
// object gets created that uses this model file it won't have to load
// anything. ReleaseModel(...) offers a possibility to force Ultimate 3D
// to release a model. If there's still an object that's dependent on this
// model file the function will return false and won't do anything.
// Otherwise it releases the model and returns true. This reduces the
// ammount of used pysical memory.
return external_call(global.u3d_release_model,argument0);

#define AddFrame
// AddFrame(ModelFile,Password)
// This script will add the first frame contained in the given model file
// to the animation sequence of the model object it's applied to. This
// works only if the new model has the same number of meshes and materials
// as the old one. If ModelFile refers to an *.u3d file and Password is a
// valid string this password will be used to decrypt the *.u3d file.
return external_call(global.u3d_add_frame,u3d_index,argument0,argument1);

#define CreateLODChain
// CreateLODChain(CameraDistance1,LOD1,CameraDistance2,LOD2,CameraDistance3,LOD3,CameraDistance4,LOD4,CameraDistance5,LOD5)
// This function creates a LOD chain for the model object it is called by.
// The camera distance arguments indicate at which distance the LOD is used.
// The LOD arguments indicate how detailed the new levels of detail should
// be. 100 means full detail (the unchanged mode), 50 would mean a triangle
// count reduced to the half and 0 would mean five triangles (that's a fixed
// limit).
return external_call(global.u3d_create_lod_chain,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);

#define CreatePrimitiveFromModel
// CreatePrimitiveFromModel()
// This function creates a primitive object from the model in the file
// given by the variable file. Since a primitive object can have only one
// material you have to specify which one you want to be used. This is done
// using the variable material. It may sound a bit confusing to create a
// primitive from a model but it makes sense in some particlular
// situations. Please have a look at the help file to get to know more
// about that.
Init();
InitializePrimitiveVariables();
InitializeVariable("password","");
InitializeVariable("material","");
u3d_index=external_call(global.u3d_create_primitive_from_model,file,password,material);
if(u3d_index){
    u3d_type=12;
}
return u3d_index!=0;

#define CreateEmptyMesh
// CreateEmptyMesh()
// This function creates an empty mesh and associates it with the object
// that has called this function. Before calling this function you have to
// set up the variables material_count, vertex_count and triangle_count.
// After calling this function you can (and should) customize the mesh
// using the model manipulation functions. For more information about
// empty meshs and model manipulation functions have a look at the help
// file.
Init();
InitializeVariable("xprevious2",-123);
InitializeVariable("yprevious2",-123);
InitializeVariable("z",0);
InitializeVariable("zprevious",-123);
InitializeVariable("rotx",0);
InitializeVariable("rotxprevious",-123);
InitializeVariable("roty",0);
InitializeVariable("rotyprevious",-123);
InitializeVariable("rotz",0);
InitializeVariable("rotzprevious",-123);
InitializeVariable("scalx",1);
InitializeVariable("scalxprevious",-123);
InitializeVariable("scaly",1);
InitializeVariable("scalyprevious",-123);
InitializeVariable("scalz",1);
InitializeVariable("scalzprevious",-123);
InitializeVariable("texture",0);
InitializeVariable("textureprevious",-123);
InitializeVariable("frame",-1);
InitializeVariable("frameprevious",-123);
InitializeVariable("first_frame",0);
InitializeVariable("first_frameprevious",-123);
InitializeVariable("last_frame",0);
InitializeVariable("last_frameprevious",-123);
InitializeVariable("material_count",0);
InitializeVariable("vertex_count",0);
InitializeVariable("triangle_count",0);
if(scalx==0 && scaly==0 && scalz==0){
    scalx=1;
    scaly=1;
    scalz=1;
}
if(material_count==0 || vertex_count==0 || triangle_count==0){
    return false;
    exit;
}
u3d_index=external_call(global.u3d_create_empty_mesh,material_count,vertex_count,triangle_count);
if(u3d_index){
    u3d_type=1;
}
else{
    u3d_type=0;
}
return u3d_index!=0;

#define ExportToU3DFile
// ExportToU3DFile(OutputFile,Password,ExportResources)
// This function exports the object it's called by to the given output file
// using the Ultimate 3D model file format. If you pass a valid string for
// Password this password will be used to encrypt the file. If you pass
// true for ExportResources all shader effects and texture files will be
// saved to the *.u3d file as well.
return external_call(global.u3d_export_to_u3d_file,u3d_index,argument0,argument1,argument2);

#define SwitchBackgroundMode
// SwitchBackgroundMode(EnableBackgroundObjectMode)
// This function can be used to enable or disable background object mode
// for the model object that calls this function. If
// EnableBackgroundObjectMode is true the object will be drawn behind all
// other objects, will not use fog and will not be effected by clipping
// planes, otherwise the object will be drawn in the usual way. As the
// first background object gets created the default backgrounds (solid,
// sky sphere or sky cube) get disabled.
return external_call(global.u3d_switch_background_mode,u3d_index,argument0);

#define GetCurrentFrame
// GetCurrentFrame()
// This function returns the frame that's currently displayed by the object that calls it.
return external_call(global.u3d_get_current_frame,u3d_index);

#define EnableVertexTweening
// EnableVertexTweening()
// This function enables vertex tweening for the model it is called for.
return external_call(global.u3d_enable_vertex_tweening,u3d_index);

#define RecalculateNormals
// RecalculateNormals()
// This function recalculates the normals of the model it is called for.
return external_call(global.u3d_recalculate_normals,u3d_index);

#define SmoothNormals
// SmoothNormals(SmoothingAngle)
// This function smoothes the normals of the model it is called for. If
// two vertices have the same position and the angle between their normals
// in degrees is smaller than SmoothingAngle both normals will be replaced
// by the mean of both normals.
return external_call(global.u3d_smooth_normals,u3d_index,argument0);

#define AddTextureCoordinateSet
// AddTextureCoordinateSet(DimensionCount)
// This function adds a new texture coordinate set to all meshs of the
// object that has called this function. The new texture coordinate set
// will have the given dimension count. The value for dimension count has
// to lie in the range from one to four. For more information about texture
// coordinate sets, the dimension count and mesh manipulation in general
// have a look at the help file.
return external_call(global.u3d_add_texture_coordinate_set,u3d_index,argument0);

#define AddTextureCoordinateSetsFromModel
// AddModelTextureCoordinates(File,Password)
// This function adds all texture coordinate sets of the given model
// (possibly an encrypted *.u3d file with the given password) to the object
// that calls this function and to all objects that are based on the same
// model (because geometry data doesn't get loaded multiple times, to
// lower the memory usage). The model the texture coordinate set gets
// added to must have the same number of meshes as the given model and
// mesh i in the model the texture coordinates get added to must have the
// same number of vertices as mesh i in the given model. This function is
// very useful in context to light mapping. For more information have a
// look at the help file.
return external_call(global.u3d_add_texture_coordinate_sets_from_model,u3d_index,argument0,argument1);

#define AddInverseTangentSpaceMatrices
// AddInverseTangentSpaceMatrices()
// This function will add inverse tangent space matrices to every single
// vertex of each mesh of the model object the function is called for. The
// normals of the meshes will be overwritten by the second column of the
// matrix. Besides two new 3D texture coordinate sets will be added. The
// first of them will contain the first column of the matrix and the second
// one will contain the third column. To get a little bit more information
// about what inverse tangent space matrices are good for have a look at
// the documentation.
external_call(global.u3d_add_inverse_tangent_space_matrices,u3d_index);

#define ApplyCelShading
// ApplyCelShading(OutlineWidth,LineColorR,LineColorG,LineColorB,LineColorA)
// This function applies a cel-shading effect to all meshs that are
// currently part of the model object.
return external_call(global.u3d_apply_cel_shading,u3d_index,argument0,argument1,argument2,argument3,argument4);

#define GetBoneIndex
// GetBoneIndex(BoneName)
// This function returns the index of the bone with the given name or
// 0 if it doesn't exist.
return external_call(global.u3d_get_bone_index,u3d_index,argument0);

#define GetBoneCount
// GetBoneCount()
// This function returns the number of bones, the skeleton of the model
// object, which has called this function, is made up of.
return external_call(global.u3d_get_bone_count,u3d_index);

#define GetBoneParent
// GetBoneParent(BoneIndex)
// This function returns the index of the parent of the bone with the
// given index of the model object that has called this function or -1 if
// the bone with the given index has no parent.
return external_call(global.u3d_get_bone_parent,u3d_index,argument0);

#define SetBoneRotation
// SetBoneRotation(BoneIndex,RotationX,RotationY,RotationZ)
// This function sets the rotation of the bone with the given index.
// Calling this function will remove the animation of the bone.
return external_call(global.u3d_set_bone_rotation,u3d_index,argument0,argument1,argument2,argument3);

#define SetBoneFrame
// SetBoneFrame(BoneIndex,Frame,EffectChildBones)
// This function sets up a new frame to be used for the bone with the given
// index. Frame has to be a positive value giving an absolute frame index.
// If you pass true for EffectChildBones the frame value used for the bone
// with the given index will be used for the bones that are appended to it
// as well, else the child bones will use the default frame value of the
// model or the frame value of another parent frame.
return external_call(global.u3d_set_bone_frame,u3d_index,argument0,argument1,argument2);

#define StartPoseInterpolation
// StartPoseInterpolation(DestinationFrame,InterpolationDuration)
// This function initializes the process of interpolating the pose the
// skeleton of the model object, which has called this function, currently
// is in towards the pose it has at DestinationFrame. The process will
// take InterpolationDuration steps unless it is aborted by another
// call to this function before. This function works for model objects with
// skeletal animation only.
return external_call(global.u3d_start_pose_interpolation,u3d_index,argument0,argument1);

#define CopyAnimation
// CopyAnimation(SourceFile,SourceFilePassword,RoationKeysOnly)
// This function copies the animation of the model saved in SourceFile
// to the model object, which has called this function, by copying all
// keyframes. If RotationKeysOnly is true, only rotation keys will be
// copied. If SourceFile is an encrypted Ultimate 3D model file (*.u3d)
// you can specify its password through SourceFilePassword. Otherwise
// SourceFilePassword should be an empty string. This function can only
// work if the source model and the destination model have the same number
// of bones and it will only have the desired results if the skeletons of
// both models are identical.
return external_call(global.u3d_copy_animation,u3d_index,argument0,argument1,argument2);

#define GetMeshCount
// GetMeshCount()
// This function returns the mesh count of the model object that belongs to
// the instance that has called the function.
return external_call(global.u3d_get_model_mesh_count,u3d_index);

#define GetLockedMeshTriangleCount
// GetLockedMeshTriangleCount(LockedMeshIndex)
// This function returns the triangle count of the given locked mesh.
return external_call(global.u3d_get_locked_mesh_triangle_count,argument0);

#define GetLockedMeshVertexCount
// GetLockedMeshVertexCount(LockedMeshIndex)
// This function returns the vertex count of the given locked mesh.
return external_call(global.u3d_get_locked_mesh_vertex_count,argument0);

#define LockMesh
// LockMesh(LockedMeshIndex,MeshIndex,Frame,LOD)
// This function prepares the given mesh for being manipulated by locking
// it. Then the locked mesh will be accessable using the given locked mesh
// index. Never forget to call UnlockMesh once for every LockMesh call!
// For more information about mesh manipulation have a look at the help
// file.
return external_call(global.u3d_lock_mesh,argument0,u3d_index,argument1,argument2,argument3);

#define SetLockedMeshVertex
// SetLockedMeshVertex(LockedMeshIndex,VertexIndex,ValueIndex,NewValue)
// This function can be used to modify vertices of the given locked mesh.
// VertexIndex defines the vertex that is to be changed. ValueIndex defines
// the part of the vertex that is to be changed. NewValue is the new value
// for the vertex. For more information about the ValueIndex parameter and
// about mesh manipulation in general have a look at the help file.
return external_call(global.u3d_set_locked_mesh_vertex,argument0,argument1,argument2,argument3);

#define GetLockedMeshVertex
// GetLockedMeshVertex(LockedMeshIndex,VertexIndex,ValueIndex)
// This function returns a part of the vertex with the given index of the
// given locked mesh. ValueIndex defines the part of the vertex that is to
// be returned. For more information about the ValueIndex parameter and
// about mesh manipulation in general have a look at the help file.
return external_call(global.u3d_get_locked_mesh_vertex,argument0,argument1,argument2);

#define GetLockedMeshTriangle
// GetLockedMeshTriangle(LockedMeshIndex,TriangleIndex,VertexIndex)
// This function can be used to retrieve the vertex indices of a given
// triangle from the given locked mesh. VertexIndex can be 0, 1 or 2. It
// defines which vertex of the triangle is requested. To get more
// information about mesh manipulation have a look at the help file.
return external_call(global.u3d_get_locked_mesh_triangle,argument0,argument1,argument2);

#define SetLockedMeshTriangleMaterial
// SetLockedMeshTriangleMaterial(LockedMeshIndex,TriangleIndex,NewMaterialIndex)
// This function changes the material used for the given triangle of the
// given locked mesh. NewMaterialIndex is the index of the material that is
// to be used for the index. GetMaterialIndex can be used to get it. For
// more information about mesh manipulation have a look at the help file.
return external_call(global.u3d_set_locked_mesh_triangle_material,argument0,argument1,argument2);

#define SetLockedMeshTriangle
// SetLockedMeshTriangle(LockedMeshIndex,TriangleIndex,VertexIndexA,VertexIndexB,VertexIndexC)
// This function can be used to change the vertices a triangle within the
// given locked mesh is made up of. VertexIndexA/B/C define the vertices
// that will be used. All of them have to be different, else the triangle
// will be invisible. Note that Ultimate 3D uses back face culling. For
// that reason the order of the vertex indices matters. For more
// information about vertex indices, back face culling and mesh
// manipulation in general have a look at the help file.
return external_call(global.u3d_set_locked_mesh_triangle,argument0,argument1,argument2,argument3,argument4);

#define GetLockedMeshTriangleMaterial
// GetLockedMeshTriangleMaterial(LockedMeshIndex,TriangleIndex)
// This function returns the index of the material used for the given
// triangle of the given locked mesh. For more information about mesh
// manipulation have a look at the help file.
return external_call(global.u3d_get_locked_mesh_triangle_material,argument0,argument1);

#define UnlockMesh
// UnlockMesh(LockedMeshIndex)
// This function unlocks the locked mesh with the given index. Don't forget
// to call this function once for every LockMesh call! For more information
// about mesh manipulation have a look at the help file.
return external_call(global.u3d_unlock_mesh,argument0);

#define GetMaterialIndex
// GetMaterialIndex(MaterialName)
// This function returns the index of the material with the given name or
// 0 if it doesn't exist.
return external_call(global.u3d_get_material_index,u3d_index,argument0);

#define GetMaterialCount
// GetMaterialCount()
// This function returns the material count of the model object that
// belongs to the instance that has called the function.
return external_call(global.u3d_get_model_material_count,u3d_index);

#define SetModelMaterial
// SetModelMaterial(MaterialIndex,ColorR,ColorG,ColorB,ColorA)
// This function changes the color of the material with the given index.
// The values for ColorR/G/B/A should lie in the range from 0 to 255 but
// they can be also higher.
return external_call(global.u3d_set_model_material,u3d_index,argument0,argument1,argument2,argument3,argument4);

#define SetModelMaterialEmissive
// SetModelMaterialEmissive(MaterialIndex,ColorR,ColorG,ColorB)
// This function changes the emissive part of the material with the given
// index. The values for ColorR/G/B should lie in the range from 0 to 255
// but they can be also higher.
return external_call(global.u3d_set_model_material_emissive,u3d_index,argument0,argument1,argument2,argument3);

#define SetModelMaterialSpecular
// SetModelMaterialSpecular(MaterialIndex,ColorR,ColorG,ColorB,Power)
// This function changes the specular part of the material with the given
// index. The values for ColorR/G/B/A should lie in the range from 0 to
// 255 but they can also be higher. Power gives the shininess of the
// material. High powers like 64 will result in very hard specular
// highlights, low powers like 2 will result in matte specular highlighs.
return external_call(global.u3d_set_model_material_specular,u3d_index,argument0,argument1,argument2,argument3,argument4);

#define SetMaterialEnvironmentMap
// SetMaterialEnvironmentMap(MaterialIndex,TextureIndex)
// This function sets the environment map used for the given material.
// TextureIndex can be the index of a normal texture for spherical
// environment mapping or the index of a cube texture for cubical
// environment mapping. If the material already uses other textures the
// first unused texture stage will be used for the environment map. If the
// graphics device doesn't support enough texture stages this function will
// fail. To get more information about environment mapping, cube textures
// and material indices have a look at the help file.
return external_call(global.u3d_set_material_environment_map,u3d_index,argument0,argument1);

#define SwitchAlphaBlending
// SwitchAlphaBlending(EnableAlphaBlending)
// This function enables or disables alpha blending for the primitive or
// model object that calls it. If alpha blending is disabled anything
// that's solid will be visible and anything that's partially transparent
// will be invisible. This can lead to a significant performance
// increasement because usually Ultimate 3D renders anything that's
// transparent in a second pass. By default alpha blending is enabled.
return external_call(global.u3d_switch_alpha_blending,u3d_index,u3d_type,argument0);

#define GetSimultaneousTextureCount
// GetSimultaneousTextureCount()
// This function returns how many textures can be used simultaneously with
// the graphics device of this PC.
return external_call(global.u3d_get_simultaneous_texture_count);

#define SetMaterialStageTexture
// SetMaterialStageTexture(MaterialIndex,TextureStage,TextureIndex)
// This function sets the texture that's used by the given texture stage
// when rendering the material with the given index. To get more
// information about material indices and texture stages have a look at the
// help file.
return external_call(global.u3d_set_material_stage_texture,u3d_index,argument0,argument1,argument2);

#define SetMaterialStageTexCoord
// SetMaterialTexCoord(MaterialIndex,TextureStage,TextureCoordinateIndex)
// This function sets the texture coordinate used for the given texture
// stage when rendering the given material. A texture coordinate index of
// -1 means, that a reflection vector will be used as texture coordinate
// (useful for environment mapping). -2 means that the vertex normal in
// camera space will be used as texture cordinate. This may be used as
// alternative environment mapping technique. -3 means that the screen
// position of the vertex will be used as texture coordinate. This may be
// useful for rendering water. For more information about texture
// coordinate indices, texture stages and material indices have a look at
// the help file.
return external_call(global.u3d_set_material_stage_tex_coord,u3d_index,argument0,argument1,argument2);

#define SetMaterialStageTextureOperation
// SetMaterialStageTextureOperation(MaterialIndex,TextureStage,TextureOperation)
// This function defines the texture operation used for the given texture
// stage when rendering the given material. To find out which value for the
// texture operation means what look at the help file. There you'll also
// find additional information about texture stages and material indices.
return external_call(global.u3d_set_material_stage_texture_operation,u3d_index,argument0,argument1,argument2);

#define ApplyParallaxAndBumpMapping
// ApplyParallaxAndBumpMapping(MaterialIndex,NormalAndHeightMapIndex,ParallaxFactor,DirectionalLightID,PointLight1ID,PointLight2ID)
// This function applies a parallax and bump mapping effect with the given
// properties to the given material of the model object that calls this
// function. For more information about these effects and the single
// arguments please refer to the help file.
var light_source_id_1,light_source_id_2,light_source_id_3;
light_source_id_1=0;
light_source_id_2=0;
light_source_id_3=0;
if(argument3){
    light_source_id_1=argument3.u3d_index;
}
if(argument4){
    light_source_id_2=argument4.u3d_index;
}
if(argument5){
    light_source_id_3=argument5.u3d_index;
}
external_call(global.u3d_apply_parallax_and_bump_mapping,u3d_index,argument0,argument1,argument2,light_source_id_1,light_source_id_2,light_source_id_3);

#define GetSupportedPSVersion
// GetSupportedPSVersion()
// This function returns the highest supported pixel shader version (1.0,
// 1.1, 1.2, 1.3 or 1.4). If no pixel shader version is supported it
// returns 0.
return external_call(global.u3d_get_supported_ps_version);

#define LoadMaterialEffect
// LoadMaterialEffect(MaterialIndex,UFXFile)
// This function loads the given *.ufx file (Ultimate 3D effect) and
// applies it to the material with the given index of the object the
// function has been called by. For more information about material indices
// and about the *.ufx file format have a look at the help file.
return external_call(global.u3d_load_material_effect,u3d_index,argument0,argument1);

#define CreateMaterialVSEffect
// CreateMaterialVSEffect(MaterialIndex,VertexShaderFile)
// This function has the purpose to offer a way to use vertex shaders in a
// way that's similar to the method, used in Ultimate 3D v 1.31. It creates
// an effect that uses the given vertex shader and applies it to the given
// material of the object that has called this function. The vertex shader
// will get the samer vertex shader constant information as in U3D 1.31.
// This way you can use vertex shaders without writing *.ufx files for them.
// For more information about material indices and vertex shader effects
// have a look at the help file.
return external_call(global.u3d_create_material_vs_effect,u3d_index,argument0,argument1);

#define SetMaterialEffectLightSource
// SetMaterialEffectLightSource(MaterialIndex,LightSourceID1,LightSourceID2,LightSourceID3)
// This function defines which light sources can be accessed by the effect
// that's used by the given material. Please refer to the help file to get
// more information about the backgrounds of this function.
var light_source_id_1,light_source_id_2,light_source_id_3;
light_source_id_1=0;
light_source_id_2=0;
light_source_id_3=0;
if(argument1){
    light_source_id_1=argument1.u3d_index;
}
if(argument2){
    light_source_id_2=argument2.u3d_index;
}
if(argument3){
    light_source_id_3=argument3.u3d_index;
}
return external_call(global.u3d_set_material_effect_light_source,u3d_index,argument0,light_source_id_1,light_source_id_2,light_source_id_3);

#define SetMaterialEffectVSConstant
// SetMaterialEffectVSConstant(MaterialIndex,VSConstantIndex,Value1,Value2,Value3,Value4)
// This function can be used to change the value of vertex shader constants
// that don't get set automatically by Ultimate 3D. It changes the values
// of the given vertex shader constant for the effect that's used by the
// given material. For more information about material indices and using
// vertex shaders have a look at the help file.
return external_call(global.u3d_set_material_effect_vs_constant,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5);

#define SetMaterialEffectPSConstant
// SetMaterialEffectPSConstant(MaterialIndex,PSConstantIndex,Value1,Value2,Value3,Value4)
// This function can be used to change the value of pixel shader constants
// that don't get set automatically by Ultimate 3D. It changes the values
// of the given pixel shader constant for the effect that's used by the
// given material. For more information about material indices and using
// pixel shaders have a look at the help file.
return external_call(global.u3d_set_material_effect_ps_constant,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5);

#define SetObjectSolidity
// SetObjectSolidity(SolidityState,GlobalSolidityState)
// This object changes the solidity state of the model, primitive or
// terrain object with the given ID. If the solidity state of an object
// is set to true it will be checked by collision detection functions if
// all is passed as object ID for these functions and if the RoomIndex
// matches the room index of the object. If GlobalSolidityState is true it
// will be checked always, if all is specified (independent from the room
// index. By default objects are not set to be solid.
return external_call(global.u3d_set_object_solidity,u3d_index,u3d_type,argument0,argument1);

#define AttemptMoveToPosition
// AttemptMoveToPosition(OutputVectorID,ObjectID,X,Y,Z,TargetX,TargetY,TargetZ,RotX,RotY,RotZ,ScalingX,ScalingY,ScalingZ,RoomIndex)
// This function performs collision detection and collision response for
// the given ellipsoid with the given object as it moves towards the given
// target position. ObjectID can be the ID of a model, primitive or
// terrain object or the keyword all. In the latter case all objects in
// the room with index RoomIndex will be checked. If ObjectID is all and
// RoomIndex is all collisions for all objects will be checked. It outputs
// the position the ellipsoid moves to as it attempts the move to the
// given target position to the given vector ID. If the given vector ID
// is negative a new vector will be created and its index gets returned.
// Never forget to call ReleaseVector(...) for every vector you create.
// The collision response algorithm used for this function does what is
// usually seen in first person shooters. If the ellipsoid collides with
// something, e.g. a wall it continues by sliding along it.
external_call(global.u3d_transmit_doubles,argument2,argument3,argument4,argument8,argument9,argument10,argument11,argument12,argument13,0,0);
if(argument1<0){
    return external_call(global.u3d_attempt_move_to_position,argument0,-1,0,argument5,argument6,argument7,argument14);
}
else{
    return external_call(global.u3d_attempt_move_to_position,argument0,argument1.u3d_index,argument1.u3d_type,argument5,argument6,argument7,argument14);
}

#define CheckSweptEllipsoidIntersection
// CheckSweptEllipsoidIntersection(ObjectID,X,Y,Z,TargetX,TargetY,TargetZ,RotX,RotY,RotZ,ScalingX,ScalingY,ScalingZ,RoomIndex)
// This function performs an intersection test between the swept ellipsoid
// defined by the given transformation variables and the given target
// position and the geometry of the given object. ObjectID can be the id
// of a model, primitive or terrain object or the keyword all. In the
// latter case all solid objects in the room with index RoomIndex will be
// checked. If ObjectID is all and RoomIndex is all collisions for all
// solid objects will be checked. If an intersection has occurred true is
// returned.
external_call(global.u3d_transmit_doubles,argument1,argument2,argument3,argument7,argument8,argument9,argument10,argument11,argument12,0,0);
if(argument0<0){
    return external_call(global.u3d_check_swept_ellipsoid_intersection,-1,0,argument13,argument4,argument5,argument6);
}
else{
    return external_call(global.u3d_check_swept_ellipsoid_intersection,argument0.u3d_index,argument0.u3d_type,argument13,argument4,argument5,argument6);
}

#define GetTriangleIntersectionCount
// GetTriangleIntersectionCount(...)
// This function returns how many triangles have been intersected by the
// swept ellipsoid specified in the last call to
// CheckSweptEllipsoidIntersection(...).
return external_call(global.u3d_get_triangle_intersection_count);

#define GetIntersectionTime
// GetIntersectionTime(IntersectedTriangleIndex)
// This function returns the time at which the swept ellipsoid defined
// in the last call to CheckSweptEllipsoidIntersection(...) has first
// intersected the triangle with the given index. The returned value is a
// factor in the range from 0 to 1, where 0 refers to the original
// position of the ellipsoid and 1 to its target position.
// IntersectedTriangleIndex has to be smaller than the return value of
// GetTriangleIntersectionCount() since it always refers to one of the
// intersected triangles.
return external_call(global.u3d_get_intersection_time,argument0);

#define GetIntersectionPosition
// GetIntersectionPosition(OutputVectorID,IntersectedTriangleIndex)
// This function creates a vector containing the position at which the
// swept ellipsoid specified in the last call to
// CheckSweptEllipsoidIntersection(...) has first intersected the triangle
// with the given index and saves the result to the given output vector.
// If OutputVectorID is negative a new vector is created and its ID is
// returned. NEver forget to call ReleaseVector(...) for every vector you
// create. IntersectedTriangleIndex has to be smaller than the return value
// of GetTriangleIntersectionCount() since it always refers to one of the
// intersected triangles.
return external_call(global.u3d_get_intersection_position,argument0,argument1);

#define GetIntersectedTriangleNormal
// GetIntersectedTriangleNormal(OutputVectorID,IntersectedTriangleIndex)
// This function creates a vector containing the normal vector (a vector
// that's perpendicular to a plane) of the triangle with the given index
// that has been intersected by the swept ellipsoid specified in the last
// call to CheckSweptEllipsoidIntersection(...) and saves the result using
// the given output vector. If a negative ID is passed for OutputVectorID
// a new vector is created and its ID gets returned. Never forget to call
// ReleaseVector(...) for every vector you create.
// IntersectedTriangleIndex has to be smaller than the return value of
// GetTriangleIntersectionCount() since it always refers to one of the
// intersected triangles.
return external_call(global.u3d_get_intersected_triangle_normal,argument0,argument1);

#define GetPushAwayVector
// GetPushAwayVector(OutputVectorID,IntersectedTriangleIndex)
// This function creates a vector containing a scaled normal vector (a
// vector that's perpendicular to a plane) of the triangle with the given
// index that has been intersected by the ellipsoid specified in the last
// call to CheckSweptEllipsoidIntersection(...) and saves the result using
// the given output vector. If a negative ID is passed for OutputVectorID
// a new vector is created and its ID gets returned. Never forget to call
// ReleaseVector(...) for every vector you create. The length of the
// vector is adjusted so that the ellipsoid will have left the triangle
// if its center gets moved using the coordinates of this vector.
// IntersectedTriangleIndex has to be smaller than the return value of
// GetTriangleIntersectionCount() since it always refers to one of the
// intersected triangles.
return external_call(global.u3d_get_push_away_vector,argument0,argument1);

#define GetTerrainHeightAtPos
// GetTerrainHeightAtPos(terrain_object_id,x,y)
// This function returns the height of the given terrain at the given x|y
// position.
return external_call(global.u3d_get_terrain_height_at_position,argument0.u3d_index,argument1,argument2);

#define CheckRayIntersection
// CheckRayIntersection(ObjectID,RayOriginX,RayOriginY,RayOriginZ,RayDirectionLongitude,RayDirectionLatitude,RoomIndex)
// This function checks whether the ray defined by RayOriginX/Y/Z and
// RayDirectionLongitude/Latitude intersects the geometry of the given
// object. ObjectID can be the ID of a model, terrain or primitive object
// or the keyword all. In the latter case all solid objects in the room
// with the given index will be checked. If RoomIndex is all solid as well
// solid objects in all rooms will be checked.
if(argument0<0){
    return external_call(global.u3d_check_ray_intersection,-1,0,argument6,argument1,argument2,argument3,argument4,argument5);
}
else{
    return external_call(global.u3d_check_ray_intersection,argument0.u3d_index,argument0.u3d_type,argument6,argument1,argument2,argument3,argument4,argument5);
}

#define GetRayTracingNormal
// GetRayTracingNormal(OutputVectorID)
// This function creates a vector containing the normal vector (a vector
// that's perpendicular to a plane) of the triangle that has been hit by
// the last ray tracing function (GetDistanceTo...(...)) and saves the
// result using the given output vector. If a negative ID is passed for
// OutputVectorID a new vector is created and it's ID gets returned. Never
// forget to call ReleaseVector for every vector you create.
return external_call(global.u3d_get_ray_tracing_normal,argument0);

#define GetIntersectedMaterialIndex
// GetIntersectedMaterialIndex()
// This function returns the index of the material which has been
// intersected by the last call to CheckRayIntersection(...) which tested
// an intersection between a ray and a model object.
return external_call(global.u3d_get_intersected_material_index);

#define CreateTerrain
// CreateTerrain()
// This function creates a terrain and associates it with the object it is
// called by. It takes the properties for creating the terrain from the
// variables height_map (the file that contains the height map describing
// the terrain), tile_size (the size of the quadratic tiles that are used
// to create a terrain), tile_count_x/y (the number of tiles along the x/y
// axis), height (the maximal height of the terrain), x, y, z (the origin
// of the terrain), terrain_lod (the level of detail used for the terrain),
// wrap_count_x/y (how often the texture gets wrapped over the terrain
// along the x/y axis) and base_texture (the file that contains the first
// texture used for the terrain). Don't forget to call
// ApplyTerrainTextures after CreateTerrain, else the terrain will be
// invisible.
// For a more detailed description of how the terrain renderer works have
// a look at the tutorial in the helpfile.
Init();
InitializeVariable("z",0);
InitializeVariable("height",0);
InitializeVariable("tile_count_x",0);
InitializeVariable("tile_count_y",0);
InitializeVariable("tile_size",0);
InitializeVariable("wrap_count_x",0);
InitializeVariable("wrap_count_y",0);
InitializeVariable("height_map","");
InitializeVariable("base_texture","");
InitializeVariable("terrain_lod",1);
InitializeVariable("alpha_map_resolution",32);
InitializeVariable("light_map_resolution",256);
external_call(global.u3d_transmit_string,0,height_map);
external_call(global.u3d_transmit_string,1,base_texture);
external_call(global.u3d_transmit_doubles,alpha_map_resolution,light_map_resolution,0,0,0,0,0,0,0,0,0);
u3d_index=external_call(global.u3d_create_terrain,height,tile_count_x,tile_count_y,tile_size,wrap_count_x,wrap_count_y,x,y,z,terrain_lod);
u3d_type=5;
return u3d_index!=0;

#define AddTerrainTexture
// AddTerrainTexture(DiffuseMap,AlphaMap,WrapCountX,WrapCountY,AlphaMapChannel)
// This function adds the texture saved in the file given by the argument
// DiffuseMap to the terrain. It will be splatted using the given AlphaMap.
// WrapCountX/Y indicate how often the diffuse map gets wrapped (repeated)
// over the terrain.
external_call(global.u3d_transmit_string,0,argument0);
external_call(global.u3d_transmit_doubles,argument4,0,0,0,0,0,0,0,0,0,0);
return external_call(global.u3d_add_terrain_texture,u3d_index,argument1,argument2,argument3);

#define ApplyTerrainTextures
// ApplyTerrainTextures()
// This function will apply all textures that are used by the terrain
// object that calls this function. It has to be called for every terrain
// object even if it doesn't call AddTerrainTexture.
return external_call(global.u3d_apply_terrain_textures,u3d_index);

#define CalculateTerrainLightMap
// CalculateTerrainLightMap(LightObjectID1,LightObjectID2, ... ,LightObjectID10)
// This function calculates a new light map for the terrain it is called by
// using the light sources given by the object ids. If you pass zero for all
// object ids all light sources contained within the scene will be used.
var light_id_0,light_id_1,light_id_2,light_id_3,light_id_4,light_id_5,light_id_6,light_id_7,light_id_8,light_id_9;
light_id_0=0;
light_id_1=0;
light_id_2=0;
light_id_3=0;
light_id_4=0;
light_id_5=0;
light_id_6=0;
light_id_7=0;
light_id_8=0;
light_id_9=0;
if(argument0){
    light_id_0=argument0.u3d_index;
}
if(argument1){
    light_id_1=argument1.u3d_index;
}
if(argument2){
    light_id_2=argument2.u3d_index;
}
if(argument3){
    light_id_3=argument3.u3d_index;
}
if(argument4){
    light_id_4=argument4.u3d_index;
}
if(argument5){
    light_id_5=argument5.u3d_index;
}
if(argument6){
    light_id_6=argument6.u3d_index;
}
if(argument7){
    light_id_7=argument7.u3d_index;
}
if(argument8){
    light_id_8=argument8.u3d_index;
}
if(argument9){
    light_id_9=argument9.u3d_index;
}
return external_call(global.u3d_calculate_terrain_light_map,u3d_index,light_id_0,light_id_1,light_id_2,light_id_3,light_id_4,light_id_5,light_id_6,light_id_7,light_id_8,light_id_9);

#define SetCustomTerrainLightMap
// SetCustomTerrainLightMap(TextureIndex)
// This function can be used to set up a custom light map for the terrain
// that calls it. The custom light map will be used instead of the
// automatically computed light map then. If TextureIndex doesn't refer to
// a valid texture the automatically created light map will be used again.
return external_call(global.u3d_set_custom_terrain_light_map,u3d_index,argument0);

#define GetTextureStrengthAtPosition
// GetTextureStrengthAtPosition(TerrainObjectID,TextureIndex,X,Y)
// This function returns the intensity factor of the texture with the
// given index (base texture has index 0, n-th added texture has index n),
// at the given position on the terrain with the given ID. A return value
// of 0 means that the texture can not be seen at this position, a return
// value of 1 means that the texture is the only texture that can be seen
// at this position.
return external_call(global.u3d_get_texture_strength_at_position,argument0.u3d_index,argument1,argument2,argument3);

#define DeformTerrain
// DeformTerrain(DeformationCenterX,DeformationCenterY,DeformationRadius,RaiseLevel)
// This function raises the geometry of the terrain object, which has
// called this function, within the circle defined by DeformationCenterX/Y
// and DeformationRadius by the maximum ammount of RaiseLevel (which can
// also be negative to deepen the terrain).
return external_call(global.u3d_deform_terrain,u3d_index,argument0,argument1,argument2,argument3);

#define CreateTerrainDecal
// CreateTerrainDecal()
// This function creates a terrain decal model object and associates it
// with the object, which has called it. It takes the relevant values from
// the variables center_x and center_y, which give the center of the decal
// on the terrain, from size, which gives the desired size for the decal
// and from terrain_object, which gives the id of the terrain object this
// decal is to be created on. For more information on the purpose of
// decals refer to the help file.
Init();
InitializeVariable("xprevious2",-123);
InitializeVariable("yprevious2",-123);
InitializeVariable("z",0);
InitializeVariable("zprevious",-123);
InitializeVariable("rotx",0);
InitializeVariable("rotxprevious",-123);
InitializeVariable("roty",0);
InitializeVariable("rotyprevious",-123);
InitializeVariable("rotz",0);
InitializeVariable("rotzprevious",-123);
InitializeVariable("scalx",1);
InitializeVariable("scalxprevious",-123);
InitializeVariable("scaly",1);
InitializeVariable("scalyprevious",-123);
InitializeVariable("scalz",1);
InitializeVariable("scalzprevious",-123);
InitializeVariable("texture",0);
InitializeVariable("textureprevious",-123);
InitializeVariable("frame",-1);
InitializeVariable("frameprevious",-123);
InitializeVariable("first_frame",0);
InitializeVariable("first_frameprevious",-123);
InitializeVariable("last_frame",0);
InitializeVariable("last_frameprevious",-123);
u3d_index=external_call(global.u3d_create_terrain_decal,terrain_object.u3d_index,center_x,center_y,size);
u3d_type=1*(u3d_index!=0);
return (u3d_index!=0);

#define SaveTerrainHeightMap
// SaveTerrainHeightMap(OutputFile)
// This function saves the current height map of the terrain object it is
// called by to the given OutputFile, including all changes made to it
// through DeformTerrain(...). The file extension of OutputFile has to be
// .bmp or .dds.
return external_call(global.u3d_save_terrain_height_map,u3d_index,argument0);

#define CreateParticleSystem
// CreateParticleSystem()
// This function creates a particle system and associates it with the
// object that has called this function. For more information about the
// particle effects system have a look at the help file.
Init();
InitializeVariable("texture",0);
InitializeVariable("z",0);
InitializeVariable("aspect_ratio",1);
u3d_index=external_call(global.u3d_create_particle_system);
if(u3d_index){
    u3d_type=6;
}
return u3d_index!=0;

#define ParticleSystemStep
// ParticleSystemStep(TimeFactor)
// This function performs a step for the particle system that has called
// it. The performed step will have a length of TimeFactor. So if you pass
// 0.5 for TimeFactor everything will be half as fast. You may want to use
// this when making the speed of your game independent from the frame rate.
return external_call(global.u3d_particle_system_step,u3d_index,x,y,z,texture,aspect_ratio+(aspect_ratio==0),argument0);

#define SetParticleCount
// SetParticleCount(MinParticleCreationCount,MaxParticleCreationCount,MaxTotalParticleCount)
// This function sets the number of particles that get created per step and
// the maximal number of particles.
return external_call(global.u3d_set_particle_count,u3d_index,argument0,argument1,argument2);

#define SetParticleLifetime
// SetParticleLifetime(MinParticleLifetime,MaxParticleLifetime)
// This function sets a range of possible particle lifetimes for the
// particle system that has called the function.
return external_call(global.u3d_set_particle_lifetime,u3d_index,argument0,argument1);

#define SetParticleOrigin
// SetParticleOrigin(SecondSphereRadius,RotationX,RotationY,RotationZ,ScalingX,ScalingY,ScalingZ)
// This function defines the origin of the particles that get created by
// this particle system. That works in the following way. The arguments
// RotationX/Y/Z and ScalingX/Y/Z in combination with the variables of the
// particle system object X, Y and Z define a complete transformation. This
// transformation gets applied to a sphere with a radius of one. Then a
// second sphere with a radius of SecondSphereRadius gets transformed in
// the same way. The space between those two spheres is the space in which
// particles can get created.
// P.S. The arguments RotationX/Y/Z will be usually not required.
return external_call(global.u3d_set_particle_origin,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define SetParticleVelocity
// SetParticleVelocity(MinLongitude,MinLatitude,MinLength,MaxLongitude,MaxLatitude,MaxLength)
// This function defines the range of possible initial velocities for the
// particles of the particle system that belongs to the object that has
// called this function. Please note that the longitude should lie in the
// range from -90 to +90. Else the particle system won't behave in the way
// you would expect. If you don't know what the terms longitude, latitude
// and length mean in this context please refer to the help file.
return external_call(global.u3d_set_particle_velocity,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5);

#define SetParticleAcceleration
// SetParticleAcceleration(MinLongitude,MinLatitude,MinLength,MaxLongitude,MaxLatitude,MaxLength)
// This function works in the same way as SetParticleVelocity. The only
// difference is that this function defines the initial acceleration of the
// particles instead of the velocity.
return external_call(global.u3d_set_particle_acceleration,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5);

#define SetInitialCenterRepulsion
// SetInitialCenterRepulsion(RepulsionFactorX,RepulsionFactorY,RepulsionFactorZ)
// This function sets the repulsion factor of the center of the particle
// system. This means that the difference of the position of the particle
// system and each particle gets multiplied by the given repulsion factor
// and added to the initial velocity of the particle. So for example if
// you'd pass 1 for all arguments all particles would fly away from the
// center after their creation (in case you have defined scaling values
// unequal to 0 when calling SetParticleOrigin). Understanding this function
// requires a basic understanding of vectors. To get more informaiton about
// it look at the help file.
return external_call(global.u3d_set_initial_center_repulsion,u3d_index,argument0,argument1,argument2);

#define SetInitialParticleColor
// SetInitialParticleColor(MinR,MinG,MinB,MinA,MaxR,MaxG,MaxB,MaxA)
// This function sets a range of possible initial particle colors. The
// arguments have to lie in the range from 0 to 255.
return external_call(global.u3d_set_initial_particle_color,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define SetFinalParticleColor
// SetFinalParticleColor(MinR,MinG,MinB,MinA,MaxR,MaxG,MaxB,MaxA)
// This function sets a range of possible final particle colors. The
// arguments have to lie in the range from 0 to 255.
return external_call(global.u3d_set_final_particle_color,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define SetParticleSize
// SetParticleSize(MinInitialSize,MaxInitialSize,MinFinalSize,MaxFinalSize)
// This function defines the development of the size of particles while
// their lifetime.
return external_call(global.u3d_set_particle_size_development,u3d_index,argument0,argument1,argument2,argument3);

#define SetParticleRotation
// SetParticleRotation(MinInitialRotation,MaxInitialRotation,MinRotationChange,MaxRotationChange)
// This function defines the range of possible initial rotations of the
// particles of this particle system and a range of possible particle
// rotation changes per step.
return external_call(global.u3d_set_particle_rotation,u3d_index,argument0,argument1,argument2,argument3);

#define SwitchAdditiveBlending
// SwitchAdditiveBlending(EnableAdditiveBlending)
// This function can be used to enable or disable additive blending for
// the primitive, model, terrain or particle system object, that calls
// this function. If EnableAdditiveBlending is true this object will be
// drawn additive over the already drawn objects, brightening up the area
// it draws to.
return external_call(global.u3d_switch_additive_blending,u3d_index,u3d_type,argument0);

#define AddGravityEmitter
// AddGravityEmitter(PositionX,PositionY,PositionZ,Mass)
// This function adds a new gravity emitter to the particle system that
// has called this function and returns it's index. If you want to change
// the emitter after creating it you have to save this index. The emitter
// is created at the given position and has the given mass (which defines
// the strength of it's gravity). The mass can be also negative. Then the
// emitter will push away the particles around it.
return external_call(global.u3d_add_gravity_emitter,u3d_index,argument0,argument1,argument2,argument3);

#define SetGravityEmitter
// SetGravityEmitter(GravityEmitterIndex,NewPositionX,NewPositionY,NewPositionZ,NewMass)
// This function changes a gravity emitter after it's creation.
// GravityEmitterIndex is the value returned by AddGravityEmitter when
// creating the emitter. NewPositionX/Y/Z and NewMass are the new values
// for the emitter (see AddGravityEmitter or the help file for more
// information about them). Setting NewMass to zero is equivalent to
// destroying the emitter.
return external_call(global.u3d_set_gravity_emitter,u3d_index,argument0,argument1,argument2,argument3,argument4);

#define AddModifier
// AddModifier()
// This function adds a new particle modifier to the particle system that
// has called it and returns it's index. You have to save this index to
// set the properties of the modifier using the functions that begin with
// SetModifier.
return external_call(global.u3d_add_modifier,u3d_index);

#define SetModifierEffectedArea
// SetModifierEffectedArea(ModifierIndex,SecondSphereRadius,PositionX,PositionY,PositionZ,RotationX,RotationY,RotationZ,ScalingX,ScalingY,ScalingZ)
// This function defines the area that's effected by the given modifier.
// The area is defined in the same way as the area in which particles can
// get created. For further information have a look at the description of
// the function SetParticleOrigin or at the help file.
external_call(global.u3d_transmit_doubles,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9,argument10,0,0);
return external_call(global.u3d_set_modifier_effected_area,u3d_index,argument0,argument1);

#define SetModifierLifetimeChange
// SetModifierLifetimeChange(ModifierIndex,LifetimeChange)
// This function sets the lifetime change of the given modifier. The
// lifetime change is a value that gets added to the lifetime of a particle
// in every step in which it is in the effected area of the modifier.
return external_call(global.u3d_set_modifier_lifetime_change,u3d_index,argument0,argument1);

#define SetModifierVelocityChange
// SetModifierVelocityChange(ModifierIndex,VelocityFactorX,VelocityFactorY,VelocityFactorZ,VelocitySummandX,VelocitySummandY,VelocitySummandZ)
// This function defines how the given modifier changes the velocity of the
// particles that are in it's effected area. The given information is
// applied using the following formular:
// Velocity=Velocity*VelocityFactor+VelocitySummand
// Understanding this function requires a basic understanding of vector
// calculations. For more information about it have a look at the help file.
return external_call(global.u3d_set_modifier_velocity_change,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define SetModifierAccelerationChange
// SetModifierAccelerationChange(ModifierIndex,AccelerationFactorX,AccelerationFactorY,AccelerationFactorZ,AccelerationSummandX,AccelerationSummandY,AccelerationSummandZ)
// This function defines how the given modifier changes the acceleration of
// the particles that are in it's effected area. The given information is
// applied using the following formular:
// Accleration=Acceleration*AcclerationFactor+AccelerationSummand
// Understanding this function requires a basic understanding of vector
// calculations. For more information about it have a look at the help file.
return external_call(global.u3d_set_modifier_acceleration_change,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5,argument6);

#define SetModifierNewFinalColor
// SetModifierNewFinalColor(ModifierIndex,MinR,MinG,MinB,MinA,MaxR,MaxG,MaxB,MaxA)
// This function defines the way the given modifier changes the colors of
// particles that are in it's effected area. If a particle is in this area
// a new final color in the given range of colors gets calculated for it.
return external_call(global.u3d_set_modifier_new_final_color,u3d_index,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);

#define SetModifierNewFinalSize
// SetModifierNewFinalSize(ModifierIndex,MinNewFinalSize,MaxNewFinalSize)
// This function defines the way the given modifier changes the final size
// of particles. If a particle is in the effected area of a modifier a new
// final size that lies in the given range gets calculated for it.
return external_call(global.u3d_set_modifier_new_final_size,u3d_index,argument0,argument1,argument2);

#define MoveCamera
// MoveCamera()
// This function should be called in the step event of every object
// that's used as camera.
u3d_type=15;
InitializeVariable("number",0);
InitializeVariable("actual_aspect",0);
InitializeVariable("render_target",0);
InitializeVariable("v_left",0);
InitializeVariable("v_top",0);
InitializeVariable("v_width",view_wport[0]);
InitializeVariable("v_height",view_hport[0]);
InitializeVariable("view",90);
InitializeVariable("height",0);
InitializeVariable("falling",0);
InitializeVariable("falling_speed",0);
InitializeVariable("follow",0);
InitializeVariable("perspective",0);
InitializeVariable("distance",10);
InitializeVariable("rotatex",0);
InitializeVariable("rotatey",0);
InitializeVariable("min_range",0.5);
InitializeVariable("max_range",100000);
InitializeVariable("z",0);
InitializeVariable("rotx",0);
InitializeVariable("roty",0);
InitializeVariable("rotz",0);
InitializeVariable("rotzprevious",0);

// Validate the values of the variables
v_left=max(v_left,0);
v_top=max(v_top,0);
if(v_width==0 && v_height==0){
    v_width=view_wport[0]-v_left;
    v_height=view_hport[0]-v_top;
}
if(min_range<=0){
    min_range=0.5;
}
if(max_range<=min_range){
    max_range=100000.0;
}
// Calculate the gravity
zprevious=z;
if(falling){
    z+=falling_speed;
    falling_speed-=global.gravitation;
}
// Follow the given object if requested
if(follow!=0 && perspective==0){
    with(follow.id){
        global.u3d_height_defined=variable_local_exists("height");
    }
    if(global.u3d_height_defined){
        rotx=-point_direction(0,0,point_distance(x,y,follow.x,follow.y),z+height-(follow.z+follow.height));
    }
    else{
        rotx=-point_direction(0,0,point_distance(x,y,follow.x,follow.y),z+height-(follow.z));
    }
    roty=-90+point_direction(0,0,x-follow.x,y-follow.y);
    Move(0,roty,(point_distance(x,y,follow.x,follow.y)-distance)/distance);
}
if(follow!=0 && perspective==1){
    falling=0;
    falling_speed=0;
    x=follow.x;
    y=follow.y;
    with(follow.id){
        global.u3d_height_defined=variable_local_exists("height");
    }
    if(global.u3d_height_defined){
        z=follow.z+follow.height-height;
    }
    else{
        z=follow.z-height;
    }
    rotx=follow.rotx+rotatex;
    roty=follow.roty+rotatey;
    Move(rotx,roty,-distance);
}
if(follow!=0 && perspective==2){
    var temp,tempx,tempy,tempz;
    falling=0;
    falling_speed=0;
    tempx=x;
    tempy=y;
    tempz=z;
    x=follow.x;
    y=follow.y;
    with(follow.id){
        global.u3d_height_defined=variable_local_exists("height");
    }
    if(global.u3d_height_defined){
        z=follow.z+follow.height-height;
    }
    else{
        z=follow.z-height;
    }
    rotx=follow.rotx+rotatex;
    roty=follow.roty+rotatey;
    Move(follow.rotx+rotatex,follow.roty+rotatey,-distance);
    temp=x; x=tempx; tempx=temp;
    temp=y; y=tempy; tempy=temp;
    temp=z; z=tempz; tempz=temp;
    x+=(tempx-x)*0.1;
    y+=(tempy-y)*0.1;
    z+=(tempz-z)*0.1;
    if(global.u3d_height_defined){
        rotx=-point_direction(0,0,point_distance(x,y,follow.x,follow.y),z+height-(follow.z+follow.height));
    }
    else{
        rotx=-point_direction(0,0,point_distance(x,y,follow.x,follow.y),z+height-(follow.z));
    }
    roty=-90+point_direction(0,0,x-follow.x,y-follow.y);
}

external_call(global.u3d_update_camera_transformation,number,x,y,z+height,rotx,roty,rotz);
external_call(global.u3d_update_camera_projection,number,min_range,max_range,view,v_left,v_top,v_width,v_height,actual_aspect,render_target);

#define SetOrtho
// SetOrtho(UseOrthogonalProjection,OrthoWidth,OrthoHeight)
// This script enables/disables an orthogonal projection for the camera
// object it's called for (or for the first one if it hasn't been called by
// a camera). OrthoWidth and OrthoHeight define the dimensions of the
// area that can be seen by the camera.
Init();
external_call(global.u3d_set_ortho,number,argument0,argument1,argument2);

#define CreateTextureRenderTarget
// CreateTextureRenderTarget(Index,RequestedWidth,RequestedHeight)
// This function creates a texture that can be used as render target. The
// texture will have the given width and height if possible. But depending
// on the device the width and the height may have to be powers of two and
// they may have to be equal. So the actual texture dimensions may differ
// from the requested texture dimensions (just as for usual textures).
return external_call(global.u3d_create_texture_render_target,argument0,argument1,argument2);

#define GetCubeMapSupport
// GetCubeMapSupport()
// This function returns whether the graphics device of the PC supports
// cube maps (false if it doesn't or true if it does).
return external_call(global.u3d_get_cube_map_support);

#define CreateCubeTextureRenderTarget
// CreateCubeTextureRenderTarget(Index,RequestedEdgeLength)
// This function creates a cube texture that can be used as render target.
// The texture will have the given edge length if possible. But depending
// on the device this value may have to be a power of two. So the actual
// texture dimensions may differ from the requested texture dimensions
// (just as for usual textures).
return external_call(global.u3d_create_cube_texture_render_target,argument0,argument1);

#define GetClippingPlaneSupport
// GetClippingPlaneSupport()
// This function returns the number of clipping planes the current graphics
// device supports. Depending on the device the return value can vary
// between 0 and 6. The return value minus one is the maximum clipping
// plane index that can be passed to SetClippingPlane().
return external_call(global.u3d_get_clipping_plane_support);

#define SetClippingPlane
// SetClippingPlane(ClippingPlaneIndex,OriginX,OriginY,OriginZ,DirectionLongitude,DirectionLatitude)
// This function sets up a clipping plane for the camera object it's called
// by and associates it with the given index. OriginX/Y/Z and
// DirectionLongitude/Latitude define the plane. The origin is an arbitrary
// point that lies on the plane and the direction is the plane normal, so
// it's orthogonal to the plane. For more information about clipping planes
// have a look at the help file.
return external_call(global.u3d_set_clipping_plane,number,argument0,argument1,argument2,argument3,argument4,argument5);

#define RenderToTexture
// RenderToTexture()
// This function has to be called by a camera object that has the variable
// render_target set to the index of a valid render target. Then it will
// render the scene using this camera to the given texture. For more
// information about render targets and camera objects have a look at the
// help file.
return external_call(global.u3d_render_to_texture,number);

#define RenderToCubeTexture
// RenderToCubeTexture(CubeTextureIndex,CameraPositionX,CameraPositionY,CameraPositionZ,ColorR,ColorG,ColorB,ColorA,RoomIndex1,RoomIndex2,...,RoomIndex8)
// This function will render a picture of the whole environment to the
// given cube texture. If the given index doesn't refer to a valid cube
// texture render target the function will fail. CameraPositionX/Y/Z
// defines the point of view from where the picture of the environment
// is taken. After rendering the scene to the cube texture Ultimate 3D will
// cover the rendered picture with a rectangle that has the given color. So
// if you want to get only very slight reflections (that's what this
// function is commonly used for) you should pass something like
// 255/255/255/188. The parameters RoomIndex1 to RoomIndex8 can be used to
// define which rooms will be rendered to the cube texture. Room 0 will be
// rendered in any case. For more information about
// CreateCubeTextureRenderTarget(...), about rooms which are parts of the
// culling functions and about this function have a look at the help file.
external_call(global.u3d_transmit_doubles,argument8,argument9,argument10,argument11,argument12,argument13,argument14,argument15,0,0,0);
return external_call(global.u3d_render_to_cube_texture,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define GetShadowSupport
// GetShadowSupport()
// This function returns whether the graphics device that's currently being
// used supports realtime stencil shadows.
return external_call(global.u3d_get_shadow_support);

#define SwitchShadows
// SwitchShadows(Enable)
// This function will enable or disable shadow casting for the light
// source object it's being called by.
return external_call(global.u3d_switch_shadows,u3d_index,argument0);

#define SwitchShadowCasting
// SwitchShadowCasting(LightSourceID,Enable)
// This function enables or disables shadow casting for the light source
// given by the first parameter. The change will apply to the model object
// that calls this function. Note that only model objects can cast shadows.
return external_call(global.u3d_switch_shadow_casting,u3d_index,argument0.u3d_index,argument1);

#define CreateShadowOptimizedGeometry
// CreateShadowOptimizedGeometry(LODIndex,CreateConnectionPatches)
// This function creates seperate geometry for the given LOD of the model
// that calls the function. The geometry will be optimal for shadow
// casting. If you pass true for CreateConnectionPatches a lot more
// geometry will need to be rendered, but the results will be better. This
// is recommended especially for low poly models.
return external_call(global.u3d_create_shadow_optimized_geometry,u3d_index,argument0,argument1);

#define SwitchShadowReceiving
// SwitchShadowReceiving(LightSourceID,Enable)
// This function enables or disables receiving shadows from the given light
// source for the object that calls the function. Note that primitives,
// models and terrains can receive shadows.
return external_call(global.u3d_switch_shadow_receiving,u3d_type,u3d_index,argument0.u3d_index,argument1);

#define CreatePostScreenShader
// CreatePostScreenShader()
// This function creates a post screen shader and associates it with the
// object that calls this function. You have to set up the variables
// vertex_shader and pixel_shader before calling this function. The
// variables camera_index and priority are optional. For more information
// about the meaning of the single variables and post screen shaders in
// general have a look at the help file.
InitializeVariable("pixel_shader","");
InitializeVariable("camera_index",0);
InitializeVariable("priority",0);
u3d_index=external_call(global.u3d_create_post_screen_shader,vertex_shader,pixel_shader,camera_index,priority);
if(u3d_index!=0){
    u3d_type=14;
}
else{
    u3d_type=0;
}
return false;

#define SetPSSTexture
// SetPSSTexture(TextureStage,TextureIndex)
// This function sets up a texture for the post screen shader object it's
// called by. The texture is going to be used for the given texture stage.
// Note that you can't set up another texture for stage 0, because this
// stage always contains the scene texture. If you pass a negative value
// for TextureIndex, the scene texture is going to be used for this stage,
// too.
return external_call(global.u3d_set_pss_texture,u3d_index,argument0,argument1);

#define SetPSSVSConstant
// SetPSSVSConstant(VSConstantIndex,Value1,Value2,Value3,Value4)
// This function sets the given vertex shader constant register for the
// post screen shader object that calls it to the given four values.
// VSConstantIndex can be a value in the range from 0 to 96.
return external_call(global.u3d_set_pss_vs_constant,u3d_index,argument0,argument1,argument2,argument3,argument4);

#define SetPSSPSConstant
// SetPSSPSConstant(PSConstantIndex,Value1,Value2,Value3,Value4)
// This function sets the given pixel shader constant register for the
// post screen shader object that calls it to the given four values.
// PSConstantIndex can be a value in the range from 0 to 8.
return external_call(global.u3d_set_pss_ps_constant,u3d_index,argument0,argument1,argument2,argument3,argument4);

#define SetPSSFilter
// SetPSSFilter(TextureStage,FilterType)
// This function changes the filter that is to be used for sampling
// textures in the given stage when applying the post screen shader object
// the function is called by. The given filter will be used for
// minification and magnification of textures. To get information about
// which value for FilterType refers to which filter have a look at
// the help file.
return external_call(global.u3d_set_pss_filter,u3d_index,argument0,argument1);

#define SetObjectRoom
// SetObjectRoom(RoomIndex)
// This function changes the room index the object that has called it is
// associated with. It can be called for any type of objects despite camera
// objects. The object will be only visible for a camera if the room it's
// associated with is set to visible for this camera. Light sources effect
// only the objects that are in the same room. By default the room index of
// an object is set to zero. See also the function SetRoomVisibility. For
// more information about this advanced culling method have a look at the
// help file.
if(u3d_type==15){
    return external_call(global.u3d_set_object_room,u3d_type,number,argument0);
}
else{
    return external_call(global.u3d_set_object_room,u3d_type,u3d_index,argument0);
}

#define SetRoomVisibility
// SetRoomVisibility(RoomIndex,NewVisibilityState)
// This function changes the visibility state of the room with the given
// index for the camera that has called this function. NewVisibilityState
// can be either true to set the room to visible or false to set the room
// to invisible. See also the function SetObjectRoom. For more information
// about this advanced culling method have a look at the help file.
return external_call(global.u3d_set_room_visibility,number,argument0,argument1);

#define CreatePortal
// CreatePortal(OriginX,OriginY,OriginZ,FacingDirectionLongitude,FacingDirectionLatitude,Radius,RoomIndex1,RoomIndex2)
// This function creates a new portal and returns it's index which is
// needed to modify the portal after creating it. The first six parameters
// define a circle with the point OriginX/Y/Z in it's center which faces
// into the direction defined by FacingDirectionLongitude/Latitude and has
// the given Radius. If a camera passes through the portal it's room index
// will be changed from RoomIndex1 to RoomIndex2 if it comes from the
// room RoomIndex1 or converse if it comes from the room RoomIndex2. For
// more information about the portal engine refer to the help file.
return external_call(global.u3d_create_portal,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7);

#define SetPortal
// SetPortal(PortalIndex,OriginX,OriginY,OriginZ,FacingDirectionLongitude,FacingDirectionLatitude,Radius,RoomIndex1,RoomIndex2)
// This function changes the portal with the given index. To get
// information about the meaning of the different parameters refer to the
// description of CreatePortal(...) or to the Ultimate 3D help file.
return external_call(global.u3d_set_portal,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8);

#define OpenPortal
// OpenPortal(PortalIndex,OpenPortal)
// This function opens or closes the portal with the given index. If
// OpenPortal is true it will get opened, if OpenPortal is false it will
// get closed. If a portal is closed, the room behind it won't be visible
// from another room. By default a portal is opened. For more information
// about the portal engine refer to the help file.
return external_call(global.u3d_open_portal,argument0,argument1);

#define DestroyPortal
// DestroyPortal(PortalIndex)
// This function destroys the portal with the given index.
return external_call(global.u3d_destroy_portal,argument0);

#define SwitchPortalEngine
// SwitchPortalEngine(UsePortalEngine)
// This function turns the portal engine on or off for the camera object
// that calls it. If UsePortalEngine is true the portal engine will be
// used if it's false it won't be used. By default the portal engine isn't
// used.
return external_call(global.u3d_switch_portal_engine,number,argument0);

#define SetRoomVisibilityEnforcement
// SetRoomVisibilityEnforcement(RoomIndex,NewVisibilityEnforcementState)
// This function changes the visibility enforcement state of the room
// with the given index for the camera that has called this function.
// NewVisibilityEnforcementState can be either true to reach that the room
// is always visible, even if the portal engine is enabled and the room
// can not be seen through a portal, or false to disable visibility
// enforcement. See also the function SetObjectRoom(...). In contrast to
// SetRoomVisibility(...) this function has an effect, when the portal
// engine is enabled. For more information about this advanced culling
// method have a look at the help file.
return external_call(global.u3d_set_room_visibility_enforcement,number,argument0,argument1);

#define GetObjectRoom
// GetObjectRoom()
// This function returns the room the object that calls this function
// currently is in. For more information about rooms and the advanced
// culling functions refer to the help file.
if(u3d_type==15){
    return external_call(global.u3d_get_object_room,u3d_type,number);
}
else{
    return external_call(global.u3d_get_object_room,u3d_type,u3d_index);
}

#define GetRoomVisibility
// GetRoomVisibility(RoomIndex)
// This function returns true if the room with the given index can be
// seen by the function that calls this function, or false if it can't be
// seen.
return external_call(global.u3d_get_room_visibility,number,argument0);

#define SetRoomAmbient
// SetRoomAmbient(RoomIndex,AmbientColorR,AmbientColorG,AmbientColorB)
// This function sets the ambient lighting for the room with the given
// index to the given color.
return external_call(global.u3d_set_ambient_light,argument1,argument2,argument3,argument0);

#define GetObjectTransformation
// GetObjectTransformation(ObjectID)
// This function returns the ID of the matrix that describes the
// transformation of the object with the given ID. ObjectID can be the ID
// of a model object, a primitive object or a camera object.
if(argument0.u3d_type==1){
    return argument0.u3d_index;
}
if(argument0.u3d_type>=7 && argument0.u3d_type<=13){
    return 15000+argument0.u3d_index;
}
if(argument0.u3d_type==15){
    return argument0.number+40000;
}
return false;

#define GetBoneTransformation
// GetBoneTransformation(MatrixIndex,BoneIndex)
// This function copies the current transformation matrix of the given bone
// of the object that has called the function to the matrix with the given
// index. If the matrix index is negative a new matrix gets created. Never
// forget to call ReleaseMatrix(...) for every matrix you have created when
// it isn't needed anymore.
return external_call(global.u3d_get_bone_transformation_matrix,argument0,u3d_index,argument1);

#define UpdateSkeleton
// UpdateSkeleton()
// Since the bone transformations only get update when Ultimate 3D renders
// the matrices returned by GetBoneTransformation(...) usually are those
// from the frame that can be currently seen on the screen. If you need
// the transformations as they will be in the next frame you can use this
// function to force Ultimate 3D to update the bone transformation matrices
// for the object that calls this function. Note that this takes some
// computing time.
return external_call(global.u3d_update_skeleton,u3d_index);

#define GetMeshOccurrenceCount
// GetMeshOccurrenceCount(MeshIndex)
// This function returns how often the given mesh occurrs within the model
// object this function has been called by.
return external_call(global.u3d_get_mesh_occurrence_count,u3d_index,argument0);

#define GetMeshOccurrenceTransformation
// GetMeshOccurrenceTransformation(OutputMatrixID,MeshIndex,OccurrenceIndex)
// This function copies the current transformation matrix of the
// OccurrenceIndex-th occurrenth of the given mesh of the object that has
// called the function to the matrix with the given index. If the matrix
// index is negative a new matrix gets created. Never forget to call
// ReleaseMatrix(...) for every matrix you have created when it isn't
// needed anymore.
return external_call(global.u3d_get_mesh_occurrence_transformation,argument0,u3d_index,argument1,argument2);

#define CreateTranslationMatrix
// CreateTranslationMatrix(MatrixID,TranslationX,TranslationY,TranslationZ)
// This function creates a translation matrix. The values are interpreted
// in the same way as the corresponding variables of primitive objects and
// models. The resulting matrix will be saved using the given ID. If the
// ID is negative a new matrix will be created and it's ID will be returned.
// Never forget to call ReleaseMatrix for every matrix you create.
return external_call(global.u3d_create_translation_scaling_matrix,argument0,argument1,argument2,argument3,1,1,1);

#define CreateScalingMatrix
// CreateScalingMatrix(MatrixID,ScalingX,ScalingY,ScalingZ)
// This function creates a scaling matrix. The values are interpreted in
// the same way as the corresponding variables of primitive objects and
// models. The resulting matrix will be saved using the given ID. If the
// ID is negative a new matrix will be created and it's ID will be returned.
// Never forget to call ReleaseMatrix for every matrix you create.
return external_call(global.u3d_create_translation_scaling_matrix,argument0,0,0,0,argument1,argument2,argument3);

#define CreateRotationMatrix
// CreateRotationMatrix(MatrixID,RotationX,RotationY,RotationZ)
// This function creates a rotation matrix. The values are interpreted in
// the same way as the corresponding variables of primitive objects and
// models. The resulting matrix will be saved using the given ID. If the
// ID is negative a new matrix will be created and it's ID will be returned.
// Never forget to call ReleaseMatrix for every matrix you create.
return external_call(global.u3d_create_transformation_matrix,argument0,0,0,0,argument1,argument2,argument3,1,1,1);

#define CreateTransformationMatrix
// CreateTransformationMatrix(MatrixID,TranslationX,TranslationY,TranslationZ,RotationX,RotationY,RotationZ,ScalingX,ScalingY,ScalingZ)
// This function creates a transformation matrix that is a combination
// of the given scaling, rotation and translation. The values are
// interpreted in the same way as the corresponding variables of primitive
// objects and models. The resulting matrix will be saved using the given
// ID. If the ID is negative a new matrix will be created and it's ID will
// be returned.
return external_call(global.u3d_create_transformation_matrix,argument0,argument1,argument2,argument3,argument4,argument5,argument6,argument7,argument8,argument9);

#define CopyMatrix
// CopyMatrix(OutputMatrixID,InputMatrixID)
// This function creates a copy of the given input matrix. If the id of the
// output matrix is negative a new matrix will be created and it's ID will
// be returned. Never forget to call ReleaseMatrix for every matrix you
// create.
return external_call(global.u3d_copy_matrix,argument0,argument1);

#define TransformMatrix
// TransformMatrix(OutputMatrixID,FirstInputMatrixID,SecondInputMatrixID)
// This function transforms the given first input matrix using the second
// input matrix. The result will be saved to the given output matrix. If
// the id of the output matrix is negative a new matrix will be created
// and it's ID will be returned. Never forget to call ReleaseMatrix for
// every matrix you create.
return external_call(global.u3d_transform_matrix,argument0,argument1,argument2);

#define InvertMatrix
// InvertMatrix(OutputMatrixID,InputMatrixID)
// This function calculates the inverse of the given input matrix. The
// inverse of a matrix is the matrix that leads to a matrix that doesn't
// perform any transformation at all when transformed using the original
// matrix. The result will be saved to the given output matrix. If the id
// of the output matrix is negative a new matrix will be created and it's
// ID will be returned. Never forget to call ReleaseMatrix for every matrix
// you create.
return external_call(global.u3d_invert_matrix,argument0,argument1);

#define InterpolateMatrices
// InterpolateMatrices(OutputMatrixID,FirstInputMatrixID,SecondInputMatrixID,InterpolationFactor)
// This function interpolates between the two input matrices using the
// given interpolation factor. With an interpolation factor of 0 the
// result will be the transformation described by FirstInputMatrixID, with
// an interpolation factor of 1 the result will be the transformation
// described by SecondInputMatrixID. Inbetween a lineary interpolation is
// used for the translation and the scaling and a spherical linear
// interpolation is used for the rotation (this means that the rotation
// has a constant speed and does not move coordinates out of a particular
// rotation plane). The resulting matrix is output to the matrix with
// identified by OutputMatrixID. If OutputMatrixID is negative a new
// matrix gets created and its ID gets returned. Never forget to call
// ReleaseMatrix(...) for every matrix you create.
return external_call(global.u3d_interpolate_matrices,argument0,argument1,argument2,argument3);

#define GetMatrixEntry
// GetMatrixEntry(MatrixID,LineIndex,ColumnIndex)
// This function returns a single entry of the matrix with the given ID.
// LineIndex and ColumnIndex can be integers in the range from 0 to 3.
return external_call(global.u3d_get_matrix_entry,argument0,argument1*4+argument2);

#define ReleaseMatrix
// ReleaseMatrix(MatrixID)
// This function releases (deletes) the matrix with the given ID. You have
// to call this function for every matrix you have created by passing a
// negative ID to one of the other matrix calculation functions! Else
// you'll get a memory leak and that will lead to an error message.
return external_call(global.u3d_release_matrix,argument0);

#define ScreenCoordToVector
// ScreenCoordToVector(OutputVectorID,ScreenCoordX,ScreenCoordY,CameraIndex)
// If you take a particular position on the screen everything that can
// be seen at this position lies on one ray and this ray begins at the
// camera position. This function computes a vector describing the
// direction of the ray that belongs to the given screen space coordinate
// (relative to the left top of the window) and saves the result using the
// given output vector. If a negative ID gets passed for OutputVectorID a
// new vector gets created and it's ID gets returned. Never forget to call
// ReleaseVector for every vector you create.
return external_call(global.u3d_screen_coord_to_vector,argument0,argument1,argument2,argument3);

#define CheckBoundingBoxVisibility
// CheckBoundingBoxVisibility(MinimumVectorID,MaximumVectorID,BoundingBoxTransformationID,CameraIndex)
// This function checks whether the bounding box definined by the given
// values lies within the view frustum of the camera with the given index.
// MinimumVectorID can be the ID of a Vector that gives the corner with
// minimal coordinates for the bounding box or a negative value. In the
// latter case the vector (-1,-1,-1) will be used as minimum vector.
// MaximumVectorID can be the ID of a Vector that gives the corner with
// maximal coordinates for the bounding box or a negative value. In the
// latter case the vector (1,1,1) will be used as maximum vector. The
// bounding box that results from these two vectors will then be
// transformed using the matrix given by BoundingBoxTransformation. If
// BoundingBoxTransformation is negative no transformation will be used.
// If the bounding box intersects the view frustum true is returned,
// otherwise the return value is false.
return external_call(global.u3d_check_bounding_box_visibility,argument0,argument1,argument2,argument3);

#define CreateVector
// CreateVector(OutputVectorID,X,Y,Z)
// This function creates a vector made up of the given three elements and
// saves the result using the given output vector. If a negative ID is
// passed for OutputVectorID a new vector is created and it's ID gets
// returned. Never forget to call ReleaseVector for every vector you
// create.
return external_call(global.u3d_create_vector,argument0,argument1,argument2,argument3);

#define CopyVector
// CopyVector(OutputVectorID,InputVectorID)
// This function copies the given input vector to the vector given by
// OutputVectorID. If OutputVectorID is negative a new vector is created
// and its ID is returned. Never forget to call ReleaseVector for every
// vector you create.
return external_call(global.u3d_calculate_vector_scalar_product,argument0,argument1,1.0);

#define CoordToScreen
// CoordToScreen(OutputVectorID,X,Y,Z,CameraIndex)
// This function returns a vector containing the given coordinate
// transformed to screen space. A vertex with the given position
// would have the returned position on the screen if seen from the given
// camera. The z-component of the returned vector contains the depth value
// of the given coordinate. If the given position is behind the camera it
// is negative.
return external_call(global.u3d_coord_to_screen,argument0,argument4,argument1,argument2,argument3);

#define CreateDirectionVector
// CreateDirectionVector(OutputVectorID,Longitude,Latitude)
// This function creates a vector with a length of one based on the given
// longitude and latitude and saves the result using the given output
// vector. If a negative ID is passed for OutputVectorID a new vector is
// created and it's ID gets returned. Never forget to call ReleaseVector
// for every vector you create.
return external_call(global.u3d_create_direction_vector,argument0,argument1,argument2);

#define CalculateVectorSum
// CalculateVectorSum(OutputVectorID,FirstVectorID,SecondVectorID)
// This function creates the sum of the first and the second vector and
// saves the resulting vector to the vector given by OutputVectorID. If
// OutputVectorID is negative a new vector is created and it's ID gets
// returned. Never forget to call ReleaseVector for every vector you
// create.
return external_call(global.u3d_calculate_vector_sum,argument0,argument1,argument2);

#define CalculateVectorDifference
// CalculateVectorDifference(OutputVectorID,FirstVectorID,SecondVectorID)
// This function creates the difference of the first and the second vector
// (FirstVector-SecondVector) and saves the resulting vector to the vector
// given by OutputVectorID. If OutputVectorID is negative a new vector is
// created and it's ID gets returned. Never forget to call ReleaseVector
// for every vector you create.
return external_call(global.u3d_calculate_vector_difference,argument0,argument1,argument2);

#define CalculateVectorScalarProduct
// CalculateVectorScalarProduct(OutputVectorID,InputVectorID,ScalarFactor)
// This function scales the given input vector using the given scalar
// factor and saves the resulting vector to the vector given by
// OutputVectorID. If OutputVectorID is negative a new vector is created
// and it's ID gets returned. Never forget to call ReleaseVector for every
// vector you create.
return external_call(global.u3d_calculate_vector_scalar_product,argument0,argument1,argument2);

#define NormalizeVector
// NormalizeVector(InputOutputVectorID)
// This function takes the vector given by InputOutputVectorID, scales
// it by the reciprocal of its length, to reach that its length becomes
// one and outputs the result to the vector given by InputOutputVectorID.
return external_call(global.u3d_normalize_vector,argument0);

#define CalculateVectorLength
// CalculateVectorLength(VectorID)
// This function returns the length of the vector with the given index.
return external_call(global.u3d_calculate_vector_length,argument0);

#define CalculateVectorLongitude
// CalculateVectorLongitude(VectorID)
// This function returns the longitude, which describes the vector with
// the given index correctly.
return external_call(global.u3d_calculate_vector_longitude,argument0);

#define CalculateVectorLatitude
// CalculateVectorLatitude(VectorID)
// This function returns the latitude, which describes the vector with the
// given index correctly.
return external_call(global.u3d_calculate_vector_latitude,argument0);

#define TransformVector
// TransformVector(OutputVectorID,InputVectorId,TransformationMatrixID)
// This function transforms the given input vector using the given
// transformation matrix and saves the result to the given output vector.
// If OutputVectorID is negative a new vector is created and it's ID gets
// returned. Never forget to call ReleaseVector for every vector you create.
return external_call(global.u3d_transform_vector,argument0,argument1,argument2);

#define TransformVectorEx
// TransformVectorEx(OutputVectorID,InputVectorId,TransformationMatrixID,ApplyRotation,ApplyTranslation,ApplyScaling)
// This function transforms the given input vector using components of the
// given transformation matrix and saves the result to the given output
// vector. If OutputVectorID is negative a new vector is created and its
// ID is returned. Never forget to call ReleaseVector for every vector you
// create.
// If ApplyRotation is true the rotation described by the given matrix
// will effect the vector.
// If ApplyTranslation is true the translation described by the given
// matrix will effect the vector.
// If ApplyScaling is true the scaling described by the given matrix
// will effect the vector.
// Otherwise the mentioned things will not happen.
return external_call(global.u3d_transform_vector_ex,argument0,argument1,argument2,argument3,argument4,argument5);

#define CalculateDotProduct
// CalculateDotProduct(FirstVectorID,SecondVectorID)
// This function returns the cross product of the two given vectors.
return external_call(global.u3d_calculate_dot_product,argument0,argument1);

#define CalculateCrossProduct
// CalculateCrossProduct(OutputVectorID,FirstVectorID,SecondVectorID)
// This function calculates the cross product of the two given input
// vectors and saves the result to the given output vector. If
// OutputVectorID is negative a new vector is created and it's ID gets
// returned. Never forget to call ReleaseVector for every vector you create.
return external_call(global.u3d_calculate_cross_product,argument0,argument1,argument2);

#define ComputeMatrixTranslation
// ComputeMatrixTranslation(OutputVectorID,InputMatrixID)
// This function computes x, y and z values that describe the translation
// of the given matrix correctly. The computed values get saved to the
// given output vector. If OutputVectorID is negative a new vector gets
// created and its ID gets returned. Never forget to call
// ReleaseVector(...) for every vector you create.
return external_call(global.u3d_compute_matrix_translation,argument0,argument1);

#define ComputeMatrixScaling
// ComputeMatrixScaling(OutputVectorID,InputMatrixID)
// This function computes scalx, scaly and scalz values that describe the
// scaling of the given matrix correctly. The computed values get saved
// to the given output vector (scalx to x, scaly to y, scalz to z).
// If OutputVectorID is negative a new vector gets created and its
// ID gets returned. Never forget to call ReleaseVector(...) for every
// vector you create.
return external_call(global.u3d_compute_matrix_scaling,argument0,argument1);

#define ComputeMatrixRotationAngles
// ComputeMatrixRotationAngles(OutputVectorID,InputMatrixID)
// This function computes rotx, roty and rotz values that describe the
// rotation of the given matrix correctly. The computed values get saved
// to the given output vector (rotx to x, roty to y, rotz to z, all in
// degrees). If OutputVectorID is negative a new vector gets created and
// it's ID gets returned. Never forget to call ReleaseVector(...) for
// every vector you create.
return external_call(global.u3d_compute_matrix_rotation_angles,argument0,argument1);

#define ApplyTransformationMatrix
// ApplyTransformationMatrix(MatrixID)
// This function applies the transformation described by the given matrix
// to this object, by setting up its transformation variables x, y, z,
// rotx, roty, rotz, scalx, scaly and scalz accordingly.
var u3d_translation,u3d_scaling,u3d_rotation;
u3d_translation=external_call(global.u3d_compute_matrix_translation,-1,argument0);
x=external_call(global.u3d_get_vector,u3d_translation,1);
y=external_call(global.u3d_get_vector,u3d_translation,2);
z=external_call(global.u3d_get_vector,u3d_translation,3);
external_call(global.u3d_release_vector,u3d_translation);
u3d_scaling=external_call(global.u3d_compute_matrix_scaling,-1,argument0);
scalx=external_call(global.u3d_get_vector,u3d_scaling,1);
scaly=external_call(global.u3d_get_vector,u3d_scaling,2);
scalz=external_call(global.u3d_get_vector,u3d_scaling,3);
external_call(global.u3d_release_vector,u3d_scaling);
u3d_rotation=external_call(global.u3d_compute_matrix_rotation_angles,-1,argument0);
rotx=external_call(global.u3d_get_vector,u3d_rotation,1);
roty=external_call(global.u3d_get_vector,u3d_rotation,2);
rotz=external_call(global.u3d_get_vector,u3d_rotation,3);
external_call(global.u3d_release_vector,u3d_rotation);

#define GetVector
// GetVector(VectorID,VectorElementID)
// This function can be used to get the elements (X, Y, Z) of a vector.
// VectorID gives the ID of the vector you want to retrieve information
// from. VectorElementID can be 1 for X, 2 for Y or 3 for Z.
return external_call(global.u3d_get_vector,argument0,argument1);

#define ReleaseVector
// ReleaseVector(VectorID)
// This function releases the vector with the given ID. Never forget to
// call this function for every vector you create. Else you will get a
// memory leak. This will lead to a error message.
return external_call(global.u3d_release_vector,argument0);

#define LoadHeightMap
// LoadHeightMap(TextureIndex,SourceFile,HeightFactor)
// This function loads a grey scale height map from the given file and
// computes it to a normal map using the given HeightFactor. A copy of the
// height map will be saved to the alpha channel of the resulting texture.
// The resulting texture will be managed using the given index.
return external_call(global.u3d_load_height_map,argument0,argument1,argument2);

#define LoadCubeTexture
// LoadCubeTexture(FileScheme,TextureIndex,CubeWidth)
// This function takes the string given by FileScheme and replaces the *
// that has to be part of the string by the words Right, Left, Top, Bottom,
// Back and Front. Then it creates a cube texture using these files. The
// resulting cube texture will have dimensions of CubeWidth. Note that
// CubeWidth mustn't be 0. For more information about cube textures have a
// look at the help file.
return external_call(global.u3d_load_cube_texture,argument1,argument2,argument0);

#define ReleaseTexture
// ReleaseTexture(TextureIndex)
// This function frees up the given texture index.
return external_call(global.u3d_release_texture,argument0);

#define GetDrawnTriangleCount
// GetDrawnTriangleCount()
// Returns the number of triangles that have been drawn in the previous
// step.
return external_call(global.u3d_get_drawn_triangle_count);

#define GetDrawCallCount
// GetDrawCallCount()
// Returns the number of draw calls that have been performed in the
// previous  step. A draw call occurs whenever Ultimate 3D makes the
// graphics device draw a piece of geometry, e.g. the parts of a mesh
// that use a particular material, or a set of primitive objects.
return external_call(global.u3d_get_draw_call_count);

#define SwitchView
// SwitchView()
// This function changes the visibility state of the Ultimate 3D view. If
// this function has been called to make the U3D view invisible Game Maker
// can use the first view again.
return external_call(global.u3d_switch_view);

#define SetFilter
// SetFilter(TextureFilter,TextureStage)
// This function changes the filter that is to be used for sampling
// textures in the given stage. If stage is negative this function sets
// up the filter that's being used for DrawTex(...) and DrawTexEx(...)
// calls. The given filter will be used for minification and magnification
// of textures. To get information about which value for TextureFilter
// refers to which filter have a look at the help file.
return external_call(global.u3d_set_filter,argument1,argument0);

#define SetMipMapFilter
// SetMipMapFilter(TextureFilter,TextureStage)
// This function changes the filter that is to be used for interpolating
// between different mip maps of the textures in the given stage. To get
// information about which value for TextureFilter refers to which filter
// have a look at the help file.
return external_call(global.u3d_set_mip_map_filter,argument1,argument0);

#define SwitchWireFrameMode
// SwitchWireFrameMode(EnableWireFrameMode)
// This function can be used to enable or disable wire frame mode for the
// primitive, model or terrain object, that calls this function. If
// EnableWireFrameMode is true wire frame mode will be used, otherwise the
// object will be drawn solid.
return external_call(global.u3d_switch_wire_frame_mode,u3d_index,u3d_type,argument0);

#define SetSoundPosition
sound_volume(argument0,min(1,max(0,1-(point_distance(camera.x,camera.y,argument1,argument2)-argument3)/(argument4-argument3))));
temp_roty=camera.roty;
while(temp_roty>360)
    temp_roty-=360;
while(temp_roty<0)
    temp_roty+=360;
result=-temp_roty-point_direction(argument1,argument2,camera.x,camera.y);
if(abs(result)>=180)
    result=result-360*sign(result);
while(result>360)
    result-=360;
while(result<0)
    result+=360;
temp_pan=cos(degtorad(result))/-2+0.5;
sound_pan(argument0,temp_pan);

#define SetMipMapCount
// SetMipMapCount(NewMipMapCount)
// This function changes the number of mip maps that's used when loading a
// texture.
return external_call(global.u3d_set_mip_map_count,argument0);

#define SetTexturePath
// SetTexturePath(TextureFolder)
// This function changes the folder where Ultimate 3D searches for textures
// when loading models. TextureFolder must be a string giving the path to
// the folder including the "/" at the end.
return external_call(global.u3d_set_texture_path,argument0);

#define Init
show_message("INIT U3D");
// Init()
// This function initializes Ultimate 3D. It's called by every U3D script
// that requires that U3D is initialized.
InitializeVariableGlobal("u3d_initialized",false);
if(!global.u3d_initialized){
    global.u3d_transmit_string=ExternalDefineWithString("TransmitString",2,ty_real,ty_string);
    global.u3d_transmit_doubles=ExternalDefineDouble("TransmitDouble",11);
    global.u3d_init=ExternalDefineDouble("InitUltimate3D",10);
    global.u3d_cleanup=ExternalDefineDouble("Cleanup",0);
    global.u3d_get_supported_ps_version=ExternalDefineDouble("GetSupportedPSVersion",0);
    global.u3d_get_cube_map_support=ExternalDefineDouble("GetCubeMapSupport",0);
    global.u3d_get_simultaneous_texture_count=ExternalDefineDouble("GetSimultaneousTextureCount",0);
    global.u3d_get_drawn_triangle_count=ExternalDefineDouble("GetDrawnTriangleCount",0);
    global.u3d_get_draw_call_count=ExternalDefineDouble("GetDrawCallCount",0);
    global.u3d_render=ExternalDefineDouble("Render",0);
    global.u3d_present=ExternalDefineDouble("Present",0);
    global.u3d_set_mip_map_count=ExternalDefineDouble("SetMipMapCount",1);
    global.u3d_set_texture_path=ExternalDefineWithString("SetTexturePath",1,ty_string);
    global.u3d_load_texture=ExternalDefineWithString("LoadTexture",4,ty_real,ty_string,ty_real,ty_real);
    global.u3d_load_height_map=ExternalDefineWithString("LoadHeightMap",3,ty_real,ty_string,ty_real);
    global.u3d_load_cube_texture=ExternalDefineWithString("LoadCubeTexture",3,ty_real,ty_real,ty_string);
    global.u3d_create_texture_render_target=ExternalDefineDouble("CreateTextureRenderTarget",3);
    global.u3d_create_cube_texture_render_target=ExternalDefineDouble("CreateCubeTextureRenderTarget",2);
    global.u3d_release_texture=ExternalDefineDouble("ReleaseTexture",1);
    global.u3d_load_background=ExternalDefineWithString("LoadBackground",1,ty_string);
    global.u3d_transmit_controller_information=ExternalDefineDouble("TransmitControllerInformation",4);
    global.u3d_switch_view=ExternalDefineDouble("SwitchView",0);
    global.u3d_set_filter=ExternalDefineDouble("SetFilter",2);
    global.u3d_set_mip_map_filter=ExternalDefineDouble("SetMipMapFilter",2);
    global.u3d_switch_wire_frame_mode=ExternalDefineDouble("SwitchWireFrameMode",3);
    global.u3d_switch_additive_blending=ExternalDefineDouble("SwitchAdditiveBlending",3);
    global.u3d_update_camera_transformation=ExternalDefineDouble("UpdateCameraTransformation",7);
    show_message("SET THE BUGGER");
    global.u3d_update_camera_projection=ExternalDefineDouble("UpdateCameraProjection",10);
    global.u3d_destroy_camera=ExternalDefineDouble("DestroyCamera",1);
    global.u3d_render_to_texture=ExternalDefineDouble("RenderToTexture",1);
    global.u3d_render_to_cube_texture=ExternalDefineDouble("RenderToCubeTexture",8);
    global.u3d_set_ortho=ExternalDefineDouble("SetOrtho",4);
    global.u3d_get_clipping_plane_support=ExternalDefineDouble("GetClippingPlaneSupport",0);
    global.u3d_set_clipping_plane=ExternalDefineDouble("SetClippingPlane",7);
    global.u3d_set_object_room=ExternalDefineDouble("SetObjectRoom",3);
    global.u3d_create_portal=ExternalDefineDouble("CreatePortal",8);
    global.u3d_set_portal=ExternalDefineDouble("SetPortal",9);
    global.u3d_open_portal=ExternalDefineDouble("OpenPortal",2);
    global.u3d_destroy_portal=ExternalDefineDouble("DestroyPortal",1);
    global.u3d_switch_portal_engine=ExternalDefineDouble("SwitchPortalEngine",2);
    global.u3d_get_object_room=ExternalDefineDouble("GetObjectRoom",2);
    global.u3d_get_room_visibility=ExternalDefineDouble("GetRoomVisibility",2);
    global.u3d_set_room_visibility=ExternalDefineDouble("SetRoomVisibility",3);
    global.u3d_set_room_visibility_enforcement=ExternalDefineDouble("SetRoomVisibilityEnforcement",3);
    global.u3d_get_shadow_support=ExternalDefineDouble("GetShadowSupport",0);
    global.u3d_switch_shadows=ExternalDefineDouble("SwitchShadows",2);
    global.u3d_switch_shadow_casting=ExternalDefineDouble("SwitchShadowCasting",3);
    global.u3d_create_shadow_optimized_geometry=ExternalDefineDouble("CreateShadowOptimizedGeometry",3);
    global.u3d_switch_shadow_receiving=ExternalDefineDouble("SwitchShadowReceiving",4);
    global.u3d_create_post_screen_shader=ExternalDefineWithString("CreatePostScreenShader",4,ty_string,ty_string,ty_real,ty_real);
    global.u3d_set_pss_texture=ExternalDefineDouble("SetPSSTexture",3);
    global.u3d_set_pss_filter=ExternalDefineDouble("SetPSSFilter",3);
    global.u3d_set_pss_vs_constant=ExternalDefineDouble("SetPSSVSConstant",6);
    global.u3d_set_pss_ps_constant=ExternalDefineDouble("SetPSSPSConstant",6);
    global.u3d_destroy_post_screen_shader=ExternalDefineDouble("DestroyPostScreenShader",1);
    global.u3d_set_mouse_position=ExternalDefineDouble("SetMousePosition",2);
    global.u3d_get_mouse_position_x=ExternalDefineDouble("GetMousePositionX",0);
    global.u3d_get_mouse_position_y=ExternalDefineDouble("GetMousePositionY",0);
    global.u3d_create_wall=ExternalDefineDouble("CreateWall",10);
    global.u3d_create_floor=ExternalDefineDouble("CreateFloor",9);
    global.u3d_create_cube=ExternalDefineDouble("CreateCube",11);
    global.u3d_create_billboard=ExternalDefineDouble("CreateBillboard",11);
    global.u3d_begin_polygon=ExternalDefineDouble("BeginPolygon",1);
    global.u3d_add_vertex=ExternalDefineDouble("AddVertex",5);
    global.u3d_create_polygon=ExternalDefineDouble("CreatePolygon",0);
    global.u3d_set_vertex=ExternalDefineDouble("SetVertex",7);
    global.u3d_get_vertex=ExternalDefineDouble("GetVertex",3);
    global.u3d_create_primitive_from_model=ExternalDefineWithString("CreatePrimitiveFromModel",3,ty_string,ty_string,ty_real);
    global.u3d_transform_primitive=ExternalDefineDouble("TransformPrimitive",11);
    global.u3d_set_material=ExternalDefineDouble("SetMaterial",5);
    global.u3d_set_material_emissive=ExternalDefineDouble("SetMaterialEmissive",4);
    global.u3d_destroy_primitive=ExternalDefineDouble("DestroyPrimitive",1);
    global.u3d_export_to_u3d_file=ExternalDefineWithString("ExportToU3DFile",4,ty_real,ty_string,ty_string,ty_real);
    global.u3d_preload_mesh=ExternalDefineWithString("PreloadMesh",2,ty_string,ty_string);
    global.u3d_release_model=ExternalDefineWithString("ReleaseModel",1,ty_string);
    global.u3d_load_mesh=ExternalDefineWithString("LoadMesh",2,ty_string,ty_string);
    global.u3d_create_empty_mesh=ExternalDefineDouble("CreateEmptyMesh",3);
    global.u3d_add_frame=ExternalDefineWithString("AddFrame",3,ty_real,ty_string,ty_string);
    global.u3d_enable_vertex_tweening=ExternalDefineDouble("EnableVertexTweening",1);
    global.u3d_model_step=ExternalDefineDouble("ModelStep",11);
    global.u3d_model_set_frame=ExternalDefineDouble("ModelSetFrame",4);
    global.u3d_get_current_frame=ExternalDefineDouble("GetCurrentFrame",1);
    global.u3d_get_material_index=ExternalDefineWithString("GetMaterialIndex",2,ty_real,ty_string);
    global.u3d_get_model_material_count=ExternalDefineDouble("GetModelMaterialCount",1);
    global.u3d_set_model_material=ExternalDefineDouble("SetModelMaterial",6);
    global.u3d_set_model_material_emissive=ExternalDefineDouble("SetModelMaterialEmissive",5);
    global.u3d_set_model_material_specular=ExternalDefineDouble("SetModelMaterialSpecular",6);
    global.u3d_load_material_effect=ExternalDefineWithString("LoadMaterialEffect",3,ty_real,ty_real,ty_string);
    global.u3d_create_material_vs_effect=ExternalDefineWithString("CreateMaterialVSEffect",3,ty_real,ty_real,ty_string);
    global.u3d_set_material_effect_light_source=ExternalDefineDouble("SetMaterialEffectLightSource",5);
    global.u3d_set_material_effect_vs_constant=ExternalDefineDouble("SetMaterialEffectVSConstant",7);
    global.u3d_set_material_effect_ps_constant=ExternalDefineDouble("SetMaterialEffectPSConstant",7);
    global.u3d_set_material_stage_texture=ExternalDefineDouble("SetMaterialStageTexture",4);
    global.u3d_set_material_stage_tex_coord=ExternalDefineDouble("SetMaterialStageTexCoord",4);
    global.u3d_set_material_stage_texture_operation=ExternalDefineDouble("SetMaterialStageTextureOperation",4);
    global.u3d_set_material_environment_map=ExternalDefineDouble("SetMaterialEnvironmentMap",3);
    global.u3d_switch_alpha_blending=ExternalDefineDouble("SwitchAlphaBlending",3);
    global.u3d_switch_background_mode=ExternalDefineDouble("SwitchBackgroundMode",2);
    global.u3d_recalculate_normals=ExternalDefineDouble("RecalculateNormals",1);
    global.u3d_smooth_normals=ExternalDefineDouble("SmoothNormals",2);
    global.u3d_add_inverse_tangent_space_matrices=ExternalDefineDouble("AddInverseTangentSpaceMatrices",1);
    global.u3d_apply_cel_shading=ExternalDefineDouble("ApplyCelShading",6);
    global.u3d_apply_parallax_and_bump_mapping=ExternalDefineDouble("ApplyParallaxAndBumpMapping",7);
    global.u3d_create_lod_chain=ExternalDefineDouble("CreateLODChain",11);
    global.u3d_get_model_mesh_count=ExternalDefineDouble("GetModelMeshCount",1);
    global.u3d_get_locked_mesh_vertex_count=ExternalDefineDouble("GetLockedMeshVertexCount",1);
    global.u3d_get_locked_mesh_triangle_count=ExternalDefineDouble("GetLockedMeshTriangleCount",1);
    global.u3d_add_texture_coordinate_set=ExternalDefineDouble("AddTextureCoordinateSet",2);
    global.u3d_add_texture_coordinate_sets_from_model=ExternalDefineWithString("AddTextureCoordinateSetsFromModel",3,ty_real,ty_string,ty_string);
    global.u3d_lock_mesh=ExternalDefineDouble("LockMesh",5);
    global.u3d_set_locked_mesh_vertex=ExternalDefineDouble("SetLockedMeshVertex",4);
    global.u3d_get_locked_mesh_vertex=ExternalDefineDouble("GetLockedMeshVertex",3);
    global.u3d_set_locked_mesh_triangle=ExternalDefineDouble("SetLockedMeshTriangle",5);
    global.u3d_get_locked_mesh_triangle=ExternalDefineDouble("GetLockedMeshTriangle",3);
    global.u3d_set_locked_mesh_triangle_material=ExternalDefineDouble("SetLockedMeshTriangleMaterial",3);
    global.u3d_get_locked_mesh_triangle_material=ExternalDefineDouble("GetLockedMeshTriangleMaterial",2);
    global.u3d_unlock_mesh=ExternalDefineDouble("UnlockMesh",1);
    global.u3d_get_bone_index=ExternalDefineWithString("GetBoneIndex",2,ty_real,ty_string);
    global.u3d_get_bone_count=ExternalDefineDouble("GetBoneCount",1);
    global.u3d_get_bone_parent=ExternalDefineDouble("GetBoneParent",2);
    global.u3d_set_bone_rotation=ExternalDefineDouble("SetBoneRotation",5);
    global.u3d_set_bone_frame=ExternalDefineDouble("SetBoneFrame",4);
    global.u3d_start_pose_interpolation=ExternalDefineDouble("StartPoseInterpolation",3);
    global.u3d_copy_animation=ExternalDefineWithString("CopyAnimation",4,ty_real,ty_string,ty_string,ty_real);
    global.u3d_destroy_model=ExternalDefineDouble("DestroyModel",1);
    global.u3d_set_object_solidity=ExternalDefineDouble("SetObjectSolidity",4);
    global.u3d_check_swept_ellipsoid_intersection=ExternalDefineDouble("CheckSweptEllipsoidIntersection",6);
    global.u3d_get_triangle_intersection_count=ExternalDefineDouble("GetTriangleIntersectionCount",0);
    global.u3d_get_intersection_time=ExternalDefineDouble("GetIntersectionTime",1);
    global.u3d_get_intersection_position=ExternalDefineDouble("GetIntersectionPosition",2);
    global.u3d_get_intersected_triangle_normal=ExternalDefineDouble("GetIntersectedTriangleNormal",2);
    global.u3d_get_push_away_vector=ExternalDefineDouble("GetPushAwayVector",2);
    global.u3d_attempt_move_to_position=ExternalDefineDouble("AttemptMoveToPosition",7);
    global.u3d_check_ray_intersection=ExternalDefineDouble("CheckRayIntersection",8);
    global.u3d_create_terrain=ExternalDefineDouble("CreateTerrain",10);
    global.u3d_add_terrain_texture=ExternalDefineWithString("AddTerrainTexture",4,ty_real,ty_string,ty_real,ty_real);
    global.u3d_apply_terrain_textures=ExternalDefineDouble("ApplyTerrainTextures",1);
    global.u3d_get_terrain_height_at_position=ExternalDefineDouble("GetTerrainHeightAtPosition",3);
    global.u3d_get_texture_strength_at_position=ExternalDefineDouble("GetTextureStrengthAtPosition",4);
    global.u3d_calculate_terrain_light_map=ExternalDefineDouble("CalculateTerrainLightMap",11);
    global.u3d_set_custom_terrain_light_map=ExternalDefineDouble("SetCustomTerrainLightMap",2);
    global.u3d_deform_terrain=ExternalDefineDouble("DeformTerrain",5);
    global.u3d_save_terrain_height_map=ExternalDefineWithString("SaveTerrainHeightMap",2,ty_real,ty_string);
    global.u3d_destroy_terrain=ExternalDefineDouble("DestroyTerrain",1);
    global.u3d_create_terrain_decal=ExternalDefineDouble("CreateTerrainDecal",4);
    global.u3d_create_particle_system=ExternalDefineDouble("CreateParticleSystem",0);
    global.u3d_particle_system_step=ExternalDefineDouble("ParticleSystemStep",7);
    global.u3d_set_particle_count=ExternalDefineDouble("SetParticleCount",4);
    global.u3d_set_particle_lifetime=ExternalDefineDouble("SetParticleLifetime",3);
    global.u3d_set_particle_origin=ExternalDefineDouble("SetParticleOrigin",8);
    global.u3d_set_particle_velocity=ExternalDefineDouble("SetParticleVelocity",7);
    global.u3d_set_particle_acceleration=ExternalDefineDouble("SetParticleAcceleration",7);
    global.u3d_set_initial_center_repulsion=ExternalDefineDouble("SetInitialCenterRepulsion",4);
    global.u3d_set_initial_particle_color=ExternalDefineDouble("SetInitialParticleColor",9);
    global.u3d_set_final_particle_color=ExternalDefineDouble("SetFinalParticleColor",9);
    global.u3d_set_particle_size_development=ExternalDefineDouble("SetParticleSizeDevelopment",5);
    global.u3d_set_particle_rotation=ExternalDefineDouble("SetParticleRotation",5);
    global.u3d_add_gravity_emitter=ExternalDefineDouble("AddGravityEmitter",5);
    global.u3d_set_gravity_emitter=ExternalDefineDouble("SetGravityEmitter",6);
    global.u3d_add_modifier=ExternalDefineDouble("AddModifier",1);
    global.u3d_set_modifier_effected_area=ExternalDefineDouble("SetModifierEffectedArea",3);
    global.u3d_set_modifier_lifetime_change=ExternalDefineDouble("SetModifierLifetimeChange",3);
    global.u3d_set_modifier_velocity_change=ExternalDefineDouble("SetModifierVelocityChange",8);
    global.u3d_set_modifier_acceleration_change=ExternalDefineDouble("SetModifierAccelerationChange",8);
    global.u3d_set_modifier_new_final_color=ExternalDefineDouble("SetModifierNewFinalColor",10);
    global.u3d_set_modifier_new_final_size=ExternalDefineDouble("SetModifierNewFinalSize",4);
    global.u3d_destroy_particle_system=ExternalDefineDouble("DestroyParticleSystem",1);
    global.u3d_set_fog=ExternalDefineDouble("SetFog",5);
    global.u3d_set_ambient_light=ExternalDefineDouble("SetAmbientLight",4);
    global.u3d_create_directional_light=ExternalDefineDouble("CreateDirectionalLight",8);
    global.u3d_create_point_light=ExternalDefineDouble("CreatePointLight",10);
    global.u3d_create_spot_light=ExternalDefineDouble("CreateSpotLight",10);
    global.u3d_light_step=ExternalDefineDouble("LightStep",11);
    global.u3d_destroy_light_source=ExternalDefineDouble("DestroyLightSource",1);
    global.u3d_set_font=ExternalDefineWithString("SetFont",4,ty_real,ty_string,ty_real,ty_real);
    global.u3d_set_font_color=ExternalDefineDouble("SetFontColor",5);
    global.u3d_draw_text=ExternalDefineWithString("DrawTextU3D",4,ty_real,ty_real,ty_real,ty_string);
    global.u3d_draw_text_3d=ExternalDefineWithString("DrawText3D",2,ty_real,ty_string);
    global.u3d_draw_texture=ExternalDefineDouble("DrawTexture",6);
    global.u3d_draw_texture_ex=ExternalDefineDouble("DrawTextureEx",11);
    global.u3d_take_screenshot=ExternalDefineWithString("TakeScreenshot",1,ty_string);
    global.u3d_take_screenshot_ex=ExternalDefineWithString("TakeScreenshotEx",1,ty_string);
    global.u3d_coord_to_screen=ExternalDefineDouble("CoordToScreen",5);
    global.u3d_screen_coord_to_vector=ExternalDefineDouble("ScreenCoordToVector",4);
    global.u3d_check_bounding_box_visibility=ExternalDefineDouble("CheckBoundingBoxVisibility",4);
    global.u3d_create_translation_scaling_matrix=ExternalDefineDouble("CreateTranslationScalingMatrix",7);
    global.u3d_create_transformation_matrix=ExternalDefineDouble("CreateTransformationMatrix",10);
    global.u3d_get_bone_transformation_matrix=ExternalDefineDouble("GetBoneTransformationMatrix",3);
    global.u3d_get_mesh_occurrence_count=ExternalDefineDouble("GetMeshOcurrenceCount",2);
    global.u3d_get_mesh_occurrence_transformation=ExternalDefineDouble("GetMeshOccurrenceTransformation",4);
    global.u3d_update_skeleton=ExternalDefineDouble("UpdateSkeleton",1);
    global.u3d_copy_matrix=ExternalDefineDouble("CopyMatrix",2);
    global.u3d_transform_matrix=ExternalDefineDouble("TransformMatrix",3);
    global.u3d_invert_matrix=ExternalDefineDouble("InvertMatrix",2);
    global.u3d_interpolate_matrices=ExternalDefineDouble("InterpolateMatrices",4);
    global.u3d_get_matrix_entry=ExternalDefineDouble("GetMatrixEntry",2);
    global.u3d_release_matrix=ExternalDefineDouble("ReleaseMatrix",1);
    global.u3d_get_ray_tracing_normal=ExternalDefineDouble("GetRayTracingNormal",1);
    global.u3d_get_intersected_material_index=ExternalDefineDouble("GetIntersectedMaterialIndex",0);
    global.u3d_create_vector=ExternalDefineDouble("CreateVector",4);
    global.u3d_create_direction_vector=ExternalDefineDouble("CreateDirectionVector",3);
    global.u3d_calculate_vector_sum=ExternalDefineDouble("CalculateVectorSum",3);
    global.u3d_calculate_vector_difference=ExternalDefineDouble("CalculateVectorDifference",3);
    global.u3d_calculate_vector_scalar_product=ExternalDefineDouble("CalculateVectorScalarProduct",3);
    global.u3d_normalize_vector=ExternalDefineDouble("NormalizeVector",1);
    global.u3d_calculate_vector_length=ExternalDefineDouble("CalculateVectorLength",1);
    global.u3d_calculate_vector_longitude=ExternalDefineDouble("CalculateVectorLongitude",1);
    global.u3d_calculate_vector_latitude=ExternalDefineDouble("CalculateVectorLatitude",1);
    global.u3d_transform_vector=ExternalDefineDouble("TransformVector",3);
    global.u3d_transform_vector_ex=ExternalDefineDouble("TransformVectorEx",6);
    global.u3d_calculate_dot_product=ExternalDefineDouble("CalculateDotProduct",2);
    global.u3d_calculate_cross_product=ExternalDefineDouble("CalculateCrossProduct",3);
    global.u3d_compute_matrix_translation=ExternalDefineDouble("ComputeMatrixTranslation",2);
    global.u3d_compute_matrix_scaling=ExternalDefineDouble("ComputeMatrixScaling",2);
    global.u3d_compute_matrix_rotation_angles=ExternalDefineDouble("ComputeMatrixRotationAngles",2);
    global.u3d_get_vector=ExternalDefineDouble("GetVector",2);
    global.u3d_release_vector=ExternalDefineDouble("ReleaseVector",1);

    Ultimate3DOptions();
    InitializeVariableGlobal("u3d_splash_screen_file","");
    external_call(global.u3d_transmit_string,0,global.u3d_splash_screen_file);
    InitializeVariableGlobal("u3d_z_buffer_format",16);
    InitializeVariableGlobal("u3d_multi_sample_type",1);
    InitializeVariableGlobal("u3d_use_right_handed_coordinate_system",false);
    InitializeVariableGlobal("u3d_device_type",0);
    InitializeVariableGlobal("u3d_log_file","");
    external_call(global.u3d_transmit_string,1,global.u3d_log_file);
    InitializeVariableGlobal("u3d_few_message_output",false);
    InitializeVariableGlobal("u3d_character_set","");
    external_call(global.u3d_transmit_string,2,global.u3d_character_set);
    if(!window_get_fullscreen()){
        external_call(global.u3d_init,window_handle(),view_xport[0],view_yport[0],view_wport[0],view_hport[0],global.u3d_z_buffer_format,global.u3d_multi_sample_type,global.u3d_use_right_handed_coordinate_system,global.u3d_device_type,global.u3d_few_message_output);
    }
    else{
        external_call(global.u3d_init,window_handle(),view_xport[0]+(display_get_width()-window_get_region_width())*0.5,view_yport[0]+(display_get_height()-window_get_region_height())*0.5,view_wport[0],view_hport[0],global.u3d_z_buffer_format,global.u3d_multi_sample_type,global.u3d_use_right_handed_coordinate_system,global.u3d_device_type,global.u3d_few_message_output);
    }
    global.u3d_initialized=true;
    return true;
}
return false;

#define ExternalDefineDouble
// ExternalDefineDouble(FunctionName,ArgumentCount)
// This function defines a function in a dll that has only double arguments
switch(argument1){
    case 0:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1);
    case 1:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,ty_real);
    case 2:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,ty_real,ty_real);
    case 3:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,ty_real,ty_real,ty_real);
    case 4:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,ty_real,ty_real,ty_real,ty_real);
    case 5:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,ty_real,ty_real,ty_real,ty_real,ty_real);
    case 6:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
    case 7:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
    case 8:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
    case 9:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
    case 10:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
    case 11:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real,ty_real);
}
return 0;

#define ExternalDefineWithString
// ExternalDefineWithString(FunctionName,ArgumentCount,ArgumentType1,ArgumentType2,ArgumentType3,ArgumentType4)
// This function defines a function in a dll that has at least one string as
// argument.
switch(argument1){
    case 1:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,argument2);
    case 2:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,argument2,argument3);
    case 3:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,argument2,argument3,argument4);
    case 4:
        return external_define("Ultimate3D.dll",argument0,dll_cdecl,ty_real,argument1,argument2,argument3,argument4,argument5);
}
return 0;

#define InitializePrimitiveVariables
// This script initializes variables that are needed for all types of
// primitives
InitializeVariable("xprevious2",-123);
InitializeVariable("yprevious2",-123);
InitializeVariable("z",0);
InitializeVariable("zprevious",-123);
InitializeVariable("rotx",0);
InitializeVariable("rotxprevious",-123);
InitializeVariable("roty",0);
InitializeVariable("rotyprevious",-123);
InitializeVariable("rotz",0);
InitializeVariable("rotzprevious",-123);
InitializeVariable("scalx",1);
InitializeVariable("scalxprevious",-123);
InitializeVariable("scaly",1);
InitializeVariable("scalyprevious",-123);
InitializeVariable("scalz",1);
InitializeVariable("scalzprevious",-123);
InitializeVariable("texx1",0);
InitializeVariable("texy1",0);
InitializeVariable("texx2",1);
InitializeVariable("texy2",1);
InitializeVariable("partsx",1);
InitializeVariable("partsy",1);
InitializeVariable("texture",0);
InitializeVariable("textureprevious",-123);
InitializeVariable("u3d_type",0);
if(scalx==0 && scaly==0 && scalz==0){
    scalx=1;
    scaly=1;
    scalz=1;
}

#define InitializeLightVariables
// This script initializes variables that are needed for all types of
// light sources
InitializeVariable("xprevious2",-123);
InitializeVariable("yprevious2",-123);
InitializeVariable("z",0);
InitializeVariable("zprevious",-123);
InitializeVariable("rotx",0);
InitializeVariable("rotxprevious",-123);
InitializeVariable("roty",0);
InitializeVariable("rotyprevious",-123);
InitializeVariable("range",0);
InitializeVariable("rangeprevious",-123);
InitializeVariable("deg",0);
InitializeVariable("degprevious",-123);
InitializeVariable("r",0);
InitializeVariable("rprevious",-123);
InitializeVariable("g",-123);
InitializeVariable("gprevious",-123);
InitializeVariable("b",0);
InitializeVariable("bprevious",-123);
InitializeVariable("spec_r",0);
InitializeVariable("spec_rprevious",-123);
InitializeVariable("spec_g",-123);
InitializeVariable("spec_gprevious",-123);
InitializeVariable("spec_b",0);
InitializeVariable("spec_bprevious",-123);
InitializeVariable("u3d_type",0);

#define InitializeVariable
// InitializeVariable(VariableName,VariableValue)
// This script initializes the local variable with the given name (a string)
// with the given value if it isn't initialized yet.
if(!variable_local_exists(argument0)){
    variable_local_set(argument0,argument1);
}

#define InitializeVariableGlobal
// InitializeVariableGlobal(VariableName,VariableValue)
// This script initializes the global variable with the given name (a string)
// with the given value if it isn't initialized yet.
if(!variable_global_exists(argument0)){
    variable_global_set(argument0,argument1);
}

#define Ultimate3DOptions
global.u3d_splash_screen_file="";
global.u3d_z_buffer_format=32;
global.u3d_device_type=0;
global.u3d_log_file="";
global.u3d_few_message_output=false;
global.u3d_character_set="";
global.u3d_multi_sample_type = 4;
