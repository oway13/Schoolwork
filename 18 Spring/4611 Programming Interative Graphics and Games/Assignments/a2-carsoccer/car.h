/** CSci-4611 Assignment 2:  Car Soccer
 */

#ifndef CAR_H_
#define CAR_H_

#include <mingfx.h>

/// Small data structure for a car
class Car {
public:
    
    /// The constructor sets the static properties of the car, like its size,
    /// and then calls Reset() to reset the position, velocity, and any other
    /// dynamic variables that change during game play.
    Car() : size_(3,2,4), collision_radius_(2.5) {
        Reset();
    }

    /// Nothing special needed in the constructor
    virtual ~Car() {}

    /// Resets all the dynamic variables, so if you call this after a goal, the
    /// car will go back to its starting position.
    void Reset() {
        position_ = Point3(0, size_[1]/2, 45);
		reset_speed();
		dir_ = 0;
    }
    
    float collision_radius() { return collision_radius_; }
    
    Vector3 size() { return size_; }
    
    Point3 position() { return position_; }
    void set_position(const Point3 &p) { position_ = p; }

	Vector3 velocity() { return Vector3(speed_*sin(dir_), 0, speed_*cos(dir_)); }
	Vector3 front() { return Vector3(sin(dir_), 0, cos(dir_)); }

	void set_speed(float timeStep, int dir) { 
		speed_ += (((dir*thrust_) - (drag_*speed_))*timeStep);
		if (speed_ > max_speed) { speed_ = max_speed; }
	}
	float speed() { return speed_; }
	void reset_speed() { speed_ = 0; }

	void set_dir(float timeStep, int dir) { dir_ += (turnRate_*dir)*speed_*timeStep; }
	float dir() { return dir_; }



    
private:
    // You will probably need to store some additional data here, e.g., speed.
    
    Vector3 size_;
    float collision_radius_;
    Point3 position_;

	float speed_;
	float dir_;
	const float thrust_ = 20;
	const float drag_ = 1;
	const float turnRate_ = 0.1;
	const float max_speed = 60;


	

};

#endif
