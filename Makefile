CXX=g++
LD=g++
SRC=src
CFLAGS=-Wall -pedantic -Wno-long-long -O0 -ggdb
LIBS=-lsfml-graphics -lsfml-system -lsfml-window
	
NM=ParticleSystem

all: compile 

compile: $(NM)

$(NM): main.o Color.o Gradient.o Particle.o ParticleGroup.o ParticleGroupPainter.o Shape.o ShapeRectangle.o Point.o
	$(LD) -o $(NM) main.o Color.o Gradient.o Particle.o ParticleGroup.o ParticleGroupPainter.o Shape.o ShapeRectangle.o Point.o $(LIBS)

main.o: $(SRC)/main.cpp $(SRC)/Color.h  $(SRC)/Gradient.h 
	$(CXX) $(CFLAGS) -c -o $@ $<

Color.o: $(SRC)/Color.cpp $(SRC)/Color.h  
	$(CXX) $(CFLAGS) -c -o $@ $<

Gradient.o: $(SRC)/Gradient.cpp $(SRC)/Color.h $(SRC)/Gradient.h 
	$(CXX) $(CFLAGS) -c -o $@ $<
	
Particle.o: $(SRC)/Particle.cpp $(SRC)/Particle.h 
	$(CXX) $(CFLAGS) -c -o $@ $<
	
ParticleGroup.o: $(SRC)/ParticleGroup.cpp $(SRC)/ParticleGroup.h  $(SRC)/Particle.h
	$(CXX) $(CFLAGS) -c -o $@ $<
	
ParticleGroupPainter.o: $(SRC)/ParticleGroupPainter.cpp $(SRC)/ParticleGroupPainter.h $(SRC)/ParticleGroup.h  $(SRC)/Particle.h
	$(CXX) $(CFLAGS) -c -o $@ $<
	
Shape.o: $(SRC)/Shape.cpp $(SRC)/Shape.h
	$(CXX) $(CFLAGS) -c -o $@ $<

ShapeRectangle.o: $(SRC)/ShapeRectangle.cpp $(SRC)/ShapeRectangle.h $(SRC)/Shape.h 
	$(CXX) $(CFLAGS) -c -o $@ $<

Point.o: $(SRC)/Point.cpp $(SRC)/Point.h 
	$(CXX) $(CFLAGS) -c -o $@ $<


clean:
	rm -f *.o $(NM)

run:
	./$(NM)

 
