CXX = g++
CXXFLAGS = -g -Wall
PROG = miny

ifeq ($(shell uname), Darwin)
	LDLIBS = -framework OpenGL -framework GLUT
else
	LDLIBS = -lglut -lGL -lGLU
endif

INCLDDIRS = -I. -I./inc
LOCAL_SRCS := main.cpp Timer.cpp Replay.cpp Field.cpp scores.cpp\
		common.cpp

.PHONY: all
all: $(PROG)

%.o: %.c
	$(CXX) $(CXXFLAGS) -c $< -o $@ $(INCLDDIRS)

$(PROG): $(LOCAL_SRCS)
	$(CXX) $(CXXFLAGS) -o $@ $^ ${LDLIBS} $(INCLDDIRS)


.PHONY: clean
clean:
	rm -f $(PROG) *.o
