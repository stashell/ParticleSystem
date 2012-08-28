/*
 * ParticleGroup.h
 *
 *  Created on: Aug 20, 2012
 *      Author: stashell
 */

#ifndef PARTICLEGROUP_H_
#define PARTICLEGROUP_H_

#include <list>
#include "Particle.h"
#include "ShapeRectangle.h"
#include "ParticlePhysics.h"
#include "Emitter.h"

using std::list;

enum BOUND_ACTION
{
	bound_stop,
	bound_mirror_port,
	bound_respawn,
	bound_kill
};

class ParticleGroup
{
public:
	ParticleGroup();
	list<Particle*> particles;

	ParticleGroup(ParticlePhysics* p_particlePhysics, Shape* p_moveableArea, BOUND_ACTION p_boundAction,
			Emitter* p_emitter, float p_defaultWeight, float p_defaultScaledSize, sf::Sprite p_defaultSprite);
	~ParticleGroup();
	void setBoundAction(BOUND_ACTION boundAction);
	void setParticlesCount(int p_count);
	void addParticles(int p_count);
	void removeParticles(int p_count);
	void addParticleAt(Point p_spawnPoint);
	void addParticle(Particle* object);
	void setRandVect();
	void processData(float framerate);
	void applyPhysics();
	void checkBounds();
	void respawn(std::list<Particle*>::iterator particle);
	int getParticleCount();
	void setScaledSize(float p_scaledSize);
	void setAlpha(int p_alpha);
	void paint(sf::RenderWindow* window);

private:
	ParticlePhysics* particlePhysics;
	Shape* moveableArea;
	Emitter* emitter;
	BOUND_ACTION boundAction;
	float defaultWeight;
	sf::Sprite particleSprite;
	float defaultScaledSize;
};

#endif /* PARTICLEGROUP_H_ */
