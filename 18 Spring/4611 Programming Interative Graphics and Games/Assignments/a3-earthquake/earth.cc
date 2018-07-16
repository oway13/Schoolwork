/** CSci-4611 Assignment 3:  Earthquake
 */

#include "earth.h"
#include "config.h"

#include <vector>

// for M_PI constant
#define _USE_MATH_DEFINES

//Definitions for limits
#define X_MIN -M_PI
#define X_MAX M_PI
#define Y_MIN -M_PI/2
#define Y_MAX M_PI/2
#define LONG_MIN -180
#define LONG_MAX 180
#define LAT_MIN -90
#define LAT_MAX 90

#include <math.h>


Earth::Earth() {
}

Earth::~Earth() {
}

void Earth::Init(const std::vector<std::string> &search_path) {
    // init shader program
    shader_.Init();
    
    // init texture: you can change to a lower-res texture here if needed
    earth_tex_.InitFromFile(Platform::FindFile("earth-2k.png", search_path));

    // init geometry
    const int nslices = 10;
    const int nstacks = 10;

	float y_dist =(Y_MAX - Y_MIN) / nstacks;
	float x_dist = (X_MAX - X_MIN) / nslices;
	float long_dist = (LONG_MAX - LONG_MIN) / nslices;
	float lat_dist = (LAT_MAX - LAT_MIN) / nstacks;
	
    std::vector<unsigned int> indices;
	std::vector<Point2> texcoords;

	//Create all of the vertices in order of left to right, top to bottom
	//Also creates the normals
	//Does Plane and Globe
	for (int i = 0; i < nstacks+1; i++) {
		for (int j = 0; j < nslices+1; j++) {
			//Plane
			plane_vertices.push_back(Point3(X_MIN + j*x_dist, Y_MIN + i*y_dist, 0));
			plane_normals.push_back(Vector3(0, 0, 1));

			//Globe
			globe_vertices.push_back(LatLongToSphere(LAT_MIN + i*lat_dist, LONG_MIN + j*long_dist));
			globe_normals.push_back(LatLongToSphere(LAT_MIN + i*lat_dist, LONG_MIN + j*long_dist) - Point3(0, 0, 0));
			
		}
	}


	//Add all of the indices two triangles at a time, row-wise
	int count = 0;
	for (int j = 0; j < nstacks; j++) {
		for (int i = 0; i < nslices; i++) {
			indices.push_back(count);
			indices.push_back(count + nslices + 2);
			indices.push_back(count + nslices + 1);


			indices.push_back(count);
			indices.push_back(count + 1);
			indices.push_back(count + nslices + 2);
			count++;
		}
		count++;
	}

	//Add all of the vertices to the texture map
	for (int i = nstacks; i > -1; i--) {
		std::cout<<i;
		for (int j = 0; j < nslices + 1; j++) {
			texcoords.push_back(Point2(((float)j/nslices), ((float)i/nstacks)));
		}
	}

    
    earth_mesh_.SetVertices(plane_vertices);
    earth_mesh_.SetIndices(indices);
	earth_mesh_.SetTexCoords(0, texcoords);
	earth_mesh_.SetNormals(plane_normals);
    earth_mesh_.UpdateGPUMemory();
}

void Earth::ToGlobe(float frac) {
	std::vector<Point3> trans_vertices;
	std::vector<Vector3> trans_normals;

	if(frac == 1){ 
		earth_mesh_.SetVertices(globe_vertices); 
		earth_mesh_.SetNormals(globe_normals);
	} else {
		for (int i = 0; i < globe_vertices.size(); i++) {
			trans_vertices.push_back(plane_vertices[i].Lerp(globe_vertices[i], frac));
			trans_normals.push_back(plane_normals[i].Lerp(globe_normals[i], frac));
		}
		earth_mesh_.SetVertices(trans_vertices);
		earth_mesh_.SetNormals(trans_normals);
	}
	
	earth_mesh_.UpdateGPUMemory();
}

void Earth::ToPlane(float frac) {
	std::vector<Point3> trans_vertices;
	std::vector<Vector3> trans_normals;

	if (frac == 1) {
		earth_mesh_.SetVertices(plane_vertices);
		earth_mesh_.SetNormals(plane_normals);
	}
	else {
		for (int i = 0; i < plane_vertices.size(); i++) {
			trans_vertices.push_back(globe_vertices[i].Lerp(plane_vertices[i], frac));
			trans_normals.push_back(globe_normals[i].Lerp(plane_normals[i], frac));
		}
		earth_mesh_.SetVertices(trans_vertices);
		earth_mesh_.SetNormals(trans_normals);
	}

	earth_mesh_.UpdateGPUMemory();
}


void Earth::Draw(const Matrix4 &model_matrix, const Matrix4 &view_matrix, const Matrix4 &proj_matrix) {
    // Define a really bright white light.  Lighting is a property of the "shader"
    DefaultShader::LightProperties light;
    light.position = Point3(10,10,10);
    light.ambient_intensity = Color(1,1,1);
    light.diffuse_intensity = Color(1,1,1);
    light.specular_intensity = Color(1,1,1);
    shader_.SetLight(0, light);

    // Adust the material properties, material is a property of the thing
    // (e.g., a mesh) that we draw with the shader.  The reflectance properties
    // affect the lighting.  The surface texture is the key for getting the
    // image of the earth to show up.
    DefaultShader::MaterialProperties mat;
    mat.ambient_reflectance = Color(0.5, 0.5, 0.5);
    mat.diffuse_reflectance = Color(0.75, 0.75, 0.75);
    mat.specular_reflectance = Color(0.75, 0.75, 0.75);
    mat.surface_texture = earth_tex_;

    // Draw the earth mesh using these settings
    if (earth_mesh_.num_triangles() > 0) {
        shader_.Draw(model_matrix, view_matrix, proj_matrix, &earth_mesh_, mat);
    }
}


Point3 Earth::LatLongToSphere(double latitude, double longitude) const {
    // lat,long --> sphere calculations
	float x = cos(GfxMath::ToRadians(latitude))*sin(GfxMath::ToRadians(longitude));
	float y = sin(GfxMath::ToRadians(latitude));
	float z = cos(GfxMath::ToRadians(latitude))*cos(GfxMath::ToRadians(longitude));
    return Point3(x,y,z);
}

Point3 Earth::LatLongToPlane(double latitude, double longitude) const {
    // lat,long --> plane calculations
	float x = X_MIN + (((X_MAX - X_MIN)*(longitude - LONG_MIN)) / (LONG_MAX - LONG_MIN));
	float y = Y_MIN + (((Y_MAX - Y_MIN)*(latitude - LAT_MIN)) / (LAT_MAX - LAT_MIN));
    return Point3(x,y,0);
}



void Earth::DrawDebugInfo(const Matrix4 &model_matrix, const Matrix4 &view_matrix, const Matrix4 &proj_matrix) {
    // This draws a cylinder for each line segment on each edge of each triangle in your mesh.
    // So it will be very slow if you have a large mesh, but it's quite useful when you are
    // debugging your mesh code, especially if you start with a small mesh.
    for (int t=0; t<earth_mesh_.num_triangles(); t++) {
        std::vector<unsigned int> indices = earth_mesh_.triangle_vertices(t);
        std::vector<Point3> loop;
        loop.push_back(earth_mesh_.vertex(indices[0]));
        loop.push_back(earth_mesh_.vertex(indices[1]));
        loop.push_back(earth_mesh_.vertex(indices[2]));
        quick_shapes_.DrawLines(model_matrix, view_matrix, proj_matrix,
            Color(1,1,0), loop, QuickShapes::LinesType::LINE_LOOP, 0.005);
    }
}

