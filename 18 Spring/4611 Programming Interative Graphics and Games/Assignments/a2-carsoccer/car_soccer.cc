/** CSci-4611 Assignment 2:  Car Soccer
 */

#include "car_soccer.h"
#include "config.h"
#include  <time.h>


CarSoccer::CarSoccer() : GraphicsApp(1024,768, "Car Soccer") {
    // Define a search path for finding data files (images and shaders)
    searchPath_.push_back(".");
    searchPath_.push_back("./data");
    searchPath_.push_back(DATA_DIR_INSTALL);
    searchPath_.push_back(DATA_DIR_BUILD);
}

CarSoccer::~CarSoccer() {
}


Vector2 CarSoccer::joystick_direction() {
    Vector2 dir;
    if (IsKeyDown(GLFW_KEY_LEFT))
        dir[0]--;
    if (IsKeyDown(GLFW_KEY_RIGHT))
        dir[0]++;
    if (IsKeyDown(GLFW_KEY_UP))
        dir[1]--;
    if (IsKeyDown(GLFW_KEY_DOWN))
        dir[1]++;
    return dir;
}

void CarSoccer::launch_ball() {
	int rx = (rand() % (max_x * 2)) - max_x;
	int ry = (rand() % (max_y * 2)) - max_y;
	int rz = (rand() % (max_z * 2)) - max_z;
	ball_.set_velocity(Vector3(rx, ry, rz));
}

void CarSoccer::OnSpecialKeyDown(int key, int scancode, int modifiers) {
    if (key == GLFW_KEY_SPACE) {
        // Here's where you could call some form of launch_ball();
		ball_.Reset();
		launch_ball();
    }

	if (key == GLFW_KEY_TAB) {
		debug *= -1;
	}
}


void CarSoccer::UpdateSimulation(double timeStep) {
    // Here's where you shound do your "simulation", updating the positions of the
    // car and ball as needed and checking for collisions.  Filling this routine
    // in is the main part of the assignment.
	ball_.set_position(ball_.position() + ball_.velocity()*timeStep);

	//Ball - Goal Collision
	if (ball_.position()[2] - ball_.radius() <= min_z && ball_.position()[1] <= 10 && \
		ball_.position()[0] <= 10 && ball_.position()[0] >= -10) { //Ball -Z Goal
		car_.Reset();
		ball_.Reset();
		launch_ball();
		return;
	}

	if (ball_.position()[2] + ball_.radius() >= max_z && ball_.position()[1] <= 10 && \
		ball_.position()[0] <= 10 && ball_.position()[0] >= -10) { //Ball +Z Goal
		car_.Reset();
		ball_.Reset();
		launch_ball();
		return;
	}

	//Ball - Wall/Floor Collision
	if (ball_.position()[0] - ball_.radius() < min_x) { //Ball's X < Min X 
		ball_.set_position(Point3(min_x + ball_.radius(), ball_.position()[1], ball_.position()[2]));
		ball_.set_velocity(Vector3(-ball_.velocity()[0] * bounce_loss, ball_.velocity()[1] * bounce_loss, ball_.velocity()[2] * bounce_loss));
	}

	if (ball_.position()[1] - ball_.radius() < min_y) { //Ball's Y < Min Y
		ball_.set_position(Point3(ball_.position()[0], min_y + ball_.radius(), ball_.position()[2]));
		ball_.set_velocity(Vector3(ball_.velocity()[0] * bounce_loss, -ball_.velocity()[1] * bounce_loss, ball_.velocity()[2] * bounce_loss));
	}

	if (ball_.position()[2] - ball_.radius() < min_z) { //Ball's Z < Min Z
		ball_.set_position(Point3(ball_.position()[0], ball_.position()[1], min_z + ball_.radius()));
		ball_.set_velocity(Vector3(ball_.velocity()[0] * bounce_loss, ball_.velocity()[1] * bounce_loss, -ball_.velocity()[2] * bounce_loss));
	}

	if (ball_.position()[0] + ball_.radius() > max_x) { //Ball's X > Max X 
		ball_.set_position(Point3(max_x - ball_.radius(), ball_.position()[1], ball_.position()[2]));
		ball_.set_velocity(Vector3(-ball_.velocity()[0] * bounce_loss, ball_.velocity()[1] * bounce_loss, ball_.velocity()[2] * bounce_loss));
	}

	if (ball_.position()[1] - ball_.radius() > max_y) { //Ball's Y > Max Y
		ball_.set_position(Point3(ball_.position()[0], max_y - ball_.radius(), ball_.position()[2]));
		ball_.set_velocity(Vector3(ball_.velocity()[0] * bounce_loss, -ball_.velocity()[1] * bounce_loss, ball_.velocity()[2] * bounce_loss));
	}

	if (ball_.position()[2] + ball_.radius() > max_z) { //Ball's Z > Max Z
		ball_.set_position(Point3(ball_.position()[0], ball_.position()[1], max_z - ball_.radius()));
		ball_.set_velocity(Vector3(ball_.velocity()[0] * bounce_loss, ball_.velocity()[1] * bounce_loss, -ball_.velocity()[2] * bounce_loss));
	}


	if (ball_.position()[1] - ball_.radius() > min_y) {
		ball_.set_velocity(Vector3(ball_.velocity()[0], ball_.velocity()[1]-(gravity*timeStep), ball_.velocity()[2]));
	}

	//Car Driving
	Vector2 joy = joystick_direction(); 
	car_.set_position(car_.position() + car_.velocity()*timeStep);
	car_.set_dir(timeStep, joy[0]);
	car_.set_speed(timeStep, joy[1]);

	

	//Car - Wall Collision
	if (car_.position()[0] - car_.collision_radius() < min_x) { //Car's X < Min X 
		car_.set_position(Point3(min_x + car_.collision_radius(), car_.position()[1], car_.position()[2]));
		car_.reset_speed();
	}



	if (car_.position()[2] - car_.collision_radius() < min_z) { //Car's Z < Min Z
		car_.set_position(Point3(car_.position()[0], car_.position()[1], min_z + car_.collision_radius()));
		car_.reset_speed();
	}

	if (car_.position()[0] + car_.collision_radius() > max_x) { //Car's X > Max X 
		car_.set_position(Point3(max_x - car_.collision_radius(), car_.position()[1], car_.position()[2]));
		car_.reset_speed();
	}



	if (car_.position()[2] + car_.collision_radius() > max_z) { //Car's Z > Max Z
		car_.set_position(Point3(car_.position()[0], car_.position()[1], max_z - car_.collision_radius()));
		car_.reset_speed();
	}

	//Ball - Car Collision
	Vector3 dist = car_.position() - ball_.position(); //Distance between Ball and Car Centers
	if (dist.Length() <= car_.collision_radius() + ball_.radius()) { //Collision
		//Step 1: Move the ball backward along its velocity vector until it no longer penetrates
		Vector3 ball_direction = ball_.velocity().ToUnit(); //Old Direction of Balls Travel
		float pene = ball_.radius() - (dist.Length() - car_.collision_radius());
		ball_.set_position(ball_.position()+pene*-ball_direction);
		//Step 2: Compute the Relative Velocity of the Ball
		Vector3 relative = ball_.velocity() - car_.velocity();
		//Step 3: Reflex the Relative Velocity about the Collision Normal
		Vector3 new_relative = relative - 2 * relative.Dot(dist.ToUnit())*dist.ToUnit();
		//Step 4: Set the new velocity of the ball
		ball_.set_velocity(car_.velocity()+new_relative);
	}


	
}


void CarSoccer::InitOpenGL() {
    // Set up the camera in a good position to see the entire field
    projMatrix_ = Matrix4::Perspective(60, aspect_ratio(), 1, 1000);
    modelMatrix_ = Matrix4::LookAt(Point3(0,60,70), Point3(0,0,10), Vector3(0,1,0));
 
    // Set a background color for the screen
    glClearColor(0.8,0.8,0.8, 1);

	srand(time(NULL));
	debug = 1;
    
    // Load some image files we'll use
    fieldTex_.InitFromFile(Platform::FindFile("pitch.png", searchPath_));
    crowdTex_.InitFromFile(Platform::FindFile("crowd.png", searchPath_));
	launch_ball();
}


void CarSoccer::DrawUsingOpenGL() {
    // Draw the crowd as a fullscreen background image
    quickShapes_.DrawFullscreenTexture(Color(1,1,1), crowdTex_);
    
    // Draw the field with the field texture on it.
    Color col(16.0/255.0, 46.0/255.0, 9.0/255.0);
    Matrix4 M = Matrix4::Translation(Vector3(0,-0.201,0)) * Matrix4::Scale(Vector3(50, 1, 60));
    quickShapes_.DrawSquare(modelMatrix_ * M, viewMatrix_, projMatrix_, col);
    M = Matrix4::Translation(Vector3(0,-0.2,0)) * Matrix4::Scale(Vector3(40, 1, 50));
    quickShapes_.DrawSquare(modelMatrix_ * M, viewMatrix_, projMatrix_, Color(1,1,1), fieldTex_);
    
    // Draw the car
    Color carcol(0.8, 0.2, 0.2);
    Matrix4 Mcar =
        Matrix4::Translation(car_.position() - Point3(0,0,0)) *
        Matrix4::Scale(car_.size()) *
        Matrix4::Scale(Vector3(0.5,0.5,0.5)) *
		Matrix4::RotationY(car_.dir());
    quickShapes_.DrawCube(modelMatrix_ * Mcar, viewMatrix_, projMatrix_, carcol);
	

	
    
    
    // Draw the ball
    Color ballcol(1,1,1);
    Matrix4 Mball =
        Matrix4::Translation(ball_.position() - Point3(0,0,0)) *
        Matrix4::Scale(Vector3(ball_.radius(), ball_.radius(), ball_.radius()));
    quickShapes_.DrawSphere(modelMatrix_ * Mball, viewMatrix_, projMatrix_, ballcol);

	if (debug == -1) {
		Color arrowcol(0.8, 0.1, 0.8);
		quickShapes_.DrawArrow(modelMatrix_, viewMatrix_, projMatrix_, arrowcol, car_.position(), car_.velocity(), 0.5);
		quickShapes_.DrawArrow(modelMatrix_, viewMatrix_, projMatrix_, arrowcol, ball_.position(), ball_.velocity(), 0.5);
		quickShapes_.DrawArrow(modelMatrix_, viewMatrix_, projMatrix_, carcol, car_.position(), car_.front()*-4, 0.3);
	}
    
    // Draw the ball's shadow -- this is a bit of a hack, scaling Y by zero
    // flattens the sphere into a pancake, which we then draw just a bit
    // above the ground plane.
    Color shadowcol(0.2,0.4,0.15);
    Matrix4 Mshadow =
        Matrix4::Translation(Vector3(ball_.position()[0], -0.1, ball_.position()[2])) *
        Matrix4::Scale(Vector3(ball_.radius(), 0, ball_.radius())) *
        Matrix4::RotationX(90);
    quickShapes_.DrawSphere(modelMatrix_ * Mshadow, viewMatrix_, projMatrix_, shadowcol);
    
    
    // You should add drawing the goals and the boundary of the playing area
    // using quickShapes_.DrawLines()
	std::vector<Point3> loop;
	loop.push_back(Point3(min_x, min_y, min_z)); 
	loop.push_back(Point3(min_x, min_y, max_z)); 
	loop.push_back(Point3(max_x, min_y, max_z)); 
	loop.push_back(Point3(max_x, min_y, min_z)); 
	loop.push_back(Point3(min_x, min_y, min_z)); 
	loop.push_back(Point3(min_x, max_y, min_z)); 
	loop.push_back(Point3(min_x, max_y, max_z)); 
	loop.push_back(Point3(min_x, min_y, max_z)); 
	loop.push_back(Point3(min_x, max_y, max_z)); 
	loop.push_back(Point3(max_x, max_y, max_z)); 
	loop.push_back(Point3(max_x, min_y, max_z)); 
	loop.push_back(Point3(max_x, max_y, max_z));
	loop.push_back(Point3(max_x, max_y, min_z));
	loop.push_back(Point3(max_x, min_y, min_z));
	loop.push_back(Point3(max_x, max_y, min_z));
	loop.push_back(Point3(min_x, max_y, min_z));
	quickShapes_.DrawLines(modelMatrix_, viewMatrix_, projMatrix_, Color(1, 0, 0.8), loop, quickShapes_.LINE_STRIP, 0.1);

	std::vector<Point3> goal1;
	for (int i = -10; i < 11; i++) {
		goal1.push_back(Point3(i, min_y, max_z));
		goal1.push_back(Point3(i, 10, max_z));
	}
	for (int i = 0; i < 11; i++) {
		goal1.push_back(Point3(-10, i, max_z));
		goal1.push_back(Point3(10, i, max_z));
	}
	quickShapes_.DrawLines(modelMatrix_, viewMatrix_, projMatrix_, Color(0.8, 0.8, 0.2), goal1, quickShapes_.LINES, 0.1);
	std::vector<Point3> goal2;
	for (int i = -10; i < 11; i++) {
		goal2.push_back(Point3(i, min_y, min_z));
		goal2.push_back(Point3(i, 10, min_z));
	}
	for (int i = 0; i < 11; i++) {
		goal2.push_back(Point3(-10, i, min_z));
		goal2.push_back(Point3(10, i, min_z));
	}
	quickShapes_.DrawLines(modelMatrix_, viewMatrix_, projMatrix_, Color(0.2, 0.8, 0.8), goal2, quickShapes_.LINES, 0.1);

}
